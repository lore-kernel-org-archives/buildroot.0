From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 09:58:21 +0100
Subject: [Buildroot]
 =?utf-8?q?SH4A_target=3A_error=3A_command_line_option?=
 =?utf-8?q?_=E2=80=98-m4-nofpu=E2=80=99_is_not_supported_by_this_configura?=
 =?utf-8?q?tion?=
In-Reply-To: <DM5PR04MB0635AD43067B754A23B8BAEE958F0@DM5PR04MB0635.namprd04.prod.outlook.com>
References: <DM5PR04MB0635AD43067B754A23B8BAEE958F0@DM5PR04MB0635.namprd04.prod.outlook.com>
Message-ID: <20161202095821.0b9fc50c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, thanks for your detailed bug report. It's very nice to
have such a minimal Buildroot .config and kernel configuration to
easily reproduce the problem.

On Thu, 1 Dec 2016 23:59:04 +0000, John Gulbrandsen wrote:

> I?m attempting to use buildroot to create cross-compiler, Linux kernel, boot loader etc. for a custom board that uses a Hitachi SH7786 CPU that has two SH4A CPU cores. It appears something goes wrong in the Linux build when a SH4A target CPU is selected in menuconfig. When a SH4 CPU is selected, everything builds fine but I would rather configure the build for my exact CPU. How do I fix this?
> 
> Note that I have tried to use these additional GCC settings but no difference:
> BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4a,m4a-nofpu"
> BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
> 
> See below for make (verbose) output. The below build uses this extra GCC options: BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4a,m4a-nofpu"

We are already passing those options to the gcc build. From
package/gcc/gcc-final/gcc-final.mk:

# The kernel wants to use the -m4-nofpu option to make sure that it
# doesn't use floating point operations.
ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
endif
ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
endif

So I believe your problem is a mismatch between your CPU selection at
the Buildroot level and at the kernel level. You have configured your
Buildroot for SH4A (so the compiler supports m4a/m4a-nofpu), but the CPU
selected in the kernel configuration is a SH4, so the kernel uses the
-m4-nofpu option.

Here is what the kernel is doing:

cflags-$(CONFIG_CPU_SH4)                := $(call cc-option,-m4,) \
        $(call cc-option,-mno-implicit-fp,-m4-nofpu)
cflags-$(CONFIG_CPU_SH4A)               += $(call cc-option,-m4a,) \
                                           $(call cc-option,-m4a-nofpu,)

So, you need to either:

 - Adjust your Buildroot configuration to use SH4

 - Adjust your Linux kernel configuration to use a SH4A

I will run some test builds to verify my theory.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
