From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Mar 2015 11:25:59 +0100
Subject: [Buildroot] kodi: build errors
In-Reply-To: <CAJ4jsacVyYjMJXaQ=AzWKV+wxT5kh_MswyvaP5KUmmKpngjouQ@mail.gmail.com>
References: <CAJ4jsacVyYjMJXaQ=AzWKV+wxT5kh_MswyvaP5KUmmKpngjouQ@mail.gmail.com>
Message-ID: <20150312112559.627104ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos A. M. dos Santos,

On Wed, 11 Mar 2015 22:49:48 -0300, Carlos A. M. dos Santos wrote:
> Hello,
> 
> I'm facing some errors trying to build kodi using the buildroot
> (commit a4788aa6157d1496cdd32cb9802710d4e97bc550)
> 
> The first problem is that kodi requires "libjpeg" to build, not
> "jpeg". I solved the problem applying the following patch:
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 1bc8b15..f6e95e2 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -42,7 +42,7 @@ menuconfig BR2_PACKAGE_KODI
>      select BR2_PACKAGE_FONTCONFIG
>      select BR2_PACKAGE_FREETYPE
>      select BR2_PACKAGE_JASPER
> -    select BR2_PACKAGE_JPEG
> +    select BR2_PACKAGE_LIBJPEG
>      select BR2_PACKAGE_LIBASS
>      select BR2_PACKAGE_LIBCDIO
>      select BR2_PACKAGE_LIBCURL
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index f40fc31..fd6fbfe 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -16,7 +16,7 @@ KODI_INSTALL_STAGING = YES
>  # http://wiki.xbmc.org/index.php?title=TexturePacker
>  KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo \
>      host-nasm host-sdl_image host-swig
> -KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype jasper jpeg \
> +KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype
> jasper libjpeg \
>      libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
>      libogg libplist libpng libsamplerate libungif libvorbis libxml2
> libxslt lzo ncurses \
>      openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib

This change is not correct: selecting BR2_PACKAGE_JPEG and having
'jpeg' in KODI_DEPENDENCIES is the right thing to do. The 'jpeg'
package is a virtual package: it will itself depend on 'libjpeg' or
'jpeg-turbo' depending on the selected jpeg implementation.

Can you be more specific about which problems you have seen in relation
to jpeg support?

> (sorry, the copy/paste converted tabs to spaces)
> 
> The error in build/kodi-14.1-Helix/config.log is
> 
> configure:26554: checking for main in -lSDL_image
> configure:26573:
> /work/br-master-glibc/host/usr/bin/i686-buildroot-linux-gnu-gcc -o
> conftest -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64   -Os  -fPIC -DPIC -D_REENTRANT
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DNDEBUG=1
> -D_LARGEFILE_SOURCE -D
> /work/br-master-glibc/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/libtag.so:
> undefined reference to `std::__throw_out_of_range_fmt(char const*,
> ...)@GLIBCXX_3.4.20'
> collect2: error: ld returned 1 exit status
> 
> Have anybody seen this before?

It's trying to use the C compiler to link with C++ libraries. Can you
share your Buildroot .config that exhibits the problem ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
