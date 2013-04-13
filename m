From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 13 Apr 2013 08:49:32 +0100
Subject: [Buildroot] [PATCH] ofono: bump to version 1.12
Message-ID: <1365839373-19783-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/ofono/ofono.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index e552eac..47228b5 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -3,7 +3,7 @@
 # ofono
 #
 #############################################################
-OFONO_VERSION = 1.7
+OFONO_VERSION = 1.12
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
@@ -14,6 +14,12 @@ OFONO_DEPENDENCIES = \
 
 OFONO_CONF_OPT = --disable-test
 
+# N.B. Qualcomm QMI modem support requires O_CLOEXEC, which
+# is not available on uClibc.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+	OFONO_CONF_OPT += --disable-qmimodem
+endif
+
 ifeq ($(BR2_PACKAGE_UDEV),y)
 	OFONO_CONF_OPT += --enable-udev
 	OFONO_DEPENDENCIES += udev
-- 
1.7.10.4
