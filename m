From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  1 Mar 2015 20:39:11 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <20150301203911.5C01F8075F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #8 from Peter Korsgaard <jacmet@uclibc.org> 2015-03-01 20:39:10 UTC ---
(In reply to comment #7)
> Further discussion with dywi on the IRC has led me to try Storage=volatile in
> /etc/systemd/journald.conf and this solves the issue additionally. It seems to
> be more "honest" as all /var/log/journal was getting written to was memory
> anyway.

Can you provide more details about your testing setup? I cannot reproduce it
here.

setup: (with current git head, 2015.02-rc3-31-gc9ba844)

- make qemu_arm_versatile_defconfig
- change to external sourcery codebench 2014.05 toolchain, enable systemd)
- run in qemu as explained in board/qemu/arm-versatile/readme.txt

..
systemd[1]: Starting Journal Socket.
[  OK  ] Listening on Journal Socket.
systemd[1]: Listening on Journal Socket.
..
systemd[1]: Starting Journal Socket (/dev/log).
[  OK  ] Listening on Journal Socket (/dev/log).
systemd[1]: Listening on Journal Socket (/dev/log).
systemd[1]: Starting Journal Service...
         Starting Journal Service...
..
[  OK  ] Started Journal Service.
systemd[1]: Started Journal Service.
         Starting Load/Save Random Seed...
         Starting Flush Journal to Persistent Storage...
         Starting Create Static Device Nodes in /dev...
[FAILED] Failed to start Load/Save Random Seed.
See "systemctl status systemd-random-seed.service" for details.
systemd-journald[57]: Received request to flush runtime journal from PID 1
[  OK  ] Started Flush Journal to Persistent Storage.
[  OK  ] Started Journal Service.
systemd[1]: Started Journal Service.
         Starting Load/Save Random Seed...
         Starting Flush Journal to Persistent Storage...
         Starting Create Static Device Nodes in /dev...
[FAILED] Failed to start Load/Save Random Seed.
See "systemctl status systemd-random-seed.service" for details.
systemd-journald[57]: Received request to flush runtime journal from PID 1
[  OK  ] Started Flush Journal to Persistent Storage.
..
Welcome to Buildroot
buildroot login: root
# journalctl 
-- Logs begin at Thu 1970-01-01 00:00:05 UTC, end at Thu 1970-01-01 00:06:41
UTC. --
Jan 01 00:00:05 buildroot systemd-journal[57]: Runtime journal is using 4.0M
(max allowed 8.0M, trying to leave 9.1M free of 57.1M available ? current limit
8.0M).
Jan 01 00:00:05 buildroot systemd-journal[57]: Runtime journal is using 4.0M
(max allowed 8.0M, trying to leave 9.1M free of 57.1M available ? current limit
8.0M).
Jan 01 00:00:05 buildroot kernel: Booting Linux on physical CPU 0x0
Jan 01 00:00:05 buildroot kernel: Linux version 3.18.4 (peko at dell) (gcc version
4.8.3 20140320 (prerelease) (Sourcery CodeBench Lite 2014.05-29) ) #1 Sun Mar 1
21:20:21 CET 2015
Jan 01 00:00:05 buildroot kernel: CPU: ARM926EJ-S [41069265] revision 5
(ARMv5TEJ), cr=00093177
Jan 01 00:00:05 buildroot kernel: CPU: VIVT data cache, VIVT instruction cache
Jan 01 00:00:05 buildroot kernel: Machine: ARM-Versatile PB
Jan 01 00:00:05 buildroot kernel: Memory policy: Data cache writeback
Jan 01 00:00:05 buildroot kernel: On node 0 totalpages: 32768
Jan 01 00:00:05 buildroot kernel: free_area_init_node: node 0, pgdat c047bef4,
node_mem_map c7efa000
Jan 01 00:00:05 buildroot kernel:   Normal zone: 256 pages used for memmap
Jan 01 00:00:05 buildroot kernel:   Normal zone: 0 pages reserved
Jan 01 00:00:05 buildroot kernel:   Normal zone: 32768 pages, LIFO batch:7


# grep Storage /etc/systemd/journald.conf 
#Storage=auto

# ls -lah /run/log/journal/*/system.journal 
-rw-r-----    1 root     systemd-    4.0M Jan  1 00:06
/run/log/journal/9d2e12bc7f174fe28e052094ddb7e92b/system.journal

So it looks like it works ok.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
