From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Fri,  7 Oct 2016 17:30:30 -0300
Subject: [Buildroot] [PATCH 3/4] netatop: enable required kernel feature
In-Reply-To: <20161007203031.21528-1-ricardo.martincoski@datacom.ind.br>
References: <20161007203031.21528-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161007203031.21528-3-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When netatop is enabled, the required kernel feature is enabled.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
Inspired by 4c10eedc103ba9648f73439f1ab5d801da9d2ed7
---
 linux/linux.mk            | 2 ++
 package/netatop/Config.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 988427c..8f40a60 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -260,6 +260,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
+	$(if $(BR2_PACKAGE_NETATOP),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
diff --git a/package/netatop/Config.in b/package/netatop/Config.in
index f54a55f..3582962 100644
--- a/package/netatop/Config.in
+++ b/package/netatop/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_NETATOP
 
 	  - CONFIG_NETFILTER
 
+	  This option will be automatically enabled by Buildroot.
+
 	  http://www.atoptool.nl/netatop.php
 
 comment "netatop needs a Linux kernel >= 2.6.24 to be built"
-- 
2.9.3
