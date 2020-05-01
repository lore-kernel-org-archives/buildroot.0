From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:28 +0200
Subject: [Buildroot] [git commit] package/ktap: bear the kernel options
 munging
Message-ID: <20200501133530.E9BE990D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b18824ffcb4a1798203138af5efc95fc3f2484ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Anders Darander <anders@chargestorm.se>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk       | 5 -----
 package/ktap/ktap.mk | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 25443c608e..9ba75f3956 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,11 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
-	$(if $(BR2_PACKAGE_KTAP),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER))
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
 	$(if $(BR2_PACKAGE_PCM_TOOLS),
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 3b9134da65..09daba5c53 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -25,5 +25,12 @@ endef
 
 KTAP_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
 
+define KTAP_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
