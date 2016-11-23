From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 23 Nov 2016 11:16:52 +1100
Subject: [Buildroot] [PATCH 1/1] package/qemu: add option to include tools
Message-ID: <00428a8b4d56493b9a3f68349b42bf9b71f6055e.1479860211.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to QEMU to include the "tools" (configure option:
--enable-tools) in the target. This adds a dependency on pixman, but
that's already present.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
Hi Buildroot,

I often need qemu-img in the target, so I've been using this patch.
In case it's useful to others, here it is.

Cheers,
Sam.

 package/qemu/Config.in | 5 +++++
 package/qemu/qemu.mk   | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 72252ac..f4a75fc 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -112,4 +112,9 @@ comment "FDT support needs a toolchain w/ dynamic library"
 
 endif # BR2_PACKAGE_QEMU_HAS_EMULS
 
+config BR2_PACKAGE_QEMU_TOOLS
+	bool "Enable tools"
+	help
+	  Say 'y' here to include tools packaged with QEMU (e.g. qemu-img).
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cf23f16..2c94a51 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -196,6 +196,12 @@ else
 QEMU_OPTS += --disable-fdt
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_TOOLS),y)
+QEMU_OPTS += --enable-tools
+else
+QEMU_OPTS += --disable-tools
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
@@ -234,7 +240,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-strip                 \
 			--disable-seccomp               \
 			--disable-sparse                \
-			--disable-tools                 \
 			$(QEMU_OPTS)                    \
 	)
 endef
-- 
2.10.0.297.gf6727b0
