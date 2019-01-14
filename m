From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 22:31:33 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: override dri path
In-Reply-To: <20190112190743.7780-1-romain.naour@gmail.com>
References: <20190112190743.7780-1-romain.naour@gmail.com>
Message-ID: <20190114223133.20e32e04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 20:07:43 +0100, Romain Naour wrote:
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
> 
> As reported by #11591, the xerver fail to load dri modules (r600_dri.so):
> 
> From Xorg.0.log:
> (EE) AIGLX error: dlopen of /full/path/to/sysroot/usr/lib/dri/r600_dri.so failed (/full/path/to/sysroot/usr/lib/dri/r600_dri.so: cannot open shared object file: No such file or directory)
> (II) GLX: no usable GL providers found for screen 0
> 
> That's because the xserver hardcode the dri divers directory path in
> DRI_DRIVER_PATH which come from
> dridriverdir=`$PKG_CONFIG --variable=dridriverdir dri`
> 
> We can see in dri.pc that dridriverdir use libdir which is now prefixed
> by the sysroot by pkgconf 1.5.3:
> 
> prefix=/usr
> exec_prefix=/usr
> libdir=${exec_prefix}/lib
> includedir=${prefix}/include
> dridriverdir=${libdir}/dri
> 
> Since we can't rely on pkgconf anymore, use --with-dri-driverdir="/usr/lib/dri"
> to use explicitly "/usr/lib/dri" instead of relying on dri.pc.
> 
> Tested using TestGlxinfo test from:
> http://patchwork.ozlabs.org/patch/1021669/
> 
> Fixes:
> https://bugs.buildroot.org/show_bug.cgi?id=11591
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied after fixing the commit log, as I explained in my previous
reply.

> +	--with-dri-driverdir="/usr/lib/dri" \

I also dropped the double quotes around /usr/lib/dri.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
