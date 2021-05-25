From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 23:48:12 +0200
Subject: [Buildroot] [PATCHv3 13/15] package/zmqpp: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210525122750.5022-14-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-14-patrickdepinguin@gmail.com>
Message-ID: <cb05cfc8-283b-1418-4c4c-1d70e763570c@mind.be>
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
>  package/zmqpp/zmqpp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
> index 3cd19d644a..cfef9874d0 100644
> --- a/package/zmqpp/zmqpp.mk
> +++ b/package/zmqpp/zmqpp.mk
> @@ -19,7 +19,7 @@ ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
>  # -ffast-math -finline-functions -fomit-frame-pointer are disabled,
>  # so only set CONFIG for the non-affected cases.
>  ifneq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
> -ZMQPP_CONFIG = $(if $(BR2_ENABLE_DEBUG),debug,release)
> +ZMQPP_CONFIG = $(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release)

 This is the effect of CONFIG:

CONFIG_FLAGS =
ifeq ($(CONFIG),debug)
        CONFIG_FLAGS = -g -fno-inline -ftemplate-depth-1000
endif
ifeq ($(CONFIG),valgrind)
        CONFIG_FLAGS = -g -O1 -DNO_DEBUG_LOG -DNO_TRACE_LOG
endif
ifeq ($(CONFIG),max)
        CONFIG_FLAGS = -O3 -funroll-loops -ffast-math -finline-functions
-fomit-frame-pointer -DNDEBUG
endif
ifneq (,$(findstring $(CONFIG),release loadtest))
        CONFIG_FLAGS = -O3 -funroll-loops -ffast-math -finline-functions
-fomit-frame-pointer -DNO_DEBUG_LOG -DNO_TRACE_LOG -DNDEBUG
endif


 So I'm OK with the release case, but I think maybe in the RUNTIME_DEBUG case we
don't want to set anything at all. Neither -fno-inline nor -ftemplate-depth is
what we want, I think. So maybe we should set nothing at all?


 Regards,
 Arnout



>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> 
