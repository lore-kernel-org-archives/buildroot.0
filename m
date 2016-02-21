From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 18:34:51 +0100
Subject: [Buildroot] [PATCH 02/10] package/openobex: depends on libusb-compat
In-Reply-To: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456076099-19607-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Openobex looks for libusb.pc provided by libusb-compat, not libusb-1.0.pc
provided by libusb:
https://github.com/zuckschwerdt/openobex/blob/master/acinclude.m4#L171

Openobex links against both libusb (libusb-1.0.so.0) and libusb-compat
(libusb-0.1.so.4):
$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/ircp | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libopenobex.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libusb-0.1.so.4]
 0x0000000000000001 (NEEDED)             Shared library: [libusb-1.0.so.0]
[...]

This patch changes the dependency in openobex.mk and also selects
libusb-compat.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openobex/Config.in   | 3 ++-
 package/openobex/openobex.mk | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index 2b8cf38..ed1b81f 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -22,8 +22,9 @@ comment "bluez support needs a toolchain w/ wchar, threads, dynamic library"
 
 config BR2_PACKAGE_OPENOBEX_LIBUSB
 	bool "enable libusb support"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
 
 comment "libusb support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index b50dbb7..6a1a10b 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -36,7 +36,7 @@ OPENOBEX_CONF_OPTS += --disable-bluetooth
 endif
 
 ifeq ($(BR2_PACKAGE_OPENOBEX_LIBUSB),y)
-OPENOBEX_DEPENDENCIES += libusb
+OPENOBEX_DEPENDENCIES += libusb-compat
 OPENOBEX_CONF_OPTS += --with-usb=$(STAGING_DIR)
 else
 OPENOBEX_CONF_OPTS += --disable-usb
-- 
2.7.0
