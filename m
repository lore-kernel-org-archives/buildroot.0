From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 14:42:59 +0200
Subject: [Buildroot] [git commit] syslinux: add missing dependency on
	host-util-linux
In-Reply-To: <20170611133214.C5BBF816C5@busybox.osuosl.org>
References: <20170611133214.C5BBF816C5@busybox.osuosl.org>
Message-ID: <CACXmViYggxbFoQ5rJcKfGd2TYPFX5Y1nLBXXqOcxERrqhEsiZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I don't think this was ever posted on the list?

Committed to 2017.05.x, thanks.

On Sun, Jun 11, 2017 at 3:21 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=
> d98d7d660eb89ec4e179a5bf54b46fe7bbcb127c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> If util-linux is not installed system-wide on the host, the build
> fails with:
>
> /usr/bin/gcc -Wp,-MT,isohybrid.o,-MMD,./.isohybrid.o.d -O2
> -I/home/thomas/projets/buildroot/output/host/usr/include -W -Wall
> -Wstrict-prototypes  -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64
> -I/home/thomas/projets/buildroot/output/build/syslinux-6.03/utils -c -o
> isohybrid.o /home/thomas/projets/buildroot/output/build/
> syslinux-6.03/utils/isohybrid.c
> /home/thomas/projets/buildroot/output/build/syslinux-6.03/utils/isohybrid.c:40:23:
> fatal error: uuid/uuid.h: No such file or directory
>  #include <uuid/uuid.h>
>                        ^
> compilation terminated.
>
> Therefore, this commit adds a dependency on host-util-linux, which
> will ensure that libuuid is available. The resulting isohybrid tool is
> really installed, and linked with libuuid:
>
> $ readelf -d output/host/usr/bin/isohybrid
>
> Dynamic section at offset 0x3e00 contains 26 entries:
>   Tag        Type                         Name/Value
>  0x0000000000000001 (NEEDED)             Shared library: [libuuid.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>  0x000000000000000f (RPATH)              Library rpath:
> [/home/thomas/projets/buildroot/output/host/usr/lib]
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/syslinux/syslinux.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index 2b3b9a7..5a60388 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -13,7 +13,8 @@ SYSLINUX_LICENSE_FILES = COPYING
>
>  SYSLINUX_INSTALL_IMAGES = YES
>
> -SYSLINUX_DEPENDENCIES = host-nasm host-upx util-linux
> +# host-util-linux needed to provide libuuid when building host tools
> +SYSLINUX_DEPENDENCIES = host-nasm host-upx util-linux host-util-linux
>
>  ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
>  SYSLINUX_TARGET += bios
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170719/62e870ea/attachment.html>
