From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Oct 2015 21:37:50 +0200
Subject: [Buildroot] [PATCH 1/1] Add more options to eudev package.
In-Reply-To: <CAOcYpt3=T60_0NWWaCPsidFOC_vcZrCcGv5s9VH+AHJnb0ckjw@mail.gmail.com>
References: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
 <20151020203326.GA31310@free.fr>
 <CAOcYpt1nwhHC7d_rpG3G5J+u8z8FaXykSntgp85NBQ1ziCy7ww@mail.gmail.com>
 <CAOcYpt3=T60_0NWWaCPsidFOC_vcZrCcGv5s9VH+AHJnb0ckjw@mail.gmail.com>
Message-ID: <5627E98E.5070106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-10-15 13:42, David Kosir wrote:
>>From aac359a0f280476ba9654e995dd4fd5565ffc22f Mon Sep 17 00:00:00 2001
> From: David Kosir <david.kosir@bylapis.com>
> Date: Wed, 21 Oct 2015 12:06:58 +0200
> Subject: [PATCH 1/1] Don't force kmod with eudev package

 Hi David,

 This patch looks good, but was not sent properly and did not appear in our
patch tracking system. Can you resubmit properly, using git send-email?

 Groeten,
 Arnout

> 
> Signed-off-by: David Kosir <david.kosir@bylapis.com>
> ---
>  package/eudev/Config.in |  1 -
>  package/eudev/eudev.mk  | 12 +++++++++---
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/package/eudev/Config.in b/package/eudev/Config.in
> index 76df409..10f24c0 100644
> --- a/package/eudev/Config.in
> +++ b/package/eudev/Config.in
> @@ -7,7 +7,6 @@ config BR2_PACKAGE_EUDEV
>      select BR2_PACKAGE_HAS_UDEV
>      select BR2_PACKAGE_UTIL_LINUX
>      select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> -    select BR2_PACKAGE_KMOD
>      help
>        Userspace device daemon. This is a standalone version,
>        independent of systemd. It is a fork maintained by Gentoo.
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index a005f45..455ce25 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -24,12 +24,18 @@ EUDEV_CONF_OPTS =        \
>      --sbindir=/sbin        \
>      --libexecdir=/lib    \
>      --with-firmware-path=/lib/firmware    \
> -    --disable-introspection            \
> -    --enable-libkmod
> +    --disable-introspection
> 
> -EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
> +EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux
>  EUDEV_PROVIDES = udev
> 
> +ifeq ($(BR2_PACKAGE_KMOD),y)
> +EUDEV_DEPENDENCIES += kmod
> +EUDEV_CONF_OPTS += --enable-libkmod
> +else
> +EUDEV_CONF_OPTS += --disable-libkmod
> +endif
> +
>  ifeq ($(BR2_ROOTFS_MERGED_USR),)
>  EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
