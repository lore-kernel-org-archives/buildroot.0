From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 May 2010 13:14:19 +0200
Subject: [Buildroot] [Bug 1855] XORG Keyboard driver fails to compile
In-Reply-To: <20100530110358.819918A522@busybox.osuosl.org>
	(bugzilla@busybox.net's message of "Sun, 30 May 2010 11:03:58 +0000
	(UTC)")
References: <bug-1855-163@https.bugs.busybox.net/>
	<20100530110358.819918A522@busybox.osuosl.org>
Message-ID: <87mxvhsktw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bugzilla" == bugzilla  <bugzilla@busybox.net> writes:

 bugzilla> https://bugs.busybox.net/show_bug.cgi?id=1855
 bugzilla> --- Comment #2 from paul.jones at iwtech.com.au <paul@pauljones.id.au>  ---
 bugzilla> (In reply to comment #1)
 >> 
 >> What package is this exactly? BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD? That one
 >> seems to list both xserver and xproto as dependencies.

 bugzilla> Yes, that's the one. I built it the other day and it worked
 bugzilla> ok, but today I did a "git pull && make distclean" and now
 bugzilla> it's not working.

Ahh, then I guess I know why:

commit b7acacaf6e84ec05ed76dd419e645cfbd6683f7a
Author: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date:   Fri May 28 17:58:43 2010 +0300

    xserver_xorg-server: Use $(MAKE1) for make install
    
    Xserver installation fails with parallel make jobs.
    
    Installation to staging is not needed. So just remove it
    instead of converting to $(MAKE1).
    
    Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

If we don't install into staging, then the other packages won't find the
xserver pkg-config file. I'll fix that now.

Please try to provide as much info as you can in the bug report in the
future, thanks.

-- 
Bye, Peter Korsgaard
