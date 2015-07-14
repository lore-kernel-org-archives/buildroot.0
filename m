From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:21:51 +0200
Subject: [Buildroot] [git commit] linux: add linux-tools infra
Message-ID: <20150714213615.61D2E81D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3a23945a283422ce07b3ca4df5398911c77b3a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit add an infrastructure to build linux kernel
tools available in the kernel sources.

Currently, the only linux kernel tool packaged in Buildroot
is perf and it's packaged as a separate generic package.
This is a problem for licence information raised in this
thread [1].

Since these tools require to build a Linux kernel, we can
use some hooks in linux package like we did for linux
extensions [2] and remove the perf package.

[1] http://lists.busybox.net/pipermail/buildroot/2015-May/128783.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-March/121835.html

[Thomas: fix minor typos in comments.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8c535f3..3ea564f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -313,6 +313,8 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
+# Include all our extensions and tools definitions.
+#
 # Note: our package infrastructure uses the full-path of the last-scanned
 # Makefile to determine what package we're currently defining, using the
 # last directory component in the path. As such, including other Makefile,
@@ -322,6 +324,7 @@ endef
 # the current Makefile, we are OK. But this is a hard requirement: files
 # included here *must* be in the same directory!
 include $(sort $(wildcard linux/linux-ext-*.mk))
+include $(sort $(wildcard linux/linux-tool-*.mk))
 
 LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
@@ -330,6 +333,27 @@ LINUX_PRE_PATCH_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),\
 		$(call UPPERCASE,$(ext))_PREPARE_KERNEL))
 
+# Install Linux kernel tools in the staging directory since some tools
+# may install shared libraries and headers (e.g. cpupower). The kernel
+# image is NOT installed in the staging directory.
+LINUX_INSTALL_STAGING = YES
+
+LINUX_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
+		$($(call UPPERCASE,$(tool))_DEPENDENCIES)))
+
+LINUX_POST_BUILD_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
+		$(call UPPERCASE,$(tool))_BUILD_CMDS))
+
+LINUX_POST_INSTALL_STAGING_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
+		$(call UPPERCASE,$(tool))_INSTALL_STAGING_CMDS))
+
+LINUX_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
+		$(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))
+
 # Checks to give errors that the user can understand
 ifeq ($(BR_BUILDING),y)
 
