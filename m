From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 27 Mar 2021 16:51:50 +0000
Subject: [Buildroot] [Bug 13671] openSSH server closes connection before
 authentication is finished
In-Reply-To: <bug-13671-163@https.bugs.busybox.net/>
References: <bug-13671-163@https.bugs.busybox.net/>
Message-ID: <bug-13671-163-ajR1Slb8yP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

--- Comment #9 from romain.naour at gmail.com ---
Hello,

I believe it's an issue between the kernel-headers version and glibc >= 2.31.
I'm able to reproduce with the Arm ARM 2020.11 and Bootlin toolchain stable
2020.08-1 but not with Bootlin toolchain bleeding-edge 2020.08-1.

The Arm ARM 2020.11 provide 4.20.3 kernel headers while the Bootlin toolchain
bleeding-edge 2020.08-1 provide 5.4.61. Both use glibc 2.31.

Since glibc 2.31, there is a tables with system call numbers that come from
kernel 5.4 [1]. But syscall like __NR_clock_gettime64 has been added since
kernel 5.1 [2]

It seems we need a toolchain with kernel headers >= 5.1 to workaround the
issue.

[1]
https://sourceware.org/git/?p=glibc.git;a=commit;h=4cf0d223052dabb9caed29e1e91e1d61933e14fb
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=48166e6ea47d23984f0b481ca199250e1ce0730a

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
