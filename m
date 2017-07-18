From: Calin Crisan <ccrisan@gmail.com>
Date: Tue, 18 Jul 2017 11:55:39 +0300
Subject: [Buildroot] [PATCH 1/1] pulseaudio: properly enable/disable bluez
	support based on package selection
Message-ID: <20170718085547.10828-1-ccrisan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of letting the configure script automatically detect the presence of
bluez package files, the script is now explicitly instructed to enable or
disable bluez (both 4.x and 5.x) support based on the selection of the
following packages: bluez_utils, bluez5_utils and sbc.

Signed-off-by: Calin Crisan <ccrisan@gmail dot com>
---
 package/pulseaudio/pulseaudio.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 2f2cfbbed..c627c4b5b 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -31,8 +31,6 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
-	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils) \
-	$(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
@@ -81,6 +79,20 @@ else
 PULSEAUDIO_CONF_OPTS += --without-soxr
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS)$(BR2_PACKAGE_SBC),yy)
+PULSEAUDIO_CONF_OPTS += --enable-bluez4
+PULSEAUDIO_DEPENDENCIES += bluez_utils sbc
+else
+PULSEAUDIO_CONF_OPTS += --disable-bluez4
+endif
+
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
+PULSEAUDIO_CONF_OPTS += --enable-bluez5
+PULSEAUDIO_DEPENDENCIES += bluez5_utils sbc
+else
+PULSEAUDIO_CONF_OPTS += --disable-bluez5
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 PULSEAUDIO_CONF_OPTS += --enable-udev
 PULSEAUDIO_DEPENDENCIES += udev
-- 
2.13.3
