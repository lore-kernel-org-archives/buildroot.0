From: =?UTF-8?Q?Micha=C5=82_Kalbarczyk?= <michal@gamecodehq.com>
Date: Fri, 13 Apr 2018 10:16:19 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add dependency on
 elfutils for R600 with LLVM
In-Reply-To: <20180412213200.3553280F77@busybox.osuosl.org>
References: <20180412213200.3553280F77@busybox.osuosl.org>
Message-ID: <CAGbXN6KP1_EoY+q0_y7OrE4kuuEmPOVA=G2BNSn_8NyqxbJtpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Just figured out that you're creating a PR with gallium R600 driver. I'm
trying do the same thing with RADEONSI driver.
Can you add radeonsi driver to your PR, or should I create separate PR for
that ?

thanks for your help
Micha?.


On Thu, Apr 12, 2018 at 11:31 PM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=
> 92fda8761aa8024be53a8edb8c102d1ba6401bce
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Gallium R600 needs libelf when mesa is built with llvm support.
> Because of this, toolchain must use either uClibc or glibc, as
> musl is not currently compatible with elfutils.
>
> This patch solves:
> configure: error: r600 requires libelf when using llvm
>
> Fixes:
>
>   http://autobuild.buildroot.org/results/8845ff0f28d3273ebe884126b85cd7
> c4a905d81b/
>
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/mesa3d/Config.in | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 1476b39acc..bd3d050e29 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -97,13 +97,23 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
>         bool "Gallium Radeon R600 driver"
>         depends on BR2_i386 || BR2_x86_64
> +       depends on !BR2_PACKAGE_MESA3D_LLVM || \
> +               (BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
> +                       BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
>         select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>         select BR2_PACKAGE_LIBDRM_RADEON
>         select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
> +       select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
>         select BR2_PACKAGE_MESA3D_NEEDS_XA
>         help
>           Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
>
> +# R600 needs libelf when Mesa3D is built with LLVM support
> +# musl is not currently compatible with elfutils
> +comment "R600 driver needs a uClibc or glibc toolchain when llvm is
> enabled"
> +       depends on BR2_PACKAGE_MESA3D_LLVM
> +       depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
>         bool "Gallium vmware svga driver"
>         depends on BR2_i386 || BR2_x86_64
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180413/d89ab868/attachment.html>
