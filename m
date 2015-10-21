From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Oct 2015 20:28:15 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: remove
 BR2_TARGET_OPTIMIZATION from TARGET_CFLAGS
In-Reply-To: <1444861150-4972-1-git-send-email-arnout@mind.be>
References: <1444861150-4972-1-git-send-email-arnout@mind.be>
Message-ID: <20151021182815.GA4112@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-10-15 00:19 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Since the toolchain is always wrapped and the wrapper already passes
> BR2_TARGET_OPTIMIZATION (through BR_ADDITIONAL_CFLAGS), there is no longer
> any need to pass it in TARGET_CFLAGS as well.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

On principle:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I noticed a potential bug in the toolchain-wrapper makefile.
Here's how we currently define BR_ADDITIONAL_CFLAGS:

    -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'

Notice the last comma in there? We want to have that comma in the
resulting expansion, so that we transform the option string:

    -mfoo -mbar -buz

into:

    "-mfoo", "-mbar", "-mbuz",

so that it can be used ina C array definition:

    static char *predef_args[] = {
    [...]
    #ifdef BR_ADDITIONAL_CFLAGS
        BR_ADDITIONAL_CFLAGS
    #endif
    }

However, in Makefile function calls, the comma is used to separate the
arguments passed to the function.

Even though $(foreach ...) only accepts three arguments, and the last
comma in fact correctly ends up in the expanded string, it would be
much safer to use $(comma) instead, like we would have to do in a call
to any other function.

Regards,
Yann E. MORIN.

> ---
> Tested with BR2_DEBUG_WRAPPER that BR2_TARGET_OPTIMIZATION and
> BR2_OPTIMIZE_* are still called correctly.
> ---
>  package/Makefile.in | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 8a592d4..ca34660 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -110,22 +110,20 @@ endif
>  STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
>  STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
>  
> -TARGET_OPTIMIZATION := $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
> -
>  ifeq ($(BR2_OPTIMIZE_0),y)
> -TARGET_OPTIMIZATION += -O0
> +TARGET_OPTIMIZATION = -O0
>  endif
>  ifeq ($(BR2_OPTIMIZE_1),y)
> -TARGET_OPTIMIZATION += -O1
> +TARGET_OPTIMIZATION = -O1
>  endif
>  ifeq ($(BR2_OPTIMIZE_2),y)
> -TARGET_OPTIMIZATION += -O2
> +TARGET_OPTIMIZATION = -O2
>  endif
>  ifeq ($(BR2_OPTIMIZE_3),y)
> -TARGET_OPTIMIZATION += -O3
> +TARGET_OPTIMIZATION = -O3
>  endif
>  ifeq ($(BR2_OPTIMIZE_S),y)
> -TARGET_OPTIMIZATION += -Os
> +TARGET_OPTIMIZATION = -Os
>  endif
>  ifeq ($(BR2_DEBUG_1),y)
>  TARGET_DEBUGGING = -g1
> -- 
> 2.6.1
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
