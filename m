From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:24:14 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/util-linux: bump
 to version 2.34
Message-ID: <20200307202445.C75028FBC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1d89d56fdc8953d7cc49f150c594b8c749d5d4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Remove patches already applied upstream.
- Update file hash.
- Add an option to select the new "hardlink" command (off by default)
- hardlink uses libpcre2-8 if pcre2 is detected at config time so add a
  build dependency on pcre2, if it's selected.
- Change selections to reflect that libblkid now does not depend on
  libuuid anymore

Full release notes available at

  https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.34/v2.34-ReleaseNotes

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bb216ed060b16e09b2027ef242347b2f2e3c97dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ake-use-poweroff-if-shutdown-is-not-found.patch | 86 ----------------------
 ...2-agetty-fix-output-of-escaped-characters.patch | 26 -------
 ...-setarch-fix-obscure-sparc32bash-use-case.patch | 84 ---------------------
 ...for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch | 32 --------
 package/util-linux/Config.in                       |  6 +-
 package/util-linux/util-linux.hash                 |  4 +-
 package/util-linux/util-linux.mk                   |  6 +-
 7 files changed, 12 insertions(+), 232 deletions(-)

diff --git a/package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch b/package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
deleted file mode 100644
index b97be2ef07..0000000000
--- a/package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From e1686b25acdedb34cc357f08f0dd3ca01c559dfd Mon Sep 17 00:00:00 2001
-From: Justin Chen <justinpopo6@gmail.com>
-Date: Thu, 1 Nov 2018 11:10:38 -0700
-Subject: [PATCH] rtcwake: use poweroff if shutdown is not found
-
-Some systems do not have the shutdown command. Use poweroff as an
-alternative.
-
-Signed-off-by: Justin Chen <justinpopo6@gmail.com>
----
- include/pathnames.h |  1 +
- sys-utils/rtcwake.c | 39 +++++++++++++++++++++++++++------------
- 2 files changed, 28 insertions(+), 12 deletions(-)
-
-diff --git a/include/pathnames.h b/include/pathnames.h
-index 3d5052e6f..ed8ea330d 100644
---- a/include/pathnames.h
-+++ b/include/pathnames.h
-@@ -53,6 +53,7 @@
- # define _PATH_LOGIN		"/bin/login"
- #endif
- #define _PATH_SHUTDOWN		"/sbin/shutdown"
-+#define _PATH_POWEROFF		"/sbin/poweroff"
- 
- #define _PATH_TERMCOLORS_DIRNAME "terminal-colors.d"
- #define _PATH_TERMCOLORS_DIR	"/etc/" _PATH_TERMCOLORS_DIRNAME
-diff --git a/sys-utils/rtcwake.c b/sys-utils/rtcwake.c
-index b63c64627..029f00f9b 100644
---- a/sys-utils/rtcwake.c
-+++ b/sys-utils/rtcwake.c
-@@ -28,6 +28,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <sys/ioctl.h>
-+#include <sys/stat.h>
- #include <sys/time.h>
- #include <sys/types.h>
- #include <termios.h>
-@@ -582,18 +583,32 @@ int main(int argc, char **argv)
- 		char *arg[5];
- 		int i = 0;
- 
--		if (ctl.verbose)
--			printf(_("suspend mode: off; executing %s\n"),
--						_PATH_SHUTDOWN);
--		arg[i++] = _PATH_SHUTDOWN;
--		arg[i++] = "-h";
--		arg[i++] = "-P";
--		arg[i++] = "now";
--		arg[i]   = NULL;
--		if (!ctl.dryrun) {
--			execv(arg[0], arg);
--			warn(_("failed to execute %s"), _PATH_SHUTDOWN);
--			rc = EXIT_FAILURE;
-+		if (!access(_PATH_SHUTDOWN, X_OK)) {
-+			arg[i++] = _PATH_SHUTDOWN;
-+			arg[i++] = "-h";
-+			arg[i++] = "-P";
-+			arg[i++] = "now";
-+			arg[i]   = NULL;
-+		} else if (!access(_PATH_POWEROFF, X_OK)) {
-+			arg[i++] = _PATH_POWEROFF;
-+			arg[i]   = NULL;
-+		} else {
-+			arg[i] 	 = NULL;
-+		}
-+
-+		if (arg[0]) {
-+			if (ctl.verbose)
-+				printf(_("suspend mode: off; executing %s\n"),
-+						arg[0]);
-+			if (!ctl.dryrun) {
-+				execv(arg[0], arg);
-+				warn(_("failed to execute %s"), arg[0]);
-+				rc = EX_EXEC_ENOENT;
-+			}
-+		} else {
-+			/* Failed to find shutdown command */
-+			warn(_("failed to find shutdown command"));
-+			rc = EX_EXEC_ENOENT;
- 		}
- 		break;
- 	}
--- 
-2.17.1
-
diff --git a/package/util-linux/0002-agetty-fix-output-of-escaped-characters.patch b/package/util-linux/0002-agetty-fix-output-of-escaped-characters.patch
deleted file mode 100644
index fcd9731348..0000000000
--- a/package/util-linux/0002-agetty-fix-output-of-escaped-characters.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 73c5a3cc748b853936319e6cdc94159a6974db52 Mon Sep 17 00:00:00 2001
-From: Christian Hesse <mail@eworm.de>
-Date: Wed, 7 Nov 2018 13:55:06 +0100
-Subject: [PATCH] agetty: fix output of escaped characters
-
-Signed-off-by: Christian Hesse <mail@eworm.de>
----
- term-utils/agetty.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/term-utils/agetty.c b/term-utils/agetty.c
-index 05a269abb..b9f08728e 100644
---- a/term-utils/agetty.c
-+++ b/term-utils/agetty.c
-@@ -2755,7 +2755,7 @@ static void output_special_char(struct issue *ie,
- 		break;
- 	}
- 	default:
--		putchar(c);
-+		putc(c, ie->output);
- 		break;
- 	}
- }
--- 
-2.17.1
-
diff --git a/package/util-linux/0003-setarch-fix-obscure-sparc32bash-use-case.patch b/package/util-linux/0003-setarch-fix-obscure-sparc32bash-use-case.patch
deleted file mode 100644
index 70588b863e..0000000000
--- a/package/util-linux/0003-setarch-fix-obscure-sparc32bash-use-case.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 3fa06e049012218d883d0e1251df86bafbc446bf Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 22 Nov 2018 11:03:35 +0100
-Subject: [PATCH] setarch: fix obscure sparc32bash use-case
-
-Reported-by: Carlos Santos <casantos@datacom.com.br>
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Carlos Santos <casantos@datacom.com.br>
----
- sys-utils/setarch.c | 28 ++++++++++++++++++----------
- 1 file changed, 18 insertions(+), 10 deletions(-)
-
-diff --git a/sys-utils/setarch.c b/sys-utils/setarch.c
-index a733f7b3c..7c0a63fbb 100644
---- a/sys-utils/setarch.c
-+++ b/sys-utils/setarch.c
-@@ -268,6 +268,7 @@ int main(int argc, char *argv[])
- 	int c;
- 	struct arch_domain *doms, *target;
- 	unsigned long pers_value = 0;
-+	char *shell = NULL, *shell_arg = NULL;
- 
- 	/* Options without equivalent short options */
- 	enum {
-@@ -310,14 +311,14 @@ int main(int argc, char *argv[])
- 	archwrapper = strcmp(program_invocation_short_name, "setarch") != 0;
- 	if (archwrapper) {
- 		arch = program_invocation_short_name;	/* symlinks to setarch */
--#if defined(__sparc64__) || defined(__sparc__)
-+
-+		/* Don't use ifdef sparc here, we get "Unrecognized architecture"
-+		 * error message later if necessary */
- 		if (strcmp(arch, "sparc32bash") == 0) {
--			if (set_arch(arch, 0L, 0))
--				err(EXIT_FAILURE, _("Failed to set personality to %s"), arch);
--			execl("/bin/bash", "", NULL);
--			errexec("/bin/bash");
-+			shell = "/bin/bash";
-+			shell_arg = "";
-+			goto set_arch;
- 		}
--#endif
- 	} else {
- 		if (1 < argc && *argv[1] != '-') {
- 			arch = argv[1];
-@@ -391,6 +392,7 @@ int main(int argc, char *argv[])
- 	argc -= optind;
- 	argv += optind;
- 
-+set_arch:
- 	/* get execution domain (architecture) */
- 	if (arch) {
- 		doms = init_arch_domains();
-@@ -422,17 +424,23 @@ int main(int argc, char *argv[])
- 	if (arch)
- 		verify_arch_domain(target, arch);
- 
-+	if (!argc) {
-+		shell = "/bin/sh";
-+		shell_arg = "-sh";
-+	}
- 	if (verbose) {
--		printf(_("Execute command `%s'.\n"), argc ? argv[0] : "/bin/sh");
-+		printf(_("Execute command `%s'.\n"), shell ? shell : argv[0]);
- 		/* flush all output streams before exec */
- 		fflush(NULL);
- 	}
- 
--	if (!argc) {
--		execl("/bin/sh", "-sh", NULL);
--		errexec("/bin/sh");
-+	/* Execute shell */
-+	if (shell) {
-+		execl(shell, shell_arg, NULL);
-+		errexec(shell);
- 	}
- 
-+	/* Execute on command line specified command */
- 	execvp(argv[0], argv);
- 	errexec(argv[0]);
- }
--- 
-2.14.5
-
diff --git a/package/util-linux/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch b/package/util-linux/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch
deleted file mode 100644
index 381c25382a..0000000000
--- a/package/util-linux/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 963413a1adf6767ab17712097e288e1a346f63a7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 4 Jan 2019 22:38:25 -0800
-Subject: [PATCH] ldattach: Check for value of _HAVE_STRUCT_TERMIOS_C_ISPEED
-
-in glibc 2.29+ checking for just existence of _HAVE_STRUCT_TERMIOS_C_ISPEED
-won't be enough, the value has to be checked
-
-see
-https://sourceware.org/git/?p=glibc.git;a=commit;h=e5a50db36eaa6e8c6427b3a971563240b633ca85
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/karelzak/util-linux/commit/963413a1adf6767ab17712097e288e1a346f63a7]
----
- sys-utils/ldattach.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sys-utils/ldattach.c b/sys-utils/ldattach.c
-index d33d68535..fb50711eb 100644
---- a/sys-utils/ldattach.c
-+++ b/sys-utils/ldattach.c
-@@ -242,7 +242,7 @@ static int my_cfsetspeed(struct termios *ts, int speed)
- 	 * -- we have to bypass glibc and set the speed manually (because glibc
- 	 *    checks for speed and supports Bxxx bit rates only)...
- 	 */
--#ifdef _HAVE_STRUCT_TERMIOS_C_ISPEED
-+#if _HAVE_STRUCT_TERMIOS_C_ISPEED
- # define BOTHER 0010000		/* non standard rate */
- 	dbg("using non-standard speeds");
- 	ts->c_ospeed = ts->c_ispeed = speed;
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index a5a137bfe0..acde9e5474 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -12,7 +12,6 @@ if BR2_PACKAGE_UTIL_LINUX
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	bool "libblkid"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install libblkid.
 
@@ -135,6 +134,11 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
 	help
 	  Check and repair a linux filesystem
 
+config BR2_PACKAGE_UTIL_LINUX_HARDLINK
+	bool "hardlink"
+	help
+	  Consolidate duplicate files via hardlinks
+
 config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
 	bool "hwclock"
 	help
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index ed503a12ed..7a83a03c1d 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.33/sha256sums.asc
-sha256 f261b9d73c35bfeeea04d26941ac47ee1df937bd3b0583e748217c1ea423658a  util-linux-2.33.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.34/sha256sums.asc
+sha256 743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5  util-linux-2.34.tar.xz
 # License files, locally calculated
 sha256 4335620e8f478ee4dc4d26540448d39469091ef1d8e3fbbbb8bf753206ceac74  README.licensing
 sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b17c0e9b7c..9bf4e92b1b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION_MAJOR = 2.33
+UTIL_LINUX_VERSION_MAJOR = 2.34
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
@@ -91,6 +91,9 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 # Used by login-utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 
+# Used by hardlink
+UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_PCRE2),pcre2)
+
 # Disable/Enable utilities
 UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BINARIES),--enable-all-programs,--disable-all-programs) \
@@ -104,6 +107,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_HARDLINK),--enable-hardlink,--disable-hardlink) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
