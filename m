From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue,  6 Dec 2016 00:07:18 +0100
Subject: [Buildroot] [PATCH 3/3] efibootmgr: depends on wchar
In-Reply-To: <1480979238-18273-1-git-send-email-nunes.erico@gmail.com>
References: <1480979238-18273-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <1480979238-18273-4-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
This "select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT" is slightly
complicated to handle for the propagated wchar dependency, if the
unavailability Kconfig "comment" is added.
Looks like we don't need to always have the wchar dependency as the
dependency on gettext is optional, however this complicates the mention
to 'needs wchar' in the Kconfig comment.
Some packages seem to try to handle this in some smarter way
(BR2_PACKAGE_LINUX_TOOLS_CPUPOWER) but then the comment is not always
accurate.
Please let me know if there is a better way to do this, right now it
seems to be simpler to just require wchar always.
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
-- 
2.7.4
