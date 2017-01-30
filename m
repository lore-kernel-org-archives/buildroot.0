From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 30 Jan 2017 05:19:46 +0100
Subject: [Buildroot] [PATCH] ruby: bump version to 2.4.0
In-Reply-To: <r94vldxsb4.ln2@ID-313208.user.individual.net>
References: <20170109171403.57632-1-Vincent.Riera@imgtec.com>
 <871sw7asxn.fsf@dell.be.48ers.dk> <87lgu24xdi.fsf@dell.be.48ers.dk>
 <r94vldxsb4.ln2@ID-313208.user.individual.net>
Message-ID: <20170130041946.GJ11210@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Bernd Kuhls wrote,

> Am Sun, 22 Jan 2017 22:07:21 +0100 schrieb Peter Korsgaard:
> 
> > This seems to cause a number of build issues. Care to take a look?
> > 
> > http://autobuild.buildroot.net/?reason=ruby-2.4.0
> 
> Hi,
> 
> apparantly configure has problems detecting math functions of uClibc:

Because configure checks for functions, but isfinite, isinf and isnan
are implemented as macros. For Dragonfly they explicitely set
isinf/isnan as available:
https://github.com/ruby/ruby/blob/trunk/configure.in#L1278

Shouldn't this be reported upstream?
I think this is an autotool detection bug.
 
> m68k-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
> D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
> D_FILE_OFFSET_BITS=64  conftest.c -lgmp -ldl -lcrypt -lm  >&5
> conftest.c:238:6: warning: conflicting types for built-in function 
> 'finite'
>  char finite ();
>       ^
> /tmp/ccip45ij.o: In function `main':
> conftest.c:(.text.startup+0x6): undefined reference to `finite'
> collect2: error: ld returned 1 exit status
> 
> although uClibc supports these functions.

finite seems obsoleted and isfinite should be used. 

It appears musl implements finite as function for backward compatibility.
Therefore the check does not fail for musl toolchains.
https://git.musl-libc.org/cgit/musl/tree/src/math/finite.c

For glibc the check fails and the replacement functions for
finite, isinf and isnan are used.

For uclibc-ng the check fails, but the replacement functions cannot
be used, because finite is already defined as macro for backward
compatibility. (added a while ago for inetd..)

> Hacking ruby.mk like this
> 
> RUBY_CONF_ENV += \
>        ac_cv_func_finite=yes \
>        ac_cv_func_isinf=yes \
>        ac_cv_func_isnan=yes
> endif

I think this is the best thing todo inside buildroot.

I think ruby's configure script should detect isfinite (function or macro) and
only fallback trying to detect finite otherwise.
 
best regards
 Waldemar
