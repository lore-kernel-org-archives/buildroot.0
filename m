From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed,  4 Jul 2018 09:07:35 +0200
Subject: [Buildroot] [PATCH 1/5] linux: automatically set CONFIG_PERF_EVENTS
 when perf is enabled
In-Reply-To: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180704070739.7259-2-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Perf profiling cannot be used if CONFIG_PERF_EVENTS is not enabled in the
kernel configuration. Similar to other tools, like ktap, we can enable the
right options automatically.

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 linux/linux.mk                | 2 ++
 package/linux-tools/Config.in | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6b5f5344ed..7f4c916671 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -292,6 +292,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
+	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 2527c90257..349dc6bf0d 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -47,9 +47,11 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF
 	  code), single CPU or severals threads.
 
 	  This will build and install the userspace 'perf'
-	  command. It is up to the user to ensure that the kernel
-	  configuration has all the suitable options enabled to allow a
-	  proper operation of 'perf'.
+	  command.
+
+	  Your kernel must have CONFIG_PERF_EVENTS enabled to use perf
+	  profiling. Buildroot automatically enables this in the kernel
+	  configuration.
 
 	  https://perf.wiki.kernel.org/
 
-- 
2.16.4
