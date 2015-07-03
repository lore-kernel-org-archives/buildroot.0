From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Jul 2015 22:00:35 +0200
Subject: [Buildroot] [PATCH v3 1/2] host-zynq-boot-bin: new package
In-Reply-To: <20150703173306.GA3652@free.fr>
References: <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <20150703173306.GA3652@free.fr>
Message-ID: <5596E9E3.2020909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/15 19:33, Yann E. MORIN wrote:
> Jan, All,
> 
> On 2015-06-23 14:49 +0200, Jan Viktorin spake thusly:
>> From: Jan Viktorin <viktorin@rehivetech.com>
>>
>> The package creates file images/boot.bin to boot
>> Xilinx Zynq based boards. It might not work with
>> U-Boot older then 2015.07.
>>
>> The script zynq-boot-bin.py is contained in the
>> Xilinx repository of U-Boot (it is not in upstream).
>>
>> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> [--SNIP--]
>> diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
>> new file mode 100644
>> index 0000000..aff4593
>> --- /dev/null
>> +++ b/package/zynq-boot-bin/zynq-boot-bin.mk
>> @@ -0,0 +1,24 @@
>> +################################################################################
>> +#
>> +# zynq-boot-bin
>> +#
>> +################################################################################
>> +
>> +ZYNQ_BOOT_BIN_VERSION = xilinx-v2015.1
>> +ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
>> +ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/$(ZYNQ_BOOT_BIN_VERSION)/tools
> 
> Missing licensing information:
>     ZYNQ_BOOT_BIN_LICENSE = foo license...
>     ZYNQ_BOOT_BIN_LICENSE_FILES = License-file
> 
>> +HOST_ZYNQ_BOOT_BIN_INSTALL_STAGING = NO
>> +HOST_ZYNQ_BOOT_BIN_INSTALL_IMAGES = YES
> 
> Since this is a host-only package, you need not specify either;
>   - install_staging already defaults to no,
>   - both are anyway only valid for target packages.

 But actually, it's not a host package, it's a target package. Took me some time
to realize that however :-) See below.

> 
>> +HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = uboot
>> +
>> +define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
>> +	@cp $(DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
>> +endef
>> +
>> +define HOST_ZYNQ_BOOT_BIN_BUILD_CMDS
>> +	@env python2 $(@D)/zynq-boot-bin.py -o $(BINARIES_DIR)/boot.bin \
> 
> That mught be an indication that it should depend on host-python, no?

 Actually, no, we actually require a system-python to exist. I think it also
needs to be python2 though we don't check for that. And to be honest, I have no
idea why we require it...

 But I certainly wouldn't like to have to build a host-python just to be able to
build the boot loader... So I'm glad there's no dependency on host-python.

> 
>> +		-u $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)))
>> +endef
> 
> Although what you wrote does work, it is not absolutely correct: the
> build commands should just really build, not install anything in the
> output directories.

 +1.

> 
> You should generate the files in the package build directory, and
> provide a command that does the install (even if it is just copying the
> generated files).
> 
>> +$(eval $(host-generic-package))
> 
> But, then since you install in $(BINARIES_DIR), which is definitely not
> what we usually do for host  packages. The expected output of a host
> package is to install something in $(HOST_DIR), so that it can later be
> used (e.g. by another package, or by a post-build/post-image script)
> 
> Here's what I think should be done:
> 
>     ZYNQ_BOOT_BIN_VERSION = xilinx-v2015.1
>     ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
>     ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/$(ZYNQ_BOOT_BIN_VERSION)/tools
>     ZYNQ_BOOT_BIN_LICENSE = GPLv3+
>     # No license file, license in file itself
> 
>     HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
> 
>     define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
>         @cp $(DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) \
>         $(HOST_DIR)/usr/bin/$(ZYNQ_BOOT_BIN_SOURCE)
>     endef
> 
>     $(eval $(hhost-generic-package))
> 
> And then in the board README file, state something along the lines:
> 
>     ---8<---
>     To finalise the boot device, run the following command:
> 
>       $ ./output/host/usr/bin/zynq-boot-bin.py \
>             -u output/images/boot.bin \
>             -o /path/to/the/boot-stuff
>     ---8<---
> 
> (you get the idea)

 That's what Jan originally had, but I told him to do it this way :-)

 You can view zynq-boot-bin as something which really should be part of uboot.
The only point of this "program" is to create the bootloader. It will never be
applied on anything except the bootloader. It doesn't need any additional
configuration or command line arguments. So it would be quite pointless to burde
the user with writing that stuff in a post-build script.

 Perhaps, however, it should go into the boot/ directory instead of packages. It
is, after all, a pre-bootloader, like at91bootstrap.

> 
> Note: that's what we do for the Raspberry Pi, for example, where we
> install the 'mkknlimg' utility in $(HOST_DIR) and tell the user how to
> use it in the board readme file:

 I think the same approach could be taken there. Though I can't say I understand
much of all the hoops you have to jump through to boot an RPi.

 Regards,
 Arnout

> 
>     ---8<---
>     The kernel image must be marked with a special header so that the
>     bootloader of the RaspberryPi knows it supports Device Tree:
> 
>       $ ./output/host/usr/bin/mkknlimg output/images/zImage \
>                                        /mnt/mountpointboot/zImage
>     ---8<---
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
