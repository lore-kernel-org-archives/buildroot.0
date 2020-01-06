From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  6 Jan 2020 19:24:19 +0100
Subject: [Buildroot] [PATCH 1/2] package/libsigrok: add optional bluez-utils
 dependency
Message-ID: <20200106182420.2833708-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bluez-utils has been added since version 0.5.2 and
https://github.com/sigrokproject/libsigrok/commit/f085705f4888f8127c80539e0fcd1cb3974bdff2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsigrok/libsigrok.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 971e90c94a..922011af7c 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -12,6 +12,16 @@ LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
 LIBSIGROK_CONF_OPTS = --disable-java --disable-python
 
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+LIBSIGROK_CONF_OPTS += --with-libbluez
+LIBSIGROK_DEPENDENCIES += bluez_utils
+else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+LIBSIGROK_CONF_OPTS += --with-libbluez
+LIBSIGROK_DEPENDENCIES += bluez_utils5
+else
+LIBSIGROK_CONF_OPTS += --without-libbluez
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
 LIBSIGROK_CONF_OPTS += --with-libserialport
 LIBSIGROK_DEPENDENCIES += libserialport
-- 
2.24.1
