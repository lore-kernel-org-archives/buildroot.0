From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri, 25 Oct 2019 15:28:52 -0300
Subject: [Buildroot] [PATCH] package/qemu: use libusb (for usb passthrough)
 if it's selected
Message-ID: <20191025182852.29670-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

This allows sharing a host USB port with the guest, which is helpful for
the upcoming libvirt package.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/qemu/qemu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3c8b0f43d8..4e39fce8a6 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -97,6 +97,13 @@ else
 QEMU_OPTS += --disable-libssh2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+QEMU_OPTS += --enable-libusb
+QEMU_DEPENDENCIES += libusb
+else
+QEMU_OPTS += --disable-libusb
+endif
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 QEMU_OPTS += --enable-nettle
 QEMU_DEPENDENCIES += nettle
-- 
2.18.1
