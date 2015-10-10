From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 10 Oct 2015 00:17:21 +0000 (UTC)
Subject: [Buildroot] [Bug 8391] Node.js 0.12.7 fails to build on
	raspberry_pi defconfig
In-Reply-To: <bug-8391-163@https.bugs.busybox.net/>
References: <bug-8391-163@https.bugs.busybox.net/>
Message-ID: <20151010001721.4964281F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8391

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> 2015-10-10 00:17:21 UTC ---
Hello Tom,

the problem is not the compiler, but the node.js code implementing its
own atomic helpers (instead of using proper library calls), the same code is
used (and fixed) in some other google code base, see eg. [1].

The buildroot rpi compiler defines __ARM_ARCH_6ZK__, see:

$ ./host/usr/bin/arm-buildroot-linux-gnueabi-g++ -dM -E - < /dev/null  | grep
ARM_ARCH
#define __ARM_ARCH_ISA_ARM 1
#define __ARM_ARCH_ISA_THUMB 1
#define __ARM_ARCH 6
#define __ARM_ARCH_6ZK__ 1

Maybe there is a newer version of node.js? Or add __ARM_ARCH_6ZK__ at
the right places of the
nodejs-0.12.7/deps/v8/src/base/atomicops_internals_arm_gcc.h file...

Regards,
Peter

[1]
https://groups.google.com/a/chromium.org/forum/#!topic/chromium-reviews/sgJEpULO5Xc

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
