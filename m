From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Jun 2020 01:24:31 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/iwd: needs dbus (runtime)
Message-ID: <20200612232433.18442-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes (on startup):

  $ usr/libexec/iwd
  Wireless daemon version 1.7
  Failed to initialize D-Bus

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note:
 - for an alternative iwd without dbus demand take a lookt at
   https://github.com/dylanaraps/eiwd
---
 package/iwd/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index eff24a8599..4501017630 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -1,16 +1,20 @@
 config BR2_PACKAGE_IWD
 	bool "iwd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
 	depends on !BR2_STATIC_LIBS # ell
 	depends on BR2_USE_WCHAR # ell
+	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_ELL
 	help
 	  iNet Wireless daemon (iwd)
 
 	  https://iwd.wiki.kernel.org/
 
-comment "iwd needs a toolchain w/ dynamic library, wchar, headers >= 4.12"
+comment "iwd needs a toolchain w/ threads, dynamic library, wchar, headers >= 4.12"
+	depends on BR2_USE_MMU # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
-- 
2.26.2
