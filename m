From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 10 Nov 2019 09:37:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-serial-test: fix build on
 MIPS
In-Reply-To: <20191109231321.19690-1-fontaine.fabrice@gmail.com>
References: <20191109231321.19690-1-fontaine.fabrice@gmail.com>
Message-ID: <CAGm1_ktusnrVNCo-15_iPyySmLCOxFvL4TvE3sWZWiTNrvomuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Sun, Nov 10, 2019 at 12:12 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fixes:
>  - http://autobuild.buildroot.org/results/86e06fdcaa91dca682651736162e9e743329412c
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Could you also submit a PR upstream?

Thanks.

Regards.
Yegor

> ---
>  ...t.c-fix-missing-CMSPAR-define-on-MIP.patch | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/linux-serial-test/0001-linux-serial-test.c-fix-missing-CMSPAR-define-on-MIP.patch
>
> diff --git a/package/linux-serial-test/0001-linux-serial-test.c-fix-missing-CMSPAR-define-on-MIP.patch b/package/linux-serial-test/0001-linux-serial-test.c-fix-missing-CMSPAR-define-on-MIP.patch
> new file mode 100644
> index 0000000000..fe5a1c6813
> --- /dev/null
> +++ b/package/linux-serial-test/0001-linux-serial-test.c-fix-missing-CMSPAR-define-on-MIP.patch
> @@ -0,0 +1,54 @@
> +From c34767aa22623a21369f1464c52fc4635895223c Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 8 Nov 2019 18:25:35 +0100
> +Subject: [PATCH] linux-serial-test.c: fix missing CMSPAR define on MIPS
> +
> +This patch is an adaptation of
> +https://git.busybox.net/buildroot/diff/package/freerdp/0003-add-missing-define.patch?id=78cd32631e959e04b1a2f18be7b0757e21482438
> +
> +linux-serial-test.c uses CMSPAR, which is defined by glibc in
> +bits/termios.h.
> +
> +glibc has two flavours of bits/termios.h: a generic one and an
> +architecture-specific one. When installing, glibc will install the
> +architecture-specific file if it exists, otherwise it installs the
> +generic file. Only Alpha, MIPS, PPC and Sparc have their own
> +bits/termios.h.
> +
> +The generic bits/termios.h, as well as the Alpha, PPC and Sparc flavours
> +do define CMSPAR. However, the MIPS flavour does not define it.
> +
> +Define CMSPAR to the value from the generic value, which is also the
> +value known to the Linux kernel for MIPS.
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/1350cc46dcb285772b1a4c90aec6ba38fdb11e3c
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/cbrake/linux-serial-test/pull/20]
> +---
> + linux-serial-test.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/linux-serial-test.c b/linux-serial-test.c
> +index 5e7504e..0d4a919 100644
> +--- a/linux-serial-test.c
> ++++ b/linux-serial-test.c
> +@@ -17,6 +17,14 @@
> + #include <linux/serial.h>
> + #include <errno.h>
> +
> ++/*
> ++ * glibc for MIPS has its own bits/termios.h which does not define
> ++ * CMSPAR, so we vampirise the value from the generic bits/termios.h
> ++ */
> ++#ifndef CMSPAR
> ++#define CMSPAR 010000000000
> ++#endif
> ++
> + // command line args
> + int _cl_baud = 0;
> + char *_cl_port = NULL;
> +--
> +2.23.0
> +
> --
> 2.23.0
>
