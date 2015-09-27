From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Sep 2015 12:00:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-vmmouse:
	Add optional dependency to udev
Message-ID: <1443348016-18535-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Udev support is enabled by default
http://cgit.freedesktop.org/xorg/driver/xf86-input-vmmouse/tree/configure.ac#n113

and only disabled on demand
http://cgit.freedesktop.org/xorg/driver/xf86-input-vmmouse/tree/configure.ac#n115

Fixes
http://autobuild.buildroot.net/results/201/2011ae075db2cc3c22706f96b190de7a4bda99eb/
http://autobuild.buildroot.net/results/cd3/cd3730ed0272c3f335ee90e0cbc4027b07945db3/
http://autobuild.buildroot.net/results/7f7/7f79ca6a35f405b56aa2d619a649ffb367da7790/
http://autobuild.buildroot.net/results/7c9/7c9ab14b22bb14ce70905d3d1471d96241242827/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index 53ceec8..6e9cf8b 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -11,4 +11,11 @@ XDRIVER_XF86_INPUT_VMMOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+XDRIVER_XF86_INPUT_VMMOUSE_CONF_OPTS += --with-libudev
+XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES += udev
+else
+XDRIVER_XF86_INPUT_VMMOUSE_CONF_OPTS += --without-libudev
+endif
+
 $(eval $(autotools-package))
-- 
2.5.3
