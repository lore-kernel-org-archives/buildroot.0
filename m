From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:45:35 +0100
Subject: [Buildroot] [git commit] efibootmgr: depends on wchar
Message-ID: <20161207224649.CE93F8183C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bde3fbe36114a72b511905070fe8213a0a61d8a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After commit 3ae07b4746 recently, efibootmgr now selects
BR2_PACKAGE_GETTEXT if the toolchain requires it.
gettext depends on wchar, so this dependency should be propagated as
well.
menuconfig currently complains loudly if you select efibootmgr, with an
error such as:

  warning: (... && BR2_PACKAGE_EFIBOOTMGR ... && ) selects
  BR2_PACKAGE_GETTEXT which has unmet direct dependencies
  (BR2_USE_WCHAR)

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efibootmgr/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index a4011d6..57874fc 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 	depends on !BR2_TOOLCHAIN_USES_MUSL # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
+	depends on BR2_USE_WCHAR # gettext
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_EFIVAR
 	help
@@ -16,10 +17,11 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhinstaller/efibootmgr
 
-comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efibootmgr needs a glibc or uClibc toolchain w/ wchar, dynamic library, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		BR2_TOOLCHAIN_USES_MUSL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
