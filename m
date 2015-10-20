From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Oct 2015 09:55:30 +0200
Subject: [Buildroot] [git commit] exfat-utils: bump to version 1.2.1
Message-ID: <20151020075546.8AD1D81ECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ef6efe3142da3007160ea84fa79cbf4def5bb6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to github homepage and site.
Package is now autotools-based.
libc patch no longer required.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-compiling-with-non-glibc-libcs.patch  |   26 --------------------
 package/exfat-utils/Config.in                      |    2 +-
 package/exfat-utils/exfat-utils.hash               |    4 +-
 package/exfat-utils/exfat-utils.mk                 |   18 ++-----------
 4 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch b/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
deleted file mode 100644
index d280040..0000000
--- a/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] fix compilation when libc does not define __GLIBC__
-
-libexfat would only compile on Linux with __GLIBC__ defined. Changed
-to use __linux__ which likely better fits the original intent.
-
-Upstream status: applied.
-See https://groups.google.com/forum/#!topic/exfat/8g3yumqrf1A.
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- platform.h |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: libexfat/libexfat/platform.h
-===================================================================
---- libexfat/libexfat/platform.h	(revision 422)
-+++ libexfat/libexfat/platform.h	(working copy)
-@@ -24,7 +24,7 @@
- #ifndef PLATFORM_H_INCLUDED
- #define PLATFORM_H_INCLUDED
- 
--#if defined(__GLIBC__)
-+#if defined(__linux__)
- 
- #include <endian.h>
- #include <byteswap.h>
diff --git a/package/exfat-utils/Config.in b/package/exfat-utils/Config.in
index aedff5f..9dfbbfc 100644
--- a/package/exfat-utils/Config.in
+++ b/package/exfat-utils/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_EXFAT_UTILS
 	help
 	  exFAT filesystem utilities.
 
-	  http://code.google.com/p/exfat/
+	  https://github.com/relan/exfat
 
 comment "exfat-utils needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
index 79ccf42..ebf5638 100644
--- a/package/exfat-utils/exfat-utils.hash
+++ b/package/exfat-utils/exfat-utils.hash
@@ -1,2 +1,2 @@
-# From https://code.google.com/p/exfat/wiki/Downloads?tm=2
-sha1	ddf0819c27aeb3eaae5aae0423d4dafc54d477da	exfat-utils-1.1.1.tar.gz
+# Locally calculated
+sha256	a91bd60c1a05e5421da46a1f7cdca19d6db85f2de0afedf8f0f5ff77f8edbcb4	exfat-utils-1.2.1.tar.gz
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index 4f43233..60eb60f 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,21 +4,9 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.1.1
-EXFAT_UTILS_SITE = http://distfiles.gentoo.org/distfiles
-EXFAT_UTILS_DEPENDENCIES = host-scons
+EXFAT_UTILS_VERSION = 1.2.1
+EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPLv3+
 EXFAT_UTILS_LICENSE_FILES = COPYING
 
-define EXFAT_UTILS_BUILD_CMDS
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS))
-endef
-
-define EXFAT_UTILS_INSTALL_TARGET_CMDS
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS) \
-		DESTDIR=$(TARGET_DIR)/usr/bin install)
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
