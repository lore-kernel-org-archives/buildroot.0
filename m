From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:41:49 +0100
Subject: [Buildroot] [RFC 4/8] barebox: add custom help entries
In-Reply-To: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1422394913-13257-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the barebox package is not yet converted to kconfig-package,
make it register its own BAREBOX_HELP_HOOKS so that its custom make
targets are visible in 'barebox-help'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 0fb7cec..4a89952 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -106,6 +106,16 @@ define BAREBOX_INSTALL_TARGET_CMDS
 endef
 endif
 
+define BAREBOX_PACKAGE_HELP
+	@$(foreach editor,menuconfig xconfig gconfig nconfig,\
+		@$(call pkg-print-help-opt,barebox-$(editor),"Run the $(editor) configuration tool")$(sep))
+	@$(call pkg-print-help-opt,barebox-savedefconfig,"Generate a minimal defconfig")
+	@$(call pkg-print-help-opt,barebox-update-config,"Update configuration as a full config file")
+	@$(call pkg-print-help-opt,barefbox-update-defconfig,"Update configuration as a minimal defconfig")
+endef
+
+BAREBOX_HELP_HOOKS += BAREBOX_PACKAGE_HELP
+
 $(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_BAREBOX),y)
-- 
2.1.0
