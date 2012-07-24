From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Jul 2012 12:55:54 +0000 (UTC)
Subject: [Buildroot] [Bug 5396] Boot hangs when starting samba if
 BR2_ENABLE_LOCALE is enabled
In-Reply-To: <bug-5396-163@https.bugs.busybox.net/>
References: <bug-5396-163@https.bugs.busybox.net/>
Message-ID: <20120724125554.D8FED96DC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5396

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-07-24 12:55:54 UTC ---
(In reply to comment #3)

> How about we use --with-libiconv= if BR2_TOOLCHAIN_BUILDROOT=y since we know it
> is not working in that case?

Sorry, but this is also a hack: we support uClibc in external toolchains and
ct-ng generated toolchains as well.

We have four cases:

 (1) Config without libiconv, uClibc
 (2) Config with libiconv, uClibC
 (3) Config without libiconv, glibc
 (4) Config with libiconv, glibc

We need to find out how to handle each case properly.

Case (4) should be prevented I think, since glibc as an internal implementation
of iconv that should just work.

Case (3) should probably be implemented by adding the support to copy of gconv
.so files to the target, see
http://lists.busybox.net/pipermail/buildroot/2011-September/045333.html. This
needs to be tested.

Case (2) needs to be verified. Last time I looked at this topic, uClibc with
locale + libiconv was causing lots of build issues, because uClibc was
providing its own version of the iconv functions, even if not as capable as the
separate libiconv library.

So as you can see, a proper fix will not be a one-liner. It needs to be a
correct investigation of how the iconv implementation works in uClibc and
glibc, how it relates to the separate libiconv, and finally how to handle that
in Buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
