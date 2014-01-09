From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 21:28:49 +0100
Subject: [Buildroot] [PATCH 2/5] toolchain/external: fix wrapper by not
	passing conflicting flags
In-Reply-To: <5d0fbb9b1f4439750dde9bb7788b273ec94a3bd5.1389134731.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 7 Jan 2014 23:46:05 +0100")
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <5d0fbb9b1f4439750dde9bb7788b273ec94a3bd5.1389134731.git.yann.morin.1998@free.fr>
Message-ID: <877ga8c326.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > In our wrapper, we forcibly add the -march=, -mcpu= and-mtune= flags
 > to the actual copmpiler, this in an attempt to always generate correct
 > and optimised code for the target.

 > But in some cases, the caller knows better than we do, and passes its
 > own set, or subset of those flags. In this case, some may conflict with
 > the ones we pass. The most prominent offender being the Linux kernel.

 > For example, on the ARM Rapsberry Pi, the Linux kernel will set the
 > -march=armv6 flag and no -mcpu= flag, but we pass -mcpu=arm1176jzf-s,
 > which conflicts:

 >     drivers/scsi/scsi_trace.c:1:0: warning: switch -mcpu=arm1176jzf-s
 >     conflicts with -march=armv6 switch

 > (and so for all the files the kernel compiles, pretty messy)
 > (note: arm1176jzf-s is not an armv6, it is an armv6zk. Yeah...)

 > To avoid this situation, we scan our commandline for any occurence of
 > the possibly conflicting flags. If none is found, then we add our owns.
 > If any is found, then we don't add any of our owns.

 > The idea behind this is that we trust the caller to know better than
 > we do what it is doing. Since the biggest, and sole so far, offender
 > is the Linux kernel, then this is a rather safe bet.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
