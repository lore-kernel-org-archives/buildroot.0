From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 22:29:02 +0200
Subject: [Buildroot] [PATCH] package/libapparmor: new package
In-Reply-To: <1527521711-17270-1-git-send-email-angelo@amarulasolutions.com>
References: <1527521711-17270-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180617222902.284dfd3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 May 2018 17:35:11 +0200, Angelo Compagnucci wrote:
> This patch adds libapparmor and it's related tools.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Thanks for this patch. Unfortunately, there are quite a lot of things
that don't look correct :-/ See below.

> diff --git a/package/libapparmor/Config.in b/package/libapparmor/Config.in
> new file mode 100644
> index 0000000..edc624b
> --- /dev/null
> +++ b/package/libapparmor/Config.in
> @@ -0,0 +1,57 @@
> +config BR2_PACKAGE_LIBAPPARMOR
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_USE_WCHAR

Dependencies should go after the "bool" line. Please run through
check-package to detect such mistakes.

> +	bool "libapparmor"
> +	help
> +	  AppArmor is an effective and easy-to-use Linux application
> +	  security system. AppArmor proactively protects the operating
> +	  system and applications from external or internal threats,
> +	  even zero-day attacks, by enforcing good behavior and
> +	  preventing even unknown application flaws from being exploited.
> +	  AppArmor security policies completely define what system
> +	  resources individual applications can access, and with what
> +	  privileges. A number of default policies are included with
> +	  AppArmor, and using a combination of advanced static analysis
> +	  and learning-based tools, AppArmor policies for even very
> +	  complex applications can be deployed successfully in a
> +	  matter of hours.
> +
> +	  http://wiki.apparmor.net
> +
> +comment "AppArmor needs a glibc w/ wchar"
> +	depends on !BR2_USE_WCHAR
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC

If it needs glibc, then the dependency on wchar is not needed. glibc
always has wchar.

> +if BR2_PACKAGE_LIBAPPARMOR
> +
> +config BR2_PACKAGE_LIBAPPARMOR_APACHE
> +	depends on BR2_PACKAGE_APACHE

Perhaps this option could be removed, and instead the corresponding
feature be enabled when BR2_PACKAGE_APACHE is eanbled.

> +	bool "Apache mod_apparmor"
> +	help
> +	  AppArmor module for Apache
> +
> +config BR2_PACKAGE_LIBAPPARMOR_BINUTILS
> +	bool "AppArmor binutils"
> +	default y
> +	help
> +	  AppArmor binary utilities

I think you should explain which utilities are going to be installed.
At first sight, it's not clear what "binutils" are compared to "utils".

Perhaps:

	bool "basic utils"
	default y
	help
	  This option installs the basic AppArmor utilities: aa-enabled
	  and aa-exec.

> +config BR2_PACKAGE_LIBAPPARMOR_PAM
> +	depends on BR2_PACKAGE_LINUX_PAM
> +	bool "AppArmor PAM"

Same comment as for Apache option.

> +	help
> +	  AppArmor module for Linux PAM
> +
> +config BR2_PACKAGE_LIBAPPARMOR_PROFILES
> +	bool "AppArmor profiles"
> +	default y
> +	help
> +	  Apparmor profiles

This help text is totally useless. Hint: if the help text is exactly
the same as the option prompt, then your help text is wrong.

> +config BR2_PACKAGE_LIBAPPARMOR_UTILS
> +	bool "AppArmor utils"
> +	default y
> +	help
> +	  AppArmor utilities

And this could be:

	bool "high-level utils"
	help

	  This option installs the high-level AppArmor utilities: ...

Since those tools are written in Python 3.x, you will need a depends on
python 3, or to select python 3 here.


> new file mode 100644
> index 0000000..73a2adb
> --- /dev/null
> +++ b/package/libapparmor/libapparmor.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# libapparmor
> +#
> +################################################################################
> +
> +LIBAPPARMOR_BASE_VERSION = 2.13
> +LIBAPPARMOR_VERSION = $(LIBAPPARMOR_BASE_VERSION).0
> +LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_BASE_VERSION).tar.gz
> +LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_BASE_VERSION)/$(LIBAPPARMOR_VERSION)/+download
> +LIBAPPARMOR_LICENSE = GPL-2.0
> +LIBAPPARMOR_LICENSE_FILES = LICENSE
> +LIBAPPARMOR_SUBDIR = libraries/libapparmor
> +LIBAPPARMOR_AUTORECONF = YES

