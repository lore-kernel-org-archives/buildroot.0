From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 3 Oct 2015 16:25:30 +0200
Subject: [Buildroot] [PATCH] libnfs: Without native RPC use libtirpc
In-Reply-To: <1443882268-9737-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443882268-9737-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAGduivwirG_RD1LfYfgekqfEphCquOr5AG9H2WKB=4Vjv7OFnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

There's a crappy file. Don't do git add with glob at home...

On Sat, Oct 3, 2015 at 4:24 PM, Maxime Hadjinlian <
maxime.hadjinlian@gmail.com> wrote:

> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> RFC: A few packages uses libtirpc if there's no native RPC support *BUT*
> they don't propagate the BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2.
>
> It was probably added later on in libtirpc, so the questions here, is
> what do we do with that ? Should we add the dependencies to the other
> packages ?
> Do we need some kind of mechanisms to handle that ?
> ---
>  package/libnfs/.Config.in.swp | Bin 0 -> 12288 bytes
>  package/libnfs/Config.in      |   8 +++++---
>  package/libnfs/libnfs.mk      |   4 ++++
>  3 files changed, 9 insertions(+), 3 deletions(-)
>  create mode 100644 package/libnfs/.Config.in.swp
>
> diff --git a/package/libnfs/.Config.in.swp b/package/libnfs/.Config.in.swp
> new file mode 100644
> index
> 0000000000000000000000000000000000000000..c737cd335751e1a7082f17205d29e1b6f8eb3318
> GIT binary patch
> literal 12288
> zcmeI&y>8P`6bJBAHX}-_GP2yHQbm!7(|`o(f}AuZR)bsROC69b+qsFa at R#fx!BD|V
> z at DjWO6O23n6DxwJfa4~WAke at F=zpcZY|F>?xxX#S@#`b|vAAEmN4z$P>K`{oed7(i
> zzfBZ-&s8kT8>?3!b5;C7-HZ7P&4V<U#WK-_naR9J&Cm;;n*K~h<2+5ZnenAJm1d;;
> zWKx)|G?}PrO(m<Fz+DJH;BtYPp4@q`PInu7^|ENYS`jz4hL_jl4g??o0SG_<0uX=z
> z1R(I=3FvH%Uh=N4EOvHnaa>zEE-rC^00bZa0SG_<0uX=z1Rwwb2teQ;6!6AGU)PC_
> zu5<JJ|Nq7B|4$o4A2_c$4rh~dmGgz`K6Bo2-f~`X%4Z*PZgRFbSP*~!1Rwwb2tWV=
> z5P$##An;cUi1{K~oEXMfW-=KUB27f)R<qY|2gk?VR>!g(w`29)LFb2(-<S8=)<IvK
> zor#~{<yZrI)OLF(tz8PzxEv1`)%gUtNTlQ@JfYJx3PMjM;+ZLQm`iV5REZ2BLanoX
> z)0`?D&ioobZx&t{`7)m_rpV8$c$!?y3LZJ<33Dk_oJF$yj;B?c)W`^Bl#x-$NCx`6
> z!xO7 at WIbxTUAsB3xig_AqOz)WGK^m`&G)^tv;1`XbkOcOR at ZHI`BR6?I&5`qXL#y1
> p>U)h|V|QCHfmV4I(D%BldMJ6Hkm0k{1z?p$%NhFRO*w~s`UVbg$W#CT
>
> literal 0
> HcmV?d00001
>
> diff --git a/package/libnfs/Config.in b/package/libnfs/Config.in
> index 6642fe4..0081548 100644
> --- a/package/libnfs/Config.in
> +++ b/package/libnfs/Config.in
> @@ -1,10 +1,12 @@
>  config BR2_PACKAGE_LIBNFS
>         bool "libnfs"
> -       depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +       depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || \
> +               (BR2_TOOLCHAIN_HAS_THREADS &&
> !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)# libtirpc
> +       select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
>         help
>           nfs userspace implementation.
>
>           http://github.com/sahlberg/libnfs
>
> -comment "libnfs needs a toolchain w/ RPC"
> -       depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +comment "libnfs needs a toolchain w/ threads"
> +       depends on !(BR2_TOOLCHAIN_HAS_THREADS ||
> BR2_TOOLCHAIN_HAS_NATIVE_RPC)
> diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
> index 0c8c4f5..fb95e21 100644
> --- a/package/libnfs/libnfs.mk
> +++ b/package/libnfs/libnfs.mk
> @@ -13,4 +13,8 @@ LIBNFS_LICENSE = LGPLv2.1+
>  LIBNFS_LICENSE_FILES = LICENCE-LGPL-2.1.txt
>  LIBNFS_DEPENDENCIES = host-pkgconf
>
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +LIBNFS_DEPENDENCIES += libtirpc
> +endif
> +
>  $(eval $(autotools-package))
> --
> 2.5.3
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151003/3a5dcb3c/attachment.html>
