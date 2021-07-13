From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 13 Jul 2021 06:46:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/kexec-tools: fix build with gcc
 10
In-Reply-To: <20210710092854.1164329-1-fontaine.fabrice@gmail.com>
References: <20210710092854.1164329-1-fontaine.fabrice@gmail.com>
Message-ID: <CAGm1_ktKV2pMG+4Wp71bMM6qt0MD+YrnCZL9RF1Xde0=Kv-TgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 10, 2021 at 11:29 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Build is broken with gcc 10 since bump to version 2.0.22 in commit
> cadb8f2f317bf37c13aea98ac1c81bf8566aad92:
>
> /tmp/instance-1/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: kexec/arch/ppc/kexec-elf-ppc.o:(.sbss+0x0): multiple definition of `ramdisk'; kexec/arch/ppc/kexec-ppc.o:(.sbss+0x0): first defined here
>
> Fixes:
>  - http://autobuild.buildroot.org/results/22932529f925630ec6db3c6a4eaebbda68b3fc16
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  ...move-duplicate-definition-of-ramdisk.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
>
> diff --git a/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch b/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
> new file mode 100644
> index 0000000000..173323bff8
> --- /dev/null
> +++ b/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
> @@ -0,0 +1,32 @@
> +From 5e7ce27626a44428c01e0e5ab3fe60ef98ca788c Mon Sep 17 00:00:00 2001
> +From: Petr Tesarik <ptesarik@suse.cz>
> +Date: Mon, 26 Apr 2021 15:29:51 +0200
> +Subject: kexec-tools: Remove duplicate definition of ramdisk
> +
> +The ramdisk variable is defined in kexec/arch/ppc/kexec-ppc.c. This
> +other definition is not needed and breaks build with -fno-common.
> +
> +Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> +Signed-off-by: Simon Horman <horms@verge.net.au>
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=5e7ce27626a44428c01e0e5ab3fe60ef98ca788c]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + kexec/arch/ppc/kexec-elf-ppc.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/kexec/arch/ppc/kexec-elf-ppc.c b/kexec/arch/ppc/kexec-elf-ppc.c
> +index ad43ad1..4a4886e 100644
> +--- a/kexec/arch/ppc/kexec-elf-ppc.c
> ++++ b/kexec/arch/ppc/kexec-elf-ppc.c
> +@@ -33,7 +33,6 @@
> + static const int probe_debug = 0;
> +
> + unsigned char reuse_initrd;
> +-const char *ramdisk;
> + int create_flatten_tree(struct kexec_info *, unsigned char **, unsigned long *,
> +                       char *);
> +
> +--
> +cgit 1.2.3-1.el7
> +
> --
> 2.30.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
