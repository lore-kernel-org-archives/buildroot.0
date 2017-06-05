From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 13:06:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/iprutils: bump version to 2.4.14.1
Message-ID: <20170605110620.25326-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:

0001-iprutils-Don-t-use-gettext.patch
https://sourceforge.net/p/iprdd/iprutils/ci/4512cfb915b492e9eed65f7b9f72fc1c1bd097c2/

0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch
https://sourceforge.net/p/iprdd/iprutils/ci/d7cfe35b9706da357814d4bdd21563396733753c/

0003-iprlib-fixes-for-compatibility-with-musl.patch
https://sourceforge.net/p/iprdd/iprutils/ci/ed9da50d114ea5e97f3cf599fb7b305e0cec18d6/

Autoreconf is not needed anymore, added upstream hashes, switched _SITE
to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../iprutils/0001-iprutils-Don-t-use-gettext.patch | 48 ----------------------
 ...c-use-pow-instead-of-matherr-for-libm-che.patch | 36 ----------------
 ...-iprlib-fixes-for-compatibility-with-musl.patch | 34 ---------------
 package/iprutils/iprutils.hash                     |  5 ++-
 package/iprutils/iprutils.mk                       |  6 +--
 5 files changed, 6 insertions(+), 123 deletions(-)
 delete mode 100644 package/iprutils/0001-iprutils-Don-t-use-gettext.patch
 delete mode 100644 package/iprutils/0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch
 delete mode 100644 package/iprutils/0003-iprlib-fixes-for-compatibility-with-musl.patch

