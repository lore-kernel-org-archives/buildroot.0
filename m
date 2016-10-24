From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 24 Oct 2016 11:58:15 -0400
Subject: [Buildroot] [PATCH 4/4] mfgtools: new package
In-Reply-To: <CAAMH-ysyagimdb6+rk1Nq5JpYUkqwsBKAoRoRsz_E3c1i-yO0g@mail.gmail.com>
References: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
 <20161019142309.15628-5-gary.bisson@boundarydevices.com>
 <CA+-urNRE0tx7RL-5WQCVqbiywUxu8eW1AJDP4vjPoWadkhN+xQ@mail.gmail.com>
 <CAAMH-ysyagimdb6+rk1Nq5JpYUkqwsBKAoRoRsz_E3c1i-yO0g@mail.gmail.com>
Message-ID: <CA+-urNRFcDDP-s6KO7XWO_hrW6YNYLWBknEg6Dsb=GeeBS5Vqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Sat, Oct 22, 2016 at 10:15 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> Hi Frank,
>
> On Thu, Oct 20, 2016 at 5:43 PM, Frank Hunleth
> <fhunleth@troodon-software.com> wrote:
>> Hi Gary,
>>
>> Thanks - your timing on submitting the mfgtools was really good. Some
>> comments below:
>
> Good to hear someone is already using it.

Well, I was hopeful to not have to run an existing manufacturing
script in the Windows version of mfgtools. Until I saw your patch, I
didn't even know that a Linux version of mfgtools existed.

>
>> On Wed, Oct 19, 2016 at 10:23 AM, Gary Bisson
>> <gary.bisson@boundarydevices.com> wrote:
>>> This package contains the Freescale manufacturing tool.
>>> It is designed to program firmware to i.MX boards during production.
>>> The communication is done over USB using the Freescale UTP protocol.
>>>
>>> The project is maintained on NXPMicro Github repository:
>>> https://github.com/NXPmicro/mfgtools
>>>
>>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>>> ---
>>> Hi,
>>>
>>> A couple of remarks. First here is the procedure I followed to test it:
>>> $ cd output
>>> $ mkdir -p "Profiles/Linux/OS Firmware/firmware"
>>> $ wget https://storage.googleapis.com/boundarydevices.com/ucl2.xml \
>>>   -O Profiles/Linux/OS\ Firmware/ucl2.xml
>>> $ cp images/u-boot.imx images/zImage images/imx6q-sabrelite.dtb \
>>>   images/rootfs.cpio.uboot Profiles/Linux/OS\ Firmware/firmware/
>>> $ ./host/usr/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
>>>   -s dtbname=imx6q-sabrelite.dtb -s initramfs=rootfs.cpio.uboot \
>>>   -s mmc=2 -p 1
>>>
>>> Note sure if you want this to be in the commit log.
>>>
>>> Also, not sure if the DEVELOPERS file should be updated within this
>>> patch or if it should be part of a follow-up patch.
>>>
>>> Regards,
>>> Gary
>>> ---
>>>  package/Config.in.host          |  1 +
>>>  package/mfgtools/Config.in.host | 10 ++++++++++
>>>  package/mfgtools/mfgtools.hash  |  2 ++
>>>  package/mfgtools/mfgtools.mk    | 34 ++++++++++++++++++++++++++++++++++
>>>  4 files changed, 47 insertions(+)
>>>  create mode 100644 package/mfgtools/Config.in.host
>>>  create mode 100644 package/mfgtools/mfgtools.hash
>>>  create mode 100644 package/mfgtools/mfgtools.mk
>>>
>>> diff --git a/package/Config.in.host b/package/Config.in.host
>>> index 1140c70..e33cbb5 100644
>>> --- a/package/Config.in.host
>>> +++ b/package/Config.in.host
>>> @@ -22,6 +22,7 @@ menu "Host utilities"
>>>         source "package/jq/Config.in.host"
>>>         source "package/jsmin/Config.in.host"
>>>         source "package/lpc3250loader/Config.in.host"
>>> +       source "package/mfgtools/Config.in.host"
>>>         source "package/mke2img/Config.in.host"
>>>         source "package/mkpasswd/Config.in.host"
>>>         source "package/mtd/Config.in.host"
>>> diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
>>> new file mode 100644
>>> index 0000000..8bba9e2
>>> --- /dev/null
>>> +++ b/package/mfgtools/Config.in.host
>>> @@ -0,0 +1,10 @@
>>> +config BR2_PACKAGE_HOST_MFGTOOLS
>>> +       bool "host mfgtools"
>>> +       depends on BR2_arm
>>> +       help
>>> +         This package contains the Freescale manufacturing tool.
>>> +         It is designed to program firmware to i.MX boards during
>>> +         production. The communication is done over USB using the
>>> +         Freescale UTP protocol.
>>> +
>>> +         https://github.com/NXPmicro/mfgtools
>>> diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
>>> new file mode 100644
>>> index 0000000..e73a7fa
>>> --- /dev/null
>>> +++ b/package/mfgtools/mfgtools.hash
>>> @@ -0,0 +1,2 @@
>>> +# locally computed
>>> +sha256  6ce93a33c269282df305cf7e517d2d14fde78203537d8ea75b064966afe48464  mfgtools-b219fc219a35c365010897ed093c40750f8cdac6.tar.gz
>>> diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
>>> new file mode 100644
>>> index 0000000..c5f9ad0
>>> --- /dev/null
>>> +++ b/package/mfgtools/mfgtools.mk
>>> @@ -0,0 +1,34 @@
>>> +################################################################################
>>> +#
>>> +# mfgtools
>>> +#
>>> +################################################################################
>>> +
>>> +MFGTOOLS_VERSION = b219fc219a35c365010897ed093c40750f8cdac6
>>> +MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,$(MFGTOOLS_VERSION))
>>> +MFGTOOLS_LICENSE = Freescale Proprietary License
>>
>> The license is BSD-3c with a couple files covered by the Code Project License.
>
> I'm no good with licenses, indeed I just checked the BSD-3C and it
> looks like it, I expected the license name to be in the header text
> (like the GPL or Apache).

