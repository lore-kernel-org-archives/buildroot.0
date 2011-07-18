From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Jul 2011 12:06:23 +0200
Subject: [Buildroot] ARM OABI build broken with current buildroot tip
In-Reply-To: <4E22BFA1.7080800@fiddes.net> (David J. Fiddes's message of "Sun, 
 17 Jul 2011 11:55:29 +0100")
References: <4E22BFA1.7080800@fiddes.net>
Message-ID: <87fwm37vj4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David J Fiddes <D.J@fiddes.net> writes:

 David> Hi,
 David> I'm trying to build an up to date ARM OABI toolchain with uClibc
 David> 0.9.32. The build fails with a missing stack unwind symobl.

 David> The toolchain I'm trying to configure is pretty straight forward. From
 David> a "make distclean" I configure:
 David>  - ARM processor
 David>  - OABI
 David>  - Disable busybox and filesystem image generation

 David> Switching uClibc to 0.9.31 allows the build to succeed.

The problem is NPTL threading support. A quick look in
libpthread/nptl/sysdeps/arm shows a number of EABI references. It seems
like NPTL on ARM is only supported with EABI.

And indeed, OABI / uClibc 0.9.32  / linuxthreads-old builds fine.

I'll adjust Buildroot so you cannot select NTPL together with OABI.

 David> It seems like this is a uClibc bug but I'm not sure how best to
 David> separate the toolchain build form the uClibc build.

It looks pretty independent of anything Buildroot related. You are
welcome to ask them regarding non-EABI NPTL support, but I would imagine
that such an uncommon configuration has fairly low priority.

May I ask why you want to use a new C library / NPTL together with the
obsolete OABI?

-- 
Bye, Peter Korsgaard
