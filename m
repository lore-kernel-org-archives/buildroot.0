From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 May 2011 17:59:37 +0200
Subject: [Buildroot] [PATCH 1/2] package: add jimtcl support
In-Reply-To: <1304170969-30138-1-git-send-email-plagnioj@jcrosoft.com>
	(Jean-Christophe PLAGNIOL-VILLARD's message of "Sat, 30 Apr 2011
	15:42:48 +0200")
References: <1304170969-30138-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <87vcxuv2c6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 Jean-Christophe> you will download it via git
 Jean-Christophe> and can specify which repos and/or which commit

 Jean-Christophe> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 Jean-Christophe> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
 Jean-Christophe> Cc: Patrice Vilchez <patrice.vilchez@atmel.com>
 Jean-Christophe> ---
 Jean-Christophe>  package/Config.in        |    1 +
 Jean-Christophe>  package/jimtcl/Config.in |   65 ++++++++++++++++++++++++++++++++++++++++++++++
 Jean-Christophe>  package/jimtcl/jimtcl.mk |   30 +++++++++++++++++++++
 Jean-Christophe>  3 files changed, 96 insertions(+), 0 deletions(-)
 Jean-Christophe>  create mode 100644 package/jimtcl/Config.in
 Jean-Christophe>  create mode 100644 package/jimtcl/jimtcl.mk

 Jean-Christophe> diff --git a/package/Config.in b/package/Config.in
 Jean-Christophe> index 76b2076..cd89892 100644
 Jean-Christophe> --- a/package/Config.in
 Jean-Christophe> +++ b/package/Config.in
 Jean-Christophe> @@ -231,6 +231,7 @@ source "package/php/Config.in"
 Jean-Christophe>  source "package/python/Config.in"
 Jean-Christophe>  source "package/ruby/Config.in"
 Jean-Christophe>  source "package/tcl/Config.in"
 Jean-Christophe> +source "package/jimtcl/Config.in"

Please sort alphabetically.

 Jean-Christophe>  endmenu
 
 Jean-Christophe>  menu "Libraries"
 Jean-Christophe> diff --git a/package/jimtcl/Config.in b/package/jimtcl/Config.in
 Jean-Christophe> new file mode 100644
 Jean-Christophe> index 0000000..7847d19
 Jean-Christophe> --- /dev/null
 Jean-Christophe> +++ b/package/jimtcl/Config.in
 Jean-Christophe> @@ -0,0 +1,65 @@
 Jean-Christophe> +menuconfig BR2_PACKAGE_JIMTCL
 Jean-Christophe> +	bool "jimtcl"
 Jean-Christophe> +	help
 Jean-Christophe> +	  Small footprint implementation of Tcl programming language
 Jean-Christophe> +
 Jean-Christophe> +	  http://jim.berlios.de/
 Jean-Christophe> +
 Jean-Christophe> +if BR2_PACKAGE_JIMTCL
 Jean-Christophe> +
 Jean-Christophe> +choice
 Jean-Christophe> +	prompt "JIMTCL Version"

You have a mix of jimtcl/JIMTCL/Jimtcl - Please use the same
capitalization everywhere.

 Jean-Christophe> +	default BR2_TARGET_JIMTCL_GIT
 Jean-Christophe> +	help
 Jean-Christophe> +	  Select the specific jimtcl version you want to use
 Jean-Christophe> +
 Jean-Christophe> +config BR2_TARGET_JIMTCL_GIT
 Jean-Christophe> +	bool "Official git"
 Jean-Christophe> +
 Jean-Christophe> +config BR2_TARGET_JIMTCL_GIT_CUSTOM
 Jean-Christophe> +	bool "Custom"

Is there really a need to support anything else than 0.70? We prefer to
only have 1 version as that simplified implementation and testing.

 Jean-Christophe> +#############################################################
 Jean-Christophe> +#
 Jean-Christophe> +# jimtcl
 Jean-Christophe> +#
 Jean-Christophe> +#############################################################
 Jean-Christophe> +JIMTCL_VERSION:=$(call qstrip,$(BR2_TARGET_JIMTCL_VERSION))
 Jean-Christophe> +JIMTCL_SITE_METHOD:=git

Please use ' = ' rather than ':=' unless you have a special need for the
direct expansion.

 Jean-Christophe> +DL_TOOLS_DEPENDENCIES += git

That's handled automatically.

 Jean-Christophe> +JIMTCL_INSTALL_STAGING = YES
 Jean-Christophe> +JIMTCL_INSTALL_TARGET = NO

Why no installation on target?

 Jean-Christophe> +
 Jean-Christophe> +OPENOCD_AUTORECONF = YES

This is JIMTCL, not OPENOCD.

 Jean-Christophe> +
 Jean-Christophe> +JIMTCL_INSTALL_STAGING_OPT= DESTDIR=$(STAGING_DIR)/usr install

Does it really use autotools and have broken DESTDIR support?

 Jean-Christophe> +$(eval $(call AUTOTARGETS,package,jimtcl))

-- 
Bye, Peter Korsgaard
