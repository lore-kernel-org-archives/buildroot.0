From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:13:56 +0100
Subject: [Buildroot] [PATCH/next 1/1] linuxptp: fix build with kernel
 headers >= 4.19
In-Reply-To: <20181129214730.7225-1-fontaine.fabrice@gmail.com>
References: <20181129214730.7225-1-fontaine.fabrice@gmail.com>
Message-ID: <20181231171356.49fb674d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Nov 2018 22:47:30 +0100, Fabrice Fontaine wrote:
> clockid_t has been added in net_tstamp.h since kernel 4.19 and
> https://github.com/torvalds/linux/commit/80b14dee2bea128928537d61c333f24cb8cbb62f
> 
> As a result, build fails on:
> In file included from clock.c:20:
> /home/peko/autobuild/instance-0/output/host/arc-buildroot-linux-uclibc/sysroot/usr/include/linux/net_tstamp.h:158:2: error: unknown type name 'clockid_t'
>   clockid_t clockid; /* reference clockid */
> 
> To fix this error, add (or move) include on time.h before net_tstamp.h
> in clock.c, sk.c and timemaster.c
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4f53c0b6f3395f4d1ec0aa58f9df36c8145b1066
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

The issue has been fixed in the upstream Linux kernel:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/uapi/linux/net_tstamp.h?id=e2c4cf7f98a519eb4d95532bfa06bcaf3562fed5

This commit is part of Linux 4.20. It has a "Fixes" tag, so it should
normally be backported to Linux 4.19 at some point, even though this
hasn't happened yet.

So instead of doing a work around in linuxptp, we'll use the upstream
Linux kernel fix.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
