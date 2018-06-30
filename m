From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:19:15 +0200
Subject: [Buildroot] [PATCH 2/2] libv4l: fix build with sdl2_image
In-Reply-To: <20180629195248.4008-2-fontaine.fabrice@gmail.com>
References: <20180629195248.4008-1-fontaine.fabrice@gmail.com>
 <20180629195248.4008-2-fontaine.fabrice@gmail.com>
Message-ID: <20180630181915.65fd07f8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jun 2018 21:52:48 +0200, Fabrice Fontaine wrote:
> sdlcam test includes jpeglib.h so add an option to disable tests
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/1eded8b44cc369550566c6ce0b3c042f1aec8d44
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libv4l/0004-Add-disable-tests-option.patch | 59 ++++++++++++++++++++++
>  package/libv4l/libv4l.mk                           |  8 ++-
>  2 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 package/libv4l/0004-Add-disable-tests-option.patch
> 
> diff --git a/package/libv4l/0004-Add-disable-tests-option.patch b/package/libv4l/0004-Add-disable-tests-option.patch
> new file mode 100644
> index 0000000000..7d1e458112
> --- /dev/null
> +++ b/package/libv4l/0004-Add-disable-tests-option.patch
> @@ -0,0 +1,59 @@
> +From d244fc440dd18dacf9b820f333134cd842e2f970 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 29 Jun 2018 21:15:10 +0200
> +Subject: [PATCH] Add --disable-tests option
> +
> +Offer the possibiity to disable tests especially sdlcam test which
> +includes jpeglib.h
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This patch is not the right/best solution to the problem. configure.ac
already checks for the availability of the jpeg library, and defines
HAVE_JPEG accordingly.

So in contrib/test/Makefile.am, just replace:

if HAVE_SDL
noinst_PROGRAMS += sdlcam
endif

by:

if HAVE_SDL
if HAVE_JPEG
noinst_PROGRAMS += sdlcam
endif
endif

Perhaps there is an automake "and" or "&&" operator, but I'm not sure.

Also, please submit this change upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
