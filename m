From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 13 Jul 2015 23:17:05 +0200
Subject: [Buildroot] [PATCH v2 4/4] docs/manual: add documentation for
	linux-ext and linux-tools.
In-Reply-To: <1436822225-29591-1-git-send-email-romain.naour@openwide.fr>
References: <1436822225-29591-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1436822225-29591-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-kernel-module.txt      |   1 +
 .../adding-packages-linux-kernel-spec-infra.txt    | 140 +++++++++++++++++++++
 docs/manual/adding-packages.txt                    |   2 +
 3 files changed, 143 insertions(+)
 create mode 100644 docs/manual/adding-packages-linux-kernel-spec-infra.txt

diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
index 0a5ec5b..ffeeef5 100644
--- a/docs/manual/adding-packages-kernel-module.txt
+++ b/docs/manual/adding-packages-kernel-module.txt
@@ -128,6 +128,7 @@ configure the build of the kernel module:
 * +FOO_MODULE_MAKE_OPTS+ may be set to contain extra variable definitions
   to pass to the Linux buildsystem.
 
+[[kernel-variables]]
 You may also reference (but you may *not* set!) those variables:
 
  * +LINUX_DIR+ contains the path to where the Linux kernel has been
diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.txt b/docs/manual/adding-packages-linux-kernel-spec-infra.txt
new file mode 100644
index 0000000..a1b92c4
--- /dev/null
+++ b/docs/manual/adding-packages-linux-kernel-spec-infra.txt
@@ -0,0 +1,140 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[linux-kernel-specific-infra]]
+=== Specific infrastructure for the Linux kernel package
+
+The Linux kernel package can use some specific infrastructure based on package
+hooks for building Linux kernel tools or/and adding Linux kernel extensions.
+
+[[linux-kernel-tools]]
+==== linux-kernel-tools
+
+Buildroot offers a helper infrastructure to build some tools available inside
+the Linux kernel sources. Those tools always require a kernel to be built by
+Buildroot, so it's not easy to package them as usual packages. There is a
+simplified packaging based on generic package which builds each of those tools
+right after the kernel.
+
+Let's look at an example of how to add a new Linux tool. For a new Linux tool
+named +foo+, create a new menu entry in the existing +linux/Config.tools.in+.
+This file will contain the option descriptions related to each kernel tool
+that will be used and displayed in the configuration tool. It would basically
+look like:
+
+------------------------------
+01: config BR2_LINUX_KERNEL_TOOL_FOO
+02: 	bool "foo"
+03: 	help
+04: 	  This is a comment that explains what foo kernel tool is.
+05:
+06: 	  http://foosoftware.org/foo/
+------------------------------
+
+The name of the option starts with the prefix +BR2_LINUX_KERNEL_TOOL_+,
+followed by the uppercase name of the tool (like is done for packages).
+
+Then for each linux tool, add a new +.mk+ file named +linux/linux-tool-foo.mk+.
+It would basically look like:
+
+------------------------------
+01: ################################################################################
+02: #
+03: # foo
+04: #
+05: ################################################################################
+06:
+07: LINUX_TOOLS += foo
+08:
+09: FOO_DEPENDENCIES = libbbb
+10:
+11: define FOO_BUILD_CMDS
+12:	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools foo
+13: endef
+14:
+15: define FOO_INSTALL_STAGING_CMDS
+16:	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
+17:		DESTDIR=$(STAGING_DIR) \
+18:		foo_install
+19: endef
+20:
+21: define FOO_INSTALL_TARGET_CMDS
+22:	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
+23:		DESTDIR=$(@D) \
+24:		foo_install
+25: endef
+--------------------------------
+
+On line 7, we register the Linux tool +foo+ to the list of available
+Linux tools.
+
+On line 9, we specify the list of dependencies this tool relies on. These
+dependencies are added to the Linux package dependencies list only when the
++foo+ tool is selected.
+
+The rest of the Makefile, lines 11-25 defines what should be done at the
+different steps of the Linux tool like for a
+xref:generic-package-tutorial[+generic package+]. They will actually be
+used only when the +foo+ tool is selected. The only supported commands are
++_BUILD_CMDS+, +_INSTALL_STAGING_CMDS+ and +_INSTALL_TARGET_CMDS+.
+
+.Note
+One *must not* call +$(eval $(generic-package))+ or any other
+package infrastructure ! Linux tools are not packages by themselves,
+they are part of the linux package.
+
+[[linux-kernel-ext]]
+==== linux-kernel-extensions
+
+Some packages provide new features that require the Linux kernel tree to
+be modified. This can be in the form of patches to be applied on the
+kernel tree, or in the form of new files to be added to the tree. The
+Buildroot's Linux kernel extensions infrastructure provides a simple
+solution to automatically do this.
+
+Let's look at an example on how to add a new Linux extension +foo+.
+
+First, create the package +foo+ that provides the extension: this package
+is a standard package; see the previous chapters on how to create such a
+package.
+
+Then create the 'Linux extension' proper: create a new menu entry in the
+existing +linux/Config.ext.in+. This file contains the option descriptions
+related to each kernel extension that will be used and displayed in the
+configuration tool. It would basically look like:
+
+------------------------------
+01: config BR2_LINUX_KERNEL_EXT_FOO
+02: 	bool "foo"
+03: 	help
+04: 	  This is a comment that explains what foo kernel extension is.
+05:
+06: 	  http://foosoftware.org/foo/
+------------------------------
+
+Then for each linux extension, add a new +.mk+ file named
++linux/linux-ext-foo.mk+. It should basically contain:
+
+------------------------------
+01: ################################################################################
+02: #
+03: # foo
+04: #
+05: ################################################################################
+06:
+07: LINUX_EXTENSIONS += foo
+08:
+09: define FOO_PREPARE_KERNEL
+10:		$(FOO_DIR)/prepare-kernel-tree.sh --linux-dir=$(@D)
+11: endef
+--------------------------------
+
+On line 7, we add the Linux extension +foo+ to the list of available
+Linux extensions.
+
+On line 9-11, we define what should be done by the extension to modify
+the Linux kernel tree; this is specific to the linux extension and can
+use the variables defined by the +foo+ package, like: +$(FOO_DIR)+ or
++$(FOO_VERSION)+... as well as all the Linux variables, like:
++$(LINUX_VERSION)+ or +$(LINUX_VERSION_PROBED)+, +$(KERNEL_ARCH)+...
+See the xref:kernel-variables[definition of those kernel variables].
\ No newline at end of file
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 721fe39..a17d651 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -35,6 +35,8 @@ include::adding-packages-asciidoc.txt[]
 
 include::adding-packages-hooks.txt[]
 
+include::adding-packages-linux-kernel-spec-infra.txt[]
+
 include::adding-packages-gettext.txt[]
 
 include::adding-packages-tips.txt[]
-- 
2.4.3
