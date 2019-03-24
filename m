From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Mar 2019 23:10:19 +0100
Subject: [Buildroot] [PATCH 3/3] package/owfs: add optional libftdi
 dependency
In-Reply-To: <20190324221019.10193-1-fontaine.fabrice@gmail.com>
References: <20190324221019.10193-1-fontaine.fabrice@gmail.com>
Message-ID: <20190324221019.10193-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ftdi support has been added in version 3.1p2 and
https://github.com/owfs/owfs/commit/2982df8ca648bd9cec4d820151046b044ef504e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/owfs/owfs.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 2d0f24fb7c..cd1c2dba6d 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -42,6 +42,20 @@ else
 OWFS_CONF_OPTS += --disable-owfs
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
+OWFS_CONF_OPTS += \
+	--enable-ftdi \
+	--with-libftdi-config=$(STAGING_DIR)/usr/bin/libftdi1-config
+OWFS_DEPENDENCIES += libftdi1
+else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
+OWFS_CONF_OPTS += \
+	--enable-ftdi \
+	--with-libftdi-config=$(STAGING_DIR)/usr/bin/libftdi-config
+OWFS_DEPENDENCIES += libftdi
+else
+OWFS_CONF_OPTS += --disable-ftdi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 OWFS_CONF_OPTS += --enable-usb
 OWFS_DEPENDENCIES += libusb
-- 
2.20.1
