From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Mar 2019 22:34:12 +0100
Subject: [Buildroot] [PATCH 1/1] ccache: fix initial setup failure
In-Reply-To: <1535419406-2407-1-git-send-email-danomimanchego123@gmail.com>
References: <1535419406-2407-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20190316213412.GA2852@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2018-08-27 21:23 -0400, Danomi Manchego spake thusly:
> The BR2_CCACHE_INITIAL_SETUP can fail if CCACHE_DISABLE is defined in the
> environment, because ccache refuses to create a ccache.conf file when
> caching is disabled.  To avoid this failure, we unset CCACHE_DISABLE prior
> to doing any initial cache setup, just on the call setting up the initial
> config.  The rest of the build can proceed with CCACHE_DISABLE set, if the
> user wishes it so.

Although I do undersand the explanations, I don't understand why a use
would export CCACHE_DISABLE in their environment, thereby explicitly
telling ccache to not cache or use the cache, and at the same time
explicitly enable ccache in Buildroot and asking it to prepare a
cache to use it...

That does not make sense to me.

It would be like the user would export an http_proxy environment
variable with an invalid proxy, and us trying to work-around that.

Regards,
Yann E. MORIN.

> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/ccache/ccache.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index 9a11d46..6c83a1c 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -55,7 +55,7 @@ BR_CCACHE_INITIAL_SETUP = $(call qstrip,$(BR2_CCACHE_INITIAL_SETUP))
>  ifneq ($(BR_CCACHE_INITIAL_SETUP),)
>  define HOST_CCACHE_DO_INITIAL_SETUP
>  	@$(call MESSAGE,"Applying initial settings")
> -	$(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
> +	unset CCACHE_DISABLE; $(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
>  	$(CCACHE) -s
>  endef
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
