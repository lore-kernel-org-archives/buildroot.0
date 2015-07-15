From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 11:53:07 +0200
Subject: [Buildroot] [PATCH v1 1/1] vidstab: new package
In-Reply-To: <1430192520-16082-1-git-send-email-skenton@ou.edu>
References: <1430192520-16082-1-git-send-email-skenton@ou.edu>
Message-ID: <20150715115307.31c930d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Mon, 27 Apr 2015 22:42:00 -0500, Steve Kenton wrote:
> 	  Vid.stab is a video image stabilization library
> 	  that can be used with ffmpeg --enable-libvidstab
> 	  and is acknowledged by the ffmpeg developers to
> 	  be superior to the built-in deshake filter. It
> 	  works best in a 2-pass configuration but 1-pass
> 	  is also available when needed/acceptable.

No need to indent the commit log.

>  package/Config.in          |  1 +
>  package/vidstab/Config.in  | 20 ++++++++++++++++++++
>  package/vidstab/vidstab.mk | 14 ++++++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 package/vidstab/Config.in
>  create mode 100644 package/vidstab/vidstab.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 4e20e4d..99935d8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -802,6 +802,7 @@ menu "Graphics"
>  	source "package/poppler/Config.in"
>  	source "package/powervr/Config.in"
>  	source "package/tiff/Config.in"
> +	source "package/vidstab/Config.in"
>  	source "package/wayland/Config.in"
>  	source "package/webkit/Config.in"
>  	source "package/webp/Config.in"
> diff --git a/package/vidstab/Config.in b/package/vidstab/Config.in
> new file mode 100644
> index 0000000..d900d17
> --- /dev/null
> +++ b/package/vidstab/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_VIDSTAB
> +	bool "vidstab"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Vid.stab is a video image stabilization library
> +	  that can be used with ffmpeg --enable-libvidstab

probably no need to mention --enable-libvidstab here explicitly.

> +	  and is acknowledged by the ffmpeg developers to
> +	  be superior to the built-in deshake filter. It
> +	  works best in a 2-pass configuration but 1-pass
> +	  is also available when needed/acceptable.
> +
> +	  Buildroot does not support packages with a '.'
> +	  in their name, which explains why it is named
> +	  vidstab and not vid.stab as might be expected.
> +
> +	  https://github.com/georgmartius/vid.stab
> +
> +comment "vidstab needs a toolschain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +

Unneeded empty new line.

> diff --git a/package/vidstab/vidstab.mk b/package/vidstab/vidstab.mk
> new file mode 100644
> index 0000000..53fb420
> --- /dev/null
> +++ b/package/vidstab/vidstab.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# vidstab
> +#
> +################################################################################
> +
> +VIDSTAB_VERSION = 3b35b4ddeb595511593a862849e750c459b99cb8
> +VIDSTAB_SITE = $(call github,georgmartius,vid.stab,$(VIDSTAB_VERSION))
> +VIDSTAB_LICENSE = GPL

License is GPLv2+

> +VIDSTAB_LICENSE_FILES = LICENSE
> +VIDSTAB_INSTALL_STAGING = YES
> +
> +$(eval $(cmake-package))
> +

Unneeded new line.

However, unfortunately, it doesn't build here: it uses x86 specific gcc
flags even on ARM:

>>> vidstab 3b35b4ddeb595511593a862849e750c459b99cb8 Building
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/projets/buildroot/output/host/usr/bin:/home/thomas/projets/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/thomas/sys/bin"  /usr/bin/make -j5  -C /home/thomas/projets/buildroot/output/build/vidstab-3b35b4ddeb595511593a862849e750c459b99cb8/
Scanning dependencies of target vidstab
[ 16%] [ 16%] [ 25%] Building C object CMakeFiles/vidstab.dir/src/transformtype.c.o
Building C object CMakeFiles/vidstab.dir/src/libvidstab.c.o
[ 33%] [ 41%] Building C object CMakeFiles/vidstab.dir/src/frameinfo.c.o
Building C object CMakeFiles/vidstab.dir/src/transformfixedpoint.c.o
Building C object CMakeFiles/vidstab.dir/src/transform.c.o
arm-linux-gcc: error: unrecognized command line option ?-msse2?
arm-linux-gcc: error: unrecognized command line option ?-msse2?
CMakeFiles/vidstab.dir/build.make:100: recipe for target 'CMakeFiles/vidstab.dir/src/libvidstab.c.o' failed
make[4]: *** [CMakeFiles/vidstab.dir/src/libvidstab.c.o] Error 1

Could you fix those issues and send an updated version of the patch?
Also, make sure that it builds fine with a static only toolchain like
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config
and if it doesn't, make the package depends on !BR2_STATIC_LIBS (see
other packages).

I'll mark your patch as Changes Requested in our patch tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
