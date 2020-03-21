From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 16:55:03 +0100
Subject: [Buildroot] [RFC PATCH 1/1] package/cegui: rename and bump
 version
In-Reply-To: <20200318085125.12843-1-b.bilas@grinn-global.com>
References: <20200318085125.12843-1-b.bilas@grinn-global.com>
Message-ID: <20200321165503.7baa0173@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bartosz,

On Wed, 18 Mar 2020 09:51:25 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Since spice ver. 0.12.6 doesn't depend on cegui anymore let's bump to the latest stable version
> and rename package.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Unfortunately, it doesn't build with uClibc/musl:

/home/thomas/projets/buildroot/output/build/cegui-0-8-7/cegui/src/Exceptions.cpp:45:25: fatal error: execinfo.h: No such file or directory
compilation terminated.

You'll have to add a check for execinfo.h in CMakeLists.txt and use the
result of this check instead of the crazy:

#elif     (defined(__linux__) && !defined(__ANDROID__)) \
      ||  defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) \
      ||  defined(__HAIKU__)

> +ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
> +CEGUI_DEPENDENCIES += libepoxy
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SDL2_OPENGLES),y)
> +CEGUI_DEPENDENCIES += sdl2_opengles
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OGRE),y)
> +CEGUI_DEPENDENCIES += ogre
> +endif

[... snip ...]

So I take it there are no enable/disable options ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