diff --git a/package/iprutils/0001-iprutils-Don-t-use-gettext.patch b/package/iprutils/0001-iprutils-Don-t-use-gettext.patch
deleted file mode 100644
index 680bb07f5..000000000
--- a/package/iprutils/0001-iprutils-Don-t-use-gettext.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 4ce3545b704588c5889b8dd7b100fcdb88ae2e1a Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 17 Sep 2014 17:48:54 +0100
-Subject: [PATCH] iprutils: Don't use gettext
-
-... since we don't have any translation.
-
-Based on the former patch by Jeremy Kerr.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Thomas: adapt to the new autotools build system.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 2 +-
- iprconfig.h  | 4 +---
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ee69bee..c1a4f70 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,7 +137,7 @@ AC_SUBST([IPRCONFIG_LIBS])
- LIBS="$save_LIBS"
- 
- # Checks for header files.
--AC_CHECK_HEADERS([fcntl.h libintl.h locale.h netinet/in.h nl_types.h \
-+AC_CHECK_HEADERS([fcntl.h locale.h netinet/in.h nl_types.h \
- 		 paths.h stddef.h stdint.h stdlib.h string.h sys/file.h \
- 		 sys/ioctl.h sys/mount.h sys/socket.h syslog.h \
- 		 unistd.h ncurses.h form.h menu.h], [],
-diff --git a/iprconfig.h b/iprconfig.h
-index 9bce950..751a737 100644
---- a/iprconfig.h
-+++ b/iprconfig.h
-@@ -11,9 +11,7 @@
-  *
-  **/
- 
--#include <libintl.h>
--
--#define _(string) gettext(string)
-+#define _(string) (string)
- #define __(string) (string)
- #define EXIT_FLAG		0x8000	/* stops at given screen on exit call */
- #define CANCEL_FLAG		0x4000	/* stops at given screen on quit call */
--- 
-2.6.4
-
diff --git a/package/iprutils/0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch b/package/iprutils/0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch
deleted file mode 100644
index ea7a68357..000000000
--- a/package/iprutils/0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 62a41abffa028a3a4c4ae0803d48c559a14e97f1 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 7 Feb 2016 13:54:10 +0100
-Subject: [PATCH] configure.ac: use pow() instead of matherr() for libm check
-
-In certain configurations of uClibc, the matherr() function may not be
-provided by the C library, which makes the current configure.ac check
-for libm fail. However, iprutils does not use matherr(), so using this
-function for the test makes little sense.
-
-This patch adjusts configure.ac to test for pow() instead, which is
-actually used by iprutils, and more commonly available, including in
-uClibc.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c1a4f70..e430554 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,7 +129,7 @@ save_LIBS="$LIBS"
- AC_CHECK_LIB([ncurses], [curses_version], [],
- 	     [AC_ERROR("libncurses not found.")])
- AC_CHECK_LIB([form], [free_form], [], [AC_ERROR("libform not found.")])
--AC_CHECK_LIB([m], [matherr], [], [AC_ERROR("libm not found.")])
-+AC_CHECK_LIB([m], [pow], [], [AC_ERROR("libm not found.")])
- AC_CHECK_LIB([menu], [new_menu], [], [AC_ERROR("libmenu not found.")])
- AC_CHECK_LIB([panel], [show_panel], [], [AC_ERROR("libpanel not found.")])
- IPRCONFIG_LIBS="$LIBS"
--- 
-2.6.4
-
diff --git a/package/iprutils/0003-iprlib-fixes-for-compatibility-with-musl.patch b/package/iprutils/0003-iprlib-fixes-for-compatibility-with-musl.patch
deleted file mode 100644
index 0fe882fb8..000000000
--- a/package/iprutils/0003-iprlib-fixes-for-compatibility-with-musl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From df3b2b74ed7b49d74f5a5ec5687bcc3188d3b319 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 7 Feb 2016 14:10:44 +0100
-Subject: [PATCH] iprlib: fixes for compatibility with musl
-
-<bits/sockaddr.h> is an internal C library header, which is not
-guaranteed to be available in all C libraries, so it shouldn't be
-included, otherwise iprutils cannot be built with musl.
-
-<limits.h> is needed to get the definition of PATH_MAX.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- iprlib.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iprlib.h b/iprlib.h
-index 16fe1e1..73aa1ce 100644
---- a/iprlib.h
-+++ b/iprlib.h
-@@ -46,9 +46,9 @@
- #include <asm/byteorder.h>
- #include <sys/mman.h>
- #include <paths.h>
--#include <bits/sockaddr.h>
- #include <linux/netlink.h>
- #include <time.h>
-+#include <limits.h>
- 
- typedef uint8_t u8;
- typedef uint16_t u16;
--- 
-2.6.4
-
diff --git a/package/iprutils/iprutils.hash b/package/iprutils/iprutils.hash
index 4b43a6177..20a97da79 100644
--- a/package/iprutils/iprutils.hash
+++ b/package/iprutils/iprutils.hash
@@ -1,2 +1,5 @@
+# From https://sourceforge.net/projects/iprdd/files/iprutils%20for%202.6%20kernels/2.4.14/
+md5 8e5a4fb399f719882f22a6a540afeb0b  iprutils-2.4.14.1.tar.gz
+sha1 7e14b8c0b8909ca2fc50b85848de422cd01ffc9b  iprutils-2.4.14.1.tar.gz
 # Locally computed:
-sha256	99f28418fec505c4dfd532270569d4902a3792dcb2f08710b896f4e7bc0211e0	iprutils-2.4.10.1.tar.gz
+sha256 581403fbca17d4858383f8a6961c0e4aecb3f0f214a3680924238a94b9dc3ddf  iprutils-2.4.14.1.tar.gz
diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index 2d3d62ed6..8bb80c885 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-IPRUTILS_VERSION_MAJOR = 2.4.10
+IPRUTILS_VERSION_MAJOR = 2.4.14
 IPRUTILS_VERSION = $(IPRUTILS_VERSION_MAJOR).1
-IPRUTILS_SITE = http://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION_MAJOR)
+IPRUTILS_SITE = https://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION_MAJOR)
 IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils
 IPRUTILS_LICENSE = Common Public License Version 1.0
 IPRUTILS_LICENSE_FILES = LICENSE
-# Patches touching configure.ac
-IPRUTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.11.0
