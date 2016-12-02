From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 21:31:22 +0100
Subject: [Buildroot]
 =?utf-8?q?SH4A_target=3A_error=3A_command_line_option?=
 =?utf-8?q?_=E2=80=98-m4-nofpu=E2=80=99_is_not_supported_by_this_configura?=
 =?utf-8?q?tion?=
In-Reply-To: <DM5PR04MB0635485E4E8675471039DD12958E0@DM5PR04MB0635.namprd04.prod.outlook.com>
References: <DM5PR04MB0635AD43067B754A23B8BAEE958F0@DM5PR04MB0635.namprd04.prod.outlook.com>
 <20161202095821.0b9fc50c@free-electrons.com>
 <DM5PR04MB0635485E4E8675471039DD12958E0@DM5PR04MB0635.namprd04.prod.outlook.com>
Message-ID: <20161202213122.57dffb8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Dec 2016 18:41:11 +0000, John Gulbrandsen wrote:


> I tried to manually edit ~buildroot/output/build/linux-4.7/.config :
> 
> #
> # System type
> #
> #CONFIG_CPU_SH4=y
> CONFIG_CPU_SH4A=y
> #CONFIG_CPU_SHX3=y
> 
> But this resulted in all four CPU types being put back by buildroot when doing 'make linux'.
> 
> Why does buildroot force ' CONFIG_CPU_SH4' and ' CONFIG_CPU_SHX3' to be set?

It's not Buildroot who does that, but the Linux kernel.

You have select the SH7786 processor in your Linux kernel
configuration, through the option CPU_SUBTYPE_SH7786. This option is
defined as:

config CPU_SUBTYPE_SH7786
        bool "Support SH7786 processor"
        select CPU_SH4A
        select CPU_SHX3

And then CPU_SH4A is defined as:

config CPU_SH4A
        bool
        select CPU_SH4

So, whenever you select SH7786, it is normal to have all of CPU_SHX3,
CPU_SH4 and CPU_SH4A enabled. And I believe the intent is that SH4A is
a super-set of SH4 and SHX3, which is why all of these are selected.

However, due to this, in arch/sh/Makefile, both of those lines get
enabled:

cflags-$(CONFIG_CPU_SH4)                := $(call cc-option,-m4,) \
        $(call cc-option,-mno-implicit-fp,-m4-nofpu)
cflags-$(CONFIG_CPU_SH4A)               += $(call cc-option,-m4a,) \
                                           $(call cc-option,-m4a-nofpu,)

So it means that the cc-option make function fails, because
-mno-implicit-fp is not supported, falls back to passing -m4-nofpu,
which we don't support in Buildroot when SH4A is selected at the
architecture variant.

All in all, I'm wondering if we shouldn't patch our gcc-final.mk as
follows:

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index c9ee476..4eab3f5 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -65,12 +65,8 @@ HOST_GCC_FINAL_CONF_OPTS = \
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
-ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
-HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
-endif
-ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
-HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
+ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
+HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu,m4a,m4a-nofpu"
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
 endif

Could you try this patch and see if it works?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
