From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 23:43:03 +0200
Subject: [Buildroot] [PATCHv3 12/15] package/uclibc: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210525122750.5022-13-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-13-patrickdepinguin@gmail.com>
Message-ID: <41d26a40-3880-1738-376b-2fe78fe7b439@mind.be>
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
>  package/uclibc/uclibc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 3d253d93bc..61bdbd50a0 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -205,7 +205,7 @@ endif
>  #
>  # Debug
>  #
> -ifeq ($(BR2_ENABLE_DEBUG),y)
> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)

 This one I'm not so sure... In UClibc, we don't (want to) enforce the -g/-O
options as strictly. In fact, we don't pass them down into uClibc at all. And
indeed, the DODEBUG option mostly controls debug symbols and optimisation. The
only "runtime debugging" difference that I can see are:

- different way of handling SSP errors;
- debug messages in linuxthreads.

 So I don't think this patch should be applied.

 Regards,
 Arnout


>  define UCLIBC_DEBUG_CONFIG
>  	$(call KCONFIG_ENABLE_OPT,DODEBUG)
>  endef
> 
