From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jul 2015 18:15:03 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-autotools: fix patching libtool for
	version 2.4
In-Reply-To: <1436129628-3636-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Sun, 5 Jul 2015 16:53:48 -0400")
References: <1436129628-3636-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87egklp8jc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > If the libtool used by the package is 2.4 (i.e. with no patchlevel), we
 > end up with error messages like this one, seen when building ntp-4.2.8p3:

 >     /bin/sh: line 0: test: 2.4: integer expression expected

 > That's because the current sed expression "[0-9].[0-9]." only deletes content
 > like "2.4.", so it leaves "2.4" (no patch level *and* no second period) intact,
 > resulting in an ltmain_patchlevel of "2.4", not empty, and not "0".  Then the
 > shell line goes bad, because the built in shell test -gt operates on integers
 > only, and fails on floating point numbers (like "2.4").

 > Additionally, the existing sed lines are problematic in other ways, because the
 > current expression "[0-9].[0-9]" will match "234" as well as "2.4", as an unescaped
 > period matches any character, not just a period.  Also, the lack of an asterisk
 > after the first character may be a problem in the future, if a two digit initial
 > number is used.

 > So, this patch changes the sed regex as follows:

 > * Match a string of digits when searching for a number.  I.e. "[0-9]*"
 > * Match specifically a period in between two numbers.  I.e. "\."
 > * When searching for a patch level, make the second period optional.  I.e. "\.*"

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

 > ---

 > For more detail, add "set -x" before the for-loop in pkg-autotools.mk, and
 > rebuild ntp, which currently will patch three libtool setups - "2.4", then
 > "2.4.2", then another "2.4".

Thanks for the detailed description!

Committed, thanks.

-- 
Bye, Peter Korsgaard
