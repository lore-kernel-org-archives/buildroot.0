From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 11 Jul 2015 01:10:30 +0200
Subject: [Buildroot] [PATCH v3] dieharder: new package
In-Reply-To: <1431848603-30142-1-git-send-email-julien.viarddegalbert@openwide.fr>
References: <1431848603-30142-1-git-send-email-julien.viarddegalbert@openwide.fr>
Message-ID: <55A050E6.6020505@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Le 17/05/2015 09:43, julien.viarddegalbert at openwide.fr a ?crit :
> From: Julien Viard de Galbert <julien@vdg.name>
> 
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
> Changes v2 -> v3
>   - remove intermediate variable use (suggested by Baruch Siach)
> Changes v1 -> v2
>   - fixed typo "bin" instead of "big" (thanks Thomas Petazoni)
>   - select gls in config (suggested by Romain Naour)
>   - specified "includedir" to fix unsafe header path
> 
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
>  package/Config.in              |  1 +
>  package/dieharder/Config.in    |  9 +++++++++
>  package/dieharder/dieharder.mk | 26 ++++++++++++++++++++++++++
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
> index 0000000..9f81876
> --- /dev/null
> +++ b/package/dieharder/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_DIEHARDER
> +	bool "dieharder"
> +	select BR2_PACKAGE_GSL
> +	help
> +	  dieharder is a fairly involved random number/uniform deviate generator
> +	  tester. It is thus suitable for use in testing both software RNG's and
> +	  hardware RNG's.
> +	  
> +	  http://www.phy.duke.edu/~rgb/General/dieharder.php
> diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
> new file mode 100644
> index 0000000..2a3d46b
> --- /dev/null
> +++ b/package/dieharder/dieharder.mk
> @@ -0,0 +1,26 @@
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
> +
> +DIEHARDER_CONF_OPTS = --includedir=$(STAGING_DIR)/usr/include
> +# fix endiannes detection
> +ifeq ($(BR2_ENDIAN),"BIG")
> +DIEHARDER_CONF_OPTS += ac_cv_c_endian=big
> +else
> +DIEHARDER_CONF_OPTS += ac_cv_c_endian=little
> +endif

There is a build issue with musl libc due to missing M_PI when _GNU_SOURCE is
not defined.

I suggest you add it in CFLAGS by using DIEHARDER_MAKE_OPTS:

DIEHARDER_MAKE_OPTS = CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

Don't forget to take into account Thomas's comment for the next version ;-)

Best regards,
Romain

> +
> +# parallel build fail, disable it
> +DIEHARDER_MAKE=$(MAKE1)
> +
> +$(eval $(autotools-package))
> 
