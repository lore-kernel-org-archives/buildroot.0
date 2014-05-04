From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 09:10:41 +0200
Subject: [Buildroot] [PATCH v2 04/24] clapack: new package
In-Reply-To: <1398208556-4195-5-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Wed, 23 Apr 2014 01:15:36 +0200")
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-5-git-send-email-s.martin49@gmail.com>
Message-ID: <87d2fukoi6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This package provides BLAS and LAPACK libraries.
 > Though it is common to find implementation of these two libraries in
 > Fortran, this package provides a C-implementation for both, because:
 > - Fortran support has been deprecated in Buildroot since the 2013.11
 >   release;
 > - most of the external toolchains do not provide a Fortran compiler.

 > Often BLAS build-systems build some test programs and run them to
 > generate some source files or adjust some build optimizations, naively
 > assuming they are building the library for the build-machine. This does
 > not play well when cross-compiling.

 > This implementation has this defect too, by building and running a tool
 > generating a header.
 > However, the build-system allows to pass an empty header.
 > So, we have to patch the CMake to build the generator (but never
 > install it) and correctly support building with and without this header
 > provided by the user.

 > Also, few CMake patches are needed to fix the build and install rules.

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 > +++ b/package/clapack/Config.in
 > @@ -0,0 +1,18 @@
 > +config BR2_PACKAGE_CLAPACK
 > +	bool "cblas/clapack"
 > +	help
 > +	  BLAS and LAPACK C implementation (f2c'ed version of).
 > +
 > +	  http://www.netlib.org/clapack/

A testbuild shows it needs largefile (STAT_ST isn't defined for !LFS),
so I've added that.


 > +++ b/package/clapack/clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
 > @@ -0,0 +1,80 @@
 > +From 834c221936d9c460b44e3a65b6fedfb3193f491b Mon Sep 17 00:00:00 2001
 > +From: Samuel Martin <s.martin49@gmail.com>
 > +Date: Sat, 11 Jan 2014 21:33:12 +0100
 > +Subject: [PATCH 2/6] cmake: make test build sensitive to BUILD_TESTING
 > +
 > +This patch prevent from wasting time building the tests if it's our
 > +wish.
 > +
 > +The test build takes a significant amount of time, and the binaries
 > +not installed.

s/not/are not/.

I've done similar small changes to some of the other patch
descriptions. Have you sent them upstream? If so, have they been integrated?

 > +++ b/package/clapack/clapack.mk
 > @@ -0,0 +1,23 @@
 > +################################################################################
 > +#
 > +# clapack
 > +#
 > +################################################################################
 > +
 > +CLAPACK_VERSION = 3.2.1
 > +CLAPACK_SOURCE = clapack-$(CLAPACK_VERSION)-CMAKE.tgz
 > +# This package provides 3 libraries:
 > +# - libf2c.a (not installed)
 > +# - libblas (statically linked with libf2c.a)
 > +# - liblapack (statically linked with libf2c.a)
 > +CLAPACK_LICENSE = HPND (libf2c), BSD-3c (libblas and liblapack)
 > +CLAPACK_LICENSE_FILES = F2CLIBS/libf2c/Notice, COPYING

_LICENSE_FILES is a space seperated list, not comma seperated.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
