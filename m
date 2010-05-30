From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 30 May 2010 11:15:32 +0000 (UTC)
Subject: [Buildroot] [Bug 1855] XORG Keyboard driver fails to compile
In-Reply-To: <bug-1855-163@https.bugs.busybox.net/>
References: <bug-1855-163@https.bugs.busybox.net/>
Message-ID: <20100530111532.B8A7C1258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1855

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #2)
> (In reply to comment #1)
> > 
> > What package is this exactly? BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD? That one
> > seems to list both xserver and xproto as dependencies.
> 
> Yes, that's the one. I built it the other day and it worked ok, but today I did
> a "git pull && make distclean" and now it's not working.

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
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
