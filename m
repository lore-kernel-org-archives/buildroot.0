From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 23:46:13 +0100
Subject: [Buildroot] [PATCH 06/15] package infra: drop non-lfs support
In-Reply-To: <1426270934-15499-7-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150314224613.GJ4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Review for both pathes 5 and 6: I think you should do it that way:

  - patch 5: the hunk of Makefile.in from this patch, alone

  - patch 6: remove use of $(DISABLE_LARGEFILE)

Granted, your proposal would work (with the additional patch I
suggested) because BR2_LARGEFILE is now always 'y'.

Still, I think it's better to get rid of DISABLE_LARGEFILE consistently.

Regards,
Yann E. MORIN.

> ---
>  package/Makefile.in      | 7 -------
>  package/pkg-autotools.mk | 1 -
>  2 files changed, 8 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 803b162..fc57427 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -136,10 +136,7 @@ ifeq ($(BR2_DEBUG_3),y)
>  TARGET_DEBUGGING = -g3
>  endif
>  
> -ifeq ($(BR2_LARGEFILE),y)
>  TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -endif
> -
>  TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
> @@ -373,10 +370,6 @@ else
>  DISABLE_NLS :=--disable-nls
>  endif
>  
> -ifneq ($(BR2_LARGEFILE),y)
> -DISABLE_LARGEFILE = --disable-largefile
> -endif
> -
>  ifeq ($(BR2_INET_IPV6),y)
>  DISABLE_IPV6 = --enable-ipv6
>  else
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index d2f15fa..2ecf7d8 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -201,7 +201,6 @@ define $(2)_CONFIGURE_CMDS
>  		--with-fop=no \
>  		--disable-dependency-tracking \
>  		$$(DISABLE_NLS) \
> -		$$(DISABLE_LARGEFILE) \
>  		$$(DISABLE_IPV6) \
>  		$$(ENABLE_DEBUG) \
>  		$$(SHARED_STATIC_LIBS_OPTS) \
> -- 
> 2.0.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
