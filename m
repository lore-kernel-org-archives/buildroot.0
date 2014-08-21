From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Aug 2014 12:12:06 +0200
Subject: [Buildroot] [PATCH v3] bandwidthd: Version bump to fix
 autobuilder errors
In-Reply-To: <1408538353-4804-1-git-send-email-nroach44@gmail.com>
References: <1408538353-4804-1-git-send-email-nroach44@gmail.com>
Message-ID: <20140821101206.GB3891@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathaniel, All,

On 2014-08-20 20:39 +0800, Nathaniel Roach spake thusly:
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
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> Acked-by: Romain Naour <romain.naour@openwide.fr>
> ---
> Changes v1 to v2
>  - Fixed spelling of Romain's name
>  - Added link to the build failure
> 
> Changes v2 to v3
>  - Added back the SOff and Ack lines
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

The comment should go. If the packages needs zlib, in which case you
must select it, and there is no need for a comment.

The only cases we use a comment are:
  - the dependency is inherited from another package we select,
  - the depndency is a run-time only dependency.

Regards,
Yann E. MORIN.

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
> -- 
> 2.1.0.rc1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
