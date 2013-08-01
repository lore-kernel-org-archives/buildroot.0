From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 07:48:45 +0200
Subject: [Buildroot] [PATCH] Add config for PHP eaccelerator package.
 Signed-off-by: Dallas Clement <dallas.a.clement@gmail.com>
In-Reply-To: <CAE9DZUT=mi4OHphQgBmeRzM_t=2nCTWRU-wC4VaGrgCmvF04Mw@mail.gmail.com>
References: <CAE9DZUT=mi4OHphQgBmeRzM_t=2nCTWRU-wC4VaGrgCmvF04Mw@mail.gmail.com>
Message-ID: <20130801074845.7f9c003c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

You submitted the below patch some time ago. While reviewing the list
of pending patches for Buildroot, we found this one. Are you still
interested in getting eaccelerator merged into Buildroot? If so, are
you willing to submit an updated patch?

Thanks,

Thomas

On Tue, 25 Sep 2012 10:36:40 -0500, Dallas Clement wrote:
>  package/Config.in                    |    1 +
>  package/eaccelerator/Config.in       |    7 +++++++
>  package/eaccelerator/eaccelerator.mk |   23 +++++++++++++++++++++++
>  3 files changed, 31 insertions(+), 0 deletions(-)
>  create mode 100644 package/eaccelerator/Config.in
>  create mode 100644 package/eaccelerator/eaccelerator.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 58dd5e8..083cad8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -272,6 +272,7 @@ endmenu
>  endif
>  source "package/microperl/Config.in"
>  source "package/php/Config.in"
> +source "package/eaccelerator/Config.in"
>  source "package/python/Config.in"
> if BR2_PACKAGE_PYTHON
>  menu "external python modules"
> diff --git a/package/eaccelerator/Config.in b/package/eaccelerator/Config.in
> new file mode 100644
> index 0000000..36600e1
> --- /dev/null
> +++ b/package/eaccelerator/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_EACCELERATOR
> +        bool "eaccelerator"
> +       depends on BR2_PACKAGE_PHP
> +        help
> +          PHP accelerator and optimizer.
> +
> +          http://eaccelerator.net/
> diff --git a/package/eaccelerator/eaccelerator.mk
> b/package/eaccelerator/eaccelerator.mk
> new file mode 100644
> index 0000000..5ecd355
> --- /dev/null
> +++ b/package/eaccelerator/eaccelerator.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# eaccelerator
> +#
> +#############################################################
> +EACCELERATOR_VERSION = 0.9.6.1
> +EACCELERATOR_SITE = http://eaccelerator.net/
> +EACCELERATOR_SOURCE = eaccelerator-$(EACCELERATOR_VERSION).tar.bz2
> +EACCELERATOR_DEPENDENCIES = php
> +EACCELERATOR_CONF_OPT = --enable-eaccelerator=shared \
> +  --with-php-config=$(STAGING_DIR)/usr/bin/php-config
> +EACCELERATOR_MAKE_ENV = INSTALL_ROOT="$(TARGET_DIR)"
> +
> +define EACCELERATOR_PRE_CONFIGURE_HOOK
> +       # Must set shared memory config manually for cross-compilation
> +       sed -i "s/mm_shm_mmap_anon=no/mm_shm_mmap_anon=yes\n
> mm_sem_pthread=yes/" $(@D)/config.m4
> +       # Need to run this command to create the autoconf configure script
> +       cd $(@D) && phpize
> +endef
> +
> +EACCELERATOR_PRE_CONFIGURE_HOOKS += EACCELERATOR_PRE_CONFIGURE_HOOK
> +
> +$(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
