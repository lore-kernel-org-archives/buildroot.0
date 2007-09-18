From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 18 Sep 2007 11:17:24 +0200
Subject: [Buildroot] Lack of MPFR seems to break build
Message-ID: <1190107044.4064.28.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Whgen building the AVR32 toolset I get a failure
configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
make[2]: *** [configure-target-libstdc++-v3] Fel 1
make[1]: *** [all] Fel 2


Not 100% sure, but I think that if MPFR is not installed 
on the host system, then the GCC-4.1.2 build fails to complete.
It is *not* enough to build the mpfr in toolchain_build_dir
Would be surprised if this was not the case for other gcc versions as
well.


Here is part of the config.log from gcc-4.1.2-final

configure:2320: /usr/bin/gcc  -o conftest -g -O2    conftest.c  -lmpfr
-lgmp 1>&5
configure:2314:18: error: mpfr.h: No such file or directory
configure: In function 'main':
configure:2316: error: 'mpfr_t' undeclared (first use in this function)
configure:2316: error: (Each undeclared identifier is reported only once
configure:2316: error: for each function it appears in.)
configure:2316: error: expected ';' before 'n'
configure:2316: error: 'n' undeclared (first use in this function)
configure: failed program was:
#line 2312 "configure"
#include "confdefs.h"
#include <gmp.h>
#include <mpfr.h>
int main() {
mpfr_t n; mpfr_init(n);
; return 0; }


/usr/include/mpfr.h is not on the host system...


--
If what I suspect is correct, I think dependencies.sh
need to check for MPFR, or GCC needs to use the MPFR
built for the host.

Best Regards
