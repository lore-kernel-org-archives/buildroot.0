From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 10:18:39 +0100
Subject: [Buildroot] [PATCH] ruby: bump version to 2.4.0
In-Reply-To: <20170130041946.GJ11210@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Mon, 30 Jan 2017 05:19:46 +0100")
References: <20170109171403.57632-1-Vincent.Riera@imgtec.com>
 <871sw7asxn.fsf@dell.be.48ers.dk> <87lgu24xdi.fsf@dell.be.48ers.dk>
 <r94vldxsb4.ln2@ID-313208.user.individual.net>
 <20170130041946.GJ11210@waldemar-brodkorb.de>
Message-ID: <87fuk0aosw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

Hi,

 >> apparantly configure has problems detecting math functions of uClibc:

 > Because configure checks for functions, but isfinite, isinf and isnan
 > are implemented as macros. For Dragonfly they explicitely set
 > isinf/isnan as available:
 > https://github.com/ruby/ruby/blob/trunk/configure.in#L1278

 > Shouldn't this be reported upstream?
 > I think this is an autotool detection bug.

 >> although uClibc supports these functions.

 > finite seems obsoleted and isfinite should be used. 

 > It appears musl implements finite as function for backward compatibility.
 > Therefore the check does not fail for musl toolchains.
 > https://git.musl-libc.org/cgit/musl/tree/src/math/finite.c

 > For glibc the check fails and the replacement functions for
 > finite, isinf and isnan are used.

 > For uclibc-ng the check fails, but the replacement functions cannot
 > be used, because finite is already defined as macro for backward
 > compatibility. (added a while ago for inetd..)

Indeed, finite is a function on musl. On my glibc version they are also
(weakly) defined (and configure correctly finds them):

nm -D /lib/x86_64-linux-gnu/libc.so.6|grep -wE 'finite|isinf|isnan'
0000000000032310 W finite
00000000000322a0 W isinf
00000000000322e0 W isnan

I'm not sure what the spec (if any exists) for these legacy BSD
functions say about if the unprefixed symbols really need to be
available, but it is certainly a difference between uClibc-ng and
glibc/musl.

 >> Hacking ruby.mk like this
 >> 
 >> RUBY_CONF_ENV += \
 >> ac_cv_func_finite=yes \
 >> ac_cv_func_isinf=yes \
 >> ac_cv_func_isnan=yes
 >> endif

 > I think this is the best thing todo inside buildroot.

Yes, that might be the way to go. Notice that musl implements isinf /
isnan as macros, so the detection fails. The reason why it doesn't cause
linker errors is that include/ruby/missing.h checks if isnan is a macro
before providing a local declaration:

#ifndef isnan
# ifndef HAVE_ISNAN
RUBY_EXTERN int isnan(double);
# endif
#endif

vs:

#ifndef HAVE_FINITE
RUBY_EXTERN int finite(double);
#endif

So another solution is to add an #ifndef finite around it. That fix
could probably be upstreamed as they already do it for a number of other
functions.

-- 
Bye, Peter Korsgaard
