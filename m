From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 May 2018 20:16:32 +0000
Subject: [Buildroot] [Bug 10996] bogus musl ARM toolchain
In-Reply-To: <bug-10996-163@https.bugs.busybox.net/>
References: <bug-10996-163@https.bugs.busybox.net/>
Message-ID: <bug-10996-163-6ekbgvrVDY@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10996

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
(In reply to Yann E. MORIN from comment #2)
Nope, because you're looking at the wrong place. The reason why the build fail
is because the "configuration" step which detects if mktime() is available or
not fails and concludes that mktime() is not available. See the string "
Check for mktime". Due to this, NO_MKTIME is defined, and this code path is
broken in util.c/timezone.c.

So there are really two problems:

 (1) That is doesn't detect the availability of mktime() because -static is not
passed during the detection test.

 (2) That the NO_MKTIME case is broken.

However, I believe (2) is not really relevant for Buildroot, as all three C
libraries provide mktime(). So all we need to fix is (1).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
