From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 10:34:50 +0200
Subject: [Buildroot] two stage gcc build with uclibc and DODEBUG enabled
In-Reply-To: <1412010975.31269.13.camel@abrodkin-8560l.internal.synopsys.com>
References: <1412010975.31269.13.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20140930103450.60039294@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 29 Sep 2014 17:16:16 +0000, Alexey Brodkin wrote:

> It looks like two stage gcc build doesn't work well with uClibc if it is
> configured with "DODEBUG=y".
> 
> Probably you don't see problems because most of arches in Buildroot
> still use uClibc 0.9.32.x instead of sources from master branch (and
> there's a reason for it - most probably uClibc won't be built at all if
> one attempts to select "use uClibc daily snapshot").
> 
> But at least for ARC we're pretty close to upstream master branch
> (difference is very minor).
> 
> So the thing is this commit
> http://git.uclibc.org/uClibc/commit/Rules.mak?id=8d31a6e50db423b89082b64a3250eec1b94a7456 introduces linkage of "libgcc_eh.a" into libuClibc.
> 
> And that's how building fails for ARC:
> =========
>   LD ld-uClibc-0.9.34-git.so
> arc-buildroot-linux-uclibc-gcc: error: libgcc_eh.a: No such file or
> directory
> make[2]: *** [lib/ld-uClibc.so] Error 1
> make[1]: *** [.../build/uclibc-arc-mainline-dev/.stamp_built] Error 2
> make: *** [_all] Error 2
> =========

Thanks for the report, and the very good initial investigation!

Unfortunately, I believe that uClibc is wrong here.

First, libgcc_eh.a is indeed only built when --enable-shared is passed
to gcc, which is only possible for the second pass gcc, not for the
first pass.

And more importantly, glibc has some very clear comment (see the main
Makeconfig file) that states:

# How to link against libgcc.  Some libgcc functions, such as those
# for "long long" arithmetic or software floating point, can always be
# built without use of C library headers and do not have any global
# state so can safely be linked statically into any executable or
# shared library requiring them; these functions are in libgcc.a.
# Other functions, relating to exception handling, may require C
# library headers to build and it may not be safe to have more than
# one copy of them in a process; these functions are only in
# libgcc_s.so and libgcc_eh.a.
#
# To avoid circular dependencies when bootstrapping, it is desirable
# to avoid use of libgcc_s and libgcc_eh in building glibc.  Where any
# glibc functionality (in particular, thread cancellation) requires
# exception handling, this is implemented through dlopen of libgcc_s
# to avoid unnecessary dependencies on libgcc_s by programs not using
# that functionality; executables built with glibc do not use
# exception handling other than through thread cancellation.
#
# Undefined references to functions from libgcc_eh or libgcc_s may
# arise for code built with -fexceptions.  In the case of statically
# linked programs installed by glibc, unwinding will never actually
# occur at runtime and the use of elf/static-stubs.c to resolve these
# references is safe.  In the case of statically linked test programs
# and test programs built with -fexceptions, unwinding may occur in
# some cases and it is preferable to link with libgcc_eh or libgcc_s
# so that the testing is as similar as possible to how programs will
# be built with the installed glibc.

And then glibc has its own implementation of Unwind_Resume(), which
according to the commit you pointed at, is the reason why uClibc is now
linked against libgcc_eh.a.

So, I believe this should rather be reported as bug to the uClibc
developers. I can take care of it if you want.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
