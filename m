From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2015 00:38:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: dri
	needs arm >= v6
In-Reply-To: <1440936990-26531-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 30 Aug 2015 14:16:30 +0200")
References: <1440936990-26531-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87vbbws8q3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 >   CC       dri.lo
 > /tmp/ccc6IbbW.s: Assembler messages:
 > /tmp/ccc6IbbW.s:3114: Error: selected processor does not support ARM mode `ldrex r2,[r1]'
 > /tmp/ccc6IbbW.s:3117: Error: selected processor does not support ARM mode `strexeq r2,r0,[r1]'
 > /tmp/ccc6IbbW.s:3273: Error: selected processor does not support ARM mode `ldrex r2,[r1]'
 > /tmp/ccc6IbbW.s:3276: Error: selected processor does not support ARM mode `strexeq r2,r3,[r1]'
 > /tmp/ccc6IbbW.s:3352: Error: selected processor does not support ARM mode `ldrex r1,[r2]'
 > /tmp/ccc6IbbW.s:3355: Error: selected processor does not support ARM mode `strexeq r1,r0,[r2]'
 > /tmp/ccc6IbbW.s:3451: Error: selected processor does not support ARM mode `ldrex r3,[r2]'
 > /tmp/ccc6IbbW.s:3454: Error: selected processor does not support ARM mode `strexeq r3,ip,[r2]'
 > /tmp/ccc6IbbW.s:3522: Error: selected processor does not support ARM mode `ldrex r3,[r0]'
 > /tmp/ccc6IbbW.s:3525: Error: selected processor does not support ARM mode `strexeq r3,r1,[r0]'
 > Makefile:653: recipe for target 'dri.lo' failed
 > make[5]: *** [dri.lo] Error 1
 > make[5]: Leaving directory
 >   '/home/buildroot/buildroot/output/build/xserver_xorg-server-1.17.2/hw/xfree86/dr

Looking closer, this is really caused by the locking macros in libdrm.
 
 > -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 > +ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER)$(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5),y)

But that doesn't work as now armv4/v5 builds without mesa dri now
enables this code. We really want mesa AND NOT armv4/armv5. We normally
handle this by sticking a wellknown character in between (typically
'n'), so we get:

ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER)n$(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5),yn)

Committed with that fixed and a comment explaining why, thanks.

-- 
Bye, Peter Korsgaard
