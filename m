From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 18:34:52 +0100
Subject: [Buildroot] [PATCH 03/10] package/gnupg2: add optional support for
	libusb-compat
In-Reply-To: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456076099-19607-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libusb-compat was compiled before, gnupg2 will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/libexec/scdaemon | grep NEEDED
[...]
 0x0000000000000001 (NEEDED)             Shared library: [libusb-0.1.so.4]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnupg2/gnupg2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 2e1f067..8d4f373 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -38,6 +38,13 @@ else
 GNUPG2_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+GNUPG2_CONF_OPTS += --enable-ccid-driver
+GNUPG2_DEPENDENCIES += libusb-compat
+else
+GNUPG2_CONF_OPTS += --disable-ccid-driver
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 GNUPG2_CONF_OPTS += --with-readline=$(STAGING_DIR)
 GNUPG2_DEPENDENCIES += readline
-- 
2.7.0
