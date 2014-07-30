From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 23:50:26 +0200
Subject: [Buildroot] Notice: significant changes for static linking
	configurations
Message-ID: <20140730235026.771f855f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've just merged a bunch of changes that make some fairly significant
changes in the handling of static linking cases:

 97703978ac870ce2b14ad144f8e082de82aa2c64 support/libtool: make -static behave like -all-static
 5d66a9b1fb67cf009fe4f15028c02a8386109dc5 package infra: add -static to C/CXXFLAGS
 8d764327a697a2572bba96878972c1a469f864f3 package infra: revert 0a4bd19f
 169141a3eb0dc009a49895ebdc255bfc869ed5af gcc-final: disable shared build for static

Those changes are aimed at fixing the issue we have seen since a long
time when linking certain C++ packages, with messages like:

  /home/test/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.7.3/../../../../x86_64-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/test/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.7.3/../../../../x86_64-buildroot-linux-uclibc/lib/../lib64/libstdc++.so'
collect2: error: ld returned 1 exit status

See
http://autobuild.buildroot.org/results/5c7/5c7f804ccc4fe233ae6e48d489cd7a40c64ed68a/build-end.log
for one such example.

So, if you are using BR2_PREFER_STATIC_LIB=y in your configuration,
please do test the latest master, and report back any issue. Basically,
the changes are as follows:

 - Change the internal toolchain backend to not build a shared
   libstdc++ when we're building static only.

 - Change the TARGET_LDFLAGS from --static to just -static, which is
   what the compiler and linker normally expect. -static was also added
   to TARGET_CFLAGS and TARGET_CXXFLAGS for good measure.

 - Addition of more libtool hackery, to make it understand -static as
   meaning "I want things to be built fully statically", which normally
   requires a libtool specific -all-static. But since that flags is not
   understood by the compiler or linker, we cannot pass it to LDFLAGS.
   See the commit log for details.

We'll see in the next few days what is the result of those changes in
the autobuilders. If it turns out to be too nasty, we might revert
back. But the static linking issue with libstdc++ has been around for
too long, it's time to get something done.

Thanks a lot to Gustavo for doing all the initial work, and helping on
IRC ironing out the last details.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
