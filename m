From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 08:52:50 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/spandsp: disable MMX on i686
In-Reply-To: <20201122170414.932130-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 22 Nov 2020 18:04:14 +0100")
References: <20201122170414.932130-1-fontaine.fabrice@gmail.com>
Message-ID: <877dqcv7al.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > MMX raises the following build failure on i686:
 > gsm0610_rpe.c: In function 'gsm0610_rpe_encoding':
 > gsm0610_rpe.c:132:5: error: invalid 'asm': invalid constraints for operand
 >      __asm__ __volatile__(
 >      ^~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3e986c3109c392afe47fc98446a2563ac9776cf6
 >  - http://autobuild.buildroot.org/results/00ed4a4285b35d8ec0be09217e5b503e4820d971

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Baruch Siach):
 >  - MMX is always enabled on x86_64 so enable MMX depending on BR2_x86_64
 >    value and drop BR2_X86_CPU_HAS_MMX

 >  ...igure.ac-fix-AVX-SSE-and-MMX-options.patch | 60 +++++++++++++++++++
 >  package/spandsp/spandsp.mk                    |  5 +-
 >  2 files changed, 64 insertions(+), 1 deletion(-)
 >  create mode 100644 package/spandsp/0001-configure.ac-fix-AVX-SSE-and-MMX-options.patch

 > diff --git a/package/spandsp/0001-configure.ac-fix-AVX-SSE-and-MMX-options.patch b/package/spandsp/0001-configure.ac-fix-AVX-SSE-and-MMX-options.patch
 > new file mode 100644
 > index 0000000000..50eecfbf4b
 > --- /dev/null
 > +++ b/package/spandsp/0001-configure.ac-fix-AVX-SSE-and-MMX-options.patch
 > @@ -0,0 +1,60 @@
 > +From e7330bfe63efd0062fa51d50a4aaa0f1abd5ff75 Mon Sep 17 00:00:00 2001
 > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > +Date: Sun, 22 Nov 2020 17:02:43 +0100
 > +Subject: [PATCH] configure.ac: fix AVX, SSE and MMX options
 > +
 > +AVX, SSE and MMX options are broken since
 > +https://github.com/freeswitch/spandsp/commit/87a900c70df73e128a5926587047f529105f5f64
 > +
 > +For example, when the user enables SSE, it will also enable MMX and the
 > +user can't disable MMX
 > +
 > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > +[Upstream status: https://github.com/freeswitch/spandsp/pull/20]
 > +---
 > + configure.ac | 8 --------
 > + 1 file changed, 8 deletions(-)
 > +
 > +diff --git a/configure.ac b/configure.ac
 > +index 83fb3fd..ac2592e 100644
 > +--- a/configure.ac
 > ++++ b/configure.ac
 > +@@ -486,35 +486,27 @@ armv7[bl] | armv7-*)
 > + x86_64-* | i386-* | i686-*)
 > +     if test "$enable_avx2" = "yes" ; then
 > +         AC_DEFINE([SPANDSP_USE_AVX2], [1], [Use the AVX2 instruction set (i386 and x86_64 only).])
 > +-        enable_avx="yes"

I guess the intention is simply to make it easier to use the configure
options. If your machine supports AVX2 then it is pretty safe to assume
it also supports AVX, if it supports SSE vX, then it also supports <vX,
..

 > diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
 > index 42c0e3bb69..4735212f31 100644
 > --- a/package/spandsp/spandsp.mk
 > +++ b/package/spandsp/spandsp.mk
 > @@ -8,14 +8,17 @@ SPANDSP_VERSION = 3.0.0-6ec23e5a7e
 >  SPANDSP_SITE = https://files.freeswitch.org/downloads/libs
 >  SPANDSP_LICENSE = LGPL-2.1 (library), GPL-2.0 (test suite)
 >  SPANDSP_LICENSE_FILES = COPYING
 > +# We're patching configure.ac
 > +SPANDSP_AUTORECONF = YES
 
 >  SPANDSP_DEPENDENCIES = tiff host-pkgconf
 >  SPANDSP_INSTALL_STAGING = YES
 >  SPANDSP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
 
 > +# MMX on i686 raises a build failure
 >  SPANDSP_CONF_OPTS = \
 >  	--disable-builtin-tiff \
 > -	$(if $(BR2_X86_CPU_HAS_MMX),--enable-mmx,--disable-mmx) \
 > +	$(if $(BR2_x86_64),--enable-mmx,--disable-mmx) \
 >  	$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
 >  	$(if $(BR2_X86_CPU_HAS_SSE2),--enable-sse2,--disable-sse2) \
 >  	$(if $(BR2_X86_CPU_HAS_SSE3),--enable-sse3,--disable-sse3) \

A fix for the MMX support would have been nicer, but given that this has
been broken for more than 18 months and upstream doesn't seem very active:

http://lists.buildroot.org/pipermail/buildroot/2019-May/249899.html

So committed, thanks.

-- 
Bye, Peter Korsgaard
