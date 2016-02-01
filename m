From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 01 Feb 2016 23:38:18 +0000
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <bug-7892-163-P2VjUC8Pun@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

Maxime Hadjinlian <maxime.hadjinlian@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #15 from Maxime Hadjinlian <maxime.hadjinlian@gmail.com> ---
Hi,

Sorry to get back on this after such a long period, here are my findings and
maybe explanation:

The skeleton has changed since that times, and systemd has been updated too, so
this has to be kept in mind.

From the test I did using NFS, I played with the exportfs (RW or RO) and with
the kernel command line (RW, RO), here's a quick table of my results:

By results, I mean that journald started properly and doing journalctl worked
as expected.
And I kept the journald.conf as default (so the Storage=auto)

NFS    KERNEL    RESULTS
RO     RO        OK
RO     RW        NAK
RW     RO        OK
RW     RW        OK

The only options where it went awry is when I told the kernel that my storage
was RW when in reality it was RO, so we could say that journald is stupid
because it takes what the user say for granted and maybe it should double
check, but I don't think the fix should come from Buildroot.

I would add that the patch that changes the Storage options unconditionally is
too harsh anyway. We can't enforce where the log should be or not be, written.
This should be a post-build scripts tweak to me, or if it's really an issue
with journalctl, maybe I need to find some SAMA5 board somewhere, maybe theres'
something special about this board, but as is, I really can't reproduce.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
