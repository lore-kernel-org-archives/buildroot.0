From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 23:50:52 +0100
Subject: [Buildroot] [RFCv1 4/4] core: implement per-package SDK and
 target
In-Reply-To: <20171103160627.6468-5-thomas.petazzoni@free-electrons.com>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-5-thomas.petazzoni@free-electrons.com>
Message-ID: <ab34a9ea-90a0-fc39-273d-0bd08a2c72b0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 17:06, Thomas Petazzoni wrote:
> This commit implemnts the core of the move to per-package SDK and
> target directories. The main idea is that instead of having a global
> output/host and output/target in which all packages install files, we
> switch to per-package host and target folders, that only contain their
> explicit dependencies.
> 
> There are two main benefits:
> 
>  - Packages will no longer discover dependencies that they do not
>    explicitly indicate in their <pkg>_DEPENDENCIES variable.
> 
>  - We can support top-level parallel build properly, because a package
>    only "sees" its own host directory and target directory, isolated
>    from the build of other packages that can happen in parallel.
> 
> It works as follows:
> 
>  - A new output/per-package/ folder is created, which will contain one
>    sub-folder per package, and inside it, a "host" folder and a
>    "target" folder:
> 
>    output/per-package/busybox/target
>    output/per-package/busybox/host
>    output/per-package/host-fakeroot/target
>    output/per-package/host-fakeroot/host
> 
>    This output/per-package/ folder is PER_PACKAGE_DIR, and each
>    package defines <pkg>_TARGET_DIR, <pkg>_HOST_DIR and
>    <pkg>_STAGING_DIR pointing to its own target, host and staging
>    directories.
> 
>  - The <pkg>_TARGET_DIR, <pkg>_HOST_DIR and <pkg>_STAGING_DIR variable
>    are passed as TARGET_DIR, HOST_DIR and STAGING_DIR to the various
>    make targets used for the different build steps of the
>    packages. Effectively this means that when a package references
>    $(HOST_DIR), the value is in fact $(<pkg>_HOST_DIR).
> 
>  - Of course, packages have dependencies, so those dependencies must
>    be installed in the per-package host and target folders before
>    configuring the package. To do so, we simply rsync (using hard
>    links to save space and time) the host and target folders of the
>    direct dependencies of the package to the current package host and
>    target folders. We only need to take care of direct dependencies
>    (and not recursively all dependencies), because we accumulate into
>    those per-package host and target folders the files installed by
>    the dependencies.
> 
>  - We fix LD_LIBRARY_PATH to make it point to the current package host
>    directory.
> 
> This is basically enough to make per-package SDK and target work. The
> only gotcha is that at the end of the build, output/target and
> output/host are empty, which means that:
> 
>  - The filesystem image creation code cannot work.
> 
>  - We don't have a SDK to build code outside of Buildroot.
> 
> In order to fix this, this commit extends the target-finalize step so
> that it starts by populating output/target and output/host by
> rsync-ing into them the target and host directories of all packages
> listed in the $(PACKAGES) variable.

 It would have been good to mention somewhere in the commit log the problem of 2
packages writing the same file...

 Also, is there a good reason not to do the rsync at the end of package
installation? I don't know how robust rsync is against race conditions in
directory or hardlink creation... OK, so I did a test and it races pretty badly
:-) So, could you add this to the commit log? Like:

It is necessary to do this sequentially in the target-finalize step and not in
each package. Doing it in package installation means that it can be done in
parallel. In that case, there is a chance that two rsyncs are creating the same
hardlink or directory at the same time, which makes one of them fail.

> 
> [Note: in fact, output/host is not completely empty, even though they
> should be. It contains the following files:
> output/host/
> output/host/lib64
> output/host/usr
> output/host/share
> output/host/share/buildroot
> output/host/share/buildroot/Platform
> output/host/share/buildroot/Platform/Buildroot.cmake
> output/host/share/buildroot/toolchainfile.cmake
> output/host/lib
> Perhaps those files should be installed by some package instead,
> perhaps the 'toolchain' package.]

 If we go that way: perhaps the .cmake files should be installed by some package
