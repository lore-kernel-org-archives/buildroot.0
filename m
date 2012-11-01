From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 02 Nov 2012 00:34:14 +0100
Subject: [Buildroot] [PATCH] efl is now at 1.7.1
In-Reply-To: <1351266080-12424-1-git-send-email-evgeni@plan42bg.com>
References: <1351266080-12424-1-git-send-email-evgeni@plan42bg.com>
Message-ID: <509306F6.9050008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/26/12 17:41, Evgeni Dobrev wrote:
> - bumped up revision to 1.7.1
> - choose between external and Buildroot built edje_cc and eet when building elemntary
> - finer control over building options

  This should be split up into separate patches.  We'd usually have one version-bump
patch per package, but I guess in this case bumping all of them together is
acceptable.  However, the feature-adding patches should definitely be done
separately (one per package).

[snip]
> +config BR2_PACKAGE_LIBEDJE_PROGRAM_CACHE
> +	bool "edje program cache"
> +	depends on BR2_PACKAGE_LIBEDJE
> +	help
> +	  Enable EDJE_PROGRAM_CACHE support.

  Can you give a more detailed explanation?

[snip]
> diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
> index 59af80e..13d03dc 100644
> --- a/package/efl/libelementary/Config.in
> +++ b/package/efl/libelementary/Config.in
> @@ -10,3 +10,74 @@ config BR2_PACKAGE_LIBELEMENTARY
>   	  with less code.
>
>   	  http://trac.enlightenment.org/e/wiki/Elementary
> +
> +choice
> +	prompt "edje_cc type"

  It's conceivable that several packages use edje_cc, so it makes more
sense to have this config option as part of libedje itself.  Then you'll
also need to define a variable $(host-libedje) which is empty if an external
edje_cc is used, and which is host-libedje if the buildroot-built one is
used, so dependent packages can add $(host-libedje) to their dependencies.


> +	default BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_BUILDROOT
> +	depends on BR2_PACKAGE_LIBELEMENTARY

  Wrap everything in a single
if BR2_PACKAGE_LIBELEMENTARY

choice
...

choice
...

endif # BR2_PACKAGE_LIBELEMENTARY

> +
> +config BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_BUILDROOT
> +	bool "Buildroot built"
> +	select BR2_PACKAGE_LIBEDJE_CC

  Why do you need edje_cc on the target in order to build it on
the host?

> +	help
> +	  Select this option if you want Buildroot to build edje_cc on your host.
> +
> +config BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PREINSTALLED
> +	bool "Pre-installed"
> +	help
> +	  Select this option if you want to use a pre-installed edje_cc
> +	  Specify the path to edje_cc in BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PATH
> +
> +endchoice
> +
> +config BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PATH
> +	string "edje_cc path"
> +	default "/path/to/edje_cc"

  I guess one typical use case is when edje_cc is already installed on
the host, so this should default to "edje_cc".

> +	depends on BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PREINSTALLED
> +	help
> +	  Path to an externally provided edje_cc
> +
> +choice
> +	prompt "eet type"
> +	default BR2_PACKAGE_LIBELEMENTARY_EET_BUILDROOT
> +	depends on BR2_PACKAGE_LIBELEMENTARY
> +
> +config BR2_PACKAGE_LIBELEMENTARY_EET_BUILDROOT
> +	bool "Buildroot built"
> +	help
> +	  Select this option if you want Buildroot to build eet on your host.
> +
> +config BR2_PACKAGE_LIBELEMENTARY_EET_PREINSTALLED
> +	bool "Pre-installed"
> +	help
> +	  Select this option if you want to use a pre-installed eer.

  eer -> eet.

> +	  Specify the path to eet in BR2_PACKAGE_LIBELEMENTARY_EET_PATH
> +
> +endchoice
> +
> +config BR2_PACKAGE_LIBELEMENTARY_EET_PATH
> +	string "eet path"
> +	default "/path/to/eet"

	default "eet"

> +	depends on BR2_PACKAGE_LIBELEMENTARY_EET_PREINSTALLED
> +	help
> +	  Path to an externally provided eet
> +
> +config BR2_PACKAGE_LIBELEMENTARY_TEST
> +	bool "build elementary_test"
> +	depends on BR2_PACKAGE_LIBELEMENTARY
> +	help
> +	  Build and install elementary_test for the target. Normally this
> +	  is not required.
> +
> +config BR2_PACKAGE_LIBELEMENTARY_CONFIG
> +	bool "build elementary_config"
> +	depends on BR2_PACKAGE_LIBELEMENTARY
> +	help
> +	  Build and install elementary_config for the target. Normally this
> +	  is not required.
> +
> +config BR2_PACKAGE_LIBELEMENTARY_QUICK_LAUNCH
> +	bool "enable quick-launch support"
> +	depends on BR2_PACKAGE_LIBELEMENTARY
> +	help
> +	  Enable quick-launch support.
> diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
> index 83c9005..18319d1 100644
> --- a/package/efl/libelementary/libelementary.mk
> +++ b/package/efl/libelementary/libelementary.mk
> @@ -4,15 +4,42 @@
>   #
>   ################################################################################
>
> -LIBELEMENTARY_VERSION = 0.8.0.65643
> +LIBELEMENTARY_VERSION = 1.7.1
>   LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
> -LIBELEMENTARY_SITE = http://download.enlightenment.org/snapshots/2011-11-28
> +LIBELEMENTARY_SITE = http://download.enlightenment.org/releases/
>   LIBELEMENTARY_INSTALL_STAGING = YES
>
> -LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
> -				host-libeet
> +LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje
>
> -LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
> -			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
> +ifneq ($(BR2_PACKAGE_LIBELEMENTARY_TEST),y)
> +LIBELEMENTARY_CONF_OPT += --disable-elementary-test
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LIBELEMENTARY_CONFIG),y)
> +LIBELEMENTARY_CONF_OPT += --disable-elementary-config
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LIBELEMENTARY_QUICK_LAUNCH),y)
> +LIBELEMENTARY_CONF_OPT += --disable-quick-launch
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PREINSTALLED),y)
> +LIBELEMENTARY_CONF_OPT += --with-edje-cc=$(BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PATH)

  If configure doesn't support searching path for what you specify here,
you can use --with-edje-cc=`which $(BR2_PACKAGE_LIBELEMENTARY_EDJE_CC_PATH)`

> +else
> +LIBELEMENTARY_DEPENDENCIES += host-libedje
> +LIBELEMENTARY_CONF_OPT += --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBELEMENTARY_EET_PREINSTALLED),y)
> +LIBELEMENTARY_CONF_OPT += --with-eet-eet=$(BR2_PACKAGE_LIBELEMENTARY_EET_PATH)
> +else
> +LIBELEMENTARY_DEPENDENCIES += host-libeet
> +LIBELEMENTARY_CONF_OPT += --with-eet-eet=$(HOST_DIR)/usr/bin/eet
> +endif
> +
> +
> +ifneq ($(BR2_HAVE_DOCUMENTATION),y)
> +LIBELEMENTARY_CONF_OPT += --disable-doc
> +endif
>
>   $(eval $(autotools-package))
[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
