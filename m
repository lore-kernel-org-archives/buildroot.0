From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:35:18 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/owfs: add
 optional libftdi dependency
Message-ID: <20190328093303.A8AD5814C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55893e0cbefb03cf667190fbb40f3ce9bf3c08be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

ftdi support has been added in version 3.1p2 and
https://github.com/owfs/owfs/commit/2982df8ca648bd9cec4d820151046b044ef504e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0d060f855f7d9cd688fb9f64360a6538c711b409)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
