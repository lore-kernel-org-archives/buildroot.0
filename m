From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:41:48 +0100
Subject: [Buildroot] [RFC 3/8] linux: add custom per-package help text
	contents
In-Reply-To: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1422394913-13257-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the linux package is not yet converted to kconfig-package, make
it register its own LINUX_HELP_HOOKS so that its custom make targets
are visible in 'linux-help'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 29f59e8..c2b31e9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -317,6 +317,16 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
+define LINUX_PACKAGE_HELP
+	@$(foreach editor,menuconfig xconfig gconfig nconfig,\
+		@$(call pkg-print-help-opt,linux-$(editor),"Run the $(editor) configuration tool")$(sep))
+	@$(call pkg-print-help-opt,linux-savedefconfig,"Generate a minimal defconfig")
+	@$(call pkg-print-help-opt,linux-update-config,"Update configuration as a full config file")
+	@$(call pkg-print-help-opt,linux-update-defconfig,"Update configuration as a minimal defconfig")
+endef
+
+LINUX_HELP_HOOKS += LINUX_PACKAGE_HELP
+
 include $(sort $(wildcard linux/linux-ext-*.mk))
 
 $(eval $(generic-package))
-- 
2.1.0
