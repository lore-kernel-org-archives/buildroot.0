From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Feb 2020 22:15:49 +0100
Subject: [Buildroot] [PATCH 2/2] package/git: fix build failure due to
 gcc bug 93847
In-Reply-To: <871rqh56r3.fsf@dell.be.48ers.dk>
References: <20200220154004.126384-1-giulio.benetti@benettiengineering.com>
 <20200220154004.126384-2-giulio.benetti@benettiengineering.com>
 <871rqh56r3.fsf@dell.be.48ers.dk>
Message-ID: <20200227211549.GG8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-02-26 23:22 +0100, Peter Korsgaard spake thusly:
> >>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>  > The git package exhibits gcc bug 93847 when built for the Nios2
>  > architecture with optimization enabled, which causes a build failure.
> 
>  > As done for other packages in Buildroot work around this gcc bug by
>  > setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_93847=y.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/e22/e225e62ea2d48660df4110790664f0c3306c1ea9/
> 
>  > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>  > ---
>  >  package/git/git.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > diff --git a/package/git/git.mk b/package/git/git.mk
>  > index a5c8669fc9..f32a2f8eb9 100644
>  > --- a/package/git/git.mk
>  > +++ b/package/git/git.mk
>  > @@ -67,7 +67,7 @@ endif
>  
>  >  GIT_CFLAGS = $(TARGET_CFLAGS)
>  
>  > -ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  > +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),y)
> 
> This fails for a (hypothetical) toolchain affected by both issues,
> perhaps something like this would be better?
> 
> ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),)

Or we can keep positive logic and use the available make utilities:

    ifeq ($(or $(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847)),y)

Regards,
Yann E. MORIN.

> -- 
> Bye, Peter Korsgaard
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
