From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Feb 2016 09:12:46 +0100
Subject: [Buildroot] [PATCH] kodi,
	mpd: fix samba4 related dependency mistakes
Message-ID: <1454400766-10041-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes the following kconfig warning:

   warning: (BR2_PACKAGE_KODI_LIBSMBCLIENT && BR2_PACKAGE_MPD_LIBSMBCLIENT) selects BR2_PACKAGE_SAMBA4 which has unmet direct dependencies (!BR2_PACKAGE_SAMBA && BR2_USE_MMU && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_NATIVE_RPC && BR2_TOOLCHAIN_HAS_THREADS && !BR2_STATIC_LIBS && !BR2_nios2)

by updating the kodi and mpd Config.in files to properly take into
account the dependencies of the BR2_PACKAGE_SAMBA4 option that they
select.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 5 +++--
 package/mpd/Config.in  | 8 ++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e697b52..a657f5b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -208,12 +208,13 @@ config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 comment "shairport support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-comment "samba support needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "samba support needs an (e)glibc toolchain w/ RPC"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 
 config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	bool "samba"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_SAMBA4
 	help
 	  Enable Samba support
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index be0843f..db79b08 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -189,13 +189,17 @@ config BR2_PACKAGE_MPD_LIBNFS
 comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
-comment "samba support needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "samba support needs an (e)glibc toolchain w/ dynamic library, RPC"
+	depends on !BR2_nios2
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
 
 config BR2_PACKAGE_MPD_LIBSMBCLIENT
 	bool "samba"
 	depends on !BR2_nios2 # samba
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_SAMBA4
 	help
 	  Enable Samba support.
-- 
2.6.4
