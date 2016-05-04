From: Simon Maes <simonn.maes@gmail.com>
Date: Wed,  4 May 2016 09:47:59 +0200
Subject: [Buildroot] [PATCH 6/6] qemu: add support for vde2
In-Reply-To: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
Message-ID: <1462348079-7631-6-git-send-email-simonn.maes@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Additional configuration for qemu package:
- Enable VDE2 support for qemu

Signed-off-by: Simon Maes <simonn.maes@gmail.com>
---
 package/qemu/Config.in.host | 8 ++++++++
 package/qemu/qemu.mk        | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 8c07e71..13f13c1 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -86,6 +86,14 @@ config BR2_PACKAGE_HOST_QEMU_STRIP_BINARY
 	help
 	  Say 'y' to enable stripping of the QEMU binary.
 
+config BR2_PACKAGE_HOST_QEMU_VDE2
+	bool "Enable VDE2 Support"
+	help
+	  Say 'y' to enable VDE2 build options for QEMU.
+	  VDE2 stands for Virtual Distributed Ethernet and can be
+	  used to create virtual switches to "plug" both physical
+	  and virtual machines in them.
+
 endif # BR2_PACKAGE_HOST_QEMU_HAS_EMULS
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 4de32b9..79f15e1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -123,6 +123,11 @@ ifeq ($(BR2_PACKAGE_HOST_QEMU_STRIP_BINARY),n)
 HOST_QEMU_OPTS += --disable-strip
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QEMU_VDE2),y)
+HOST_QEMU_OPTS += --enable-vde
+HOST_QEMU_DEPENDENCIES += host-vde2
+endif
+
 endif
 
 define HOST_QEMU_CONFIGURE_CMDS
-- 
2.6.2
