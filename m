From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 22:50:58 +0200
Subject: [Buildroot] [PATCH 2/2] boost: context needs C++11
In-Reply-To: <20180820165555.20492-2-fontaine.fabrice@gmail.com>
References: <20180820165555.20492-1-fontaine.fabrice@gmail.com>
 <20180820165555.20492-2-fontaine.fabrice@gmail.com>
Message-ID: <20180820225058.4d83d48f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 18:55:55 +0200, Fabrice Fontaine wrote:
> Without this flag, mutex is not always correctly detected with gcc 4.x
> or 5.x. As a result, boost_thread is wrongly selected by boost_context.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/fb046c04fe18bec973d120e4ab33971f32ba5769
>  - http://autobuild.buildroot.net/results/99f1a255b78a973faeb8bf3b94d78efc54426a8b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 14f6162003..a09dd3cf45 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -61,6 +61,11 @@ else
>  BOOST_FLAGS += --without-icu
>  endif
>  
> +# boost-context needs C++11
> +ifeq ($(BR2_PACKAGE_BOOST_CONTEXT),y)
> +BOOST_TARGET_CXXFLAGS += -std=c++11
> +endif

I was about to apply, but... C++11 requires at least gcc 4.8 or 4.9
depending on the features being used, and I don't see any dependency on
a gcc version in the definition of BR2_PACKAGE_BOOST_CONTEXT. There are
also other Boost options that say they are related to C++11.

Don't we have a problem with gcc 4.7 or older compilers ?

https://git.buildroot.org/buildroot/tree/support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config
has a 4.7 compiler.

I'm not sure we have a gcc 4.6 compiler. Perhaps we should add that to
the autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
