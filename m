From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 07:18:04 +0200
Subject: [Buildroot] [PATCH v2 11/17] refpolicy: new package
In-Reply-To: <1378936777-28308-12-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378936777-28308-12-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20130918071804.2548927a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 11 Sep 2013 16:59:31 -0500, Clayton Shotwell wrote:

> +config BR2_PACKAGE_REFPOLICY_PATCH_FOLDER
> +	string "Build specific refpolicy patches folder"
> +	default ""
> +	help
> +	  A path to a folder containing board specific 
> +	  configuration patch files.  These will get applied
> +	  after the patches in the package folder.

We already have the BR2_GLOBAL_PATCH_DIR mechanism to allow people to
provide custom patches for all packages. See
http://buildroot.org/downloads/manual/manual.html#_global_patch_directory.
So there shouldn't be a need to add a refpolicy specific mechanism for
this.

> +choice
> +	prompt "SELinux policy type"
> +	default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +
> +	config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +		bool "Standard"
> +		help
> +		  Standard SELinux policy
> +	
> +	config BR2_PACKAGE_REFPOLICY_TYPE_MCS
> +		bool "MCS"
> +		help
> +		  SELinux policy with multi-catagory support
> +	
> +	config BR2_PACKAGE_REFPOLICY_TYPE_MLS
> +		bool "MLS"
> +		help
> +		  SELinux policy with multi-catagory and multi-level support
> +endchoice
> +
> +config BR2_PACKAGE_REFPOLICY_TYPE
> +	string
> +	default "standard" if BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +	default "mcs" if BR2_PACKAGE_REFPOLICY_TYPE_MCS
> +	default "mls" if BR2_PACKAGE_REFPOLICY_TYPE_MLS
> +
> +choice
> +	prompt "SELinux Policy Distribution"
> +	default BR2_PACKAGE_REFPOLICY_DIST_REDHAT
> +	
> +	config BR2_PACKAGE_REFPOLICY_DIST_REDHAT
> +		bool "redhat"
> +
> +	config BR2_PACKAGE_REFPOLICY_DIST_GENTOO
> +		bool "gentoo"
> +
> +	config BR2_PACKAGE_REFPOLICY_DIST_DEBIAN
> +		bool "debian"
> +
> +	config BR2_PACKAGE_REFPOLICY_DIST_SUSE
> +		bool "suse"
> +
> +	config BR2_PACKAGE_REFPOLICY_DIST_REDHAT14
> +		bool "redhat 14"
> +endchoice

Do we really need to provide a distribution choice here? Isn't
'Buildroot' considered a distribution? I must admit that as a Buildroot
user, I would be somewhat confused by a choice that allows me to select
between debian, suse, gentoo, redhat, etc. This Buildroot is "sort" of
a distribution, shouldn't we just make one choice that happens to work
for Buildroot ?

> +config BR2_PACKAGE_REFPOLICY_MONOLITHIC
> +	bool "Build a monolithic SELinux policy"
> +	default y
> +	help
> +	  Select Y to build a monolithic SELinux policy otherwise
> +	  a modular policy will be built. Note, this is suggested
> +	  for embedded systems.

For a non-english speaker, the wording of "Note, this is suggested for
embedded systems" might suggest that what is recommended is to build a
modular policy.

Also, what about inverting the logic of this option? I.e:

config BR2_PACKAGE_REFPOLICY_MODULAR
	bool "Build a modular SELinux policy"
	help
	  Select Y to build a modular SELinux policy. By default,
	  SELinux builds a monolithic policy, which is the best
	  solution for embedded systems for space/performance reasons
	  (FIXME), but building a modular policy might be useful in
	  (FIXME).

> +config BR2_PACKAGE_REFPOLICY_NAME
> +	string "Name for the SELinux policy"
> +	default "refpolicy"

Is this something that is actually useful to change?

