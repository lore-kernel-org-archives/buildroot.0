From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 May 2014 12:36:36 +0200
Subject: [Buildroot] [PATCH v2] agg: new package
In-Reply-To: <53635F06.2050208@free.fr>
References: <1398351989-24238-1-git-send-email-julien.boibessot@free.fr>
 <20140430204346.GD3336@free.fr> <53635F06.2050208@free.fr>
Message-ID: <20140502103636.GA3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

[Please do not send HTML mail]

On 2014-05-02 11:01 +0200, Julien Boibessot spake thusly:
> On 04/30/2014 10:43 PM, Yann E. MORIN wrote:
>  Julien, All,On 2014-04-24 17:06 +0200,
>  [1]julien.boibessot at free.fr spake thusly:
[--SNIP--]
>  Not your fault, but here's what one gets when one visits
>  [4]http://antigrain.com/ :    antigrain.com expired on 04/09/2014 and is pending renewal or
>      deletion
[--SNIP--]
> Oups I missed that one... :-(
> Would it be OK if I switch to agg-2.4 which is a fork that seems to be
> still maintained and used in several other projects ?
> ( [6]https://sourceforge.net/p/agg/svn/HEAD/tree/ )

Whatever gets us up-n-runnin', I guess :-)

> My idea behind agg was to have a "lightweight" gnash player for ARM9
> platform which doesn't have OpenVG/GL accelerators. Do you
> think cairo can do the job ? I got inspired from LFS which uses agg
> as gnash backend.

I don't know. If agg makes it work for you, then just add agg. If you or
someone else wants to experiment with cairo, then it's fine too.

>  +comment "agg needs a toolchain with C++ support"

BTW, this should be:

    comment "agg needs a toolchain w/ C++"

See:
    http://buildroot.net/downloads/manual/manual.html#dependencies-target-toolchain-options

>  diff --git a/package/agg/agg.mk b/package/agg/agg.mk
>  new file mode 100644index 0000000..4802d3e
>  --- /dev/null+++ b/package/agg/agg.mk@@ -0,0 +1,39 @@
>  +###############################################################################
>  +#+# agg+#+###############################################################################
>  ++AGG_VERSION = 2.5+AGG_SITE =
>  [8]http://www.antigrain.com/
> 
>  Ditto, point to SF instead.
> 
>  +AGG_LICENSE = GPLv2++AGG_LICENSE_FILES = copying
>  +# Examples (if one day enabled) use gpc library which has a different license:
>  +#AGG_LICENSE += with exceptions: gpc sources are free for non-commercial use
>  +#AGG_LICENSE_FILES += gpc/copying.txt+AGG_INSTALL_STAGING = YES
>  +# No ./configure in the sources, we need to generate it:
>  +AGG_AUTORECONF = YES++AGG_DEPENDENCIES = host-pkgconf sdl
>  ++# Forces sdl-prefix, otherwise configure will set it to Host SDL devt files
>  +# directory, if installed:+AGG_CONF_OPT = \
>  +        --with-sdl-prefix=$(STAGING_DIR)/usr \
>  +        --disable-sdltest++ifeq ($(BR2_PACKAGE_SDL_X11),)
>  +AGG_CONF_OPT += \+     --with-x=NO \+  --disable-examples # examples require X11
> 
>  Single line, please, it is not long enough to warrant a multi-line
>  Besides, the comment on that second line is part of the variable value,
>  so it might come and interfere with the build. Move it above:
>      # Dont build examples, they need X11    AGG_CONF_OPT += --with-x=NO --disable-examples
> 
>  +endif
> 
>  Peter might disagree, but I prefer when there is an explicit else-clause
>  that does the opposite:    else    AGG_CONF_OPT += --with-x --enable-examples
>      endif(Or disable exanples altogether anyway.)
> 
> even if it's the default configure options ?

Yes, I do not trust the defaults.

Regards,
Yann E. NORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
