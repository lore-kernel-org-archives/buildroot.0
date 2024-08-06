Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691F6C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 278AB60885;
	Tue,  6 Aug 2024 22:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxbOLuZwW2MU; Tue,  6 Aug 2024 22:46:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1265A60888
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1265A60888;
	Tue,  6 Aug 2024 22:46:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 534A01BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4052580CB7
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zsDHSYlXaRu for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14E2180E42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14E2180E42
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:46:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 018978438E; Tue,  6 Aug 2024 22:46:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 00:41:48 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4fa204ab1106f421f436420aaf19b2d80d9b42e4
X-Git-Newrev: 295e166502809202a8d6c4459de8c816b28b7777
X-Patchwork-Hint: ignore
Message-Id: <20240806224615.018978438E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pppd: add patch
 fixing build issue on SPARC/SPARC64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1511503521934968417=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1511503521934968417==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=295e166502809202a8d6c4459de8c816b28b7777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Integrate a patch, which was submitted upstream, to work-around an
issue with the SPARC kernel headers. The kernel headers have been
fixed in the upstream kernel (in the to-be-released 6.10 kernel), but
we need a workaround for the older toolchains, until we believe 6.10
is "old" enough to be able to drop the workaround.

Fixes:

  http://autobuild.buildroot.net/results/272c464ed4f9392535fa3b7613218dbd03acf901/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b162aab7c6da6b45dc5ba9ad30b59b4362e2dc2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ppd-workaround-sparc-asm-termbits.h-issue.patch | 316 +++++++++++++++++++++
 1 file changed, 316 insertions(+)