Why the heck are you using the autotools-package infrastructure ? There
is no configure script, no Makefile.am, not a single sign that this
package is using the autotools.

> +LIBAPPARMOR_INSTALL_STAGING = YES
> +LIBAPPARMOR_CONF_OPTS = --enable-static --enable-man-pages=no

This is not used anywhere.

> +
> +LIBAPPARMOR_DEPENDENCIES += \
> +	$(if $(BR2_PACKAGE_APPARMOR_APACHE),apache) \
> +	$(if $(BR2_PACKAGE_APPARMOR_PAM),linux-pam) \
> +
> +APPARMOR_DIRS = parser \

This variable is not prefixed with the package name, that's not good.

> +	$(if $(BR2_PACKAGE_APPARMOR_APACHE),changehat/mod_apparmor) \
> +	$(if $(BR2_PACKAGE_APPARMOR_BINUTILS),binutils) \
> +	$(if $(BR2_PACKAGE_APPARMOR_PAM),changehat/pam_apparmor) \
> +	$(if $(BR2_PACKAGE_APPARMOR_PROFILES),profiles) \
> +	$(if $(BR2_PACKAGE_APPARMOR_UTILS),utils)
> +
> +APPARMOR_BUILD_OPTS += \

This variable is not prefixed with the package name, that's not good.

> +	$(if $(BR2_PACKAGE_APPARMOR_APACHE),APXS=$(STAGING_DIR)/usr/bin/apxs)

Please group stuff by "feature" instead. So for example:

ifeq ($(BR2_PACKAGE_APPARMOR_APACHE),y)
LIBAPPARMOR_DEPENDENCIES += apache
LIBAPPARMOR_DIRS += changehat/mod_apparmor
LIBAPPARMOR_BUILD_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
endif

> +define APPARMOR_BUILD_CMDS
> +	$(foreach d,$(APPARMOR_DIRS),
> +		### AppArmor building $d ###
> +		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +		$(LIBAPPARMOR_MAKE) -C $(@D)/$(d) $(APPARMOR_BUILD_OPTS)
> +	)
> +endef
> +
> +LIBAPPARMOR_POST_INSTALL_STAGING_HOOKS += APPARMOR_BUILD_CMDS

What ? Adding build commands as a post install staging hook ? This
doesn't make *any* sense.

Do you know why you had to do this ? Because your variable is not
properly prefixed. But instead of figuring out the real problem, you
just worked around it in an ugly way.

> +define APPARMOR_INSTALL_TARGET_CMDS
> +	$(foreach d,$(APPARMOR_DIRS),
> +		### AppArmor installing $d ###
> +		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +		$(LIBAPPARMOR_MAKE) -C $(@D)/$(d) DESTDIR=$(TARGET_DIR) \
> +		$(APPARMOR_BUILD_OPTS) install
> +	)
> +endef
> +
> +LIBAPPARMOR_POST_INSTALL_TARGET_HOOKS += APPARMOR_INSTALL_TARGET_CMDS

Same comment.

Finally, the AppArmor README.md says:

"""
--------------------------------------
Important note on AppArmor kernel code
--------------------------------------

While most of the kernel AppArmor code has been accepted in the
upstream Linux kernel, a few important pieces were not included. These
missing pieces unfortunately are important bits for AppArmor userspace
and kernel interaction; therefore we have included compatibility
patches in the kernel-patches/ subdirectory, versioned by upstream
kernel (2.6.37 patches should apply cleanly to 2.6.38 source).

Without these patches applied to the kernel, the AppArmor userspace
will not function correctly.
"""

And your package is not at all taking care of applying patches, and
this is not even mentioned in the Config.in help text.

Could you fix all those problems, and come back with a cleaner
solution ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
