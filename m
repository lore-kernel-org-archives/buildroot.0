From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  8 Aug 2015 16:04:54 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <20150808160454.A3486805EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #14 from Floris Bos <bos@je-eigen-domein.nl> 2015-08-08 16:04:54 UTC ---
>This issue occurs when the 'rw' flag is given to the kernel.

Problem with journalctl reporting "No journal files were found" also occurs
when using initramfs as output image, which has a writeable / as well.

Seems that journald starts early, before fstab is processed, and uses
/var/log/journal -> /tmp/journal if it is able to (has a writeable fs at that
point).
Later fstab is processed which with the default skeleton mounts another /tmp
tmpfs on top:

==
tmpfs           /tmp            tmpfs   mode=1777       0       0
==

rendering the journal file unreachable.


>The fix/workaround seems to be to edit in "Storage=Volatile" in /etc/systemd/journald.conf

Yes, that solves it for me as well.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
