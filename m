From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 23:48:24 +0200
Subject: [Buildroot] [git commit] libqmi: add optional features
Message-ID: <20170906214104.7F4D780E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cb40de7ee09338f1e7db03915447434485959cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libqmi library and tools come with several optional features that
may be enabled or disabled during build.

This patch adds support to automatically enable or disable them based
on the presence of the required dependencies for each:
 * QMI-over-MBIM is enabled if libmbim is selected.
 * udev support in qmi-firmware-update is enabled if libgudev is
   selected.
 * MM runtime check in qmi-firmware-update is enabled if ModemManager
   is selected (but we don't build-depend on it, the runtime check is
   done using plain glib2 DBus operations).

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libqmi/libqmi.mk | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 917265f..3a3d079 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -15,7 +15,33 @@ LIBQMI_AUTORECONF = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
-# we don't want -Werror and disable gudev Gobject bindings
-LIBQMI_CONF_OPTS = --enable-more-warnings=no --without-udev
+# we don't want -Werror
+LIBQMI_CONF_OPTS = --enable-more-warnings=no
+
+# if libgudev available, request udev support for a better
+# qmi-firmware-update experience
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+LIBQMI_DEPENDENCIES += libgudev
+LIBQMI_CONF_OPTS += --with-udev
+else
+LIBQMI_CONF_OPTS += --without-udev
+endif
+
+# if libmbim available, request QMI-over-MBIM support
+ifeq ($(BR2_PACKAGE_LIBMBIM),y)
+LIBQMI_DEPENDENCIES += libmbim
+LIBQMI_CONF_OPTS += --enable-mbim-qmux
+else
+LIBQMI_CONF_OPTS += --disable-mbim-qmux
+endif
+
+# if ModemManager available, enable MM runtime check in
+# qmi-firmware-update (note that we don't need to build-depend on
+# anything else)
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
+LIBQMI_CONF_OPTS += --enable-mm-runtime-check
+else
+LIBQMI_CONF_OPTS += --disable-mm-runtime-check
+endif
 
 $(eval $(autotools-package))
