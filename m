From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Mar 2013 10:13:46 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-03-19
In-Reply-To: <CAH+T41aiFXadTx4tjzwUZwTVbm=+oCVWQGUO7U_p=AvA2WqLxw@mail.gmail.com>
 (Dan Price's message of "Wed, 20 Mar 2013 01:48:57 -0700")
References: <20130320073506.B07DA428501@lolut.humanoidz.org>
 <CAH+T41aiFXadTx4tjzwUZwTVbm=+oCVWQGUO7U_p=AvA2WqLxw@mail.gmail.com>
Message-ID: <871ubasab9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dan" == Dan Price <dp@dssd.com> writes:

Hi,

 Dan> I would really like to fix this, but I am at a loss as to the root
 Dan> cause, at least in my first pass at this.? The guard in the redis
 Dan> code is:

 Dan> /* Test for backtrace() */
 Dan> #if (defined(__APPLE__) || defined(__linux__) || defined(__sun)) && !defined
 Dan> (__UCLIBC__)
 Dan> #define HAVE_BACKTRACE 1
 Dan> #endif

 Dan> So this should automatically turn this off when uclibc is used.?
 Dan> The only thing I can think of is that the toolchain isn't defining
 Dan> __UCLIBC__?? Or isn't actually a uclibc toolchain?? Or someone
 Dan> else is defining HAVE_BACKTRACE?

 Dan> I note from http://git.buildroot.net/buildroot/plain/package/connman/
 Dan> connman-uclibc-backtrace.patch that the guard in redis could be improved to:? !
 Dan> (defined(__UCLIBC__) && !defined (__UCLIBC_HAS_BACKTRACE__)).? I'll try to
 Dan> advocate for that.

It does indeed look odd. __UCLIBC__ (like the name says) comes from the
C library, so you need to include <features.h>, but your patch does
that, and __unix is defined:

./usr/bin/arm-linux-gcc -dM -E - </dev/null | grep unix
#define __unix__ 1
#define unix 1
#define __unix 1

./usr/bin/arm-linux-gcc -dM -E - </dev/null | grep __UCLIBC__

./usr/bin/arm-linux-gcc -dM -E -include features.h - </dev/null | grep __UCLIBC__
#define __UCLIBC__ 1

The easiest way to debug it is probably to add a few #error lines at
strategic places.

-- 
Bye, Peter Korsgaard
