From: Martin Kepplinger <martink@posteo.de>
Date: Sun, 30 Apr 2017 15:05:02 +0200
Subject: [Buildroot] [PATCH v2] x11vnc: make x11vnc select libvncserver
In-Reply-To: <20170430084350.zpxjcn7y6ws4w4lf@sapphire.tkos.co.il>
References: <20170430084350.zpxjcn7y6ws4w4lf@sapphire.tkos.co.il>
Message-ID: <20170430130502.32345-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

x11vnc needs libvncserver, so select it explicitely.

In case of missing libvncserver, we see build failures like this:

http://autobuild.buildroot.net/results/34f/34f8045e772b96293cc7d25bd61ac0aa5842824f/

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---

Thanks a lot for your help! I think that's what you meant, right?

revision history
----------------
v2: add libvncserver to build dependencies and !BR2_nios2 to depends
v1: initial patch. add select BR2_PACKAGE_LIBVNCSERVER


 package/x11vnc/Config.in | 2 ++
 package/x11vnc/x11vnc.mk | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 0909b9aec..9d9541cbf 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -2,9 +2,11 @@ config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_nios2 # from libvncserver
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_LIBVNCSERVER
 	help
 	  VNC server for X11 display
 
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 9233b7047..5a505b920 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -16,6 +16,8 @@ X11VNC_LICENSE_FILES = COPYING
 # Source coming from github, no configure included
 X11VNC_AUTORECONF = YES
 
+X11VNC_DEPENDENCIES += libvncserver
+
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 X11VNC_DEPENDENCIES += avahi dbus
 else
-- 
2.11.0
