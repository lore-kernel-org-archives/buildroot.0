From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 17:33:43 +0200
Subject: [Buildroot] [git commit] toolchain-external: drop no longer
 needed CC_TARGET_<foo>_ variables
In-Reply-To: <cfa54f82-a1bb-9416-e9c9-2adb096b281a@embecosm.com> (Mark
 Corbin's message of "Mon, 1 Oct 2018 15:12:35 +0100")
References: <20181001125331.C5E498A5DE@busybox.osuosl.org>
 <cfa54f82-a1bb-9416-e9c9-2adb096b281a@embecosm.com>
Message-ID: <87zhvxptpk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark.corbin@embecosm.com> writes:

 > Hello Peter
 > I've just noticed something with this patch - see below...

 > On 01/10/18 13:52, Peter Korsgaard wrote:
 >> commit: https://git.buildroot.net/buildroot/commit/?id=e0d14fb21bc1bd3468e3b4ddc6bf20cce13dcdec
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Since the introduction of the GCC_TARGET_<foo> variables in
 >> arch/arch.mk in commit bd0640a2139119e2fdb4b384ebf32d1edcb0fdaa
 >> ("arch: allow GCC target options to be optionally overwritten") and
 >> the removal of the BR2_GCC_TARGET_CPU_REVISION, the CC_TARGET_<foo>_
 >> variables in pkg-toolchain-external.mk map 1:1 with the corresponding
 >> GCC_TARGET_<foo> variables.
 >> 
 >> So let's drop the CC_TARGET_<foo>_ variables, and use directly the
 >> GCC_TARGET_<foo> ones.
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> .../toolchain-external/pkg-toolchain-external.mk   | 56 ++++++++++------------
 >> 1 file changed, 24 insertions(+), 32 deletions(-)
 >> 
 >> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
 >> index 241a39a5ee..b1c41b0d97 100644
 >> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
 >> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
 >> @@ -151,14 +151,6 @@ TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 >> # Definition of the CFLAGS to use with the external toolchain, as well as the
 >> # common toolchain wrapper build arguments
 >> #
 >> -CC_TARGET_CPU_ := $(GCC_TARGET_CPU)
 >> -CC_TARGET_ARCH_ := $(GCC_TARGET_ARCH)
 >> -CC_TARGET_ABI_ := $(GCC_TARGET_ABI)
 >> -CC_TARGET_NAN_ := $(GCC_TARGET_NAN)
 >> -CC_TARGET_FP32_MODE_ := $(GCC_TARGET_FP32_MODE)
 >> -CC_TARGET_FPU_ := $(GCC_TARGET_FPU)
 >> -CC_TARGET_FLOAT_ABI_ := $(GCC_TARGET_FLOAT_ABI)
 >> -CC_TARGET_MODE_ := $(GCC_TARGET_MODE)
 >> 
 >> # march/mtune/floating point mode needs to be passed to the external toolchain
 >> # to select the right multilib variant
 >> @@ -166,39 +158,39 @@ ifeq ($(BR2_x86_64),y)
 >> TOOLCHAIN_EXTERNAL_CFLAGS += -m64
 >> TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_64
 >> endif
 >> -ifneq ($(CC_TARGET_ARCH_),)
 >> -TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
 >> -TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
 >> +ifneq ($(GCC_TARGET_ARCH),)
 >> +TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH)
 >> +TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(GCC_TARGET_ARCH)"'

 > ...isn't there a 'G' missing in front of the 'CC_TARGET_ARCH' in the
 > inserted TOOLCHAIN_EXTERNAL_CFLAGS line above?

Hmm, correct - I'll fix. Thanks!

-- 
Bye, Peter Korsgaard
