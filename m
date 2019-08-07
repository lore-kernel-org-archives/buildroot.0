From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 16:33:34 +0200
Subject: [Buildroot] [PATCH 2/3] package/gpsd: requires NTP time hinting
 support
In-Reply-To: <20190806051921.28680-2-bernd.kuhls@t-online.de>
References: <20190806051921.28680-1-bernd.kuhls@t-online.de>
 <20190806051921.28680-2-bernd.kuhls@t-online.de>
Message-ID: <20190807163334.67e5835b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Tue,  6 Aug 2019 07:19:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes
> http://autobuild.buildroot.net/results/446/44639b8fe407bee30ac96ab54b8037439f3dac88/
> 
> Mandatory LEAP* defines are only enabled when TIMEHINT_ENABLE is
> enabled: https://gitlab.com/gpsd/gpsd/blob/master/gpsd.h#L293
> 
> And TIMEHINT_ENABLE is only enabled when NTPSHM_ENABLE is enabled:
> https://gitlab.com/gpsd/gpsd/blob/master/gpsd.h#L109
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks a lot for the additional information provided, I've applied the
patch after extending the commit log with those additional details.

Note that I have also dropped the Config.in.legacy option. Indeed,
users who had the option enabled will still have it enabled, as it's
now unconditionally enabled, so there's nothing to warn them about.

The only users who could be disappointed are users who had it disabled,
as the feature will now be unconditionally enabled, slightly increasing
the gpsd installation size. But this is not something that
Config.in.legacy allows to detect.

> diff --git a/Config.in.legacy b/Config.in.legacy
> index de05b07c97..f443ab0741 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,11 @@ endif
>  
>  comment "Legacy options removed in 2019.08"
>  
> +config BR2_PACKAGE_GPSD_NTP_SHM
> +	bool "gpsd optional NTP time hinting support removed"

For the record, an option in Config.in.legacy that doesn't select
BR2_LEGACY is quite useless, as it doesn't prevent the build from
starting.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
