From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:05:35 +0100
Subject: [Buildroot] [PATCH V2] ffmpeg: enable use of freetype and
	fontconfig
In-Reply-To: <54C6E85B.2010707@ou.edu> (Steve Kenton's message of "Mon, 26 Jan
 2015 19:22:35 -0600")
References: <54C6E85B.2010707@ou.edu>
Message-ID: <87k307yj4g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Kenton <skenton@ou.edu> writes:

 > Configure ffmpeg to use freetype and fontconfig
 > if those packages are selected.

 > ffmpeg freetype support require fenv.h
 > which is not available in uClibc
 > except for uClibc on x86

 > Signed-off-by Stephen M. Kenton <skenton@ou.edu>
 > ---
 > V2 Added fontconfig to make freetype support more robust

 > I could not find a good way to do "or" in the make file
 > Is there something better than nesting and using two
 > ffmpeg_environment_has_fenv ?= y
 > statements? I'm not really happy about the temporary

I also don't like the lowercase variable, but see below:

 > +# ffmpeg freetype support require fenv.h
 > +# which is not available in uClibc
 > +ifneq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 > +ffmpeg_environment_has_fenv ?= y
 > +endif
 > +# except for uClibc on x86
 > +ifeq ($(BR2_i386)$(BR2_x86_64),y)
 > +ffmpeg_environment_has_fenv ?= y

While it is true that uClibc on x86 CAN be built with fenv support, it
isn't by default and our default defconfig in Buildroot doesn't enable
it. Chances are that external toolchains also don't enable it, so I
would prefer to just not enable it for uClibc.

You also don't cover musl. While it does provide fenv.h, it is missing
functionality on atleast microblaze and soft float arm/mips, so I think
the sanest approach is just to only enable it for glibc.


> +endif
 > +ifeq ($(BR2_PACKAGE_FREETYPE)$(ffmpeg_environment_has_fenv),yy)
 > +FFMPEG_CONF_OPTS += --enable-libfreetype
 > +FFMPEG_DEPENDENCIES += freetype
 > +# fontconfig only makes sense if we also have freetype
 > +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 > +FFMPEG_CONF_OPTS += --enable-fontconfig
 > +FFMPEG_DEPENDENCIES += fontconfig
> +endif

You are missing an else part with --disable-fontconfig here. While it is
true that fontconfig doesn't make much sense without freetype ffmpeg
does handle it correctly (E.G. --enable-fontconfig --disable-libfreetype
isn't an error, but it doesn't do anything with the fontconfig stuff),
so I prefer to just move the fontconfig stuff outside of the freetype
handling.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
