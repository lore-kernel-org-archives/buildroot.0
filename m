From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 02 May 2014 11:01:58 +0200
Subject: [Buildroot] [PATCH v2] agg: new package
In-Reply-To: <20140430204346.GD3336@free.fr>
References: <1398351989-24238-1-git-send-email-julien.boibessot@free.fr>
 <20140430204346.GD3336@free.fr>
Message-ID: <53635F06.2050208@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On 04/30/2014 10:43 PM, Yann E. MORIN wrote:
> Julien, All,
>
> On 2014-04-24 17:06 +0200, julien.boibessot at free.fr spake thusly:
>> From: Julien Boibessot <julien.boibessot@armadeus.com>
> [--SNIP--]
>> diff --git a/package/agg/Config.in b/package/agg/Config.in
>> new file mode 100644
>> index 0000000..a842098
>> --- /dev/null
>> +++ b/package/agg/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_AGG
>> +	bool "agg"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	select BR2_PACKAGE_SDL
>> +	help
>> +	  The Anti-Grain Geometry project. A High Quality 2D Graphics Rendering
>> +	  Engine for C++.
>> +	  We select the SDL backend by default.
>> +
>> +	  http://www.antigrain.com/index.html
> Not your fault, but here's what one gets when one visits
> http://antigrain.com/ :
>
>     antigrain.com expired on 04/09/2014 and is pending renewal or
>     deletion
>
> So, I'm a bit sceptic at adding this package, just because there will
> shortly be no way of getting it... :-/
>
> But wikipedia comes to the rescue, and points us to a "copy" of the
> site, on sourceforge:
>     http://agg.sourceforge.net/antigrain.com/index.html
>
> You may want to point to SF instead.
>
> Still upstream does not seem very active, and I'm a bit uneasy at adding
> it...
>
> BTW, strictly speaking, it is not *needed* by gnash. It is only one of
> the few, somewhat-supported backends:
>     directfb, OpenVG, OpenGLES1, OpenGL, Cairo.
>
> Granted, only cairo and agg are enabled by default (others are
> considered incomplete).

Oups I missed that one... :-(
Would it be OK if I switch to agg-2.4 which is a fork that seems to be
still maintained and used in several other projects ?
( https://sourceforge.net/p/agg/svn/HEAD/tree/)

My idea behind agg was to have a "lightweight" gnash player for ARM9
platform which doesn't have OpenVG/GL accelerators. Do you think cairo
can do the job ? I got inspired from LFS which uses agg as gnash backend.

>
>> +comment "agg needs a toolchain with C++ support"
>> +	depends on !BR2_INSTALL_LIBSTDCPP
>> diff --git a/package/agg/agg-make-autoreconfable.patch b/package/agg/agg-make-autoreconfable.patch
>> new file mode 100644
>> index 0000000..9c069a3
>> --- /dev/null
>> +++ b/package/agg/agg-make-autoreconfable.patch
>> @@ -0,0 +1,25 @@
>> +Make the package autoreconfigurable without having to create NEWS, AUTHORS and
>> +README files. Also fixes reconfiguring with recent automake by removing
>> +AM_C_PROTOTYPES.
>> +
>> +Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
>> +
>> +--- agg-2.5.org/configure.in	2014-04-24 15:53:57.832886577 +0200
>> ++++ agg-2.5/configure.in	2014-04-24 16:06:56.788749209 +0200
>> +@@ -1,14 +1,13 @@
>> +-AC_INIT(src/agg_arc.cpp) # give me a source file, any source file...
>> ++AC_INIT([agg], 2.5.0)
> Yep, good, except you should now need something like:
>     AC_CONFIG_SRCDIR([src/agg_arc.cpp]) # give me a source file, any source file...
>
>> + AC_CANONICAL_TARGET
>> + AC_CONFIG_HEADERS(include/config.h)
>> +-AM_INIT_AUTOMAKE(agg, 2.5.0)
>> ++AM_INIT_AUTOMAKE([foreign])
> Yep! :-)
>
> I know upstream looks pretty dead, but it might still be worth pushing
> this patch to them if possible (once the nit above is fixed.)
>
>> + 
>> + dnl Checks for programs.
>> + AC_PROG_CC
>> + AC_PROG_CXX
>> + AC_ISC_POSIX
>> +-AM_C_PROTOTYPES
> Yep, die C prototypes, die! :-]
>
>> + if test "x$U" != "x"; then
>> +   AC_MSG_ERROR(Compiler not ANSI compliant)
>> + fi
>> diff --git a/package/agg/agg.mk b/package/agg/agg.mk
>> new file mode 100644
>> index 0000000..4802d3e
>> --- /dev/null
>> +++ b/package/agg/agg.mk
>> @@ -0,0 +1,39 @@
>> +###############################################################################
>> +#
>> +# agg
>> +#
>> +###############################################################################
>> +
>> +AGG_VERSION = 2.5
>> +AGG_SITE = http://www.antigrain.com/
> Ditto, point to SF instead.
>
>> +AGG_LICENSE = GPLv2+
>> +AGG_LICENSE_FILES = copying
>> +# Examples (if one day enabled) use gpc library which has a different license:
>> +#AGG_LICENSE += with exceptions: gpc sources are free for non-commercial use
>> +#AGG_LICENSE_FILES += gpc/copying.txt
>> +AGG_INSTALL_STAGING = YES
>> +# No ./configure in the sources, we need to generate it:
>> +AGG_AUTORECONF = YES
>> +
>> +AGG_DEPENDENCIES = host-pkgconf sdl
>> +
>> +# Forces sdl-prefix, otherwise configure will set it to Host SDL devt files
>> +# directory, if installed:
>> +AGG_CONF_OPT = \
>> +        --with-sdl-prefix=$(STAGING_DIR)/usr \
>> +        --disable-sdltest
>> +
>> +ifeq ($(BR2_PACKAGE_SDL_X11),)
>> +AGG_CONF_OPT += \
>> +	--with-x=NO \
>> +	--disable-examples # examples require X11
> Single line, please, it is not long enough to warrant a multi-line
>
> Besides, the comment on that second line is part of the variable value,
> so it might come and interfere with the build. Move it above:
>
>     # Dont build examples, they need X11
>     AGG_CONF_OPT += --with-x=NO --disable-examples
>
>> +endif
> Peter might disagree, but I prefer when there is an explicit else-clause
> that does the opposite:
>
>     else
>     AGG_CONF_OPT += --with-x --enable-examples
>     endif
>
> (Or disable exanples altogether anyway.)

even if it's the default configure options ?

Regards,
Julien


>
>> +ifeq ($(BR2_PACKAGE_FREETYPE),y)
>> +AGG_DEPENDENCIES += freetype
>> +AGG_CONF_OPT += --enable-freetype
>> +else
>> +AGG_CONF_OPT += --disable-freetype
>> +endif
>> +
>> +$(eval $(autotools-package))
> Regards,
> Yann E. MORIN.
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140502/d02fbe76/attachment.html>