like 'host-cmake-infra' that is added to the dependencies from cmake-package.

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile               | 17 ++++++++++++++---
>  package/pkg-generic.mk | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5496273329..4e1ba62569 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -216,6 +216,8 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
>  BUILD_DIR := $(BASE_DIR)/build
>  BINARIES_DIR := $(BASE_DIR)/images
>  TARGET_DIR := $(BASE_DIR)/target
> +PER_PACKAGE_DIR := $(BASE_DIR)/per-package
> +
>  # initial definition so that 'make clean' works for most users, even without
>  # .config. HOST_DIR will be overwritten later when .config is included.
>  HOST_DIR := $(BASE_DIR)/host
> @@ -231,7 +233,7 @@ LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
>  LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
>  LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
>  
> -export LD_LIBRARY_PATH = $(if $(PKG),$(HOST_DIR)/lib)
> +export LD_LIBRARY_PATH = $(if $(PKG),$($(PKG)_HOST_DIR)/lib)
>  
>  ################################################################################
>  #
> @@ -239,7 +241,7 @@ export LD_LIBRARY_PATH = $(if $(PKG),$(HOST_DIR)/lib)
>  # dependencies anywhere else
>  #
>  ################################################################################
> -$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
> +$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
>  	@mkdir -p $@
>  
>  BR2_CONFIG = $(CONFIG_DIR)/.config
> @@ -675,10 +677,19 @@ endef
>  TARGET_FINALIZE_HOOKS += PURGE_LOCALES
>  endif
>  
> +ALL_PACKAGES_TARGET_DIRS = $(foreach pkg,$(PACKAGES),$($(call UPPERCASE,$(pkg))_TARGET_DIR))
> +ALL_PACKAGES_HOST_DIRS   = $(foreach pkg,$(PACKAGES),$($(call UPPERCASE,$(pkg))_HOST_DIR))
> +
>  $(TARGETS_ROOTFS): target-finalize
>  
>  .PHONY: target-finalize
>  target-finalize: $(PACKAGES)
> +	@$(call MESSAGE,"Creating global target directory")
> +	$(foreach dir,$(ALL_PACKAGES_TARGET_DIRS),\
> +		rsync -au --link-dest=$(dir) $(dir) $(TARGET_DIR)$(sep))

 Why -u? Since we're not actually copying anything, there is no reason to not
overwrite files that already exist, right?

 Also, shouldn't there be a / behind $(dir)? Otherwise, if TARGET_DIR exists
already, rsync will create $(dir) as a subdirectory of $(TARGET_DIR), no?


> +	@$(call MESSAGE,"Creating global host directory")
> +	$(foreach dir,$(ALL_PACKAGES_HOST_DIRS),\
> +		rsync -au --link-dest=$(dir) $(dir) $(HOST_DIR)$(sep))
>  	@$(call MESSAGE,"Finalizing target directory")
>  	$(TOPDIR)/support/scripts/fix-rpath host
>  	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
> @@ -972,7 +983,7 @@ printvars:
>  clean:
>  	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
>  		$(BUILD_DIR) $(BASE_DIR)/staging \
> -		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
> +		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR)
>  
>  .PHONY: distclean
>  distclean: clean
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 82f8c06821..aee4011f63 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -158,6 +158,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
>  $(BUILD_DIR)/%/.stamp_extracted:
>  	@$(call step_start,extract)
>  	@$(call MESSAGE,"Extracting")
> +	@mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR)

 Why do you create them here? It would make more sense to do it just before the
rsync, no?

 Given the possible host-tar and host-lzip dependencies, the rsync should be
done here already, not in the configure step. Ouch, that's not good, because the
dependencies are only evaluated for the configure step... There are
PATCH_DEPENDENCIES, but those are only before patch. Well, I guess that's a
reason to keep host-tar and host-lzip as DEPENDENCIES_HOST_PREREQ :-)

>  	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
>  	$(Q)mkdir -p $(@D)
>  	$($(PKG)_EXTRACT_CMDS)
> @@ -215,6 +216,10 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>  $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call step_start,configure)
>  	@$(call MESSAGE,"Configuring")
> +	$(foreach dir,$($(PKG)_FINAL_DEPENDENCIES_HOST_DIRS),\
> +		rsync -au --link-dest=$(dir) $(dir) $(HOST_DIR)$(sep))

 Shouldn't there be a $Q somewhere?

> +	$(foreach dir,$($(PKG)_FINAL_DEPENDENCIES_TARGET_DIRS),\
> +		rsync -au --link-dest=$(dir) $(dir) $(TARGET_DIR)$(sep))
>  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
>  	$($(PKG)_CONFIGURE_CMDS)
>  	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> @@ -409,6 +414,10 @@ $(2)_NAME			=  $(1)
>  $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
>  $(2)_PKGDIR			=  $(pkgdir)
>  
> +$(2)_TARGET_DIR		= $$(PER_PACKAGE_DIR)/$(1)/target/

 Ah, here is the trailing slash, that explains why it worked. I don't really
like it when you have to rely on a trailing slash in the variable definition...

> +$(2)_HOST_DIR		= $$(PER_PACKAGE_DIR)/$(1)/host/
> +$(2)_STAGING_DIR	= $$(PER_PACKAGE_DIR)/$(1)/host/$(STAGING_SUBDIR)

 I hate adding more per-package variables. Can't you use the expanded values,
substituting $($(PKG)_NAME) for $(1)? Or maybe even better, change the
definition of TARGET_DIR etc:

TARGET_DIR = $(if
$(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_RAWNAME)/target,$(BASE_DIR)/target)

 That way you also don't need to pass those variables to each individual stamp rule.

