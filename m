From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 12 Dec 2009 03:22:30 +0100
Subject: [Buildroot] [PATCH 5/6] package: Added libdvdnav package
 (dependency of gst-plugins-bad)
In-Reply-To: <87ws0ttbau.fsf@macbook.be.48ers.dk>
References: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
	<1260487878-21126-6-git-send-email-llandwerlin@gmail.com>
	<87ws0ttbau.fsf@macbook.be.48ers.dk>
Message-ID: <1260584550.9059.18.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le vendredi 11 d?cembre 2009 ? 23:07 +0100, Peter Korsgaard a ?crit :
> >>>>> "Lionel" == llandwerlin  <llandwerlin@gmail.com> writes:
> 
>  Lionel> From: Lionel Landwerlin <llandwerlin@gmail.com>
>  Lionel> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Hmm, this seems pretty broken - Does it really build for you?
> First of all, there's no configure script in the tarball. There is a
> configure2 script, and adding a symlink gets us to the build step where
> it dies trying to find the libdvdread headers:
> 
> make[1]: Entering directory `/tmp/br/build/libdvdnav-4.1.3'
> sh "/tmp/br/build/libdvdnav-4.1.3"/version.sh "/tmp/br/build/libdvdnav-4.1.3" "4.1.3"
> cd obj && gcc -fPIC -DPIC -MD -O3  -g -Wall -funsigned-char -I/tmp/br/build/libdvdnav-4.1.3 -I"/tmp/br/build/libdvdnav-4.1.3"/src -I"/tmp/br/build/libdvdnav-4.1.3"/src/vm -DDVDNAV_COMPILE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H -DHAVE_DLFCN_H  -c -o dvdnav.so /tmp/br/build/libdvdnav-4.1.3/src/dvdnav.c
> /tmp/br/build/libdvdnav-4.1.3/src/dvdnav.c:40:32: error: dvdread/dvd_reader.h: No such file or directory
> 
> Also notice that it uses the host compiler.

Arg...

I'm sorry, I removed the AUTORECONF option...
I used to set autoreconf & libtool patching by default on almost every
package I compiled otherwise it broke compilation with my cross sh4
toolchain.

When rebasing my patchs I removed them all, forgetting this was usefull
for libdvdread & libdvdnav packages...

Please find a corrected patch as attachment.

> 
>  Lionel> +config BR2_PACKAGE_LIBDVDNAV
>  Lionel> +	bool "libdvdnav"
>  Lionel> +        select BR2_PACKAGE_LIBDVDREAD
>  Lionel> +	help
>  Lionel> +	  libdvdnav is a library that allows easy use of sophisticated
>  Lionel> +	  DVD navigation features such as DVD menus, multiangle
>  Lionel> +	  playback and even interactive DVD games.
>  Lionel> +
>  Lionel> +          http://www.mplayerhq.hu
> 
> Indentation is off here.
> 
>  Lionel> +++ b/package/multimedia/libdvdnav/libdvdnav.mk
>  Lionel> @@ -0,0 +1,19 @@
>  Lionel> +#############################################################
>  Lionel> +#
>  Lionel> +# libdvdnav
>  Lionel> +#
>  Lionel> +#############################################################
>  Lionel> +
>  Lionel> +LIBDVDNAV_VERSION = 4.1.3
>  Lionel> +LIBDVDNAV_SOURCE = libdvdnav_$(LIBDVDNAV_VERSION).orig.tar.gz
>  Lionel> +LIBDVDNAV_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libd/libdvdnav/
> 
> The official upstream location is afaik
> http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
> 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-package-Added-libdvdnav-package-dependency-of-gst-pl.patch
Type: text/x-patch
Size: 2690 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091212/498f4815/attachment.bin>
