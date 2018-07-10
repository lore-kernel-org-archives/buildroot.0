From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 10 Jul 2018 23:54:31 +0200
Subject: [Buildroot] [PATCH v4 1/3] uboot: zynqmp: allow to use custom
 psu_init files
In-Reply-To: <6b428669-ea55-efe8-d0fa-aa97287824a9@gmail.com>
References: <mailman.4777.1529627642.16495.buildroot@busybox.net>
 <6b428669-ea55-efe8-d0fa-aa97287824a9@gmail.com>
Message-ID: <7e3f3d75-15d8-f778-ef25-5e2b0b959f72@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joel,

On 09/07/2018 21:07, Joel Carlson wrote:
> Hello,
> 
> I've been using the v3 form of your patches to get our Zynqmp board
> booting. This morning I upgraded our U-Boot from v2018.05 to v2018.07,
> and on my 2018.05 buildroot branch I removed the v3 patches and applied
> the v4 ones. I had a few issues with this patch.

Good to know this work is useful to somebody!

Thank you for your report, see below my comments.

> On 06/21/2018 03:26 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> 
> <snip>
>> diff --git
>> a/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
>> b/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
>>
>> new file mode 100644
>> index 000000000000..ab8108ee0c6a
>> --- /dev/null
>> +++
>> b/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
>>
>> @@ -0,0 +1,175 @@
>> +From 4c9d54ab5a41d65000c8d249b6fb1b76056f1812 Mon Sep 17 00:00:00 2001
>> +From: Luca Ceresoli<luca@lucaceresoli.net>
>> +Date: Wed, 20 Jun 2018 12:11:50 +0200
>> +Subject: [PATCH] arm/arm64: zynq/zynqmp: pass the PS init file as a
>> kconfig
>> + variable
>> +
>> +U-Boot needs to link ps7_init_gpl.c on Zynq or psu_init_gpl.c on
>> +ZynqMP (PS init for short). The current logic to locate this file for
>> +both platforms is:
>> +
>> + 1. if a board-specific file exists in
>> +??? board/xilinx/zynq[mp]/$(CONFIG_DEFAULT_DEVICE_TREE)/ps?_init_gpl.c
>> +??? then use it
>> + 2. otherwise use board/xilinx/zynq/ps?_init_gpl.c
>> +
>> +In the latter case the file does not exist in the U-Boot sources and
>> +must be copied in the source tree from the outside before starting the
>> +build. This is typical when it is generated from Xilinx tools while
>> +developing a custom hardware. However making sure that a
>> +board-specific file is_not_? found (and used) requires some trickery
>> +such as removing or overwriting all PS init files (e.g.: the current
>> +meta-xilinx yocto layer [0]).
>> +
>> +This generates a few problems:
>> +
>> + * if the source tree is shared among different out-of-tree builds,
>> +?? they will pollute (and potentially corrupt) each other
>> + * the source tree cannot be read-only
>> + * any buildsystem must add a command to copy the PS init file binary
>> + * overwriting or deleting files in the source tree is ugly as hell
>> +
>> +Simplify usage by allowing to pass the path to the desired PS init
>> +file in kconfig variable XILINX_PS_INIT_FILE. It can be an absolute
>> +path or relative to $(srctree). If the variable is set, the
>> +user-specified file will always be used without being copied
>> +around. If the the variable is left empty, for backward compatibility
>> +fall back to the old behaviour.
>> +
>> +Since the issue is the same for Zynq and ZynqMP, add one kconfig
>> +variable in a common place and use it for both.
>> +
>> +Also use the new kconfig help text to document all the ways to give
>> +U-Boot the PS init file.
>> +
>> +Build-tested with all combinations of:
>> + - platform: zynq or zynqmp
>> + - PS init file: from XILINX_PS_INIT_FILE (absolute, relative path,
>> +?? non-existing), in-tree board-specific, in board/xilinx/zynq[mp]/
>> + - building in-tree, in subdir, in other directory
>> +
>> +[0]https://github.com/Xilinx/meta-xilinx/blob/b2f74cc7fe5c4881589d5e440a17cb51fc66a7ab/meta-xilinx-bsp/recipes-bsp/u-boot/u-boot-spl-zynq-init.inc#L9
>>
>> +
>> +Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>> +Cc: Albert Aribaud<albert.u.boot@aribaud.net>
>> +Cc: Michal Simek<michal.simek@xilinx.com>
>> +Cc: Nathan Rossi<nathan@nathanrossi.com>
>> +Submitted upstream:https://patchwork.ozlabs.org/patch/932392/?
>> (slightly adapted to fix conflicts)
>> +---
>> + arch/arm/Kconfig???????????? |? 1 +
>> + board/xilinx/Kconfig???????? | 41
>> +++++++++++++++++++++++++++++++++++++++++
>> + board/xilinx/zynq/Makefile?? | 10 +++++++++-
>> + board/xilinx/zynqmp/Makefile | 10 +++++++++-
>> + 4 files changed, 60 insertions(+), 2 deletions(-)
>> + create mode 100644 board/xilinx/Kconfig
>> +
>> +diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> +index 22234cde2ab6..e04979d0ef7e 100644
>> +--- a/arch/arm/Kconfig
>> ++++ b/arch/arm/Kconfig
>> +@@ -1293,4 +1293,5 @@ source "board/technologic/ts4600/Kconfig"
>> + source "board/vscom/baltos/Kconfig"
>> + source "board/woodburn/Kconfig"
>> + source "board/work-microwave/work_92105/Kconfig"
>> ++source "board/xilinx/Kconfig"
> 
> This patch does not apply with U-Boot 2018.07 - I don't know which
> version of U-Boot it is desired to maintain compatibility against. But
> it was a pretty small change to make it apply again, just adding:
>> source "board/xilinx/zynqmp/Kconfig"
> below the line the patch adds.

Yes, IIRC that's the only relevant difference between this patch and the
one that got applied (https://patchwork.ozlabs.org/patch/933198/).
However supporting a more recent version of U-Boot will probably require
an extra work that I'd rather leave as a future improvement.

BTW, how are you building your PMU firmware?

> <snip>
>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>> index 03bd7ea743ed..e4571a6ccf9f 100644
>> --- a/boot/uboot/uboot.mk
>> +++ b/boot/uboot/uboot.mk
>> @@ -274,6 +274,17 @@ define UBOOT_INSTALL_IMAGES_CMDS
>> ????????????? $(BINARIES_DIR)/boot.scr)
>> ? endef
>> ? +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>> +
>> +ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE)),)
>> +define UBOOT_ZYNQMP_KCONFIG_PSU_INIT
>> +??? $(call
>> KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(TOPDIR)/$(call
>> qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE))", \
>> +?????????? $(@D)/.config)
> 
> I think you should get rid of the "$(TOPDIR)/" part and let the user
> specify it as part of BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE if needed.
> My psu_init files are in a path that I reference via BR2_EXTERNAL, so
> having $(TOPDIR) prepended messed up the path to my files.

Uhm, my mistake, as I've never user BR2_EXTERNAL I tend to forget to
test it... Sorry about that.

Since the kconfig option we're setting here will be evaulated during the
build process, which will happen in another directory
($O/build/uboot-*/), I chose to tranform that path to an absolute one
using $TOPDIR.

But as you noticed this is not a correct solution. At first sight we
should rather copy the file in a proper place (sysroot or
$O/build/uboot-*/) and then point the kconfig option to that path. I'll
have a look to this, as well as to your comments to patch 2.

Bye,
-- 
Luca
