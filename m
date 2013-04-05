From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Apr 2013 14:12:47 +0200
Subject: [Buildroot] Quick analysis of the last build failures
Message-ID: <20130405141247.67149ee7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a quick analysis of the last build failures, so that we discuss
how to solve them. If anyone is interested in taking any of the
following issues and work on it, that would be great.

 * pixman on mips
   http://autobuild.buildroot.org/results/fc6786536d11b8a9f14e550b4033d2a70469985e/build-end.log

   I believe the problem is caused by the fact that the toolchain is
   multilib, and the pixman build process uses ld instead of gcc at the
   link stage. So, the link stage doesn't go through the external
   toolchain wrapper (because we don't wrap ld) and fails because the
   multilib variant used at build time doesn't match the one used at
   link time.

   Solution: use the external toolchain wrapper for ld as well. This
   is part of the work discussed at the last Buildroot meeting
   regarding the external toolchain wrapper. From
   http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013: 

     Flags in external toolchain wrapper. The source of this discussion
     is the Cavium toolchain which requires an additional linker option
     to link correctly. Note that this is only about compile/link flags
     that are strictly needed for compiling for the right target, so
     typically things like -mfpu. The conclusion is that we want:

       * For toolchains built by buildroot (internal, ct-ng),
         the toolchain configuration itself should already have
         the right options.

       * For external toolchains downloaded by buildroot,
         buildroot should add the correct flags in the toolchain
         wrapper to do the right thing.

       * For custom external toolchains, there should be a free-text
         config option that is coded into the toolchain wrapper.

       * The BR2_TARGET_OPTIMIZATION option should be renamed to
         something more sensible, and only be used in TARGET_CFLAGS
         (not in the wrapper).

 * linux-pam on aarch64
   http://autobuild.buildroot.org/results/64c010a05a8adb26dc0591c7d913125565bcbc10/build-end.log

   Missing RLIMIT_NOFILE.

   Quick solution: add a #ifndef...#define...#endif patch in linux-pam.

   Good solution: investigate why RLIMIT_NOFILE is not part of the
   aarch64 kernel headers. Was it removed for good reason, and in that
   case, it's linux-pam that needs patching. Is it absent because of
   some mistake, and in that case, report it to aarch64 toolchain
   people (and in the mean time, use the #ifndef...#define...#endif
   trick).

 * strace on aarch64
   http://autobuild.buildroot.org/results/cc590a0e830def391a261bd4ef2826acbffac521/build-end.log

   Quick solution: disable strace on Aarch64.

   Good solution: bump strace to the latest Git version, which has
   Aarch64 support. Someone on the list proposed a patch to add it, but
   it was a backport of only the main patch adding Aarch64 support, and
   it has been followed by several fixes. Generally speaking, strace
   4.7 is 11 months old, and there has been numerous commits in the
   strace code base since 4.7, so maybe we should adopt a Git version
   until a new strace release is made?

 * lttng-libust on arm
   http://autobuild.buildroot.org/results/dff75bdc6383714588f69981761f09f72b516de3/build-end.log

   Compiler failure. I've reported this failure some time ago on the
   Crosstool-NG mailing list (because it happens with a toolchain
   generated with Crosstool-NG). See
   http://sourceware.org/ml/crossgcc/2013-01/msg00011.html. 4.6.3 is
   still the latest version in the 4.6.x series.

   We could also bump lttng-libust to 2.1.2 and see if any code change
   happens to workaround the compiler bug.

 * ltp-testsuite on arm
   http://autobuild.buildroot.org/results/86b598b885e2db57f651a722c87be26f5fee956b/build-end.log

   Not sure what's going on here. Missing dependency on libcap or
   something? Not clear to me if cap_set_file() is part of the C
   library or libcap.

 * media-ctl
   http://autobuild.buildroot.org/results/be34936a5957d2ea377370ad796cbc5122b3f151/build-end.log

   Kernel headers problem. We should add a patch to media-ctl to
   include the needed kernel headers, until all toolchains have
   sufficiently recent kernel headers.

 * opkg on bfin
   http://autobuild.buildroot.org/results/bbf41833999b635633e746ff859b11d8b1713e4f/build-end.log

   opkg needs fork. Probably just disable it on !BR2_USE_MMU.

 * bzip2 on bfin
   http://autobuild.buildroot.org/results/98b88ca98e0f9e8133e4bda09cbd78d9e2aec36f/build-end.log

   Fails because bzip2 tries to build a shared library even though only
   static libraries are supported on bfin-uclinux. Should figure out
   why it tries to build a shared library.

 * libglib2 on arm with no threads
   http://autobuild.buildroot.org/results/935bbe4f21917a65105ededd7b37542010eca97d/build-end.log

   Build failure of libglib2 due to the absence of threads. I'm pretty
   sure the problem can be fixed by a patch of libglib2.

   Adding the !BR2_TOOLCHAIN_HAS_THREADS dependency on libglib2 would
   be a nightmare because libglib2 has gazillions of reverse
   dependencies.

 * libpfm4 on avr32
   http://autobuild.buildroot.org/results/845681638cd31f65221955a6670791dbac59b618/build-end.log

   Maybe because avr32 does not have the implementation of the perf
   system calls? If so, adding depends on !BR2_avr32 should be
   sufficient, no?

 * berkeleydb on sh2a
   http://autobuild.buildroot.org/results/ae1ee5c1f702e1449030cab244eb9b74b488e27c/build-end.log

   Not sure what's going on here. I'm considering dropping the sh2/sh3
   variants that we have, since I don't think we ever had anyone using
   Buildroot for those platforms. sh2 support was originally added by
   me because I started working on a sh2 project, but the Linux support
   was so horrible that I recommended a different hardware platform to
   the customer. So in the end, I don't care about sh2.

   Thoughts?

 * qt4 on powerpc
   http://autobuild.buildroot.org/results/87fbba8985ebd55ecc129594639129bd0b912f1c/build-end.log

   Don't know what's going on here exactly. Maybe the JIT support of
   JavascriptCore doesn't exist for PowerPC, or something like that.

 * imagemagick on powerpc
   http://autobuild.buildroot.org/results/29c4029fa6166410fcaa3b97e5331750d34b7acd/build-end.log

   Hum, I analyzed this one some time ago, but I unfortunately don't
   remember the conclusion. The problem is that even though the C++
   compiler is available, for some reason, ImageMagick decides it
   doesn't work, and therefore doesn't build/install the C++ library
   and related config script.

 * python3 on powerpc
   http://autobuild.buildroot.org/results/c1ba50aa5712afb785d95f7c8e6eb2daedfe49e8/build-end.log

   I don't know what's going on here. A parallel build issue?

 * e2fsprogs on avr32
   http://autobuild.buildroot.org/results/bc84c0a4c6f6eeba375223f6e93862c4a8e64818/build-end.log

   avr32 doesn't have fallocate(), or kernel headers too old?

 * udev on mips
   http://autobuild.buildroot.org/results/82672877fd04df02d97bc6e1f2833bd2e945e35d/build-end.log

   Yet another toolchain problem... the only thing I can do is
   blacklist in the autobuilders this package/toolchain combination.

 * pcre on arm (static lib)
   http://autobuild.buildroot.org/results/28a8e2e66a3131f549ec4dc52a5fbe9f62f59ff0/build-end.log

   A static linking issue.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
