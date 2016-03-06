From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 06 Mar 2016 12:51:15 +0000
Subject: [Buildroot] [Bug 8766] Compiling host-gcc-final-4.9.3 broken on i386
In-Reply-To: <bug-8766-163@https.bugs.busybox.net/>
References: <bug-8766-163@https.bugs.busybox.net/>
Message-ID: <bug-8766-163-Tc1s7yr72M@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8766

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks Bernd for the report. This is an issue you already reported in the past,
I found your previous report and some related discussion at
https://patchwork.ozlabs.org/patch/484002/.

Basically, as I understand it, the problem is that uClibc-ng only offers the
NPTL thread implementation for x86. But since i386 does not have the necessary
instructions to implement NPTL, we only offer the "none" thread implementation,
which explains why <pthread.h> is missing.

So I think there are really two questions here:

 1/ Is it correct that uClibc-ng provides no thread implementation at all for
i386. This is something to discuss with Waldemar.

 2/ Are we also seeing this <pthread.h> missing problem when building with no
threads on i486+. If we also have this problem, then I don't see how the "none"
thread implementation can still be useful.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
