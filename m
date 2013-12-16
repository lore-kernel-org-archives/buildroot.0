From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 22:09:40 +0100
Subject: [Buildroot] [git commit] linux.mk: enable options for ktap
Message-ID: <20131216211314.871079C0B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aaef2cad852377f8ed9ac5cc3282c9741f81c7d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Certain tracing related options are required to be able to build ktapvm.ko, enable those.

Enable CONFIG_FUNTCTION_TRACER as otherwise, CONFIG_EVENT_TRACING won't stick. (Some
tracer needs to be enabled for this).

[Peter: add a note to ktap Config.in explaining this is done]
Signed-off-by: Anders Darander <anders@chargestorm.se>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk         |    5 +++++
 package/ktap/Config.in |    2 ++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 33931e5..5af167d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -184,6 +184,11 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
+	$(if $(BR2_PACKAGE_KTAP),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
diff --git a/package/ktap/Config.in b/package/ktap/Config.in
index ba6b42b..7f40ce2 100644
--- a/package/ktap/Config.in
+++ b/package/ktap/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_KTAP
 	  Your kernel must have CONFIG_EVENT_TRACING,
 	  CONFIG_PERF_EVENTS, and CONFIG_DEBUG_FS enabled to compile.
 
+	  Buildroot automatically enables these in the kernel configuration.
+
 	  http://www.ktap.org
 
 comment "ktap needs a Linux kernel to be built"
