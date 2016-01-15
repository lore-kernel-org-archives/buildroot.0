From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jan 2016 21:43:17 +0100
Subject: [Buildroot] [PATCH] libnspr: only enable thumb if
	BR2_ARM_INSTRUCTIONS_THUMB2
In-Reply-To: <1452869536-13918-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 15 Jan 2016 15:52:16 +0100")
References: <1452869536-13918-1-git-send-email-arnout@mind.be>
Message-ID: <878u3qy3oa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > libnspr currently passes --enable-thumb2 if the CPU has thumb
 > instructions. This option will pass -mthumb to the compiler. However,
 > if an external multilib toolchain is used that has a thumb-specific
 > variant, it will try to use that one. But we only copy a single variant
 > to the sysroot, so the build will fail with:

 > In order to fix this, only enable thumb2 when we are really using
 > thumb2. Note that it is still necessary to pass this option, cfr.
 > http://autobuild.buildroot.org/results/d7323831372050e425a34f5104a46d8cbd6be214

 > We could have chosen to still enable thumb2 with the internal toolchain.
 > However, that would mean we create a discrepancy between the result of
 > building with the same (buildroot) toolchain when it is used as an
 > internal one or as an external one. To avoid potentially surprising
 > results, just stick to the option chosen for the rest of the rootfs.

Why do we actually ever pass --enable-thumb2 / --disable-thumb2? As far
as I can see, the only thing this does is adding -marm / -mthumb to
CFLAGS, and we already pass the correct -m<arm/thumb> option in the
toolchain wrapper.

-- 
Bye, Peter Korsgaard
