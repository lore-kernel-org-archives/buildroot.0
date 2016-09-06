From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  6 Sep 2016 16:29:15 +0200
Subject: [Buildroot] [PATCH 2/2 v3] docs/manual: update the linux tools
	section
In-Reply-To: <cover.1473171931.git.yann.morin.1998@free.fr>
References: <cover.1473171931.git.yann.morin.1998@free.fr>
Message-ID: <bdadcf3de3e5617f0492d88329476963a06fad44.1473171931.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 .../adding-packages-linux-kernel-spec-infra.txt    | 40 ++++++++++++----------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.txt b/docs/manual/adding-packages-linux-kernel-spec-infra.txt
index d394ae6..a7003cc 100644
--- a/docs/manual/adding-packages-linux-kernel-spec-infra.txt
+++ b/docs/manual/adding-packages-linux-kernel-spec-infra.txt
@@ -12,21 +12,18 @@ hooks for building Linux kernel tools or/and building Linux kernel extensions.
 
 Buildroot offers a helper infrastructure to build some userspace tools
 for the target available within the Linux kernel sources. Since their
-source code is part of the kernel source code, it is not very
-practical to use separate packages for them as they often need to be
-built with the same kernel version as the kernel being used on the
-target. The small Linux kernel tools infrastructure is a simplified
-packaging mechanism based on the generic package infrastructure to
-help building those tools.
+source code is part of the kernel source code, a special package,
++linux-tools+, exists and re-uses the sources of the Linux kernel that
+runs on the target.
 
 Let's look at an example of a Linux tool. For a new Linux tool named
 +foo+, create a new menu entry in the existing
-+linux/Config.tools.in+.  This file will contain the option
++package/linux-tools/Config.in+.  This file will contain the option
 descriptions related to each kernel tool that will be used and
 displayed in the configuration tool. It would basically look like:
 
 ------------------------------
-01: config BR2_LINUX_KERNEL_TOOL_FOO
+01: config BR2_PACKAGE_LINUX_TOOLS_FOO
 02: 	bool "foo"
 03: 	help
 04: 	  This is a comment that explains what foo kernel tool is.
@@ -34,11 +31,16 @@ displayed in the configuration tool. It would basically look like:
 06: 	  http://foosoftware.org/foo/
 ------------------------------
 
-The name of the option starts with the prefix +BR2_LINUX_KERNEL_TOOL_+,
+The name of the option starts with the prefix +BR2_PACKAGE_LINUX_TOOLS_+,
 followed by the uppercase name of the tool (like is done for packages).
 
-Then for each linux tool, add a new +.mk+ file named +linux/linux-tool-foo.mk+.
-It would basically look like:
+.Note
+Unlike other packages, the +linux-tools+ package options appear in the
++linux+ kernel menu, under the `Linux Kernel Tools` sub-menu, not under
+the `Target packages` main menu.
+
+Then for each linux tool, add a new +.mk+ file named
++package/linux-tools/linux-tool-foo.mk+. It would basically look like:
 
 ------------------------------
 01: ################################################################################
@@ -52,19 +54,19 @@ It would basically look like:
 09: FOO_DEPENDENCIES = libbbb
 10:
 11: define FOO_BUILD_CMDS
-12:	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools foo
+12: 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/linux/tools foo
 13: endef
 14:
 15: define FOO_INSTALL_STAGING_CMDS
-16:	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
-17:		DESTDIR=$(STAGING_DIR) \
-18:		foo_install
+16: 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/linux/tools \
+17: 		DESTDIR=$(STAGING_DIR) \
+18: 		foo_install
 19: endef
 20:
 21: define FOO_INSTALL_TARGET_CMDS
-22:	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
-23:		DESTDIR=$(@D) \
-24:		foo_install
+22: 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/linux/tools \
+23: 		DESTDIR=$(TARGET_DIR) \
+24: 		foo_install
 25: endef
 --------------------------------
 
@@ -84,7 +86,7 @@ used only when the +foo+ tool is selected. The only supported commands are
 .Note
 One *must not* call +$(eval $(generic-package))+ or any other
 package infrastructure! Linux tools are not packages by themselves,
-they are part of the +linux+ package.
+they are part of the +linux-tools+ package.
 
 [[linux-kernel-ext]]
 ==== linux-kernel-extensions
-- 
2.7.4
