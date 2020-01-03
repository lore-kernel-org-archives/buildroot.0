From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri,  3 Jan 2020 09:52:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/linux-tools: add hooks for busybox
 init and systemd service installation
Message-ID: <20200103085251.7625-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in preparation for adding the HyperV Integration Services

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/linux-tools/linux-tools.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index ac4da59..cd1da86 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -42,4 +42,14 @@ LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))
 
+LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
+		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+			$(call UPPERCASE,$(tool))_INSTALL_INIT_SYSV)))
+
+LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_INIT_SYSTEMD),\
+		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+			$(call UPPERCASE,$(tool))_INSTALL_INIT_SYSTEMD)))
+
 $(eval $(generic-package))
-- 
2.7.4
