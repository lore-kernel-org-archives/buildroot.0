From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 16:07:19 -0300
Subject: [Buildroot] [PATCH] xapp_xinit: revert removal
Message-ID: <1368472039-5128-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though xinit isn't included in the X11R7.7 release it is very
useful for debugging and quick tests.
Reinstante it without xdm requiring it though.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/Config.in                |  1 +
 package/x11r7/xapp_xinit/Config.in     | 10 ++++++++++
 package/x11r7/xapp_xinit/xapp_xinit.mk | 12 ++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/x11r7/xapp_xinit/Config.in
 create mode 100644 package/x11r7/xapp_xinit/xapp_xinit.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index f7487da..205079c 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -103,6 +103,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xgamma/Config.in
 		source package/x11r7/xapp_xgc/Config.in
 		source package/x11r7/xapp_xhost/Config.in
+		source package/x11r7/xapp_xinit/Config.in
 		source package/x11r7/xapp_xinput/Config.in
 		source package/x11r7/xapp_xinput-calibrator/Config.in
 		source package/x11r7/xapp_xkbcomp/Config.in
diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
new file mode 100644
index 0000000..aede5d9
--- /dev/null
+++ b/package/x11r7/xapp_xinit/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XAPP_XINIT
+	bool "xinit"
+	# Runtime dependency: can't start an X server unless there is one
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+	# Runtime dependency; mcookie is also in util-linux
+	select BR2_PACKAGE_MCOOKIE if !BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_XAPP_XAUTH
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  X Window System initializer
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
new file mode 100644
index 0000000..fc9218d
--- /dev/null
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xinit -- X Window System initializer
+#
+################################################################################
+
+XAPP_XINIT_VERSION = 1.3.2
+XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
+XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
+
+$(eval $(autotools-package))
-- 
1.8.1.5
