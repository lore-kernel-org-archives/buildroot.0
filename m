From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Sep 2011 22:32:29 +0200
Subject: [Buildroot] [PATCHv2] package: add the poco C++ libraries
	collection
In-Reply-To: <20110926064459.GB28996@sapphire.tkos.co.il> (Baruch Siach's
 message of "Mon, 26 Sep 2011 09:44:59 +0300")
References: <bc337c3bfe93b6d50d40f042d53480f38a8dd0b8.1314792605.git.baruch@tkos.co.il>
 <87mxdsxpe8.fsf@macbook.be.48ers.dk>
 <20110926064459.GB28996@sapphire.tkos.co.il>
Message-ID: <87pqinvyci.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 >> The FE_* macros afaik only supposed to be defined if the arch can
 >> efficiently handle it, which isn't the case for ARM.

 Baruch> It builds here for ARM (BR2_ARM_TYPE="ARM926T") using the CodeSourcery 
 Baruch> toolchain (with a little toolchain support fix I'll send shortly).

Indeed. The codesourcery toolchain presumably uses glibc. The problem is
with uClibc - But I don't want to add a package which doesn't work with
the internal toolchain.

 >> fenv.h the
 >> supporting functions are only enabled on uClibc if UCLIBC_HAS_FENV is
 >> enabled in the .config, which it isn't for our uClibc defconfigs.
 >> 
 >> I'm not exactly sure how to fix this. Any ideas?

 Baruch> Is there a way to depend on UCLIBC_HAS_FENV?
 Baruch> Is depending on glibc an option?

I would rather see a patch which uses the dummy fenv implementation on
uClibc without UCLIBC_HAS_FENV.

You can detect that using something like

#include <fetures.h>
#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_FENV__)
..

But I haven't looked at the poco build system to see how easy that would
be.

-- 
Bye, Peter Korsgaard
