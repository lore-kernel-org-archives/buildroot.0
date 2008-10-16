From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 16 Oct 2008 23:14:49 +0200
Subject: [Buildroot] [PATCH 9/9] Add support for cloning Linux git trees
In-Reply-To: <20081016203301.15826.50075.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203301.15826.50075.stgit@localhost.localdomain>
Message-ID: <20081016211449.GE11249@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 16, 2008 at 02:33:01PM -0600, Grant Likely wrote:
>From: Grant Likely <grant.likely@secretlab.ca>
>
>Add an option in Linux advanced configuration to clone a git repository
>directly (without a snapshot tarball).
>
>---
>
>This patch depends on the earlier patch to add the variable
>$(LINUX26_VERSION_MOD) because the value of $(LINUX26_VERSION) is set
>to 'git' here, but the kernel could report just about any version string.
>---
>
> target/linux/Config.in.advanced   |   30 ++++++++++++++++++++++++++++++
> target/linux/Makefile.in.advanced |   12 ++++++++++++
> 2 files changed, 42 insertions(+), 0 deletions(-)
>
>
>diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
>index 798a662..350129b 100644
>--- a/target/linux/Config.in.advanced
>+++ b/target/linux/Config.in.advanced
>@@ -15,6 +15,10 @@ if BR2_KERNEL_LINUX_ADVANCED
> # BR2_CUSTOM_LINUX26_PATCH_SITE
> # BR2_CUSTOM_LINUX26_PATCH
> #
>+# BR2_LINUX26_GIT
>+# BR2_LINUX26_GIT_URL
>+# BR2_LINUX26_GIT_BRANCH
>+#
> # BR2_LINUX_BSP_PATCH
> #
> # BR2_PACKAGE_LINUX_USE_KCONFIG
>@@ -140,6 +144,11 @@ config BR2_LINUX_2_6_STABLE
> 	help
> 	  Linux 2.6.26.3
> 
>+config BR2_LINUX26_GIT
>+	bool "Use a Linux git repository"
>+	help
>+	  Clone from a git tree.
>+
> config BR2_LINUX_2_6_26
> 	bool "Linux 2.6.26"
> 	select BR2_KERNEL_BASE
>@@ -253,6 +262,26 @@ config BR2_CUSTOM_LINUX26_PATCH_SITE
> 
> endif
> 
>+if BR2_LINUX26_GIT
>+config BR2_LINUX26_GIT_URL
>+	string "git URL"
>+	default "file:///path/to/git/tree/linux-2.6/"
>+	help
>+	  URL to git repository
>+
>+	  Any git URL works here, but you may find it more efficient to
>+	  clone from a tree on the same local filesystem using the file:///
>+	  protocol.  The file:/// protocol allows git to hardlink to the
>+	  respository database which is faster and is requires less disk
>+	  space.
>+
>+config BR2_LINUX26_GIT_BRANCH
>+	string "git branch"
>+	default "master"
>+	help
>+	  Name of branch to use in get repository
>+endif
>+
> # -----------------------------------------------
> 
> menu "Patches"
>@@ -418,6 +447,7 @@ config BR2_LINUX26_VERSION
> 	default "2.6.22.10" if BR2_LINUX_2_6_22_10
> 	default "$(BR2_KERNEL_CURRENT_VERSION)"if BR2_LINUX_2_6_STABLE

looking at the URI of this file. No wonder.

> 	default $(BR2_CUSTOM_LINUX26_VERSION) if BR2_LINUX26_CUSTOM
>+	default "git" if BR2_LINUX26_GIT
> 
> menu "Linux Kernel Configuration"
> 
>diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
>index 9c6df1f..b0cb03e 100644
>--- a/target/linux/Makefile.in.advanced
>+++ b/target/linux/Makefile.in.advanced
>@@ -209,6 +209,7 @@ $(DL_DIR)/$(LINUX26_PATCH_SOURCE):
> 	 $(WGET) -P $(DL_DIR) $(LINUX26_PATCH_SITE)/$(LINUX26_PATCH_SOURCE)
> endif
> 
>+ifneq ($(BR2_LINUX26_GIT),y)
> $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
> 	rm -rf $(LINUX26_DIR)
> 	@echo "*** Unpacking kernel source"
>@@ -218,6 +219,14 @@ ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
> 	mv -f $(PROJECT_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
> endif
> 	touch $@
>+else
>+$(LINUX26_DIR)/.unpacked:
>+	@echo "*** Cloning kernel git tree"
>+	git clone --depth 1 $(BR2_LINUX26_GIT_URL) $(LINUX26_DIR)
>+	cd $(LINUX26_DIR) && \
>+		git reset --hard origin/$(BR2_LINUX26_GIT_BRANCH)
>+	touch $@
>+endif # BR2_LINUX26_GIT

I've done something like this for libtool, and i *think* that i will not
waste _that_ much bandwith over and over again. Not my call, though.
> 
> 
> # -----------------------------------------------------------------------------
>@@ -499,6 +508,9 @@ linux-status:

linux-status. If you have make, you most likely have grep, too.

> 	@echo BR2_LINUX26_CUSTOM=$(BR2_LINUX26_CUSTOM)
> 	@echo BR2_CUSTOM_LINUX26_PATCH_SITE=$(BR2_CUSTOM_LINUX26_PATCH_SITE)
> 	@echo BR2_CUSTOM_LINUX26_PATCH=$(BR2_CUSTOM_LINUX26_PATCH)
>+	@echo BR2_LINUX26_GIT=$(BR2_LINUX26_GIT)
>+	@echo BR2_LINUX26_GIT_URL=$(BR2_LINUX26_GIT_URL)
>+	@echo BR2_LINUX26_GIT_BRANCH=$(BR2_LINUX26_GIT_BRANCH)
> 	@echo BR2_LINUX_BSP_PATCH=$(BR2_LINUX_BSP_PATCH)
> 	@echo BR2_PACKAGE_LINUX_USE_KCONFIG=$(BR2_PACKAGE_LINUX_USE_KCONFIG)
> 	@echo BR2_PACKAGE_LINUX_USE_DEFCONFIG=$(BR2_PACKAGE_LINUX_USE_DEFCONFIG)
>
