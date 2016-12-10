From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 10 Dec 2016 04:19:01 +0000
Subject: [Buildroot] [Bug 8946] Valgrind fails to build with stack
	protection turned on
In-Reply-To: <bug-8946-163@https.bugs.busybox.net/>
References: <bug-8946-163@https.bugs.busybox.net/>
Message-ID: <bug-8946-163-dTGd2UDJJY@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8946

Brandon Maier <brandon.maier@rockwellcollins.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|WORKSFORME                  |---
             Status|RESOLVED                    |REOPENED

--- Comment #8 from Brandon Maier <brandon.maier@rockwellcollins.com> ---
We just ran into this same build error on one of our boards.

I was able to recreate the error on master
(f30eec41f95ed99909eb2c7590d83c12b9142df2) by building the beaglebone_defconfig
with BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y and BR2_SSP_ALL=y. Then doing "make
valgrind".

The cause is Valgrind requires -fno-stack-protector to build correctly. I fixed
the error by appending -fno-stack-protector to the CFLAGS passed to Valgrind,
so that it overrides the ones in TARGET_CFLAGS.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
