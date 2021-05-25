From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 23:17:53 +0200
Subject: [Buildroot] [PATCHv3 07/15] package/boost: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210525122750.5022-8-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-8-patrickdepinguin@gmail.com>
Message-ID: <47fb92f1-ffb8-a79f-625a-aaa27e5b713e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
> should have no negative effect on performance.
> 
> Introduction of 'assert' statements, 'debug'-type builds with additional
> logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/boost/boost.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 8d745ecc72..e72ddf897c 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -95,7 +95,7 @@ BOOST_OPTS += --no-cmake-config \
>  	     toolset=gcc \
>  	     threading=multi \
>  	     abi=$(BOOST_ABI) \
> -	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release)
> +	     variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release)

It looks like the variant does the following things:

<optimization>off <debug-symbols>on <inlining>off <runtime-debugging>on

 Perhaps it would make more sense to control these individually in
user-config.jam. E.g. inlining should be controller by optimization level >= 2 IMHO.

 We should probably also check if our -g and -O options are properly propagated
through the stuff that is set by bjam itself.

 But that's probably for someone with actual boost expertise to tackle, so I'm
OK with applying as-is.

 Regards,
 Arnout

>  
>  ifeq ($(BR2_sparc64),y)
>  BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
> 