diff --git a/package/pppd/0001-pppd-workaround-sparc-asm-termbits.h-issue.patch b/package/pppd/0001-pppd-workaround-sparc-asm-termbits.h-issue.patch
new file mode 100644
index 0000000000..923c047743
--- /dev/null
+++ b/package/pppd/0001-pppd-workaround-sparc-asm-termbits.h-issue.patch
@@ -0,0 +1,316 @@
+From ef37e5b112734f551132b613438788fd4ef8797a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 12 Jul 2024 20:24:22 +0200
+Subject: [PATCH] pppd: workaround sparc <asm/termbits.h> issue
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The SPARC version of the <asm/termbits.h> kernel header has an issue:
+it defines "struct termio", which conflicts with the definition in
+<bits/ioctl-types.h>, causing a build failure in pppd.
+
+This issue was fixed in the upstream Linux kernel in commit
+c32d18e7942d7589b62e301eb426b32623366565 ("sparc: move struct termio
+to asm/termios.h"), which is going to appear in Linux 6.10.
+
+In order to support building with older toolchains, this patch
+includes in the pppd source code a copy of the fixed SPARC
+<asm/termbits.h> in the pppd code base, and uses it if we're on SPARC
+with kernel headers older than 6.10.
+
+Fixes:
+
+In file included from termios_linux.h:39:
+/home/thomas/projets/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/asm/termbits.h:17:8: error: redefinition of ‘struct termio’
+   17 | struct termio {
+      |        ^~~~~~
+  CC       pppd-ipv6cp.o
+In file included from /home/thomas/projets/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/sys/ioctl.h:29,
+                 from sys-linux.c:76:
+/home/thomas/projets/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/bits/ioctl-types.h:36:8: note: originally defined here
+   36 | struct termio
+      |        ^~~~~~
+
+Upstream: https://github.com/ppp-project/ppp/pull/504
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ pppd/sparc-termbits.h | 247 ++++++++++++++++++++++++++++++++++++++++++
+ pppd/termios_linux.h  |   6 +
+ 2 files changed, 253 insertions(+)
+ create mode 100644 pppd/sparc-termbits.h
+
+diff --git a/pppd/sparc-termbits.h b/pppd/sparc-termbits.h
+new file mode 100644
+index 0000000..f92a27a
+--- /dev/null
++++ b/pppd/sparc-termbits.h
+@@ -0,0 +1,247 @@
++/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
++#ifndef _SPARC_TERMBITS_H
++#define _SPARC_TERMBITS_H
++
++#include <linux/posix_types.h>
++
++typedef unsigned char   cc_t;
++typedef unsigned int    speed_t;
++
++#if defined(__sparc__) && defined(__arch64__)
++typedef unsigned int    tcflag_t;
++#else
++typedef unsigned long   tcflag_t;
++#endif
++
++#define NCCS 17
++struct termios {
++	tcflag_t c_iflag;		/* input mode flags */
++	tcflag_t c_oflag;		/* output mode flags */
++	tcflag_t c_cflag;		/* control mode flags */
++	tcflag_t c_lflag;		/* local mode flags */
++	cc_t c_line;			/* line discipline */
++	cc_t c_cc[NCCS];		/* control characters */
++};
++
++struct termios2 {
++	tcflag_t c_iflag;		/* input mode flags */
++	tcflag_t c_oflag;		/* output mode flags */
++	tcflag_t c_cflag;		/* control mode flags */
++	tcflag_t c_lflag;		/* local mode flags */
++	cc_t c_line;			/* line discipline */
++	cc_t c_cc[NCCS+2];		/* control characters */
++	speed_t c_ispeed;		/* input speed */
++	speed_t c_ospeed;		/* output speed */
++};
++
++struct ktermios {
++	tcflag_t c_iflag;		/* input mode flags */
++	tcflag_t c_oflag;		/* output mode flags */
++	tcflag_t c_cflag;		/* control mode flags */
++	tcflag_t c_lflag;		/* local mode flags */
++	cc_t c_line;			/* line discipline */
++	cc_t c_cc[NCCS+2];		/* control characters */
++	speed_t c_ispeed;		/* input speed */
++	speed_t c_ospeed;		/* output speed */
++};
++
++/* c_cc characters */
++#define VINTR    0
++#define VQUIT    1
++#define VERASE   2
++#define VKILL    3
++#define VEOF     4
++#define VEOL     5
++#define VEOL2    6
++#define VSWTC    7
++#define VSTART   8
++#define VSTOP    9
++
++
++
++#define VSUSP    10
++#define VDSUSP   11  /* SunOS POSIX nicety I do believe... */
++#define VREPRINT 12
++#define VDISCARD 13
++#define VWERASE  14
++#define VLNEXT   15
++
++/* Kernel keeps vmin/vtime separated, user apps assume vmin/vtime is
++ * shared with eof/eol
++ */
++#define VMIN     VEOF
++#define VTIME    VEOL
++
++/* c_iflag bits */
++#define IGNBRK	0x00000001
++#define BRKINT	0x00000002
++#define IGNPAR	0x00000004
++#define PARMRK	0x00000008
++#define INPCK	0x00000010
++#define ISTRIP	0x00000020
++#define INLCR	0x00000040
++#define IGNCR	0x00000080
++#define ICRNL	0x00000100
++#define IUCLC	0x00000200
++#define IXON	0x00000400
++#define IXANY	0x00000800
++#define IXOFF	0x00001000
++#define IMAXBEL	0x00002000
++#define IUTF8   0x00004000
++
++/* c_oflag bits */
++#define OPOST	0x00000001
++#define OLCUC	0x00000002
++#define ONLCR	0x00000004
++#define OCRNL	0x00000008
++#define ONOCR	0x00000010
++#define ONLRET	0x00000020
++#define OFILL	0x00000040
++#define OFDEL	0x00000080
++#define NLDLY	0x00000100
++#define   NL0	0x00000000
++#define   NL1	0x00000100
++#define CRDLY	0x00000600
++#define   CR0	0x00000000
++#define   CR1	0x00000200
++#define   CR2	0x00000400
++#define   CR3	0x00000600
++#define TABDLY	0x00001800
++#define   TAB0	0x00000000
++#define   TAB1	0x00000800
++#define   TAB2	0x00001000
++#define   TAB3	0x00001800
++#define   XTABS	0x00001800
++#define BSDLY	0x00002000
++#define   BS0	0x00000000
++#define   BS1	0x00002000
++#define VTDLY	0x00004000
++#define   VT0	0x00000000
++#define   VT1	0x00004000
++#define FFDLY	0x00008000
++#define   FF0	0x00000000
++#define   FF1	0x00008000
++#define PAGEOUT 0x00010000  /* SUNOS specific */
++#define WRAP    0x00020000  /* SUNOS specific */
++
++/* c_cflag bit meaning */
++#define CBAUD	  0x0000100f
++#define  B0	  0x00000000   /* hang up */
++#define  B50	  0x00000001
++#define  B75	  0x00000002
++#define  B110	  0x00000003
++#define  B134	  0x00000004
++#define  B150	  0x00000005
++#define  B200	  0x00000006
++#define  B300	  0x00000007
++#define  B600	  0x00000008
++#define  B1200	  0x00000009
++#define  B1800	  0x0000000a
++#define  B2400	  0x0000000b
++#define  B4800	  0x0000000c
++#define  B9600	  0x0000000d
++#define  B19200	  0x0000000e
++#define  B38400	  0x0000000f
++#define EXTA      B19200
++#define EXTB      B38400
++#define  CSIZE    0x00000030
++#define   CS5	  0x00000000
++#define   CS6	  0x00000010
++#define   CS7	  0x00000020
++#define   CS8	  0x00000030
++#define CSTOPB	  0x00000040
++#define CREAD	  0x00000080
++#define PARENB	  0x00000100
++#define PARODD	  0x00000200
++#define HUPCL	  0x00000400
++#define CLOCAL	  0x00000800
++#define CBAUDEX   0x00001000
++/* We'll never see these speeds with the Zilogs, but for completeness... */
++#define  BOTHER   0x00001000
++#define  B57600   0x00001001
++#define  B115200  0x00001002
++#define  B230400  0x00001003
++#define  B460800  0x00001004
++/* This is what we can do with the Zilogs. */
++#define  B76800   0x00001005
++/* This is what we can do with the SAB82532. */
++#define  B153600  0x00001006
++#define  B307200  0x00001007
++#define  B614400  0x00001008
++#define  B921600  0x00001009
++/* And these are the rest... */
++#define  B500000  0x0000100a
++#define  B576000  0x0000100b
++#define B1000000  0x0000100c
++#define B1152000  0x0000100d
++#define B1500000  0x0000100e
++#define B2000000  0x0000100f
++/* These have totally bogus values and nobody uses them
++   so far. Later on we'd have to use say 0x10000x and
++   adjust CBAUD constant and drivers accordingly.
++#define B2500000  0x00001010
++#define B3000000  0x00001011
++#define B3500000  0x00001012
++#define B4000000  0x00001013  */
++#define CIBAUD	  0x100f0000  /* input baud rate (not used) */
++#define CMSPAR	  0x40000000  /* mark or space (stick) parity */
++#define CRTSCTS	  0x80000000  /* flow control */
++
++#define IBSHIFT	  16		/* Shift from CBAUD to CIBAUD */
++
++/* c_lflag bits */
++#define ISIG	0x00000001
++#define ICANON	0x00000002
++#define XCASE	0x00000004
++#define ECHO	0x00000008
++#define ECHOE	0x00000010
++#define ECHOK	0x00000020
++#define ECHONL	0x00000040
++#define NOFLSH	0x00000080
++#define TOSTOP	0x00000100
++#define ECHOCTL	0x00000200
++#define ECHOPRT	0x00000400
++#define ECHOKE	0x00000800
++#define DEFECHO 0x00001000  /* SUNOS thing, what is it? */
++#define FLUSHO	0x00002000
++#define PENDIN	0x00004000
++#define IEXTEN	0x00008000
++#define EXTPROC	0x00010000
++
++/* modem lines */
++#define TIOCM_LE	0x001
++#define TIOCM_DTR	0x002
++#define TIOCM_RTS	0x004
++#define TIOCM_ST	0x008
++#define TIOCM_SR	0x010
++#define TIOCM_CTS	0x020
++#define TIOCM_CAR	0x040
++#define TIOCM_RNG	0x080
++#define TIOCM_DSR	0x100
++#define TIOCM_CD	TIOCM_CAR
++#define TIOCM_RI	TIOCM_RNG
++#define TIOCM_OUT1	0x2000
++#define TIOCM_OUT2	0x4000
++#define TIOCM_LOOP	0x8000
++
++/* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
++#define TIOCSER_TEMT    0x01	/* Transmitter physically empty */
++
++
++/* tcflow() and TCXONC use these */
++#define	TCOOFF		0
++#define	TCOON		1
++#define	TCIOFF		2
++#define	TCION		3
++
++/* tcflush() and TCFLSH use these */
++#define	TCIFLUSH	0
++#define	TCOFLUSH	1
++#define	TCIOFLUSH	2
++
++/* tcsetattr uses these */
++#define	TCSANOW		0
++#define	TCSADRAIN	1
++#define	TCSAFLUSH	2
++
++#endif /* _SPARC_TERMBITS_H */
+diff --git a/pppd/termios_linux.h b/pppd/termios_linux.h
+index a234d30..9812017 100644
+--- a/pppd/termios_linux.h
++++ b/pppd/termios_linux.h
+@@ -32,7 +32,13 @@
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+ #include <asm/ioctls.h>
++#include <linux/version.h>
++
++#if defined(__sparc__) && LINUX_VERSION_CODE < KERNEL_VERSION(6,10,0)
++#include "sparc-termbits.h"
++#else
+ #include <asm/termbits.h>
++#endif
+ 
+ #if defined(BOTHER) && defined(TCGETS2)
+ #define termios termios2
+-- 
+2.45.2
+

--===============1511503521934968417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1511503521934968417==--