> +endif
> diff --git a/package/refpolicy/S12selinux b/package/refpolicy/S12selinux
> new file mode 100644
> index 0000000..24aec7a
> --- /dev/null
> +++ b/package/refpolicy/S12selinux
> @@ -0,0 +1,134 @@
> +#!/bin/sh
> +################################################################################
> +#
> +# This file labels the security contexts of memory based filesystems such as
> +# /dev/ and checks for auto relabel request if '/.autorelabel' file exists.
> +# The 'stop' argument drops the security mode to 'permissive'.
> +#
> +# This script is a heavily stripped down and modified version of the one use

Minor nit: use -> used

> diff --git a/package/refpolicy/config b/package/refpolicy/config
> new file mode 100755
> index 0000000..c482b3f
> --- /dev/null
> +++ b/package/refpolicy/config
> @@ -0,0 +1,10 @@
> +# This file controls the state of SELinux on the system.
> +# SELINUX= can take one of these three values:
> +#     enforcing - SELinux security policy is enforced.
> +#     permissive - SELinux prints warnings instead of enforcing.
> +#     disabled - No SELinux policy is loaded.
> +SELINUX=permissive
> +# SELINUXTYPE= can take one of these two values:
> +#     targeted - Targeted processes are protected,
> +#     mls - Multi Level Security protection.
> +SELINUXTYPE=refpolicy

So the default value for SELINUXTYPE is not one of the two accepted
values? Seems odd.

> diff --git a/package/refpolicy/refpolicy-0001-gentoo_hardened_fixes.patch b/package/refpolicy/refpolicy-0001-gentoo_hardened_fixes.patch
> new file mode 100644
> index 0000000..c1c398f
> --- /dev/null
> +++ b/package/refpolicy/refpolicy-0001-gentoo_hardened_fixes.patch
> @@ -0,0 +1,1250 @@
> +From: Dominick Grift <dominick.grift@gmail.com>
> +Date: Fri, 16 Aug 2013 07:07:37 +0000 (+0200)
> +Subject: Fix monolithic built
> +X-Git-Url: http://git.overlays.gentoo.org/gitweb/?p=proj%2Fhardened-refpolicy.git;a=commitdiff_plain;h=86500de7
> +
> +Fix monolithic built

Do we have a chance of getting this patch merged upstream? We don't
like to carry feature patches in Buildroot, so if a feature doesn't
exist upstream, or is so broken upstream and never going to be fixed,
then we prefer to not support it at all.

If fixing this upstream is an on-going effort, then no problem to carry
the patch in Buildroot.

> --- /dev/null
> +++ b/package/refpolicy/refpolicy.mk
> @@ -0,0 +1,86 @@
> +################################################################################
> +#
> +# refpolicy
> +#
> +################################################################################
> +
> +REFPOLICY_VERSION = 2.20130424
> +REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
> +REFPOLICY_SITE = http://oss.tresys.com/files/refpolicy/
> +REFPOLICY_LICENSE = GPLv2
> +REFPOLICY_LICENSE_FILES = COPYING
> +
> +# Cannot use multiple threads to build the reference policy
> +REFPOLICY_MAKE=$(MAKE1)
> +
> +REFPOLICY_DEPENDENCIES = host-m4 host-checkpolicy host-policycoreutils \
> +	host-setools host-python-pyxml policycoreutils

Do we really need all those dependencies? I've tried to draw a diagram
of all the host and target dependencies between all these SELinux
packages, but I must admit I get a bit lost. If you could give some
general comments on why the various target/host variants of each
package are needed, that'd be really great.

> +
> +REFPOLICY_INSTALL_STAGING = YES
> +
> +define REFPOLICY_BUILD_SPECIFIC_PATCH_CMDS
> +	@echo "Applying board specific patches"
> +	$(ifneq $(BR2_PACKAGE_REFPOLICY_PATCH_FOLDER) "", \
> +		toolchain/patch-kernel.sh $(@D) \
> +		$(call qstrip,$(BR2_PACKAGE_REFPOLICY_PATCH_FOLDER)) refpolicy-\*.patch)
> +endef
> +
> +REFPOLICY_POST_PATCH_HOOKS += REFPOLICY_BUILD_SPECIFIC_PATCH_CMDS

This part would become unneeded, as per the above suggestions.

