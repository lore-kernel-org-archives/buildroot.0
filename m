From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Tue, 14 Jul 2020 11:57:49 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/qemu: add vnc support
Message-ID: <20200714165750.33726-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update to add vnc support to qemu if libvncserver is
selected

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
v1->v2: Update to handle suboptions for vnc support.
---
 package/qemu/qemu.mk | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c013e6ffa0..ff234622f4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -98,6 +98,28 @@ else
 QEMU_OPTS += --disable-libusb
 endif
 
+
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
@@ -140,7 +162,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-bsd-user \
 			--disable-containers \
 			--disable-xen \
-			--disable-vnc \
 			--disable-virtfs \
 			--disable-brlapi \
 			--disable-curses \
-- 
2.17.1
