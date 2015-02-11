From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 11 Feb 2015 20:00:33 +0100
Subject: [Buildroot] [PATCH v1] qt5base: disable gold linker
In-Reply-To: <20150211153232.2dcd2b32@free-electrons.com>
References: <1423637231-4145-1-git-send-email-ps.report@gmx.net>
 <20150211153232.2dcd2b32@free-electrons.com>
Message-ID: <ED36A5D7725743CF92375A6BCED9A0A7@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


-----Oorspronkelijk bericht-----
Van: buildroot [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: woensdag 11 februari 2015 15:33
Aan: Peter Seiderer
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH v1] qt5base: disable gold linker

Dear Peter Seiderer,

On Wed, 11 Feb 2015 07:47:11 +0100, Peter Seiderer wrote:
> Fixes [1],[2]:
> powerpc-ctng_e500v2-linux-gnuspe-g++: error: unrecognized command line option '-fuse-ld=gold'
> Makefile:1192: recipe for target '../../lib/libQt5Core.so.5.4.0' 
> failed

The Qt configure script has some logic to detect whether the compiler supports -fuse-ld=gold or not. Do you know why this logic is
not properly working, and not detecting that this specific compiler doesn't support this?

Disabling unconditionally this feature is maybe OK, but I'd like to understand why the configure script logic to auto-detect this is
not working.

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

------------------------------------------------------------------------------------------------------------------------------------
----


Dear Thomas

There was something similar in qt 4.7
Testing for /usr/ld.gold  ...

From :
https://lists.fedoraproject.org/pipermail/scm-commits/2012-January/725442.html


snip
 contains(JAVASCRIPTCORE_JIT,no): DEFINES+=ENABLE_JIT=0
+ 
+-linux-g++ {
+-isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
+-    message(Using gold linker)
+-    QMAKE_LFLAGS+=-fuse-ld=gold
+-}
+-}
++#linux-g++ {
++#isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
++#    message(Using gold linker)
++#    QMAKE_LFLAGS+=-fuse-ld=gold
++#}
++#}
snip





-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150211/c05c606c/attachment.bin>
