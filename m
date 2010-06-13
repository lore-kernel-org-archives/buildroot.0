From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 20:50:10 +0200
Subject: [Buildroot] [PATCH 06/10] linux: Add dependency on
	host-module-init-tools
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7d614439173007c667d3281f77f3b0669af24502.1276454802.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to not depend on module init tools being installed on the
development environment of the Buildroot user, let's build module init
tools for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk                                 |    2 +-
 package/module-init-tools/module-init-tools.mk |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 39abdea..d3a583e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -113,7 +113,7 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source
 	$(Q)touch $@
 
-linux26: $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
+linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux26
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 3e8b06b..ea7c014 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -17,3 +17,5 @@ MODULE_INIT_TOOLS_AUTORECONF=YES
 HOST_MODULE_INIT_TOOLS_AUTORECONF=YES
 
 $(eval $(call AUTOTARGETS,package,module-init-tools))
+$(eval $(call AUTOTARGETS,package,module-init-tools,host))
+
-- 
1.7.0.4