> +
>  # Keep the package version that may contain forward slashes in the _DL_VERSION
>  # variable, then replace all forward slashes ('/') by underscores ('_') to
>  # sanitize the package version that is used in paths, directory and file names.
> @@ -561,6 +570,13 @@ $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
>  $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
>  $(2)_FINAL_ALL_DEPENDENCIES = $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
>  
> +$(2)_FINAL_DEPENDENCIES_HOST_DIRS = \
> +	$$(foreach dep,$$($(2)_FINAL_DEPENDENCIES),\
> +		$$($$(call UPPERCASE,$$(dep))_HOST_DIR))
> +$(2)_FINAL_DEPENDENCIES_TARGET_DIRS = \
> +	$$(foreach dep,$$($(2)_FINAL_DEPENDENCIES),\
> +		$$($$(call UPPERCASE,$$(dep))_TARGET_DIR))

 I may be overengineering things, but perhaps things can be simplified as
follows (with the definition of TARGET_DIR etc as above):

define RSYNC_HOST_DIRS
	$(foreach pkg,$(1),\
		$(Q)dir=$(PER_PACKAGE_DIR)/$(pkg)/host;\
		rsync -au --link-dest=$$dir $$dir/ $(HOST_DIR)$(sep))
endef

define RSYNC_TARGET_DIRS
	$(foreach pkg,$(1),\
		$(Q)dir=$(PER_PACKAGE_DIR)/$(pkg)/target;\
		rsync -au --link-dest=$$dir $$dir/ $(TARGET_DIR)$(sep))
endef

(as always, completely untested). These macros can be used both in the config
stamp rule and in the finalize rule. I even considered leaving out the argument
and instead defaulting $(1) to
$(if $(PKG),$($(PKG)_FINAL_DEPENDENCIES),$(PACKAGES))
but that probably just makes things harder to understand.


 Otherwise looks good to me :-P

 Regards,
 Arnout

> +
>  $(2)_INSTALL_STAGING		?= NO
>  $(2)_INSTALL_IMAGES		?= NO
>  $(2)_INSTALL_TARGET		?= YES
> @@ -789,17 +805,38 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
>  # define the PKG variable for all targets, containing the
>  # uppercase package variable prefix
>  $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
> +$$($(2)_TARGET_INSTALL_TARGET):		HOST_DIR=$$($(2)_HOST_DIR)
> +$$($(2)_TARGET_INSTALL_TARGET):		STAGING_DIR=$$($(2)_STAGING_DIR)
> +$$($(2)_TARGET_INSTALL_TARGET):		TARGET_DIR=$$($(2)_TARGET_DIR)
>  $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
> +$$($(2)_TARGET_INSTALL_STAGING):	HOST_DIR=$$($(2)_HOST_DIR)
> +$$($(2)_TARGET_INSTALL_STAGING):	STAGING_DIR=$$($(2)_STAGING_DIR)
> +$$($(2)_TARGET_INSTALL_STAGING):	TARGET_DIR=$$($(2)_TARGET_DIR)
>  $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
> +$$($(2)_TARGET_INSTALL_IMAGES):		HOST_DIR=$$($(2)_HOST_DIR)
> +$$($(2)_TARGET_INSTALL_IMAGES):		STAGING_DIR=$$($(2)_STAGING_DIR)
> +$$($(2)_TARGET_INSTALL_IMAGES):		TARGET_DIR=$$($(2)_TARGET_DIR)
>  $$($(2)_TARGET_INSTALL_HOST):		PKG=$(2)
> +$$($(2)_TARGET_INSTALL_HOST):		HOST_DIR=$$($(2)_HOST_DIR)
> +$$($(2)_TARGET_INSTALL_HOST):		STAGING_DIR=$$($(2)_STAGING_DIR)
> +$$($(2)_TARGET_INSTALL_HOST):		TARGET_DIR=$$($(2)_TARGET_DIR)
>  $$($(2)_TARGET_BUILD):			PKG=$(2)
> +$$($(2)_TARGET_BUILD):			HOST_DIR=$$($(2)_HOST_DIR)
> +$$($(2)_TARGET_BUILD):			STAGING_DIR=$$($(2)_STAGING_DIR)
> +$$($(2)_TARGET_BUILD):			TARGET_DIR=$$($(2)_TARGET_DIR)
>  $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
> +$$($(2)_TARGET_CONFIGURE):		HOST_DIR=$$($(2)_HOST_DIR)
> +$$($(2)_TARGET_CONFIGURE):		STAGING_DIR=$$($(2)_STAGING_DIR)
> +$$($(2)_TARGET_CONFIGURE):		TARGET_DIR=$$($(2)_TARGET_DIR)
>  $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>  $$($(2)_TARGET_RSYNC):			PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
>  $$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
>  $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
>  $$($(2)_TARGET_EXTRACT):		PKG=$(2)
> +$$($(2)_TARGET_EXTRACT):		HOST_DIR=$$($(2)_HOST_DIR)
> +$$($(2)_TARGET_EXTRACT):		STAGING_DIR=$$($(2)_STAGING_DIR)
> +$$($(2)_TARGET_EXTRACT):		TARGET_DIR=$$($(2)_TARGET_DIR)
>  $$($(2)_TARGET_SOURCE):			PKG=$(2)
>  $$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
>  $$($(2)_TARGET_ACTUAL_SOURCE):		PKG=$(2)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
