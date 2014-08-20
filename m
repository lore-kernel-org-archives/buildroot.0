From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 20 Aug 2014 14:20:55 +0200
Subject: [Buildroot] [PATCH v2] bandwidthd: Version bump to fix
 autobuilder errors
In-Reply-To: <1408536201-19148-1-git-send-email-nroach44@gmail.com>
References: <1408536201-19148-1-git-send-email-nroach44@gmail.com>
Message-ID: <53F492A7.6090803@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

Le 20/08/2014 14:03, Nathaniel Roach a ?crit :
> Thanks to Romain Naour, we've found that certain tests
> in configure fail if their dependencies aren't tested for
> beforehand.
> 
> libpng has been added as a dependency just to make sure it
> gets built.
> 
> In upstream the changes to fix this issue are:
>  - Test for libusb-1.0 purely to ensure that variables are set
> 	(it's only needed if libpcap was built with it).
>  - Test for libz and continue/fail because it's actually needed by libpng
> 	and it's probably more meaningful to fail on libz rather than
> 	libpng if libz is the issue.
> 
> Also, the X.Org tests have been removed from the configure script
> and therefore we don't need --without-x to be defined anymore.
> 
> Additional upstream changes:
>  - Handle the postgres/sqlite flags better (should not effect BR).
>  - Other general configure.ac cleanups.
> 
> Fixes:
> autobuild.buildroot.net/results/37a/37a94e0f2d3faa0aec9c488e987cfff706fc9f3b/build-end.log

Your Sob line has been dropped.

With that fixed, your can add my

Acked-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
> 
> ---
> Changes v1 to v2
>  - Fixed spelling of Romain's name
>  - Added link to the build failure
> ---
>  package/bandwidthd/Config.in     | 1 +
>  package/bandwidthd/bandwidthd.mk | 6 ++----
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
> index c1f0ee1..b6c2b23 100644
> --- a/package/bandwidthd/Config.in
> +++ b/package/bandwidthd/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_BANDWIDTHD
>  	bool "bandwidthd"
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_ZLIB # Just to be sure
>  	select BR2_PACKAGE_LIBPNG
>  	select BR2_PACKAGE_LIBPCAP
>  	select BR2_PACKAGE_GD
> diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
> index 3e11d6a..59b6143 100644
> --- a/package/bandwidthd/bandwidthd.mk
> +++ b/package/bandwidthd/bandwidthd.mk
> @@ -4,19 +4,17 @@
>  #
>  ################################################################################
>  
> -BANDWIDTHD_VERSION = v2.0.1-auto-r08
> +BANDWIDTHD_VERSION = v2.0.1-auto-r10
>  BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
>  
>  # Specified as "any version of the GPL that is current as of your
>  # download" by upstream.
>  BANDWIDTHD_LICENSE = GPL
>  
> -BANDWIDTHD_DEPENDENCIES = gd libpng libpcap
> +BANDWIDTHD_DEPENDENCIES = gd libpng libpcap zlib
>  
>  BANDWIDTHD_AUTORECONF = YES
>  
> -BANDWIDTHD_CONF_OPT += --without-x
> -
>  ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
>  BANDWIDTHD_DEPENDENCIES += postgresql
>  BANDWIDTHD_CONF_OPT += --with-postgresql-logging=true
> 
