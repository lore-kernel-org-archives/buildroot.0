From: Anders Darander <anders@chargestorm.se>
Date: Mon, 16 Dec 2013 11:53:20 +0100
Subject: [Buildroot] [PATCH 1/1] linux.mk: enable options for ktap
Message-ID: <1387191200-20387-1-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Certain tracing related options are required to be able to build ktapvm.ko, enable those.

Enable CONFIG_FUNTCTION_TRACER as otherwise, CONFIG_EVENT_TRACING won't stick. (Some
tracer needs to be enabled for this).

Signed-off-by: Anders Darander <anders@chargestorm.se>
---

 This is a followup to the introduction of the ktap package, as was discussed in
 http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/72000.

 linux/linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

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
-- 
1.8.5.1
