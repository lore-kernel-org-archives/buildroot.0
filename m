From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:29:32 +0200
Subject: [Buildroot] [PATCHv3 11/14] arch/arm: add support for Thumb2
In-Reply-To: <1373961805-3901-12-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:22 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sizezl8j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Until now, we were using the default ARM instruction set, as used by
 Thomas> the toolchain: the 32 bits ARM instruction set for the internal
 Thomas> backend, and for external toolchain, whatever default was chosen when
 Thomas> the toolchain was generated.

 Thomas> This commit adds support for the Thumb2 instruction set. To do so, it:

 Thomas>  * provides a menuconfig choice between ARM and Thumb2. The choice is
 Thomas>    only shown when Thumb2 is supported, i.e on ARMv7-A CPUs.

 Thomas>  * passes the --with-mode={arm,thumb} option when building gcc in the
 Thomas>    internal backend. This tells the compiler which type of
 Thomas>    instructions it should generate.

 Thomas>  * passes the m{arm,thumb} option in the external toolchain
 Thomas>    wrapper. ARM and Thumb2 code can freely be mixed together, so the
 Thomas>    fact that the C library has been built either ARM or Thumb2 and
 Thomas>    that the rest of the code is built Thumb2 or ARM is not a problem.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  arch/Config.in                                     |  6 ++++
 Thomas>  arch/Config.in.arm                                 | 36 ++++++++++++++++++++++
 Thomas>  package/gcc/gcc.mk                                 |  5 +++
 Thomas>  toolchain/toolchain-external/ext-tool.mk           |  5 +++
 Thomas>  .../toolchain-external/ext-toolchain-wrapper.c     |  3 ++
 Thomas>  5 files changed, 55 insertions(+)


 Thomas> +++ b/package/gcc/gcc.mk
 Thomas> @@ -177,6 +177,11 @@ ifneq ($(GCC_TARGET_FLOAT_ABI),)
 Thomas>  HOST_GCC_COMMON_CONF_OPT += --with-float=$(GCC_TARGET_FLOAT_ABI)
 Thomas>  endif
 
 Thomas> +GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
 Thomas> +ifneq ($(GCC_TARGET_MODE),y)

This should check against the empty string and not 'y'.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
