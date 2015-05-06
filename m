From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 07 May 2015 00:59:20 +0200
Subject: [Buildroot] [PATCH 1/1] dieharder: new package
In-Reply-To: <1430947801-4156-1-git-send-email-julien.viarddegalbert@openwide.fr>
References: <1430947801-4156-1-git-send-email-julien.viarddegalbert@openwide.fr>
Message-ID: <554A9CC8.1060309@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Le 06/05/2015 23:30, julien.viarddegalbert at openwide.fr a ?crit :
> From: Julien Viard de Galbert <julien@vdg.name>
> 
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
>  package/Config.in              |  1 +
>  package/dieharder/Config.in    |  8 ++++++++
>  package/dieharder/dieharder.mk | 27 +++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 package/dieharder/Config.in
>  create mode 100644 package/dieharder/dieharder.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index af4d2b7..cc0bd79 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -61,6 +61,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/bonnie/Config.in"
>  	source "package/cache-calibrator/Config.in"
>  	source "package/dhrystone/Config.in"
> +	source "package/dieharder/Config.in"
>  	source "package/dmalloc/Config.in"
>  	source "package/dropwatch/Config.in"
>  	source "package/dstat/Config.in"
> diff --git a/package/dieharder/Config.in b/package/dieharder/Config.in
> new file mode 100644
> index 0000000..d342aa2
> --- /dev/null
> +++ b/package/dieharder/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_DIEHARDER
> +	bool "dieharder"

The gsl package should be selected here, since dieharder depends on it,
	select BR2_PACKAGE_GSL

> +	help
> +	  dieharder is a fairly involved random number/uniform deviate generator
> +	  tester. It is thus suitable for use in testing both software RNG's and
> +	  hardware RNG's.
> +
> +	  http://www.phy.duke.edu/~rgb/General/dieharder.php
> diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
> new file mode 100644
> index 0000000..b774065
> --- /dev/null
> +++ b/package/dieharder/dieharder.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# dieharder
> +#
> +################################################################################
> +
> +DIEHARDER_VERSION = 3.31.1
> +DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder/
> +DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
> +DIEHARDER_SUBDIR = dieharder-$(DIEHARDER_VERSION)
> +DIEHARDER_LICENSE = GPLv2b
> +DIEHARDER_LICENSE_FILES = $(DIEHARDER_SUBDIR)/COPYING
> +DIEHARDER_DEPENDENCIES = gsl
> +DIEHARDER_AUTORECONF = YES

Why autoreconf is needed ? a configure script is bundled with the archive.

Also I did a build test with BR2_COMPILER_PARANOID_UNSAFE_PATH=y
ERROR: unsafe header/library path used in cross-compilation: '/usr/include'

Best regards,
Romain

> +
> +# fix endiannes detection
> +ifeq ($(BR2_ENDIAN),"BIG")
> +BR2_AC_CV_C_ENDIAN = ac_cv_c_endian=bin
> +else
> +BR2_AC_CV_C_ENDIAN = ac_cv_c_endian=little
> +endif
> +DIEHARDER_CONF_OPTS = $(BR2_AC_CV_C_ENDIAN)
> +
> +# parallel build fail, disable it
> +DIEHARDER_MAKE=$(MAKE1)
> +
> +$(eval $(autotools-package))
> 
