From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Nov 2015 21:52:14 +0000 (UTC)
Subject: [Buildroot] [Bug 8491] libglib2 2.46.1 not Building for armv5 on
	2015.11-rc3
In-Reply-To: <bug-8491-163@https.bugs.busybox.net/>
References: <bug-8491-163@https.bugs.busybox.net/>
Message-ID: <20151129215214.D1A447FF27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8491

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> 2015-11-29 21:52:14 UTC ---
(In reply to comment #1)
> Hello,
> 
> Thanks for your report!
> 
> However, I can not reproduce that build failure.
> Here's my defconfig:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_LIBGLIB2=y

Based on the error message, the reporter was most likely building with thumb1
mode.

And indeed, it fails here as well with that config +
BR2_ARM_INSTRUCTIONS_THUMB=y

  CC       libglib_2_0_la-gstringchunk.lo
/tmp/ccSVEXME.s: Assembler messages:
/tmp/ccSVEXME.s:587: Error: shifts in CMP/MOV instructions are only supported
in unified syntax -- `mov r12,r12,ror#3'
/tmp/ccSVEXME.s:587: Error: shifts in CMP/MOV instructions are only supported
in unified syntax -- `mov r12,r12,ror#13'
/tmp/ccSVEXME.s:588: Error: shifts in CMP/MOV instructions are only supported
in unified syntax -- `mov r12,r12,ror#29'
/tmp/ccSVEXME.s:588: Error: shifts in CMP/MOV instructions are only supported
in unified syntax -- `mov r12,r12,ror#19'
/tmp/ccSVEXME.s:589: Error: lo register required -- `orr r10,r10,r10'
Makefile:2087: recipe for target 'libglib_2_0_la-gslice.lo' failed

I guess we'll need to force -marm for libglib2.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
