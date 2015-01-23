From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 17:35:43 +0100
Subject: [Buildroot] [git commit] eudev: really bump version
Message-ID: <20150123185533.AFE25801E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14af550d5eb50222196ece3042d2f1e2a9466cf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script checks for linux/btrfs.h which is only available since
3.9 (55e301fd57a6239ec: Btrfs: move fs/btrfs/ioctl.h to
include/uapi/linux/btrfs.h).

It now also uses static_assert which is only available since GCC 4.6, so
handle it as well in the legacy patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...y-use-pragma-for-ignoring-diagnostics-if-.patch |   30 ++++++++++---------
 package/eudev/eudev.mk                             |    2 +-
 system/Config.in                                   |    6 ++-
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch b/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
index 8b70fbf..3046ba5 100644
--- a/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
+++ b/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
@@ -4,34 +4,36 @@ Date: Wed, 2 Apr 2014 12:36:52 +0200
 Subject: [PATCH] libudev: Only use #pragma for ignoring diagnostics if GCC
  version supports it.
 
-
+[Peter: update for 2.1.1, fix shared_assert issue]
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- src/libudev/macro.h |    5 +++++
- 1 file changed, 5 insertions(+)
+ src/shared/macro.h |    8 +++++
+ 1 file changed, 8 insertions(+)
 
-diff --git a/src/libudev/macro.h b/src/libudev/macro.h
-index ac2a23f..fb55983 100644
---- a/src/libudev/macro.h
-+++ b/src/libudev/macro.h
-@@ -40,12 +40,17 @@
+diff --git a/src/shared/macro.h b/src/shared/macro.h
+--- a/src/shared/macro.h
++++ b/src/shared/macro.h
+@@ -38,6 +38,7 @@
  #define _cleanup_(x) __attribute__((cleanup(x)))
  
- 
+ /* Temporarily disable some warnings */
 +#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
- #define DISABLE_WARNING_FORMAT_NONLITERAL                               \
+ #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT                     \
          _Pragma("GCC diagnostic push");                                 \
-         _Pragma("GCC diagnostic ignored \"-Wformat-nonliteral\"")
+         _Pragma("GCC diagnostic ignored \"-Wdeclaration-after-statement\"")
+@@ -48,6 +49,13 @@
  
  #define REENABLE_WARNING                                                \
          _Pragma("GCC diagnostic pop")
 +#else
++#define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT
 +#define DISABLE_WARNING_FORMAT_NONLITERAL
 +#define REENABLE_WARNING
++/* glibc unconditionally defines this, but it needs GCC 4.6+ */
++#undef static_assert
 +#endif
  
- /* Rounds up */
- 
+ #define XCONCATENATE(x, y) x ## y
+ #define CONCATENATE(x, y) XCONCATENATE(x, y)
 -- 
 1.7.9.5
-
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 3cd22be..2221966 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 1.9
+EUDEV_VERSION = 2.1.1
 EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
diff --git a/system/Config.in b/system/Config.in
index 4d7a4e3..e9f2428 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -129,12 +129,14 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 	select BR2_PACKAGE_EUDEV
 
-comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
+comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
 	depends on !BR2_avr32 # eudev
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 
 endchoice
 
