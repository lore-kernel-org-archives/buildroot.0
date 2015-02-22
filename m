From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 14:39:00 +0100
Subject: [Buildroot] [PATCH] linux: adjust fixup logic for ktap
Message-ID: <1424612340-2332-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ktap package requires some parts of the kernel tracing
infrastructure to be enabled, especially
CONFIG_EVENT_TRACING. However, this option is a blind option in the
kernel, so enabling it in linux.mk has no effect: we need to enable a
non-blind option that selects CONFIG_EVENT_TRACING. We've chosen to
select CONFIG_FTRACE.

This fixes the build of ktap.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 29f59e8..75f4936 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -198,7 +198,7 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
-- 
2.1.0
