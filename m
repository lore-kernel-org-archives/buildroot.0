From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Oct 2009 21:22:16 +0200
Subject: [Buildroot] [git commit master] x11r7: tweak kconfig
Message-ID: <20091008202856.2B6B577629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c9a2b035ee5c70a6c62ceb2df90eda3ea73425c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Show comment about what to enable in toolchain to make modular X.org
visible, and move comment about x11r7 toolchain dependency to end,
as otherwise kconfig gets confused and doesn't put X options under
the x11r7 menuconfig.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index b827367..25cc455 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -9,9 +9,6 @@ menuconfig BR2_PACKAGE_XORG7
 	  Support for X11R7 libraries, servers, drivers, and/or
 	  applications in the target.
 
-comment "X.org requires a toolchain with WCHAR support"
-        depends on !BR2_USE_WCHAR
-
 if BR2_PACKAGE_XORG7
 
 choice
@@ -25,6 +22,9 @@ config BR2_PACKAGE_XSERVER_xorg
 	# depending on BR2_ENABLE_LOCALE gives a recursion error with dbus
 	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP # && BR2_ENABLE_LOCALE
 
+comment 'X.org requires largefile, locale and C++ support'
+	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE)
+
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "TinyX"
 
@@ -330,3 +330,6 @@ endmenu
 		source package/x11r7/xkeyboard-config/Config.in
 	endmenu
 endif
+
+comment "X.org requires a toolchain with WCHAR support"
+        depends on !BR2_USE_WCHAR
-- 
1.6.3.3
