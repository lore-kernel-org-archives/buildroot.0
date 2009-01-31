From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 13:29:03 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-lib
In-Reply-To: <20090131101825.7DC5376219@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 31 Jan 2009 10\:18\:25 +0000 \(UTC\)")
References: <20090131101825.7DC5376219@busybox.osuosl.org>
Message-ID: <87y6wrlkvk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-31 10:18:23 +0000 (Sat, 31 Jan 2009)
 ulf> New Revision: 25175

 ulf> Log:
 ulf> Workaround for AVR32 compiler issue affecting inlining, causing alsa-lib to break, feedback to AVR32 compiler team will be sent

 ulf> +++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-31 10:18:23 UTC (rev 25175)
 ulf> @@ -12,11 +12,17 @@
 ulf>  ALSA_LIB_TARGET_BINARY:=usr/lib/$(ALSA_LIB_BINARY)
 
 ulf>  ifeq ($(BR2_arm),y)
 ulf> -ALSA_LIB_ABI:=-mabi=aapcs-linux
 ulf> +ALSA_LIB_ABI+=-mabi=aapcs-linux
 ulf>  else
 ulf> -ALSA_LIB_ABI:=
 ulf> +ALSA_LIB_ABI+=
 ulf>  endif
 
 ulf> +ifeq ($(BR2_avr32),y)
 ulf> +ALSA_LIB_ABI+=-DAVR32_INLINE_BUG
 ulf> +else
 ulf> +ALSA_LIB_ABI+=
 ulf> +endif

Please rename that variable to something sensible when you start to
use it for other things, something like ALSA_CFLAGS.

And now we're at it, is the arm abi handling needed after the fix in
r25164? Could you give it a try (with an internal toolchain ofcourse)?

-- 
Bye, Peter Korsgaard
