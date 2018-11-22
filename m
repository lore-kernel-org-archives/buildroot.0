From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 22 Nov 2018 16:21:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: allow enabling virtual
 filesystem
Message-ID: <1542900100-13157-1-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce builrdoot package configuration directive to enable Qemu host configuration directive

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/qemu/Config.in.host | 6 ++++++
 package/qemu/qemu.mk        | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 957c7d2..8840ff5 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -67,4 +67,10 @@ config BR2_PACKAGE_HOST_QEMU_VDE2
 	  Ethernet and can be used to create virtual switches to
 	  "plug" both physical and virtual machines in them.
 
+config BR2_PACKAGE_HOST_QEMU_VIRTFS
+	bool "Enable virtual filesystem in Qemu emulator"
+	help
+	  Enables support for virtual filesystem in Qemu allowing
+	  shared filesystem between Qemu and its emulated target.
+
 endif
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 709535a..8153c06 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -254,6 +254,10 @@ HOST_QEMU_OPTS += --enable-vde
 HOST_QEMU_DEPENDENCIES += host-vde2
 endif
 
+ifdef ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)
+HOST_QEMU_OPTS += --enable-virtfs
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
-- 
1.9.1
