From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 27 Sep 2007 02:53:26 +0200
Subject: [Buildroot] AVR32  build broken.
Message-ID: <1190854406.4933.78.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The atngw100small also fails with the following error:

configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
make[2]: *** [configure-target-libiberty] Fel 1
make[2]: *** Inv?ntar oavslutade jobb...
make[1]: *** [all] Fel 2

This is the same error you get when you try to build the ARM with
softfloat.
Since the AVR32 does not have an FPU, this is always softfloat.

There is something screwed up with the linking process
when using the current trunk.

Not all libraries are found, so gcc configure
cannot link and this sets some flags resulting in the error above.

The ARM softfloat patch was trying to overcome the fact
that libgcc.a is not used/found by the uClibc build.
It allows uClibc build to complete, but gcc-final
still bombs out on the linking process
because crt1.o is not found.
Then the GCC_NO_EXECUTABLES is set, and 
when tested for this later, the build is terminated.

crt1.o is an x86 thing and should not affect arm or avr32
but it certainly does.

Have tried to find a workaround, but failed so far.

Until a solution is found, the www.ateml.no/buildroot
seems the way to go.
Once a solution is found, then ARM softfloat will probably 
work as well.

Using the external toolchain option would be one alternative.

BR
Ulf Samuelsson
