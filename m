From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sat, 22 Oct 2016 16:09:12 +0200
Subject: [Buildroot] [PATCH 4/4] mfgtools: new package
In-Reply-To: <20161019172929.511eb430@free-electrons.com>
References: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
 <20161019142309.15628-5-gary.bisson@boundarydevices.com>
 <20161019172929.511eb430@free-electrons.com>
Message-ID: <CAAMH-ytfqtYZ0_SS1+KXMT7jNbzYiR6AnCNALOUwuk=a1CnxVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 19, 2016 at 5:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 19 Oct 2016 16:23:09 +0200, Gary Bisson wrote:
>> This package contains the Freescale manufacturing tool.
>> It is designed to program firmware to i.MX boards during production.
>> The communication is done over USB using the Freescale UTP protocol.
>>
>> The project is maintained on NXPMicro Github repository:
>> https://github.com/NXPmicro/mfgtools
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
> Thanks for this package.
>
>> A couple of remarks. First here is the procedure I followed to test it:
>> $ cd output
>> $ mkdir -p "Profiles/Linux/OS Firmware/firmware"
>> $ wget https://storage.googleapis.com/boundarydevices.com/ucl2.xml \
>>   -O Profiles/Linux/OS\ Firmware/ucl2.xml
>> $ cp images/u-boot.imx images/zImage images/imx6q-sabrelite.dtb \
>>   images/rootfs.cpio.uboot Profiles/Linux/OS\ Firmware/firmware/
>> $ ./host/usr/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
>>   -s dtbname=imx6q-sabrelite.dtb -s initramfs=rootfs.cpio.uboot \
>>   -s mmc=2 -p 1
>>
>> Note sure if you want this to be in the commit log.
>
> Either in the Config.in help text, or in package/mfgtools/readme.txt.
> We have already mentioned such a possibility for another package, and I
> think we should start doing it.

Ok, that sounds like a good idea.

>> Also, not sure if the DEVELOPERS file should be updated within this
>> patch or if it should be part of a follow-up patch.
>
> As a follow-up patch.

Ok.

>> +MFGTOOLS_CFLAGS = $(HOST_CFLAGS)
>> +MFGTOOLS_CFLAGS += -l pthread -Wl,-rpath=$(HOST_DIR)/usr/lib
>> +MFGTOOLS_CFLAGS += -l usb-1.0 -I$(HOST_DIR)/usr/include/libusb-1.0
>> +MFGTOOLS_CFLAGS += -L . -l MfgToolLib -I$(@D)/MfgToolLib
>> +MFGTOOLS_CFLAGS += -fpermissive -Wno-write-strings
>
> Please use:
>
> MFGTOOLS_CFLAGS = \
>         ... \
>         ... \
>         ...

Ok

> Please remove the space between -l and the library name. Also
> -Wl,-rpath=$(HOST_DIR)/usr/lib is already part of $(HOST_CFLAGS), so
> you can get rid of this part.
>
>> +define HOST_MFGTOOLS_CONFIGURE_CMDS
>> +     $(HOST_CONFIGURE_OPTS) $(MAKE) CMAKE=$(HOST_DIR)/usr/bin/cmake \
>> +             -C $(@D)/TestPrgm cmake
>> +endef
>
> This build system is really completely brain-damaged. I would suggest
> to instead use the host-cmake-package infrastructure with a proper
> _SUBDIR so that it builds the library, and then a simple post-build
> hook to build the CLI tool.
>
> And of course, submit a bug report upstream to tell them to use CMake
> for the whole thing rather than doing this crap.

Will look into this. For the upstream report, I guess the best would
be to offer a patch directly.

>> +define HOST_MFGTOOLS_INSTALL_CMDS
>> +     $(INSTALL) -D -m 755 $(@D)/TestPrgm/libMfgToolLib.so $(HOST_DIR)/usr/lib
>> +     $(INSTALL) -D -m 755 $(@D)/TestPrgm/mfgtoolcli $(HOST_DIR)/usr/bin
>
> Full destination path needed when using $(INSTALL) -D.

Ok, will try to send my v2 next week.

Thanks,
Gary
