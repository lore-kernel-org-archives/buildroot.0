From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  9 Nov 2016 11:03:05 +0100
Subject: [Buildroot] [PATCH] qemu: allow to build statically
Message-ID: <20161109100305.6261-1-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compiling Qemu statically allows to use it to chroot into target/. It is a
nice feature, so add an option for it.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/qemu/Config.in.host | 26 ++++++++++++++++++++++++++
 package/qemu/qemu.mk        |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index b3eb590..c61b787 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -17,6 +17,32 @@ config BR2_PACKAGE_HOST_QEMU
 
 if BR2_PACKAGE_HOST_QEMU
 
+config BR2_PACKAGE_HOST_QEMU_STATIC
+	bool "Build statically"
+	help
+	  Build static qemu executable(s). Use this option if you want to
+	  'chroot' in your target directory. An example to do this for an ARM
+	  target:
+
+	     1. copy qemu binary on your target directory:
+
+	          cp host/usr/bin/qemu-arm target/usr/bin
+
+	     2. Make sure binfmt_misc is mounted on /proc/sys/fs/binfmt_misc:
+
+	          mount -t binfmt_misc none /proc/sys/fs/binfmt_misc
+
+	     3. Register /usr/bin/qemu-arm is interpreter for arm binaries. See
+	        linux/Documentation/binfmt_misc.txt for more information:
+
+	          MAGIC='\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00'
+	          MASK='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+	          echo ":qemu-arm:M:0:$MAGIC:$MASK:/usr/bin/qemu-arm:OC" > /proc/sys/fs/binfmt_misc/register
+
+	     4. Chroot to your target:
+
+	          chroot target /bin/sh
+
 comment "Emulators selection"
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cf23f16..d33106c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -110,6 +110,10 @@ HOST_QEMU_OPTS += --enable-vde
 HOST_QEMU_DEPENDENCIES += host-vde2
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QEMU_STATIC),y)
+HOST_QEMU_OPTS += --static
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
-- 
2.9.3
