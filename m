From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Aug 2011 20:05:20 +0200
Subject: [Buildroot] util-linux compile problems
In-Reply-To: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Mon, 8 Aug 2011 13:58:08 +0200")
References: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87fwlblqxr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> after updating buildroot we are getting compile errors from building
 Sven> util-linux. First the linker was complaining that it couldn't find
 Sven> libintl_gettext and related symbols. I was able to fix that by
 Sven> passing --disable-nls to the configure script (patch follows).
 Sven> Now I am getting errors all over the place because
 Sven> program_invocation_short_name is not defined. This is correct
 Sven> and there's a configure check to test for this. Based on this check
 Sven> a fallback is provided by include/c.h. However this file is not
 Sven> included from all places that use program_invocation_short_name.

 Sven> Now I wonder if this would best be fixed by patching all affected
 Sven> source files in util-linux or if UCLIBC_HAS_PROGRAM_INVOCATION_NAME
 Sven> should be selected when util-linux is selected.

We got rid of the BR2_PROGRAM_INVOCATION option back on the 27/7, as the
dependencies got quite messy and it only adds ~100 bytes to uClibc, so
check your uclibc .config.

We already pass --disable-nls unless you have locales enabled, so
perhaps it needs similar handling as libglib2 for uClibc (select
LIBINTIL if BR2_NEEDS_GETTEXT). Thomas also mentioned something about
that, but I haven't done a locale build lately to test. Will do so now.

-- 
Bye, Peter Korsgaard
