From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 28 Feb 2017 11:26:25 +1100
Subject: [Buildroot] [PATCHv2] openocd: avoid documentation rebuild to
 fix build issues
In-Reply-To: <1488147736-9778-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488147736-9778-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170228002625.GC2535@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 26, 2017 at 11:22:16PM +0100, Thomas Petazzoni wrote:
> On PowerPC64(le), we patch all configure scripts. Due to this, the
> version.texi in OpenOCD files gets regenerated, and then since it has
> a newer date than openocd.info, openocd build system rebuilds the
> documentation. Unfortunately, this documentation rebuild fails on old
> machines.
> 
> We work around this by faking the date of the generated version.texi
> file, to make the build system believe the documentation doesn't need
> to be regenerated.

Looks good to me.

I just have a comment about your comment:

I don't think modifying the configure script is sufficient to cause
version.texi to be rebuilt, it just causes the timestamp file to be
checked. It's the timezone issue that actually causes the rebuild and it
happens even though version.texi isn't out of date. (That's why I
couldn't reproduce the autobuilder failure, it doesn't happen in my TZ.)

i.e. This causes a doc rebuild on my system (with freshly unpacked
source):
touch configure && ./configure && env TZ="US/Eastern" make -C doc

But this doesn't:
touch configure && ./configure && env TZ="Australia/Sydney" make -C doc

(So it's actually a bug in their build system, maybe they'd fix it
upstream? ;-))

Reviewed-by: Sam Bobroff <sam.bobroff@au1.ibm.com>

Cheers,
Sam.

> Fixes:
> 
>   http://autobuild.buildroot.net/results/3cbe65a46e75b8e67846d593884c96df97dec7a4
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1: fix commit title
> 
> This is an alternative proposal to:
> 
>   https://patchwork.ozlabs.org/patch/724932/
> 
> and to:
> 
>   https://github.com/ntfreak/openocd/pull/4/commits/2c0cc66d5388e07679ac9f07c1ce0f8469931f02
> 
> which was submitted upstream but not accepted.
> ---
>  package/openocd/openocd.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 21a302f..0d18365 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -99,5 +99,20 @@ HOST_OPENOCD_CONF_OPTS = \
>  
>  HOST_OPENOCD_DEPENDENCIES = host-libftdi host-libusb host-libusb-compat
>  
> +# Avoid documentation rebuild. On PowerPC64(le), we patch the
> +# configure script. Due to this, the version.texi files gets
> +# regenerated, and then since it has a newer date than openocd.info,
> +# openocd build system rebuilds the documentation. Unfortunately, this
> +# documentation rebuild fails on old machines. We work around this by
> +# faking the date of the generated version.texi file, to make the
> +# build system believe the documentation doesn't need to be
> +# regenerated.
> +define OPENOCD_FIX_VERSION_TEXI
> +       touch -r $(@D)/doc/openocd.info $(@D)/doc/version.texi
> +endef
> +OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
> +HOST_OPENOCD_POST_BUILD_HOOKS += OPENOCD_FIX_VERSION_TEXI
> +
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.7.4
