From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Feb 2017 10:42:42 +0100
Subject: [Buildroot] [PATCH 3/3] gstreamer1: drop unused configure time
 unaligned access handling logic
In-Reply-To: <20170218092550.29810-3-peter@korsgaard.com>
References: <20170218092550.29810-1-peter@korsgaard.com>
 <20170218092550.29810-3-peter@korsgaard.com>
Message-ID: <20170218094242.GA3632@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-02-18 10:25 +0100, Peter Korsgaard spake thusly:
> gstreamer has moved to build time unaligned access support detection using
> ifdefs in gstconfig.h since 1.9.2:
> 
> commit 6ef601367e0f5adb7a8b02cec94dec04fccf701a
> Author: Nirbheek Chauhan <nirbheek@centricular.com>
> Date:   Tue Jun 21 18:59:49 2016 +0530
> 
>     gstconfig.h: Detect unaligned access support at compile-time
> 
>     This makes gstconfig.h completely arch-independent. Should cover all
>     compilers that gstreamer is known to build on, and all architectures
>     that I could find information on. People are encouraged to file bugs if
>     their platform/arch is missing.
> 
> So ac_cv_unaligned_access is no longer used and our logic can be removed.

In the previous patch, you add the or1k conditions to the if-block, but
it is unused and you remove it here.

So I think this patch should come before you fix or1k, i.e. swap patches
2 and 3, no?

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gstreamer1/gstreamer1/gstreamer1.mk | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index 7872ba13f..e110dee7d 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -11,16 +11,6 @@ GSTREAMER1_INSTALL_STAGING = YES
>  GSTREAMER1_LICENSE_FILES = COPYING
>  GSTREAMER1_LICENSE = LGPLv2+, LGPLv2.1+
>  
> -# Checking if unaligned memory access works correctly cannot be done when cross
> -# compiling. For the following architectures there is no information available
> -# in the configure script.
> -ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2)$(BR2_or1k),y)
> -GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
> -endif
> -ifeq ($(BR2_aarch64),y)
> -GSTREAMER1_CONF_ENV = as_cv_unaligned_access=yes
> -endif
> -
>  GSTREAMER1_CONF_OPTS = \
>  	--disable-examples \
>  	--disable-tests \
> -- 
> 2.11.0
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
