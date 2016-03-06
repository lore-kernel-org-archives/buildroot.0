From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 06 Mar 2016 13:27:31 +0000
Subject: [Buildroot] [Bug 8766] Compiling host-gcc-final-4.9.3 broken on i386
In-Reply-To: <bug-8766-163@https.bugs.busybox.net/>
References: <bug-8766-163@https.bugs.busybox.net/>
Message-ID: <bug-8766-163-Fm8qtlzXbf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8766

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
After some research, it seems to be an x86 specific issue. The file causing
problems is libgcc/generic-morestack-thread.c, which gets included in the build
by libgcc/config/t-stack. It is related to the implementation of -fsplit-stack,
which is only supported on x86 32/64.

So on other architectures, a no thread configuration should still build fine.
However, seeing that on a major arch like x86 the nothread support has been
broken for a while (-fsplit-stack has been around since gcc 4.6) really makes
me wonder if we should continue to support the no thread solution.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
