From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 29 May 2018 22:45:25 +0200
Subject: [Buildroot] [PATCH v3 3/5] uboot: zynqmp: allow to use custom
 psu_init files
In-Reply-To: <20180528224912.539b05f6@windsurf.home>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
 <1525364617-23633-4-git-send-email-luca@lucaceresoli.net>
 <20180528224912.539b05f6@windsurf.home>
Message-ID: <a61417d4-fa49-cbbb-c51f-a88f72dcb30e@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 28/05/2018 22:49, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu,  3 May 2018 18:23:35 +0200, Luca Ceresoli wrote:
> 
>> +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>> +
>> +ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_DIR)),)
> 
> It'd be nice to have an intermediate UBOOT_ZYNQMP_PSU_INIT_DIR variable
> instead of calculating its qstripped value twice.
> 
>> +define UBOOT_ZYNQMP_COPY_PSU_INIT
>> +# In U-Boot's board/xilinx/zynqmp/Makefile the bundled psu_init_gpl.c
>> +# has precedence over ours if placed in a subdir whose name matches
>> +# CONFIG_DEFAULT_DEVICE_TREE. Delete them all to be sure we use ours.
>> +	rm -f $(@D)/board/xilinx/zynqmp/*/psu_init*.[ch]
>> +	cp $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_DIR))/psu_init_gpl.[ch] \
>> +	   $(@D)/board/xilinx/zynqmp/
> 
> However, the bigger question is why do we need this in the first
> place ? This is in fact just patching the U-Boot source code. Why not
> use a patch instead ? Aren't people in general anyway going to have
> their own custom U-Boot Git tree, in which they will version control
> their psu_init files ?

Of course course having a custom U-Boot tree with these files versioned
is a valid workflow, which does not need the present patch. But there
are other valid use cases.

> Since this really looks like a specialized patching step, I'm not sure
> it really makes sense to add this. Unless you can convince me
> otherwise :-)

The psu_init files are special because they contain
automatically-generated code to configure the SoC peripherals: enable
devices, set pinmuxes etc, which is not otherwise done at runtime. Have
a look at a few examples: [0] [1].

This file will change whenever the hardware *or* the configuration
changes (e.g. to enable peripherals).

It is perfectly fine if one wants to use a mainline U-Boot release or a
Xilinx release, unmodified, that works fine... *except* for the psu_init
file. With your proposed workflow all users will be forced to use a
custom git tree, just because they have a slightly different psu_init
file. With my patch these users can just use a "standard" U-Boot
(downloaded straight from the Internet), throw a psu_init file in their
Buildroot boards/ dir and change their Buildroot config to point to it.

Even though it's technically code, you can consider the psu_init
somewhat like a configuration file.

Did I convince you? :-)

[0]
http://git.denx.de/?p=u-boot.git;a=blob;f=board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c;h=fcd6a46ad9ffa0da06c4f0a67c2397aa4128ca29;hb=HEAD
[1]
http://git.denx.de/?p=u-boot.git;a=blob;f=board/xilinx/zynqmp/zynqmp-zcu102-revA/psu_init_gpl.c;h=5f21c4747584815ba86e50a36906b6c1fe8af1ca;hb=HEAD

Regards,
-- 
Luca
