From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jun 2018 19:17:05 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/binutils: Cortex-M targets
 require version <2.29
In-Reply-To: <20180601154209.GB3841@scaer> (Yann E. MORIN's message of "Fri, 1
 Jun 2018 17:42:09 +0200")
References: <1527772887-31616-1-git-send-email-christophe.priouzeau@st.com>
 <1527772887-31616-3-git-send-email-christophe.priouzeau@st.com>
 <20180601154209.GB3841@scaer>
Message-ID: <87sh66xw8e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Christophe, All,
 > On 2018-05-31 13:21 +0000, Christophe PRIOUZEAU spake thusly:
 >> From: Laurent GONZALEZ <br22@gezedo.com>
 >> 
 >> binutils 2.29 changed the implementation of adr pseudo instruction
 >> it breaks linux kernel and impacts Cortex-M targets (eg. stm32)
 >> 
 >> Signed-off-by: Laurent GONZALEZ <br22@gezedo.com>
 >> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
 >> ---
 >> package/binutils/Config.in.host | 5 +++--
 >> 1 file changed, 3 insertions(+), 2 deletions(-)
 >> 
 >> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
 >> index 03b2281..9a4caad 100644
 >> --- a/package/binutils/Config.in.host
 >> +++ b/package/binutils/Config.in.host
 >> @@ -2,8 +2,9 @@ comment "Binutils Options"
 >> 
 >> choice
 >> prompt "Binutils Version"
 >> -	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
 >> -	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 >> +	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M

 > Again, isn't it the fact that a Thumb-mode compilation is attempted, so
 > we'd trigger the same issue when building in Thumb mode for (e.g.) a
 > cortex-a CPU as well?

Yes, it looks like you are right. Lacking hardware at hand I did a test
build of qemu_arm_vexpress:

default, E.G. binutils 2.29, ARM instructions: OK
2.28, THUMB2_KERNEL / BR2_ARM_INSTRUCTIONS_THUMB2: OK
2.29, THUMB2_KERNEL / BR2_ARM_INSTRUCTIONS_THUMB2: FAIL

It crashes in init:

devtmpfs: mounted
Freeing unused kernel memory: 1024K
Internal error: Oops - undefined instruction: 0 [#1] SMP THUMB2
Modules linked in:
CPU: 0 PID: 1 Comm: init Not tainted 4.16.7 #1
Hardware name: ARM-Versatile Express
PC is at ret_fast_syscall+0x4/0x62

See https://pastebin.com/VdtBWEgi for the complete boot log.

So I guess we should change the BR2_ARM_CPU_ARMV7M to
BR2_ARM_INSTRUCTIONS_THUMB2.

-- 
Bye, Peter Korsgaard
