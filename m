From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:25 +0200
Subject: [Buildroot] [git commit] efibootmgr: use the new gettext logic
Message-ID: <20170704233514.8ECA6802A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2171d073156afc370d7298c1ec464424016e5243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

The BR2_USE_WCHAR dependency was needed for gettext, now that we no
longer need gettext, we can also get rid of this dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efibootmgr/Config.in     | 7 ++-----
 package/efibootmgr/efibootmgr.mk | 4 ++--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 57874fc..1096b9d 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_EFIBOOTMGR
 	depends on !BR2_TOOLCHAIN_USES_MUSL # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-	depends on BR2_USE_WCHAR # gettext
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_EFIVAR
 	help
 	  A Linux user-space application to modify the Intel Extensible
@@ -17,11 +15,10 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhinstaller/efibootmgr
 
-comment "efibootmgr needs a glibc or uClibc toolchain w/ wchar, dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		BR2_TOOLCHAIN_USES_MUSL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index 094dd28..b32d9cb 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -8,8 +8,8 @@ EFIBOOTMGR_VERSION = 14
 EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING
-EFIBOOTMGR_DEPENDENCIES = efivar $(if $(BR2_NEEDS_GETTEXT),gettext)
-EFIBOOTMGR_LDFLAGS = $(TARGET_LDFLAGS) $(if $(BR2_NEEDS_GETTEXT),-lintl)
+EFIBOOTMGR_DEPENDENCIES = efivar $(TARGET_NLS_DEPENDENCIES)
+EFIBOOTMGR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 define EFIBOOTMSR_PATCH_HEADER_PATH
 	$(SED) 's,-I/,-I$(STAGING_DIR)/,' $(@D)/Makefile
