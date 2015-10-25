From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 22:40:20 +0100
Subject: [Buildroot] [PATCH 1/2] x265: new package
In-Reply-To: <87d1w2fxgq.fsf@dell.be.48ers.dk>
References: <1445716229-40660-1-git-send-email-thijsvermeir@gmail.com>
 <87d1w2fxgq.fsf@dell.be.48ers.dk>
Message-ID: <20151025214020.GL11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

\Peter, All,

On 2015-10-25 22:29 +0100, Peter Korsgaard spake thusly:
> >>>>> "Thijs" == Thijs Vermeir <thijsvermeir@gmail.com> writes:
>  > x265 is a H.265 / HEVC video encoder application library, designed to encode
>  > video or images into an H.265 / HEVC encoded bitstream.
> 
>  > http://x265.org
> 
>  > Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
> 
> > +++ b/package/x265/x265.mk
>  > @@ -0,0 +1,31 @@
>  > +################################################################################
>  > +#
>  > +# x265
>  > +#
>  > +################################################################################
>  > +
>  > +X265_VERSION = 1.8
>  > +X265_SOURCE = x265_$(X265_VERSION).tar.gz
>  > +X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
>  > +X265_LICENSE = GPLv2+
>  > +X265_LICENSE_FILES = COPYING
>  > +X265_SUBDIR = source/
> 
> NIT: we normally don't append the trailing '/'.
> 
> > +X265_INSTALL_STAGING = YES
>  > +
>  > +ifeq ($(BR2_i386)$(BR2_x86_64),y)
>  > +X265_DEPENDENCIES += host-yasm
>  > +endif
>  > +
>  > +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>  > +X265_CONF_OPTS += -DENABLE_SHARED=true -DENABLE_PIC=true
>  > +else
>  > +X265_CONF_OPTS += -DENABLE_SHARED=false
>  > +endif
> 
> Any idea why the x265 developers don't use the "standard"
> BUILD_SHARED_LIBS=ON|OFF flag like other packages?

I gues it would work, since they do things like:

    if(ENABLE_SHARED)
and
    if(ENABLE_PIC)

Ditto for CLI.

Thijs, care to check if changing true/false to ON/OFF still works,
please? If so, can you send an patch? This way, all our Cmake-based
packages will look the same, which is good for consistency.

Regards,
Yann E. MORIN.

>  > +ifeq ($(BR2_PACKAGE_X265_CLI),)
>  > +X265_CONF_OPTS += -DENABLE_CLI=false
>  > +else
>  > +X265_CONF_OPTS += -DENABLE_CLI=true
>  > +endif
> 
> We prefer positive logic, so I've swapped these around.
> 
> Committed, thanks.
> 
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
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
