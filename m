From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jul 2014 09:50:53 -0300
Subject: [Buildroot] [PATCH] openssh: disable PIE when building for ARC
In-Reply-To: <1406723541-28499-1-git-send-email-abrodkin@synopsys.com>
References: <1406723541-28499-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <53D8EA2D.50704@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/30/2014 09:32 AM, Alexey Brodkin wrote:

> Fixes build failure reported here:
> http://autobuild.buildroot.net/results/262/26218e028f3d2c77c5192b45154627f08384b688/
> 
> uClibc toolchain for ARC doesn't support PIE
> 
> Attempt to build anything with "-pie" option lead to linker failure:
> 
> arc-buildroot-linux-uclibc-gcc -pie test.c
> ld: ../4.8-r3/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/crt1.o: warning: unresolvable relocation against symbol `__uClibc_main' from .text section
> ld: ../4.8-r3/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o: warning: unresolvable relocation against symbol `__deregister_frame_info@@GCC_3.0' from .text section
> ld: ../4.8-r3/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o: warning: unresolvable relocation against symbol `__deregister_frame_info@@GCC_3.0' from .text section
> ld: ../4.8-r3/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o: warning: unresolvable relocation against symbol `__register_frame_info@@GCC_3.0' from .text section
> ld: ../4.8-r3/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o: warning: unresolvable relocation against symbol `__register_frame_info@@GCC_3.0' from .text section
> 
> In its turn this behavior confuses configure script of openssh so some options
> get set improperly. In particular "strnvis" gets determined as existing which
> causes failure during compilation:
> 
> log.c:67:25: error: 'VIS_SAFE' undeclared (first use in this function)
>  #define LOG_STDERR_VIS (VIS_SAFE|VIS_OCTAL)
> 
> With disabled PIE ("--without-pie") openssh gets built without issues.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
