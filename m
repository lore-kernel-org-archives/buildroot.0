From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jun 2014 14:04:30 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140616140430.C4E8F9D00B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #12 from bugdal at aerifal.cx 2014-06-16 14:04:29 UTC ---
The relevant part of the musl patch is intended to remove the hard-coding of
USE_PT_GNU_EH_FRAME as glibc-specific and instead detect via configure that it
should be used. My guess is that something's broken in the configure script
whereby TARGET_DL_ITERATE_PHDR is not getting detected correctly; perhaps the
test is not cross-compiler-compatible.

Based on the thread on the musl mailing list
(http://www.openwall.com/lists/musl/2014/06/16/2), I think if this is the
problem it would go undetected by musl, since when targetting musl gcc is still
producing an "old-style" crtbegin/crtend that works without
USE_PT_GNU_EH_FRAME. With glibc that doesn't happen because the crtstuff
preprocessor conditionals are still hard-coded for glibc.

In my opinion the "right" fix is finding and fixing whatever's wrong in
configure, but as a short-term solution, the conditional could be fixed to
hard-code USE_PT_GNU_EH_FRAME for glibc while detecting it elsewhere, as in:

+#if (!defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) &&
defined(TARGET_DL_ITERATE_PHDR)) || defined(__gnu_linux__)
 # define USE_PT_GNU_EH_FRAME

or something closer to whatever the upstream logic is for glibc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
