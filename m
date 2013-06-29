From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sat, 29 Jun 2013 10:46:36 +0200
Subject: [Buildroot] [PATCH 2/4] package/libsvg: new package
In-Reply-To: <87ehbmyrmg.fsf@dell.be.48ers.dk>
References: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
 <1372445557-15546-2-git-send-email-c.schoenert@gmail.com>
 <87ehbmyrmg.fsf@dell.be.48ers.dk>
Message-ID: <51CE9EEC.3090809@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Am 28.06.2013 21:14, schrieb Peter Korsgaard:
>  Carsten> +	  http://www.t2-project.org/packages/libsvg.html
> 
> Are you sure that's the upstream URL? Isn't t2 yet another embedded
> build system?

Yes, true. After a longer try to find a "official" project webpage I
couldn't find no one that fits into.
The source is placed under cairographics.org (but even without any
dedicated info for the package libsvg (and also for libsvg-cairo). So
just point to the main site of cairographics.org?

> This is the default, so you can drop this line.
> 
> Personally I prefer to not align the '=' signs, but I know we have a bit
> of a mix in the tree.

Ahh, o.k. I didn't ever realize that, will drop this line.

>  Carsten> +LIBSVG_LICENSE         = LGPLv2
> 
> grep -rls 'any later version' src | wc -l
> 24
> 
> It looks to be LGPLv2+.

You are right, it's later written in the COPYING file.

> It looks good, but it doesn't work:
> 
> checking for ANSI C header files... (cached) yes
> checking whether libexpat is requested... no
> ./configure: line 20639: /home/peko/source/buildroot/output/host/usr/bin/pkg-config: No such file or directory
> *** Your version of pkg-config is too old. You need version 0.9.0 or newer.
> *** See http://www.freedesktop.org/software/pkgconfig
> configure: error: Library requirements (libxml-2.0 >= 2.4.7 ) not met; consider adjusting the PKG_CONFIG_PATH environment variable if your libraries are in a nonstandard prefix so pkg-config can find them.
> 
> So you atleast need host-pkgconf as a dependency. It looks like it can
> work with expat instead, so you could drop the hard dependency on
> libxml2, but that is not really critical.

That's correct, it should working with expat too (as a deeper look into
configure.in is showing). I changed the the libsvg.mk to cover this

> ifeq ($(BR2_PACKAGE_EXPAT),y)
> LIBSVG_CONF_OPT += --with-expat
> else
> LIBSVG_DEPENDENCIES += libxml2
> endif

but it doesn't work with my external (crosstool-NG) toolchain which I
create at my self, the expat.h is missing.

> checking whether libexpat is requested... yes
> configure: creating ./config.status
> config.status: creating libsvg.spec
> config.status: creating libsvg.pc
> config.status: creating src/svg_version.h
> config.status: creating Makefile
> config.status: creating src/Makefile
> config.status: creating config.h
> config.status: executing depfiles commands
>>>> libsvg 0.1.4 Building
...
> In file included from svg.c:31:0:
> svgint.h:28:19: fatal error: expat.h: No such file or directory

The BR2_PACKAGE_EXPAT is set by BR2_INSTALL_LIBSTDCPP which is set by
BR2_TOOLCHAIN_EXTERNAL_CXX. But crosstool-NG didn't provide the expat
related files.

http://sourceware.org/ml/crossgcc/2013-03/msg00021.html

So I think there is a little problem, how to tell buildroot if there is
a real support for expat or not? Maybe the other external toolchains
provide the expat files, I don't have tested this.

So I would suggest to set up the dependency to libxml2 with a comment why.

Regards
Carsten
