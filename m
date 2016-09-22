From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 12:32:34 +0200
Subject: [Buildroot] [git commit] docs/manual: update the linux tools section
Message-ID: <20160922103317.D0C0B81DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73a640160641f6096a9e65984f5a862627b9a187
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
[Thomas:
 - Adjust the Config.in example to show that we now need to "select
   BR2_PACKAGE_LINUX_TOOLS"
 - Adjust the .mk file example to use $(LINUX_DIR) instead of $(@D)]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../adding-packages-linux-kernel-spec-infra.txt    | 49 ++++++++++++----------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.txt b/docs/manual/adding-packages-linux-kernel-spec-infra.txt
index d394ae6..6deb6d4 100644
--- a/docs/manual/adding-packages-linux-kernel-spec-infra.txt
+++ b/docs/manual/adding-packages-linux-kernel-spec-infra.txt
@@ -12,33 +12,36 @@ hooks for building Linux kernel tools or/and building Linux kernel extensions.
 
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
-03: 	help
-04: 	  This is a comment that explains what foo kernel tool is.
-05:
-06: 	  http://foosoftware.org/foo/
+03: 	select BR2_PACKAGE_LINUX_TOOLS
+04: 	help
+05: 	  This is a comment that explains what foo kernel tool is.
+06:
+07: 	  http://foosoftware.org/foo/
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
@@ -52,19 +55,19 @@ It would basically look like:
 09: FOO_DEPENDENCIES = libbbb
 10:
 11: define FOO_BUILD_CMDS
-12:	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools foo
+12: 	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools foo
 13: endef
 14:
 15: define FOO_INSTALL_STAGING_CMDS
-16:	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
-17:		DESTDIR=$(STAGING_DIR) \
-18:		foo_install
+16: 	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+17: 		DESTDIR=$(STAGING_DIR) \
+18: 		foo_install
 19: endef
 20:
 21: define FOO_INSTALL_TARGET_CMDS
-22:	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
-23:		DESTDIR=$(@D) \
-24:		foo_install
+22: 	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+23: 		DESTDIR=$(TARGET_DIR) \
+24: 		foo_install
 25: endef
 --------------------------------
 
@@ -84,7 +87,7 @@ used only when the +foo+ tool is selected. The only supported commands are
 .Note
 One *must not* call +$(eval $(generic-package))+ or any other
 package infrastructure! Linux tools are not packages by themselves,
-they are part of the +linux+ package.
+they are part of the +linux-tools+ package.
 
 [[linux-kernel-ext]]
 ==== linux-kernel-extensions
