From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 01 Jul 2019 21:47:09 +0000
Subject: [Buildroot] [Bug 11996] opencv3 SIGILL on Cortex-A5 with VFPv4-D16
In-Reply-To: <bug-11996-163@https.bugs.busybox.net/>
References: <bug-11996-163@https.bugs.busybox.net/>
Message-ID: <bug-11996-163-b3eE6ncpmK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11996

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
> I think this code in opencv3.mk is wrong (or maybe the ARM fpu config options
> are wrong):
>
> ifeq ($(BR2_ARCH_IS_64):$(BR2_ARM_CPU_HAS_VFPV3),:y)
> OPENCV3_CONF_OPTS += -DENABLE_VFPV3=ON
> else
> OPENCV3_CONF_OPTS += -DENABLE_VFPV3=OFF
> endif
> 
> Apparently I have BR2_ARM_CPU_HAS_VFPV3 set (even though I only have the 
> -D16 version), but when you pass -DENABLE_VFPV3=ON to OpenCV, it passes 
> -mfpu=vfpv3 to the compiler and this is what's causing the SIGILL.

If the only thing that ENABLE_VFPV3 does is to set the -mfpu=... option, then
we should just always set it to OFF, because we already pass that option.

Same for NEON, by the way.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
