From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 12:50:29 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-wrapper: add BR2_RELRO_
Message-ID: <20181020113218.5A24183AB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7484c1c3b8065d6f2f5a67607e9917ecfea022eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The RELRO/PIE flags are currently passed via CFLAGS/LDFLAGS and this patch
proposes moving them to the toolchain wrapper.

 (1) The flags should _always_ be passed, without leaving the possibility
     for any package to ignore them. I.e, when BR2_RELRO_FULL=y is used
     in a build, all executables should be built PIE. Passing those
     options through the wrapper ensures they are used during the build
     of all packages.

 (2) Some options are incompatible with -fPIE. For example, when
     building object files for a shared libraries, -fPIC is used, and
     -fPIE shouldn't be used in combination with -fPIE. Similarly, -r
     or -static are directly incompatible as they are different link
     time behaviors then the intent of PIE. Passing those options
     through the wrapper allows to add some "smart" logic to only pass
     -fPIE/-pie when relevant.

 (3) Some toolchain, kernel and bootloader packages may want to
     explicitly disable PIE in a build where the rest of the userspace
     has intentionally enabled it. The wrapper provides an option
     to key on the -fno-pie/-no-pie and bypass the appending of RELRO
     flags.
     The current Kernel and U-boot source trees include this option.
     https://github.com/torvalds/linux/commit/8438ee76b004ef66d125ade64c91fc128047d244
     https://github.com/u-boot/u-boot/commit/6ace36e19a8cfdd16ce7c02625edf36864897bf5
     If using PIE with a older Kernel and/or U-boot version, a backport of these
     changes  might be required. However this patchset also uses the
     __KERNEL__ and __UBOOT__ defines as a way to disable PIE.

NOTE: The current implementation via CFLAGS/LDFLAGS has caused some
build time failures as the conditional logic doesn't yet exist in
Buildroot:

https://bugs.busybox.net/show_bug.cgi?id=11206
https://bugs.busybox.net/show_bug.cgi?id=11321

Good summary of the most common build failures related to
enabling pie: https://wiki.ubuntu.com/SecurityTeam/PIE

[Peter: minor cleanups]
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in            | 11 ------
 toolchain/toolchain-wrapper.c  | 82 ++++++++++++++++++++++++++++++++++++++++--
 toolchain/toolchain-wrapper.mk |  6 ++++
 3 files changed, 86 insertions(+), 13 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index abfdb819cf..cd2148270a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -141,9 +141,6 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
 
-TARGET_CFLAGS_RELRO = -Wl,-z,relro
-TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
-
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_SSP_REGULAR),y)
@@ -154,14 +151,6 @@ else ifeq ($(BR2_SSP_ALL),y)
 TARGET_HARDENED += -fstack-protector-all
 endif
 
-ifeq ($(BR2_RELRO_PARTIAL),y)
-TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
-TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
-else ifeq ($(BR2_RELRO_FULL),y)
-TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
-TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
-endif
-
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=1
 else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index c5eb813dd0..c73a0cc079 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -49,8 +49,12 @@ static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
  * 	-D__TIME__=
  * 	-D__DATE__=
  * 	-Wno-builtin-macro-redefined
+ * 	-Wl,-z,now
+ * 	-Wl,-z,relro
+ * 	-fPIE
+ * 	-pie
  */
-#define EXCLUSIVE_ARGS	6
+#define EXCLUSIVE_ARGS	10
 
 static char *predef_args[] = {
 #ifdef BR_CCACHE
@@ -236,7 +240,7 @@ int main(int argc, char **argv)
 	char *env_debug;
 	char *paranoid_wrapper;
 	int paranoid;
-	int ret, i, count = 0, debug;
+	int ret, i, count = 0, debug, found_shared = 0;
 
 	/* Calculate the relative paths */
 	basename = strrchr(progpath, '/');
@@ -363,6 +367,80 @@ int main(int argc, char **argv)
 		*cur++ = "-Wno-builtin-macro-redefined";
 	}
 
+#ifdef BR2_RELRO_FULL
+	/* Patterned after Fedora/Gentoo hardening approaches.
+	 * https://fedoraproject.org/wiki/Changes/Harden_All_Packages
+	 * https://wiki.gentoo.org/wiki/Hardened/Toolchain#Position_Independent_Executables_.28PIEs.29
+	 *
+	 * A few checks are added to allow disabling of PIE
+	 * 1) -fno-pie and -no-pie are used by other distros to disable PIE in
+	 *    cases where the compiler enables it by default. The logic below
+	 *    maintains that behavior.
+	 *         Ref: https://wiki.ubuntu.com/SecurityTeam/PIE
+	 * 2) A check for -fno-PIE has been used in older Linux Kernel builds
+	 *    in a similar way to -fno-pie or -no-pie.
+	 * 3) A check is added for Kernel and U-boot defines
+	 *    (-D__KERNEL__ and -D__UBOOT__).
+	 */
+	for (i = 1; i < argc; i++) {
+		/* Apply all incompatible link flag and disable checks first */
+		if (!strcmp(argv[i], "-r") ||
+		    !strcmp(argv[i], "-Wl,-r") ||
+		    !strcmp(argv[i], "-static") ||
+		    !strcmp(argv[i], "-D__KERNEL__") ||
+		    !strcmp(argv[i], "-D__UBOOT__") ||
+		    !strcmp(argv[i], "-fno-pie") ||
+		    !strcmp(argv[i], "-fno-PIE") ||
+		    !strcmp(argv[i], "-no-pie"))
+			break;
+		/* Record that shared was present which disables -pie but don't
+		 * break out of loop as a check needs to occur that possibly
+		 * still allows -fPIE to be set
+		 */
+		if (!strcmp(argv[i], "-shared"))
+			found_shared = 1;
+	}
+
+	if (i == argc) {
+		/* Compile and link condition checking have been kept split
+		 * between these two loops, as there maybe already are valid
+		 * compile flags set for position independence. In that case
+		 * the wrapper just adds the -pie for link.
+		 */
+		for (i = 1; i < argc; i++) {
+			if (!strcmp(argv[i], "-fpie") ||
+			    !strcmp(argv[i], "-fPIE") ||
+			    !strcmp(argv[i], "-fpic") ||
+			    !strcmp(argv[i], "-fPIC"))
+				break;
+		}
+		/* Both args below can be set@compile/link time
+		 * and are ignored correctly when not used
+		 */
+		if(i == argc)
+			*cur++ = "-fPIE";
+
+		if (!found_shared)
+			*cur++ = "-pie";
+	}
+#endif
+	/* Are we building the Linux Kernel or U-Boot? */
+	for (i = 1; i < argc; i++) {
+		if (!strcmp(argv[i], "-D__KERNEL__") ||
+		    !strcmp(argv[i], "-D__UBOOT__"))
+			break;
+	}
+	if (i == argc) {
+		/* https://wiki.gentoo.org/wiki/Hardened/Toolchain#Mark_Read-Only_Appropriate_Sections */
+#ifdef BR2_RELRO_PARTIAL
+		*cur++ = "-Wl,-z,relro";
+#endif
+#ifdef BR2_RELRO_FULL
+		*cur++ = "-Wl,-z,now";
+		*cur++ = "-Wl,-z,relro";
+#endif
+	}
+
 	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
 	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
 		paranoid = 1;
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index b8074efc3c..99d303975c 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -45,6 +45,12 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
+ifeq ($(BR2_RELRO_PARTIAL),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_PARTIAL
+else ifeq ($(BR2_RELRO_FULL),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_FULL
+endif
+
 define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
