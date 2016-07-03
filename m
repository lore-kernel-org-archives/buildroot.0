From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2016 00:24:23 +0200
Subject: [Buildroot] [PATCH 3/4] qemu: add support for vde2
In-Reply-To: <1467584664-11640-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467584664-11640-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467584664-11640-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Maes <simonn.maes@gmail.com>

Additional configuration for qemu package:
- Enable VDE2 support for qemu

Signed-off-by: Simon Maes <simonn.maes@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/Config.in.host | 7 +++++++
 package/qemu/qemu.mk        | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 227749a..b3eb590 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -31,4 +31,11 @@ config BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	  Enables the build of the user-land emulator, which allows to
 	  run user-space applications.
 
+config BR2_PACKAGE_HOST_QEMU_VDE2
+	bool "VDE2 support"
+	help
+	  Enables VDE2 support. VDE2 stands for Virtual Distributed
+	  Ethernet and can be used to create virtual switches to
+	  "plug" both physical and virtual machines in them.
+
 endif
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5c3cfea..3ca0958 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -105,6 +105,11 @@ else # BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 HOST_QEMU_OPTS += --disable-linux-user
 endif # BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 
+ifeq ($(BR2_PACKAGE_HOST_QEMU_VDE2),y)
+HOST_QEMU_OPTS += --enable-vde
+HOST_QEMU_DEPENDENCIES += host-vde2
+endif
+
 define HOST_QEMU_CONFIGURE_CMDS
 	cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
 		--target-list="$(HOST_QEMU_TARGETS)"    \
-- 
2.7.4
