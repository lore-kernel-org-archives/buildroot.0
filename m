From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 10:39:25 +0200
Subject: [Buildroot] [git commit] package/qemu: Add option to enable USB
 passthrough support on host variant
Message-ID: <20191025084136.553E986164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=900024a2bbf989cdece1e2c41f579f7eac13617a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

USB passthrough is a useful feature while using qemu for debugging purpose.

[Peter: reword commit message, pass --disable-libusb if not enabled]
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in.host | 5 +++++
 package/qemu/qemu.mk        | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 9eceba5021..43d55c88ce 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -83,4 +83,9 @@ config BR2_PACKAGE_HOST_QEMU_VIRTFS
 	  Enables support for virtual filesystem in Qemu allowing
 	  shared filesystem between Qemu and its emulated target.
 
+config BR2_PACKAGE_HOST_QEMU_USB
+	bool "USB passthrough support"
+	help
+	  Enables USB passthrough support from guest to host.
+
 endif
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cf2a570efa..5f97dab39f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -264,6 +264,13 @@ else
 HOST_QEMU_OPTS += --disable-virtfs
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QEMU_USB),y)
+HOST_QEMU_OPTS += --enable-libusb
+HOST_QEMU_DEPENDENCIES += host-libusb
+else
+HOST_QEMU_OPTS += --disable-libusb
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
