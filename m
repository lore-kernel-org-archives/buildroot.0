From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 22:07:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/zeromq: disable libbsd on
 static build
In-Reply-To: <20210130133201.2334604-1-fontaine.fabrice@gmail.com>
References: <20210130133201.2334604-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131220717.0d6d896d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2021 14:32:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Static linking with libbsd fails because of multiple definition of the
> strlcpy symbol. uClibc optionally provides these symbols.
> 
> So disable libbsd on zeromq when linking statically to avoid the
> following build failure with bitcoin and zeromq:
> 
>   CXXLD    bitcoind
> /tmp/instance-1/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /tmp/instance-1/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib//libc.a(strlcpy.os): in function `__GI_strlcpy':
> strlcpy.c:(.text+0x0): multiple definition of `strlcpy'; /tmp/instance-1/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libbsd.a(strlcpy.o):strlcpy.c:(.text+0x0): first defined here
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ba87544d42ad5e77a27a7a504bc6336a06f6e291
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

We already fixed something similar for stress-ng in commit
f2d6c5ff9092aa7735c7a739d15180910ae734df. So I'm wondering if we don't
need a more general solution to this.

Indeed, libbsd seems to define its symbols regardless of what the C
library provides, so obviously this is always going to cause multiple
definitions build failures.

So should libbsd only define functions if not provided by the C library
? Or should libbsd be made "depends on !BR2_STATIC_LIBS" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
