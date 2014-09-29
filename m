From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 29 Sep 2014 17:16:16 +0000
Subject: [Buildroot] two stage gcc build with uclibc and DODEBUG enabled
Message-ID: <1412010975.31269.13.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

It looks like two stage gcc build doesn't work well with uClibc if it is
configured with "DODEBUG=y".

Probably you don't see problems because most of arches in Buildroot
still use uClibc 0.9.32.x instead of sources from master branch (and
there's a reason for it - most probably uClibc won't be built at all if
one attempts to select "use uClibc daily snapshot").

But at least for ARC we're pretty close to upstream master branch
(difference is very minor).

So the thing is this commit
http://git.uclibc.org/uClibc/commit/Rules.mak?id=8d31a6e50db423b89082b64a3250eec1b94a7456 introduces linkage of "libgcc_eh.a" into libuClibc.

And that's how building fails for ARC:
=========
  LD ld-uClibc-0.9.34-git.so
arc-buildroot-linux-uclibc-gcc: error: libgcc_eh.a: No such file or
directory
make[2]: *** [lib/ld-uClibc.so] Error 1
make[1]: *** [.../build/uclibc-arc-mainline-dev/.stamp_built] Error 2
make: *** [_all] Error 2
=========

This is obviously because "libgcc_eh.a" is built on gcc's second stage
(use another build tree for ARM that was successfully built due to
0.9.32.x uClibc):
=========
$ cd br2_output/arm-test-debug/build
$ find . -name libgcc_eh.a
./host-gcc-final-4.8.3/build/gcc/libgcc_eh.a
./host-gcc-final-4.8.3/build/arm-buildroot-linux-uclibcgnueabi/libgcc/libgcc_eh.a
=========

At this point I see 2 probable solutions:
1. Make sure uClibc is configured without DODEBUG on toolchain building
with invocation of uClibc's "second stage building" with "DODEBUG" when
"libgcc_eh.a" is already there.

2. Modify uClibc, but I'm not sure if this is a good move, looks like
the commit in question was made on purpose.

Any thoughts on this?

-Alexey
