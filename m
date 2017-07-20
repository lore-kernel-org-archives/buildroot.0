From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 23:06:22 +0200
Subject: [Buildroot] [git commit] pulseaudio: improve enabling/disabling of
	Bluez4/Bluez5
Message-ID: <20170720210334.F2C2A7FC94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5defa77123bb2f5bc63c0c44e1fa6ce516026de6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of letting the configure script automatically detect the
presence of bluez package files, the script is now explicitly
instructed to enable or disable bluez (both 4.x and 5.x) support based
on the selection of the following packages: bluez_utils, bluez5_utils
and sbc.

Indeed, the bluez_utils or bluez5_utils packages were not sufficient
to enable Bluetooth support, the sbc package is also needed, but when
no --enable option is passed, the configure script silently disables
Bluetooth support if one of the dependencies is missing.

Signed-off-by: Calin Crisan <ccrisan@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseaudio/pulseaudio.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 2f2cfbb..c627c4b 100644
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