> +# Pointing to the host compiled SELinux applications while using the target 
> +# cross compiler.  Note, the TEST_TOOLCHAIN option will also set the 
> +# LD_LIBRARY_PATH at run time.
> +REFPOLICY_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \

I'm not really a big fan of passing $(HOST_CONFIGURE_OPTS) when
building a target package. If all you need is that the PATH contains
output/host/usr/bin so that the host SELinux applications are used,
then just use $(TARGET_MAKE_ENV) :

	$(TARGET_MAKE_ENV) $(MAKE1) ...

> +	TEST_TOOLCHAIN="$(HOST_DIR)" \
> +	PYTHON="$(HOST_DIR)/usr/bin/python" \
> +	M4="$(HOST_DIR)/usr/bin/m4"

Those two last lines should then be unneeded.

> +define REFPOLICY_CONFIGURE_CMDS
> +	$(REFPOLICY_MAKE) -C $(@D) bare $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)

so:

	$(TARGET_MAKE_ENV) -C $(@D) bare $(REFPOLICY_MAKE_CMDS) ...

> +	sed -i "/TYPE/c\TYPE = $(BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
> +	sed -i "/NAME/c\NAME = $(BR2_PACKAGE_REFPOLICY_NAME)" $(@D)/build.conf
> +	sed -i "/DISTRO/c\DISTRO = $(BR2_PACKAGE_REFPOLICY_DIST)" $(@D)/build.conf
> +	sed -i "/MONOLITHIC/c\MONOLITHIC = $(BR2_PACKAGE_REFPOLICY_MONOLITHIC)" $(@D)/build.conf

Use $(SED) instead of sed -i

> +	$(REFPOLICY_MAKE) -C $(@D) conf $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define REFPOLICY_BUILD_CMDS
> +	$(REFPOLICY_MAKE) -C $(@D) $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define REFPOLICY_CLEAN_CMDS
> +	$(REFPOLICY_MAKE) -C $(@D) clean $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define REFPOLICY_INSTALL_STAGING_CMDS
> +	$(REFPOLICY_MAKE) -C $(@D) install-src install-headers install-docs \
> +		$(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define REFPOLICY_INSTALL_TARGET_CMDS
> +	$(REFPOLICY_MAKE) -C $(@D) install $(REFPOLICY_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
> +	$(INSTALL) -m 0755 package/refpolicy/config $(TARGET_DIR)/etc/selinux/

Use -D and specify the destination path entirely.

> +	sed -i "/^SELINUXTYPE/c\SELINUXTYPE=$(BR2_PACKAGE_REFPOLICY_NAME)" $(TARGET_DIR)/etc/selinux/config

$(SED).

> +	$(INSTALL) -m 0755 package/refpolicy/S12selinux $(TARGET_DIR)/etc/init.d/

Should be using the INIT_SYSV mechanism (look at other packages and/or
documentation), use -D and specific the destination path entirely.

> +endef
> +
> +define REFPOLICY_POLICY_COMPILE
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/policy
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/modules/active/modules
> +	if [ ! -f $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/contexts/files/file_contexts.local ]; \
> +	then \
> +		touch $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/contexts/files/file_contexts.local; \
> +	fi

Why not just touch it? If it exists, it will just update its timestamp,
so no big deal.

> +	# Currently, semodule is unabled to compile the policy during the build so 
> +	# the modules must be compiled into the policy during the first boot.  This 
> +	# is done by the S12selinux startup script.
> +	#( export PATH=$(TARGET_PATH); \
> +	#	$(HOST_DIR)/usr/sbin/semodule -v -n -p $(TARGET_DIR) -s $(BR2_PACKAGE_REFPOLICY_NAME) \
> +	#		-b $(@D)/base.pp -i $(shell ls $(@D)/*.pp | grep -v base); \
> +	#)

So if this was done at build time, we could avoid having a bunch of
tools on the target?

> +endef
> +ifeq ($(BR2_PACKAGE_REFPOLICY_MONOLITHIC),)
> +	REFPOLICY_POST_INSTALL_TARGET_HOOKS += REFPOLICY_POLICY_COMPILE
> +endif
> +
> +$(eval $(generic-package))



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