Upstream actually wasn't very good with their license documentation.
Before I wrote you, I confirmed the license with them since there were
several inconsistencies.

>
>>> +MFGTOOLS_LICENSE_FILES = LICENSE
>>> +HOST_MFGTOOLS_DEPENDENCIES = host-cmake host-libusb
>>> +
>>> +MFGTOOLS_CFLAGS = $(HOST_CFLAGS)
>>> +MFGTOOLS_CFLAGS += -l pthread -Wl,-rpath=$(HOST_DIR)/usr/lib
>>> +MFGTOOLS_CFLAGS += -l usb-1.0 -I$(HOST_DIR)/usr/include/libusb-1.0
>>> +MFGTOOLS_CFLAGS += -L . -l MfgToolLib -I$(@D)/MfgToolLib
>>> +MFGTOOLS_CFLAGS += -fpermissive -Wno-write-strings
>>
>> I had to add "-std=c++11" to get it to compile on my system. If I
>> didn't do this, I'd get errors from std:stoi not being defined. Their
>> Makefile added this as well.
>
> hmm, that is in their Makefile indeed, which GCC version are you using?

gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.2)

>
>> I would add a "TestedBy", but the tool is so flaky for me that I'm not
>> sure if I really tested it. It did upload u-boot and Linux to my board
>> (custom iMX6) and rebooted to run the programming script, but I never
>> could get it to get all the way through the programming script. I
>> don't think that's your issue, though.
>
> What happens exactly? I've generated an initramfs for the target that
> includes uuc and it was ok. Actually I had to do one thing manually
> which was to modprobe the g_mass_storage module manually. I need to
> add it to the init scripts but I'm not sure how to do that in the
> systemd service file, I need to look at it.

I'm using a pre-existing 'ucl2.xml' that came with binaries for the
loader versions of U-Boot and Linux. I'm including it below since it's
not too long. The "BootStrap" stsps appeared to work. The "Updater"
steps hung at the "Sending U-Boot" command. I'm not convinced that the
other steps really worked, though, since it took them quite a while to
run like they may have just timed out. Since I rarely need to run this
script, I wasn't planning on debugging it. Maybe this will give you
some hints, though?

<UCL>
  <CFG>
    <STATE name="BootStrap" dev="MX6D" vid="15A2" pid="0061"/>
    <STATE name="Updater"   dev="MSC" vid="066F" pid="37FF"/>
  </CFG>
<!--
  The following Lists are for i.MX6Solo/DualLite chips
-->
<LIST name="i.MX6DL-ubuntu-SabreSD-eMMC-uImage" desc="Choose eMMC
android as media">
    <CMD state="BootStrap" type="boot" body="BootStrap" file
="u-boot-mx6dl-sabresd.bin" >Loading U-boot</CMD>
    <CMD state="BootStrap" type="load" file="uImage" address="0x10800000"
        loadSection="OTH" setSection="OTH" HasFlashHeader="FALSE"
>Loading Kernel.</CMD>
    <CMD state="BootStrap" type="load" file="initramfs.cpio.gz.uboot"
address="0x10C00000"
        loadSection="OTH" setSection="OTH" HasFlashHeader="FALSE"
>Loading Initramfs.</CMD>
    <CMD state="BootStrap" type="jump" > Jumping to OS image. </CMD>

    <CMD state="Updater" type="push" body="$ ls /dev/*"/>
        <CMD state="Updater" type="push" body="$ dd if=/dev/zero
of=/dev/mmcblk0 bs=512 seek=1536 count=16">clean up u-boot
parameter</CMD>
        <!--
    <CMD state="Updater" type="push" body="$ echo 1 >
/sys/devices/platform/sdhci-esdhc-imx.3/mmc_host/mmc0/mmc0:0001/boot_config">access
boot partition 1</CMD>
    <CMD state="Updater" type="push" body="send"
file="files/u-boot-dyn.bin">Sending U-Boot</CMD>
    <CMD state="Updater" type="push" body="$ dd if=$FILE
of=/dev/mmcblk0 bs=512 seek=2 skip=2">write U-Boot to sd card</CMD>
    <CMD state="Updater" type="push" body="$ echo 8 >
/sys/devices/platform/sdhci-esdhc-imx.3/mmc_host/mmc0/mmc0:0001/boot_config">access
user partition and enable boot partion 1 to boot</CMD>
-->
    <CMD state="Updater" type="push" body="send"
file="files/uImage-ecol">Sending kernel uImage</CMD>
    <CMD state="Updater" type="push" body="$ dd if=$FILE
of=/dev/mmcblk0 bs=1M seek=1 conv=fsync">write kernel image to sd
card</CMD>

    <CMD state="Updater" type="push" body="$ echo Update Complete!">Done</CMD>
</LIST>
</UCL>

Thanks,
Frank
