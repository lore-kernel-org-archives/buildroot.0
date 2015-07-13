From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 18:26:58 +0200
Subject: [Buildroot] [git commit] linux: adjust fixup logic for ktap
Message-ID: <20150713162738.6BFFB818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90d008ea7ab4fe0cf8e17b27b978bc367edfd8c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ktap package requires some parts of the kernel tracing
infrastructure to be enabled, especially
CONFIG_EVENT_TRACING. However, this option is a blind option in the
kernel, so enabling it in linux.mk has no effect: we need to enable a
non-blind option that selects CONFIG_EVENT_TRACING. We've chosen to
select CONFIG_ENABLE_DEFAULT_TRACERS.

This fixes the build of ktap.

[Thomas: use CONFIG_ENABLE_DEFAULT_TRACERS as suggested by Arnout.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index eca1450..b602a04 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -207,7 +207,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
