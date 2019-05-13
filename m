From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 May 2019 13:11:35 +0000
Subject: [Buildroot] [Bug 11866] iniramfs file system fails to boot using
 Grub on EFI x86_64
In-Reply-To: <bug-11866-163@https.bugs.busybox.net/>
References: <bug-11866-163@https.bugs.busybox.net/>
Message-ID: <bug-11866-163-OM5LoclU0F@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11866

--- Comment #3 from Pete Morici <pmorici@dev295.com> ---
Looked into this more and the source of the issue is setting the console
argument to certain values causes the boot process to lock up but only when the
initramfs file system is used.  I have been setting the console value to null
which causes the problem and when I changed it back to tty1 I made a typo and
wrote /dev/tty1 which also causes the problem.  None of these values cause a
boot hang when used with a file system other than initramfs.

This might have something to do with the /init script installed as part of the
cpio fs option that initramfs depends on but since there is no output I can't
tell what the exact problem is.

 #!/bin/sh
 # devtmpfs does not get automounted for initramfs
 /bin/mount -t devtmpfs devtmpfs /dev
 exec 0</dev/console
 exec 1>/dev/console
 exec 2>/dev/console
 exec /sbin/init "$@"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
