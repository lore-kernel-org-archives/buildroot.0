From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 13:57:45 +0200
Subject: [Buildroot] [RFC v3 2/4] meson: change from global to per
 package cross-compilation.conf
In-Reply-To: <20180719204355.10465-2-ps.report@gmx.net>
References: <20180719204355.10465-1-ps.report@gmx.net>
 <20180719204355.10465-2-ps.report@gmx.net>
Message-ID: <20180816135745.71ed73f2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 22:43:53 +0200, Peter Seiderer wrote:

> -define HOST_MESON_INSTALL_CROSS_CONF
> +define HOST_MESON_INSTALL_CROSS_CONF_IN
>  	mkdir -p $(HOST_DIR)/etc/meson
>  	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
>  	    -e "s%@TARGET_ARCH@%$(ARCH)%g" \
> @@ -31,9 +31,9 @@ define HOST_MESON_INSTALL_CROSS_CONF
>  	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
>  	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
>  	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
> -	    > $(HOST_DIR)/etc/meson/cross-compilation.conf  
> +	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in

I am not super happy with this approach, because this file is not meant
to be used just during the build of Buildroot packages, but potentially
after the Buildroot build is finished, for people to easily
cross-compile Meson-based software manually. To me, this file is
similar to toolchainfile.cmake that pkg-cmake.mk is installing, and
which allows to easily cross-compile stuff with CMake outside of
Buildroot, using the Buildroot generated toolchain.

So I would prefer to:

 - Move this file to
   $(HOST_DIR)/usr/share/buildroot/meson-cross-compilation.conf or
   something like that, so that we are a bit consistent with what we do
   for CMake.

 - Keep it directly usable.

 - Pass the additional CFLAGS/LDFLAGS to packages on the command line
   rather than through this file.
   https://mesonbuild.com/howtox.html#set-extra-compiler-and-linker-flags-from-the-outside-when-eg-building-distro-packages
   seems to say this is possible, no ? Or does it override the ones
   from the cross-compilation.conf ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
