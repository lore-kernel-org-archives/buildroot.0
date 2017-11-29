From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 29 Nov 2017 21:30:10 +0000
Subject: [Buildroot] [git commit] rauc: select host-squashfs as a host
 dependency
In-Reply-To: <20171129210644.C2457803E2@busybox.osuosl.org>
References: <20171129210644.C2457803E2@busybox.osuosl.org>
Message-ID: <1511991010.9792.41.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2017-11-29 at 22:11 +0100, Thomas Petazzoni wrote:
> 
> +	select BR2_PACKAGE_HOST_SQUASHFS # run-time dependency
>  	help
>  	  RAUC is the Robust Auto-Update Controller developed by
>  	  Pengutronix. Enable this option to build the rauc
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index 479a583..67ef155 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -29,7 +29,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  RAUC_DEPENDENCIES += systemd
>  endif
>  
> -HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
> +HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs

Would it work to not include the build dependency on host-sqaushfs? 
Since squashfs is a command invoked at run time, rauc doesn't actually
need to be present when building.  Minimize the dependency info, allow
greater parallelism if packages were built in parallel, etc.  Or
perhaps it's easier to always match the config dep with a build dep
even if the latter isn't necessary in some cases?
