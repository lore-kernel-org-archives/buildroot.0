From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 10:05:37 +0200
Subject: [Buildroot] [PATCH] binutils: add patch to fix AArch64 glibc
	build issue
In-Reply-To: <1400169395-11964-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 15 May 2014 17:56:35 +0200")
References: <1400169395-11964-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9airvvy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The autobuilders are not able to build glibc on AArch64 since we moved
 > to the internal toolchain backend as the default for AArch64. The
 > reason is that the cross-ld segfaults while linking of the glibc
 > utilities. Unfortunately, the issue has so far been impossible to
 > reproduce outside of the autobuilder CI loop itself: even on the same
 > machine, in the same chroot, the issue does not appear.

 > Today, Will Newton helped me analyze a bit further the problem. In the
 > logs of the build machine, we have found that the following segfault
 > notification matched the dates of the autobuilder failures:

 > /var/log/syslog:May 15 10:39:20 sd-56966 kernel: [767023.832598] ld[6846]: segfault at 1b2c002 ip 00000000004caf80 sp 00007fffaa308df8 error 4 in ld[400000+1b9000]
 > /var/log/syslog.2.gz:May 13 07:58:24 sd-56966 kernel: [585094.434264] ld[17761]: segfault at 154b002 ip 00000000004caf80 sp 00007fff0d400168 error 4 in ld[400000+1b9000]
 > /var/log/syslog.3.gz:May 12 20:24:08 sd-56966 kernel: [543558.227915] ld[14841]: segfault at 2706002 ip 00000000004caf80 sp 00007fffc08d41c8 error 4 in ld[400000+1b9000]
 > /var/log/syslog.4.gz:May 11 19:51:59 sd-56966 kernel: [455484.523033] ld[50162]: segfault at 1f00002 ip 00000000004caf80 sp 00007fff14a02328 error 4 in ld[400000+1b9000]
 > /var/log/syslog.4.gz:May 12 05:13:37 sd-56966 kernel: [489085.120089] ld[32067]: segfault at 2430002 ip 00000000004caf80 sp 00007fffc448db48 error 4 in ld[400000+1b9000]
 > /var/log/syslog.6.gz:May  9 15:20:38 sd-56966 kernel: [266948.197141] ld[13483]: segfault at ff0002 ip 00000000004caf80 sp 00007fff7e4fe948 error 4 in ld[400000+1b9000]
 > /var/log/syslog.7.gz:May  8 16:45:08 sd-56966 kernel: [185853.688607] ld[1757]: segfault at 20b1002 ip 00000000004caf80 sp 00007fffd07d5ae8 error 4 in ld[400000+1b9000]

 > See
 > http://autobuild.buildroot.org/?reason=glibc-2.18-svnr23787&arch=aarch64
 > for the autobuilder results.

 > So, the segfault always happens while accessing an address 2 bytes
 > after the beginning of a page: it looks like a buffer overflow, which
 > gets triggered because the object is placed towards the end of the
 > previous page, and crosses over the next, unallocated page.

 > Moreover, we looked at the 0x4caf80 address in an AArch64 cross-ld
 > built by Buildroot, and it turns out that it is part of the
 > iterative_hash() function. This nicely correlates with the patch that
 > Will Newton had pointed in
 > http://lists.busybox.net/pipermail/buildroot/2014-May/095881.html as a
 > fix for invalid memory accesses reported by Valgrind in the AArch64
 > cross-ld, specifically around the same area of 'ld'.

 > Therefore, even though we have not been able to reproduce the issue
 > outside of the autobuilders, and cannot confirm that the patch is
 > fixing the issue, I propose to integrate this binutils patch into
 > Buildroot. It is anyway an upstream binutils patch, which fixes a real
 > problem.

Thanks for the investigations, both - Committed, thanks.

-- 
Bye, Peter Korsgaard
