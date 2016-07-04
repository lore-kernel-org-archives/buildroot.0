From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 11:29:31 +0200
Subject: [Buildroot] [git commit] host-qemu: add support for vde2
Message-ID: <20160704092942.8AB4A816A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be1d93dd523116196327d563758e63fd471bd8e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Additional configuration for host-qemu package:
- Enable VDE2 support for qemu

Signed-off-by: Simon Maes <simonn.maes@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
