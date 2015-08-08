From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:48 -0000
Subject: [Buildroot] [git commit branch/next] linux-tools: add cpupower
Message-ID: <20150808105633.58F1280414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1863ede94c29e120d7ce900f7cce211f1e8633a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch is based on the patch send by James Knight:
http://lists.busybox.net/pipermail/buildroot/2015-May/128754.html

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: James Knight <james.knight@rockwellcollins.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in              |    3 +++
 linux/Config.tools.in        |   11 +++++++++++
 linux/linux-tool-cpupower.mk |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8c86a1a..097cde5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -364,6 +364,9 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 # Linux extensions
 source "linux/Config.ext.in"
 
+# Linux tools
+source "linux/Config.tools.in"
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/Config.tools.in b/linux/Config.tools.in
new file mode 100644
index 0000000..008e68c
--- /dev/null
+++ b/linux/Config.tools.in
@@ -0,0 +1,11 @@
+menu "Linux Kernel Tools"
+
+config BR2_LINUX_KERNEL_TOOL_CPUPOWER
+	bool "cpupower"
+	depends on !BR2_bfin # pciutils
+	select BR2_PACKAGE_PCIUTILS
+	help
+	  cpupower is a collection of tools to examine and tune power
+	  saving related features of your processor.
+
+endmenu
diff --git a/linux/linux-tool-cpupower.mk b/linux/linux-tool-cpupower.mk
new file mode 100644
index 0000000..4551cda
--- /dev/null
+++ b/linux/linux-tool-cpupower.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# cpupower
+#
+################################################################################
+
+LINUX_TOOLS += cpupower
+
+CPUPOWER_DEPENDENCIES = pciutils
+
+CPUPOWER_MAKE_OPTS = CROSS=$(TARGET_CROSS) \
+	CPUFREQ_BENCH=false \
+	DEBUG=false
+
+define CPUPOWER_BUILD_CMDS
+	$(Q)if test ! -f $(@D)/tools/power/cpupower/Makefile ; then \
+		echo "Your kernel version is too old and does not have the cpupower tool." ; \
+		echo "At least kernel 3.4 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
+		$(CPUPOWER_MAKE_OPTS) \
+		cpupower
+endef
+
+define CPUPOWER_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
+		$(CPUPOWER_MAKE_OPTS) \
+		DESTDIR=$(STAGING_DIR) \
+		cpupower_install
+endef
+
+define CPUPOWER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
+		$(CPUPOWER_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		cpupower_install
+endef
