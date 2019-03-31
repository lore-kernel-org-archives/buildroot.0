From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:51:39 +0200
Subject: [Buildroot] [git commit] package/rpm: security bump to 4.14.2.1
Message-ID: <20190331125625.1F9F08A50D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b4cc264d937a42e11f23e8a24a18d292fe7499c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove first and second patches (already in version)
- Remove third and fourth patches (not needed since:
  https://github.com/rpm-software-management/rpm/commit/245b5a3b4b6d616adf47361137987e90f8dab22c)
- Add hash for license file
- Drop autoreconf (as configure.ac is not patched anymore)
- Use new --with-crypto option
- Restrict symlink following on installation (CVE-2017-7500,
  CVE-2017-7501)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ink-instead-of-compile-for-gcc-flags-test.patch | 33 -------------
 ...onfigure-ac-correct-stack-protector-check.patch | 45 ------------------
 ...h-to-enable-disable-sepdebugcrcfix-buildi.patch | 55 ----------------------
 ...bugcrcfix.c-fix-build-with-recent-binutil.patch | 43 -----------------
 package/rpm/rpm.hash                               |  7 ++-
 package/rpm/rpm.mk                                 | 12 ++---
 6 files changed, 9 insertions(+), 186 deletions(-)

diff --git a/package/rpm/0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch b/package/rpm/0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch
deleted file mode 100644
index 6f6a2aba51..0000000000
--- a/package/rpm/0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b5f1895aae096836d6e8e155ee289e1b10fcabcb Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 10 Oct 2015 23:17:44 +0200
-Subject: [PATCH] configure.ac: use link instead of compile for gcc flags test
-
-The logic that tests whether gcc supports or not certain flags uses
-AC_COMPILE_IFELSE(). However, when checking for stack smashing
-protection support, an AC_LINK_IFELSE() test is needed, since the
-build might work but not the link stage if certain libraries are
-missing for proper stack smashing protection support.
-
-Therefore, this commit switches to use AC_LINK_IFELSE().
-
-[Upstream commit: https://github.com/rpm-software-management/rpm/commit/b5f1895aae096836d6e8e155ee289e1b10fcabcb]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: James Knight <james.d.knight@live.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6ece8c9fd..822294c3f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,7 +43,7 @@ if test "$GCC" = yes; then
-     echo
-     for flag in $cflags_to_try; do
-         CFLAGS="$CFLAGS $flag -Werror"
--        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
-+        AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
-                 echo "   $flag"
-                 RPMCFLAGS="$RPMCFLAGS $flag"
-         ],[])
diff --git a/package/rpm/0002-configure-ac-correct-stack-protector-check.patch b/package/rpm/0002-configure-ac-correct-stack-protector-check.patch
deleted file mode 100644
index 9d2942b4fa..0000000000
--- a/package/rpm/0002-configure-ac-correct-stack-protector-check.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c810a0aca3f1148d2072d44b91b8cc9caeb4cf19 Mon Sep 17 00:00:00 2001
-From: James Knight <james.knight@rockwellcollins.com>
-Date: Wed, 16 Nov 2016 15:54:46 -0500
-Subject: [PATCH] configure.ac: correct stack protector check
-
-If a used toolchain accepts the `-fstack-protector` option but does not
-provide a stack smashing protector implementation (ex. libssp), linking
-will fail:
-
- .libs/rpmio.o: In function `Fdescr':
- rpmio.c:(.text+0x672): undefined reference to `__stack_chk_fail_local'
- .libs/rpmio.o: In function `Fdopen':
- rpmio.c:(.text+0xce9): undefined reference to `__stack_chk_fail_local'
- .libs/rpmio.o: In function `ufdCopy':
- rpmio.c:(.text+0x10f7): undefined reference to `__stack_chk_fail_local'
- ...
-
-This is a result of testing for `-fstack-protector` support using a main
-that GCC does not inject guards. GCC's manual notes that stack protector
-code is only added when "[functions] that call alloca, and functions
-with buffers larger than 8 bytes" [1]. This commit adjusts the stack
-protector check to allocate memory on the stack (via `alloca`).
-
-[1]: https://gcc.gnu.org/onlinedocs/gcc-4.4.2/gcc/Optimize-Options.html
-
-Signed-off-by: James Knight <james.knight@rockwellcollins.com>
-[Upstream commit: https://github.com/rpm-software-management/rpm/commit/c810a0aca3f1148d2072d44b91b8cc9caeb4cf19]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a9730d3bc..b4b3fe8fb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,7 +43,7 @@ if test "$GCC" = yes; then
-     echo
-     for flag in $cflags_to_try; do
-         CFLAGS="$CFLAGS $flag -Werror"
--        AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
-+        AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[alloca(100);]])],[
-                 echo "   $flag"
-                 RPMCFLAGS="$RPMCFLAGS $flag"
-         ],[])
diff --git a/package/rpm/0003-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch b/package/rpm/0003-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch
deleted file mode 100644
index e1fd0697e6..0000000000
--- a/package/rpm/0003-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From edadcf67980764c104c25c7c1a0ba91257b89698 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 8 Dec 2016 23:33:30 +0100
-Subject: [PATCH 1/2] Detect bfd.h to enable/disable sepdebugcrcfix building
-
-tools/sepdebugcrcfix includes <bfd.h>, but this header from binutils
-is not checked in the configure script. Due to this, sepdebugcrcfix is
-attempted to be built even when <bfd.h> is not available. This commit
-addresses that by adding the appropriate configure check.
-
-This fixes the following build error:
-
-tools/sepdebugcrcfix.c:31:17: fatal error: bfd.h: No such file or directory
-compilation terminated.
-make[3]: *** [tools/sepdebugcrcfix.o] Error 1
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am  | 2 ++
- configure.ac | 3 +++
- 2 files changed, 5 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 863138c..d8a68f0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -168,9 +168,11 @@ elfdeps_SOURCES =	tools/elfdeps.c
- elfdeps_LDADD =		rpmio/librpmio.la
- elfdeps_LDADD +=	@WITH_LIBELF_LIB@ @WITH_POPT_LIB@
- 
-+if HAS_BFD_H
- rpmlibexec_PROGRAMS +=	sepdebugcrcfix
- sepdebugcrcfix_SOURCES = tools/sepdebugcrcfix.c
- sepdebugcrcfix_LDADD =	@WITH_LIBELF_LIB@
-+endif # HAS_BFD_H
- endif
- endif
- 
-diff --git a/configure.ac b/configure.ac
-index c5ae701..b99ecb8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -242,6 +242,9 @@ AC_CHECK_HEADERS([dwarf.h], [
- ])
- AM_CONDITIONAL(LIBDWARF,[test "$WITH_LIBDWARF" = yes])
- 
-+AC_CHECK_HEADERS([bfd.h])
-+AM_CONDITIONAL(HAS_BFD_H, [test "${ac_cv_header_bfd_h}" = "yes"])
-+
- #=================
- # Check for beecrypt library if requested.
- AC_ARG_WITH(beecrypt, [  --with-beecrypt         build with beecrypt support ],,[with_beecrypt=no])
--- 
-2.7.4
-
diff --git a/package/rpm/0004-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch b/package/rpm/0004-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch
deleted file mode 100644
index bebe94511d..0000000000
--- a/package/rpm/0004-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 65afab91444d4996a8e61d1e2d27d52e18417ef5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 8 Dec 2016 23:45:55 +0100
-Subject: [PATCH 2/2] tools/sepdebugcrcfix.c: fix build with recent binutils
-
-Moderately recent binutils versions install a <bfd.h> header that
-checks if config.h is included. While this makes sense in binutils
-itself, it does not outside. So the binutils developers have added a
-check: if PACKAGE or PACKAGE_VERSION are defined, they assume you're
-re-using bfd.h outside of binutils, and therefore including it without
-including config.h is legit.
-
-So we take the same approch as numerous users of bfd.h: fake a PACKAGE
-definition. See for example tools/perf/util/srcline.c in the Linux
-kernel source tree.
-
-This fixes the following build error:
-
-In file included from tools/sepdebugcrcfix.c:31:0:
-/home/test/autobuild/run/instance-0/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/bfd.h:35:2: error: #error config.h must be included before this header
- #error config.h must be included before this header
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tools/sepdebugcrcfix.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
-index cd7fa02..e7b480f 100644
---- a/tools/sepdebugcrcfix.c
-+++ b/tools/sepdebugcrcfix.c
-@@ -28,6 +28,8 @@
- #include <error.h>
- #include <libelf.h>
- #include <gelf.h>
-+/* Needed to please <bfd.h> */
-+#define PACKAGE "rpm"
- #include <bfd.h>
- 
- #define _(x) x
--- 
-2.7.4
-
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index 7ae9ec73d9..b550e12721 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,2 +1,5 @@
-# From http://rpm.org/wiki/Releases/4.13.0.1
-sha1 9566f95f38fcb214e439c552f378c2f64ba0aff9  rpm-4.13.0.1.tar.bz2
+# From https://rpm.org/wiki/Releases/4.14.2.1.html
+sha256 1139c24b7372f89c0a697096bf9809be70ba55e006c23ff47305c1849d98acda  rpm-4.14.2.1.tar.bz2
+
+#??Hash for license file
+sha256 d56f4f1f290f6920cb053aef0dbcd0b853cda289e2568b364ddbfce220a6f3e0  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 87c2059e71..eb9a4a5a51 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 4.13
-RPM_VERSION = $(RPM_VERSION_MAJOR).0.1
+RPM_VERSION_MAJOR = 4.14
+RPM_VERSION = $(RPM_VERSION_MAJOR).2.1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib \
@@ -13,10 +13,6 @@ RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib \
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
 
-# 0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch
-# 0002-configure-ac-correct-stack-protector-check.patch
-RPM_AUTORECONF = YES
-
 RPM_CONF_OPTS = \
 	--disable-python \
 	--disable-rpath \
@@ -35,11 +31,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 RPM_DEPENDENCIES += libnss
-RPM_CONF_OPTS += --without-beecrypt
+RPM_CONF_OPTS += --with-crypto=nss
 RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr
 else
 RPM_DEPENDENCIES += beecrypt
-RPM_CONF_OPTS += --with-beecrypt
+RPM_CONF_OPTS += --with-crypto=beecrypt
 RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/beecrypt
 endif
 
