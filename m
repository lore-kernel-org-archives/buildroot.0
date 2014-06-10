From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 10 Jun 2014 16:00:23 +0000
Subject: [Buildroot] [PATCH] uclibc: prevent rebuilding after
	installation to staging
In-Reply-To: <1401913653-23804-1-git-send-email-abrodkin@synopsys.com>
References: <1401913653-23804-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1402416022.1656.2.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Thu, 2014-06-05 at 00:27 +0400, Alexey Brodkin wrote:
> Currently we configure uClibc to use kernel headers from "staging" folder with
> KERNEL_HEADERS="$(STAGING_DIR)/usr/include". This path is added to include
> search path of uClibc build system in Rules.mak "CFLAGS += -I$(KERNEL_HEADERS)".
> 
> At the same time on uClibc installation to "staging" we point to the same
> location "$(STAGING_DIR)/usr" (headers effectively go in "usr/include").
> 
> So after every installation to "staging" dependences get touched (even though we
> copy the same headers every time) and so we may see lots of sources in uClibc
> get rebuilt.
> 
> This has 2 consequences:
> 1. Longer build time - becase even on ordinary buildroot build uClibc is built
> twice. On "uclibc building" and on "uclibc installation to target".
> 
> 2. Symbols in libuClibc built initially (that is later installed in
> "staging/sysroot") are situated with different offset compared to second build
> (later copied in "target"). This happens because as described above only part
> of sources get rebuilt and then on final linkage object files are linked in
> different order.
> 
> And (2) leads to problems on remote rebugging: gdbserver reports offsets that
> correspond to pointless assembly in libuClibc on host.
> 
> Here's how it looks like.
> 
> Before this patch:
> $ cd ~/br2_output/i586/target/lib
> $ i586-buildroot-linux-uclibc-readelf -s libuClibc-0.9.33.2.so | grep kill
>    423: 0000c42c    54 FUNC    GLOBAL DEFAULT    7 kill
> 
> $ cd ~/br2_output/i586/staging/lib
> $ i586-buildroot-linux-uclibc-readelf -s libuClibc-0.9.33.2.so | grep kill
>    423: 0000b518    54 FUNC    GLOBAL DEFAULT    7 kill
> 
> After this patch:
> $ cd ~/br2_output/i586/target/lib
> $ i586-buildroot-linux-uclibc-readelf -s libuClibc-0.9.33.2.so | grep kill
>    423: 0000b518    54 FUNC    GLOBAL DEFAULT    7 kill
> 
> $ cd ~/br2_output/i586/staging/lib
> $ i586-buildroot-linux-uclibc-readelf -s libuClibc-0.9.33.2.so | grep kill
>    423: 0000b518    54 FUNC    GLOBAL DEFAULT    7 kill

Any thoughts on this one?

Regards,
Alexey
