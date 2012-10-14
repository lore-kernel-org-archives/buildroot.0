From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 12:04:29 +0200
Subject: [Buildroot] Confused by the <fenv> implementation,
	causing gsl build issues
Message-ID: <20121014120429.52067fdc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

uClibc provides a UCLIBC_HAS_FENV option that can be enabled on any
architecture. As soon as this option is enabled, the <fenv.h> header is
included, which make applications and libraries think that function
such as feenableexcept() or fesetround() are available. However, on
ARM, those function are in fact not implemented by uClibc.

This causes the following build failure when trying to build the gsl
library (version 1.15) against an ARM uClibc toolchain:

../ieee-utils/.libs/libgslieeeutils.a(fp.o): In function `gsl_ieee_set_mode':
fp.c:(.text+0xd4): undefined reference to `fesetround'
fp.c:(.text+0x148): undefined reference to `feenableexcept'
collect2: ld returned 1 exit status

Of course, in one sense, the configure.ac check of gsl to test the
existence of those functions might be considered incorrect (it only
verifies if they are declared, not if it is actually possible to link a
program using those functions), but on the other hand, it sounds
strange for uClibc to install <fenv.h>, exposing certain functions that
are in fact not available.

See the end of
http://autobuild.buildroot.org/results/f1784c53cb595a3573cb98d63868aee36b5d9bb6/build.log.bz2
if you want to see the entire build log of gsl.

Am I misunderstanding something?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
