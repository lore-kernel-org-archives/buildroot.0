From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Apr 2016 22:24:37 +0200
Subject: [Buildroot] [PATCH] package/racehound: bump and fix dependencies
Message-ID: <1460579077-1219-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed out by Arnout, racehound does not require kernel headers
3.14-or-later. So, drop this depenency.

It stills require a kernel >= 3.14 to build and run, but we really hae
no way to express that dependency as Kconfig options.

Besides, racehound oes not build with kernel 4.5 because the struct
modules has been updated. Bump racehound to fix that build failure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/racehound/Config.in    | 6 ++----
 package/racehound/racehound.mk | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index 53e39a8..6f62f81 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RACEHOUND
 	bool "racehound"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
@@ -30,8 +29,7 @@ comment "racehound needs an Linux kernel >= 3.14 to be built"
 	depends on !BR2_LINUX_KERNEL
 	depends on BR2_i386 || BR2_x86_64
 
-comment "racehound needs a uClibc or (e)glibc toolchain w/ C++, wchar, dynamic library, headers >= 3.14"
+comment "racehound needs a uClibc or (e)glibc toolchain w/ C++, wchar, dynamic library"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
index 7d8d1e3..8e282c1 100644
--- a/package/racehound/racehound.mk
+++ b/package/racehound/racehound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RACEHOUND_VERSION = f3375911019607a0cb6a15bf68fa62dadd6b790b
+RACEHOUND_VERSION = f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c
 RACEHOUND_SITE = $(call github,winnukem,racehound,$(RACEHOUND_VERSION))
 RACEHOUND_LICENSE = GPLv2
 RACEHOUND_LICENSE_FILES = LICENSE
-- 
1.9.1
