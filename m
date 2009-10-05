From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Oct 2009 21:05:28 +0200
Subject: [Buildroot] [git commit master] x11r7: fix kconfig dependencies
Message-ID: <20091005190727.0A93777793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1ba675c85c717e376103f07fe9dba8abc380089
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most of X.org (E.G. libX11) needs WCHAR support, so ensure that
the toplevel BR2_PACKAGE_XORG7 cannot get enabled unless we have
WCHAR support in the toolchain.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index ace438a..b827367 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -4,10 +4,14 @@ menuconfig BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_FONTCONFIG
+	depends on BR2_USE_WCHAR
 	help
 	  Support for X11R7 libraries, servers, drivers, and/or
 	  applications in the target.
 
+comment "X.org requires a toolchain with WCHAR support"
+        depends on !BR2_USE_WCHAR
+
 if BR2_PACKAGE_XORG7
 
 choice
@@ -19,11 +23,10 @@ choice
 config BR2_PACKAGE_XSERVER_xorg
 	bool "Modular X.org"
 	# depending on BR2_ENABLE_LOCALE gives a recursion error with dbus
-	depends on BR2_USE_WCHAR && BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP # && BR2_ENABLE_LOCALE
+	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP # && BR2_ENABLE_LOCALE
 
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "TinyX"
-	depends on BR2_USE_WCHAR
 
 endchoice
 
-- 
1.6.3.3
