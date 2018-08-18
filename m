From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Aug 2018 01:15:12 +0200
Subject: [Buildroot] [RFC v3 2/4] meson: change from global to per
 package cross-compilation.conf
In-Reply-To: <20180816135745.71ed73f2@windsurf>
References: <20180719204355.10465-1-ps.report@gmx.net>
 <20180719204355.10465-2-ps.report@gmx.net>
 <20180816135745.71ed73f2@windsurf>
Message-ID: <20180819011512.11fad995@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 16 Aug 2018 13:57:45 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Thu, 19 Jul 2018 22:43:53 +0200, Peter Seiderer wrote:
> 
> > -define HOST_MESON_INSTALL_CROSS_CONF
> > +define HOST_MESON_INSTALL_CROSS_CONF_IN
> >  	mkdir -p $(HOST_DIR)/etc/meson
> >  	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
> >  	    -e "s%@TARGET_ARCH@%$(ARCH)%g" \
> > @@ -31,9 +31,9 @@ define HOST_MESON_INSTALL_CROSS_CONF
> >  	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
> >  	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
> >  	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \  
> > -	    > $(HOST_DIR)/etc/meson/cross-compilation.conf    
> > +	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in  
> 
> I am not super happy with this approach, because this file is not meant
> to be used just during the build of Buildroot packages, but potentially
> after the Buildroot build is finished, for people to easily
> cross-compile Meson-based software manually. To me, this file is
> similar to toolchainfile.cmake that pkg-cmake.mk is installing, and
> which allows to easily cross-compile stuff with CMake outside of
> Buildroot, using the Buildroot generated toolchain.
> 
> So I would prefer to:
> 
>  - Move this file to
>    $(HOST_DIR)/usr/share/buildroot/meson-cross-compilation.conf or
>    something like that, so that we are a bit consistent with what we do
>    for CMake.
> 
>  - Keep it directly usable.
> 
>  - Pass the additional CFLAGS/LDFLAGS to packages on the command line
>    rather than through this file.
>    https://mesonbuild.com/howtox.html#set-extra-compiler-and-linker-flags-from-the-outside-when-eg-building-distro-packages
>    seems to say this is possible, no ? Or does it override the ones
>    from the cross-compilation.conf ?

The CFLAGS are ignored, e.g. with 'LIBDRM_CONF_ENV += CFLAGS=-DAO_NO_SPARC_V9' in package/libdrm/libdrm.mk:

	$ make libdrm V=1
[...]

... CFLAGS=-DAO_NO_SPARC_V9 host/bin/meson --prefix=/usr --libdir=lib --default-library=shared --buildtype=debug --cross-file=.../host/etc/meson/cross-compilation.conf -Dcairo-tests=false -Dmanpages=false -Dintel=false -Dradeon=true -Damdgpu=true -Dnouveau=true -Dvmwgfx=false -Domap=false -Detnaviv=true -Dexynos=false -Dfreedreno=false -Dtegra=false -Dvc4=false -Dudev=true -Dvalgrind=false -Dinstall-test-programs=true .../build/libdrm-2.4.93/ .../build/libdrm-2.4.93//build
The Meson build system
Version: 0.47.1
Source dir: .../build/libdrm-2.4.93
Build dir: .../build/libdrm-2.4.93/build
Build type: cross build
WARNING: Unknown options: "manpages"
Project name: libdrm
Project version: 2.4.93
Appending CFLAGS from environment: '-DAO_NO_SPARC_V9'
Appending CFLAGS from environment: '-DAO_NO_SPARC_V9'
Native C compiler: cc (gcc 8.1.1 "cc (SUSE Linux) 8.1.1 20180719 [gcc-8-branch revision 262874]")
Cross C compiler: /home/seiderer/Work/Buildroot/build_libdrm_c99/host/bin/sparc-linux-gcc (gcc 6.4.0)

[...]

[1/104] .../host/bin/sparc-linux-gcc -Ilibkms/libkms@@kms at sha -Ilibkms -I../libkms -I. -I../ -I../include/drm -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=gnu99 -O0 -g -include config.h -fPIC -Wall -Wextra -Wsign-compare -Werror=undef -Werror-implicit-function-declaration -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Wpacked -Wswitch-enum -Wmissing-format-attribute -Wstrict-aliasing=2 -Winit-self -Winline -Wshadow -Wdeclaration-after-statement -Wold-style-definition -Wno-unused-parameter -Wno-attributes -Wno-long-long -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g2 -MD -MQ 'libkms/libkms@@kms at sha/api.c.o' -MF 'libkms/libkms@@kms at sha/api.c.o.d' -o 'libkms/libkms@@kms at sha/api.c.o' -c ../libkms/api.c

Only the c_args from cross-compilation.conf ('-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g2')
are used (in contrast to the 'Appending CFLAGS from environment' message)...

Regards,
Peter

> 
> Thanks!
> 
> Thomas
