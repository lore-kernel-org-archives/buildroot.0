From: Grant Likely <grant.likely@secretlab.ca>
Date: Fri, 31 Oct 2008 13:21:25 -0600
Subject: [Buildroot] External toolchain support improvements
In-Reply-To: <20081030094501.66983ff9@surf>
References: <20081030094501.66983ff9@surf>
Message-ID: <fa686aa40810311221i2982bacfsd7a4f8a4f13c73a4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 30, 2008 at 2:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Improve external toolchain support
>
>  * Do not put kernel-headers in the dependencies of BASE_TARGETS in
>   the case where BR2_TOOLCHAIN_SOURCE is not y. The kernel headers
>   are already supposed to be part of the external toolchain, so
>   there's no need to download, extract and install them.
>
>  * In the configuration system, don't display the kernel headers
>   version selection list when an external toolchain is selected. This
>   is implemented by moving the source
>   "toolchain/kernel-headers/Config.in" inside the if
>   BR2_TOOLCHAIN_SOURCE in toolchain/Config.in.2.
>
>  * Change the description and help message of the BR2_LARGEFILE,
>   BR2_INET_IPV6, BR2_INET_RPC, and BR2_SOFT_FLOAT option in
>   toolchain/external-toolchain/Config.in. In the case of an external
>   toolchain, the semantic of these options is not to enable large
>   file support, IPV6 or RPC (since the toolchain is already compiled,
>   it has been decided previously). Their semantic is to let Buildroot
>   know about the characteristics of the external toolchain being
>   used.
>
>   As an improvement, we could guess these values automatically:
>
>    - for BR2_LARGEFILE, look at the value of __UCLIBC_HAS_LFS__ in
>      bits/uClibc_config.h in the libc headers directory.
>
>    - for BR2_INET_RPC, look at the value of __UCLIBC_HAS_RPC__ in the
>      same file
>
>    - for BR2_INET_IPV6, look at the value of __UCLIBC_HAS_IPV6__ in
>      the same file
>
>    - for BR2_SOFT_FLOAT, look at the output of $(CC) -v 2>&1 | grep
>      -- "--with-float=soft"
>
>   But I'm not sure how this would be possible, since these values are
>   used at configuration-time by other configuration options, not only
>   at build time.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
>  Makefile                               |    2 +-
>  toolchain/Config.in.2                  |    3 +--
>  toolchain/external-toolchain/Config.in |   23 ++++++++++-------------
>  3 files changed, 12 insertions(+), 16 deletions(-)
>
> Index: buildroot/Makefile
> ===================================================================
> --- buildroot.orig/Makefile
> +++ buildroot/Makefile
> @@ -202,7 +202,7 @@
>  ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
>  BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
>  else
> -BASE_TARGETS:=uclibc kernel-headers
> +BASE_TARGETS:=uclibc
>  endif
>  TARGETS:=
>
> Index: buildroot/toolchain/Config.in.2
> ===================================================================
> --- buildroot.orig/toolchain/Config.in.2
> +++ buildroot/toolchain/Config.in.2
> @@ -1,8 +1,7 @@
>  #
>
> -source "toolchain/kernel-headers/Config.in"
> -
>  if BR2_TOOLCHAIN_SOURCE
> +source "toolchain/kernel-headers/Config.in"
>  source "toolchain/uClibc/Config.in"
>  source "toolchain/binutils/Config.in"
>  source "toolchain/gcc/Config.in"
> Index: buildroot/toolchain/external-toolchain/Config.in
> ===================================================================
> --- buildroot.orig/toolchain/external-toolchain/Config.in
> +++ buildroot/toolchain/external-toolchain/Config.in
> @@ -69,32 +69,29 @@
>  endchoice
>
>  config BR2_LARGEFILE
> -       bool "Enable large file (files > 2 GB) support?"
> +       bool "Toolchain supports large files (> 2 GB) ?"
>        depends on !BR2_cris
>        default y
>        help
> -         Enable large file (files > 2 GB) support
> +         Set this option if the external toolchain supports large
> +         files (> 2 GB)
> +
>
>  config BR2_INET_IPV6
> -       bool "Enable IPv6"
> +       bool "Toolchain supports IPv6 ?"
>        help
> -           Enable IPv6.
> +         Set this option if the external toolchain supports IPv6.
>
>  config BR2_INET_RPC
> -       bool "Enable RPC"
> +       bool "Toolchain supports RPC ?"
>        help
> -           Enable RPC. RPC support is needed for nfs.
> +         Set this option if the external toolchain supports RPC.
>
>  config BR2_SOFT_FLOAT
> -       bool "Use software floating point by default"
> +       bool "Toolchain supports soft float ?"
>        depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_powerpc
>        help
> -         If your target CPU does not have a Floating Point Unit (FPU) or a
> -         kernel FPU emulator, but you still wish to support floating point
> -         functions, then everything will need to be compiled with soft
> -         floating point support (-msoft-float).
> -
> -         Most people will answer N.
> +         Set this option if the external toolchain supports soft float.
>
>  config BR2_TARGET_OPTIMIZATION
>        string "Target Optimizations"
>
>
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>



-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
