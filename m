From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:27:44 +0100
Subject: [Buildroot] [git commit branch/next] package/qemu: add option to
	include tools
Message-ID: <20161126142827.DAF53817AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac6785f12cc6b24e66f3d16eb6058d7c5db6014e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add an option to QEMU to include the "tools" (configure option:
--enable-tools) in the target. This adds a dependency on pixman, but
that's already present.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/Config.in | 5 +++++
 package/qemu/qemu.mk   | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e935ef9..b9c1ca1 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -107,4 +107,9 @@ comment "FDT support needs a toolchain w/ dynamic library"
 
 endif # BR2_PACKAGE_QEMU_HAS_EMULS
 
+config BR2_PACKAGE_QEMU_TOOLS
+	bool "Enable tools"
+	help
+	  Say 'y' here to include tools packaged with QEMU (e.g. qemu-img).
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 45fc0fa..bc707cf 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -204,6 +204,12 @@ else
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
@@ -242,7 +248,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-strip                 \
 			--disable-seccomp               \
 			--disable-sparse                \
-			--disable-tools                 \
 			$(QEMU_OPTS)                    \
 	)
 endef
