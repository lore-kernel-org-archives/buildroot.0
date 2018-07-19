From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 19:57:14 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: automatically set
 CONFIG_PERF_EVENTS when perf is enabled
Message-ID: <20180719180713.7E66B88F81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13b8a31289fa5238b0bd64e53ec3571ede84234c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Perf profiling cannot be used if CONFIG_PERF_EVENTS is not enabled in the
kernel configuration. Similar to other tools, like ktap, we can enable the
right options automatically.

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 63d76c6f2f04c836af24098e26f2befe1e8e4cc4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk                | 2 ++
 package/linux-tools/Config.in | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 701d7ee1ae..cc5aeb69cd 100644
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
index e3ccd850f9..fd496bba06 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -48,9 +48,11 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF
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
 
