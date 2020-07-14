From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:18:58 +0200
Subject: [Buildroot] [git commit] package/qemu: add optional vnc support
Message-ID: <20200714201523.AED9786DA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fec5e41c3437ecbbebacd8f6edf45178409f2077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c013e6ffa0..a68f37542c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -98,6 +98,27 @@ else
 QEMU_OPTS += --disable-libusb
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVNCSERVER),y)
+QEMU_OPTS += \
+	--enable-vnc \
+	--disable-vnc-sasl
+QEMU_DEPENDENCIES += libvncserver
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+QEMU_OPTS += --enable-vnc-png
+QEMU_DEPENDENCIES += libpng
+else
+QEMU_OPTS += --disable-vnc-png
+endif
+ifeq ($(BR2_PACKAGE_JPEG),y)
+QEMU_OPTS += --enable-vnc-jpeg
+QEMU_DEPENDENCIES += jpeg
+else
+QEMU_OPTS += --disable-vnc-jpeg
+endif
+else
+QEMU_OPTS += --disable-vnc
+endif
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 QEMU_OPTS += --enable-nettle
 QEMU_DEPENDENCIES += nettle
@@ -140,7 +161,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-bsd-user \
 			--disable-containers \
 			--disable-xen \
-			--disable-vnc \
 			--disable-virtfs \
 			--disable-brlapi \
 			--disable-curses \
