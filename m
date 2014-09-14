From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Sep 2014 11:49:58 +0200
Subject: [Buildroot] [PATCH 0/5] Moving to a two stage gcc build
Message-ID: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new iteration of the patch series moving from a three stage
gcc build to a two stage gcc build, which obviously speeds up quite a
bit the toolchain build process. This time around, I've done a *lot*
more testing, and I've fixed the Stack Smashing Protection issue that
lead to reverting the previous solution (back in October 2013).

You can see the results at:

  https://docs.google.com/spreadsheets/d/1Qj3t6HJzuVxsqLfXZp3HiFMGrangmRl510BqR_VIOeM/edit?usp=sharing

I've done build testing on all architectures that we support (except
I've done tested all little endian / big endian variations of the
different architectures), and I've done runtime testing on all the
architectures for which we have Qemu support. This testing has been
done for the three supported C libraries: glibc, uclibc and musl (I
haven't done eglibc testing, since it's going away, and should be
identical to glibc).

This testing was done with a variety of compiler versions, C library
versions (for glibc), and toolchain configuration. Of course, I
haven't tested *all* possible combinations, but quite a few.

The results show that this patch series does not introduce
regressions: the configuration that do not build or do not run on
target also fail in the same way on the master branch:

 - ARC build fails in Busybox, like in master (but the toolchain
   builds fine)

 - mips64el/uclibc build and mipsel/uclibc build fail to run, like in
   master.

 - powerpc/musl fails to build, since it doesn't have SPE support,
   like in master (patches from Gustavo pending).

 - sh4 toolchain is broken, like in master.

I'd like to call people using the internal toolchain backend to please
test this patch series (both build time and run time), and report any
issue or send their Tested-by. We're still relatively early in the
development cycle, it's the good moment to get such changes merged.

Thanks!

Thomas

Thomas Petazzoni (5):
  toolchain: switch to a two stage gcc build
  gcc/gcc-intermediate: remove package
  musl: two-stage gcc simplifications
  glibc: two-stage gcc simplifications
  uclibc: two-stage gcc simplifications

 package/gcc/gcc-initial/gcc-initial.mk           | 20 +++++++++-
 package/gcc/gcc-intermediate/gcc-intermediate.mk | 49 ------------------------
 package/gcc/gcc.mk                               |  3 +-
 package/glibc/glibc.mk                           | 15 +-------
 package/musl/musl.mk                             | 27 +------------
 package/uclibc/uclibc.mk                         | 25 +-----------
 6 files changed, 24 insertions(+), 115 deletions(-)
 delete mode 100644 package/gcc/gcc-intermediate/gcc-intermediate.mk

-- 
2.0.0
