From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 11:03:05 +0100
Subject: [Buildroot] [PATCH] trousers: Pass "-mno-compact-casesi" when
 building for ARCv1
In-Reply-To: <1479808825-2001-1-git-send-email-vzakhar@synopsys.com>
References: <1479808825-2001-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161122110305.5088f8ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 13:00:25 +0300, Vlad Zakharov wrote:
> Compact casesi patterns don't have a reload version. This causes build
> failures of "trousers" package for ARC.
> 
> Current patch disables compact casesi patterns for ARCv1 (750D and 770D)
> via passing "-mno-compact-casesi" option when compiling "trousers".
> 
> This change is a temporary workaround and the feature is going to be
> fixed in the next ARC toolchain release version.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Has this been detected by the autobuilders? If yes, what is the
reference to the autobuilder failure?

> diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
> index 3d9e0ba..c5878df 100644
> --- a/package/trousers/trousers.mk
> +++ b/package/trousers/trousers.mk
> @@ -18,6 +18,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  TROUSERS_DEPENDENCIES += libiconv
>  endif
>  
> +ifeq ($(BR2_arc770d)$(BR2_arc750d),y)
> +TROUSERS_CONF_ENV += CFLAGS="$(CFLAGS) -mno-compact-casesi"

This should be:

	CFLAGS="$(TARGET_CFLAGS) ..."

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
