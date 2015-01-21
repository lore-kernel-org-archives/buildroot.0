From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Jan 2015 18:40:19 +0100
Subject: [Buildroot] [PATCH 06/11 v5] package/nvidia-driver: add
 NVidia's OpenGL binary blob
In-Reply-To: <1543651.dEYKR9f3t7@aquila>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
 <38defbca2c222a8bbcc2a3bb5a87c2e97282ee6e.1421699898.git.yann.morin.1998@free.fr>
 <1543651.dEYKR9f3t7@aquila>
Message-ID: <20150121174019.GE4375@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r^ome, All,

On 2015-01-20 15:00 +0100, J?r?me Pouiller spake thusly:
> On Monday 19 January 2015 21:40:36 Yann E. MORIN wrote:
> [...]
> > --- /dev/null
> > +++ b/package/nvidia-driver/Config.in
> > @@ -0,0 +1,51 @@
> > +comment "nvidia-driver needs an (e)glibc toolchain and a modular Xorg server"
> > +	depends on BR2_i386 || BR2_x86_64
> > +	depends on !BR2_TOOLCHAIN_USES_GLIBC \
> > +		|| !BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
> > +
> > +config BR2_PACKAGE_NVIDIA_DRIVER
> > +	bool "nvidia-driver"
> > +	depends on BR2_i386 || BR2_x86_64
> > +	depends on BR2_TOOLCHAIN_USES_GLIBC
> > +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
> > +	select BR2_PACKAGE_OPENGL_REGISTRY
> > +	select BR2_PACKAGE_XLIB_LIBX11
> > +	select BR2_PACKAGE_XLIB_LIBXEXT
> > +	select BR2_PACKAGE_HAS_LIBGL
> > +	select BR2_PACKAGE_HAS_LIBEGL
> > +	select BR2_PACKAGE_HAS_LIBGLES
> > +	help
> > +	  The binary-only driver blob for NVidia cards.
> > +	  This is the userland part only.
> > +
> > +	  http://www.nvidia.com/
> > +
> > +if BR2_PACKAGE_NVIDIA_DRIVER
> > +
> > +config BR2_PACKAGE_PROVIDES_LIBGL
> > +	default "nvidia-driver"
> If I understand right, mesa3d cannot be selected in same time than 
> nvidia-driver.

Indeed no, since they both are providers for the GL stuff, and we can
have only one provider for each virtual package.

> Consequently, xorg-xserver will be built with 
> "--disable-dri --disable-glx". 
> It does not produce error when loading nvidia-driver? In add, I 
> suppose it is not possible to use OpenGL application if xserver
> is compiled --disable-glx, no?

This series is surely not exhaustive about GL dependencies. My test-case
was to build Kodi for my HTPC (NVidia GPU, as you may have guessed!),
and that series makes it at least build (I still need to extensively
run-test it, though), so it is very well possible that building X.org
for NVidia-based accelerated X is not working completely (but that would
be an new feature, not a breaking of existing features).

> I am currently trying to compile xorg-xserver with dri/glx but without
> using mesa3d (using opengl-registry and nvidia-driver instead).

I see you have submitted the patches already. Thanks for working on
that! :-) I'll have a look at them.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
