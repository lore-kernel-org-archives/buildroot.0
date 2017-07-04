From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:30 +0200
Subject: [Buildroot] [PATCH 050/100] linux-tools: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-51-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection. The BR2_USE_WCHAR
   dependency was only needed for gettext, so it is no longer needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-tools/Config.in              | 6 ------
 package/linux-tools/linux-tool-cpupower.mk | 4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index db9ed9f..9d5bf7a 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -8,18 +8,12 @@ config BR2_PACKAGE_LINUX_TOOLS
 config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
 	bool "cpupower"
 	depends on !BR2_bfin # pciutils
-	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT # gettext
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_PCIUTILS
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  cpupower is a collection of tools to examine and tune power
 	  saving related features of your processor.
 
-comment "cpupower needs a toolchain w/ wchar"
-	depends on !BR2_bfin
-	depends on !BR2_USE_WCHAR && BR2_NEEDS_GETTEXT
-
 config BR2_PACKAGE_LINUX_TOOLS_GPIO
 	bool "gpio"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-cpupower.mk b/package/linux-tools/linux-tool-cpupower.mk
index 9958cff..2a2d3e0 100644
--- a/package/linux-tools/linux-tool-cpupower.mk
+++ b/package/linux-tools/linux-tool-cpupower.mk
@@ -6,12 +6,12 @@
 
 LINUX_TOOLS += cpupower
 
-CPUPOWER_DEPENDENCIES = pciutils $(if $(BR2_NEEDS_GETTEXT),gettext)
+CPUPOWER_DEPENDENCIES = pciutils $(TARGET_NLS_DEPENDENCIES)
 
 CPUPOWER_MAKE_OPTS = CROSS=$(TARGET_CROSS) \
 	CPUFREQ_BENCH=false \
 	NLS=false \
-	$(if $(BR2_NEEDS_GETTEXT),LDFLAGS=-lintl) \
+	LDFLAGS=$(TARGET_NLS_LIBS) \
 	DEBUG=false
 
 define CPUPOWER_BUILD_CMDS
-- 
2.9.4
