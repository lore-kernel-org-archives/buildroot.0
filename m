From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 22:41:00 +0200
Subject: [Buildroot] [PATCH 1/1] boost: correctly disable icu in locale
 if needed
In-Reply-To: <20180713174247.4005-1-fontaine.fabrice@gmail.com>
References: <20180713174247.4005-1-fontaine.fabrice@gmail.com>
Message-ID: <20180714224100.2bc87253@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 13 Jul 2018 19:42:47 +0200, Fabrice Fontaine wrote:
> boost doesn't take into account --without-icu flag and links
> libboost_locale with icu if it founds it in staging directory
> 
> So use boost.locale.icu to fix this issue
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index b2605a70b7..242b60a460 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -116,6 +116,12 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>  BOOST_OPTS += boost.locale.posix=off
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ICU),y)
> +BOOST_OPTS += boost.locale.icu=on
> +else
> +BOOST_OPTS += boost.locale.icu=off
> +endif

I'm not sure to fully understand what's going on here.

First, if --without-icu has no effect, why isn't your patch removing
it ?

Second, why are you introducing another BR2_PACKAGE_ICU conditional,
even if there's already one ?

Third, what is the problem with libboost_locale linking with icu if
found in the staging directory ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
