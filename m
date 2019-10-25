From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 25 Oct 2019 07:35:04 +0200
Subject: [Buildroot] [PATCH v2] package/qemu: enable usb passthrough on host
 variant
Message-ID: <20191025053504.19829-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usb passthrough is a useful feature while using qemu for debugging
purpose.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qemu/Config.in.host | 5 +++++
 package/qemu/qemu.mk        | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 9eceba5021..e74bbafc26 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -83,4 +83,9 @@ config BR2_PACKAGE_HOST_QEMU_VIRTFS
 	  Enables support for virtual filesystem in Qemu allowing
 	  shared filesystem between Qemu and its emulated target.
 
+config BR2_PACKAGE_HOST_QEMU_USB
+	bool "USB passthrough support"
+	help
+	  Enables usb passthrough from guest to host.
+
 endif
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1d3759a850..7e2faf8a54 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -264,6 +264,11 @@ else
 HOST_QEMU_OPTS += --disable-virtfs
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QEMU_USB),y)
+HOST_QEMU_OPTS += --enable-libusb
+HOST_QEMU_DEPENDENCIES += host-libusb
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
-- 
2.17.1
