From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sat, 22 Oct 2016 16:15:39 +0200
Subject: [Buildroot] [PATCH 4/4] mfgtools: new package
In-Reply-To: <CA+-urNRE0tx7RL-5WQCVqbiywUxu8eW1AJDP4vjPoWadkhN+xQ@mail.gmail.com>
References: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
 <20161019142309.15628-5-gary.bisson@boundarydevices.com>
 <CA+-urNRE0tx7RL-5WQCVqbiywUxu8eW1AJDP4vjPoWadkhN+xQ@mail.gmail.com>
Message-ID: <CAAMH-ysyagimdb6+rk1Nq5JpYUkqwsBKAoRoRsz_E3c1i-yO0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

On Thu, Oct 20, 2016 at 5:43 PM, Frank Hunleth
<fhunleth@troodon-software.com> wrote:
> Hi Gary,
>
> Thanks - your timing on submitting the mfgtools was really good. Some
> comments below:

Good to hear someone is already using it.

> On Wed, Oct 19, 2016 at 10:23 AM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>> This package contains the Freescale manufacturing tool.
>> It is designed to program firmware to i.MX boards during production.
>> The communication is done over USB using the Freescale UTP protocol.
>>
>> The project is maintained on NXPMicro Github repository:
>> https://github.com/NXPmicro/mfgtools
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>> Hi,
>>
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
>>
>> Also, not sure if the DEVELOPERS file should be updated within this
>> patch or if it should be part of a follow-up patch.
>>
>> Regards,
>> Gary
>> ---
>>  package/Config.in.host          |  1 +
>>  package/mfgtools/Config.in.host | 10 ++++++++++
>>  package/mfgtools/mfgtools.hash  |  2 ++
>>  package/mfgtools/mfgtools.mk    | 34 ++++++++++++++++++++++++++++++++++
>>  4 files changed, 47 insertions(+)
>>  create mode 100644 package/mfgtools/Config.in.host
>>  create mode 100644 package/mfgtools/mfgtools.hash
>>  create mode 100644 package/mfgtools/mfgtools.mk
>>
>> diff --git a/package/Config.in.host b/package/Config.in.host
>> index 1140c70..e33cbb5 100644
>> --- a/package/Config.in.host
>> +++ b/package/Config.in.host
>> @@ -22,6 +22,7 @@ menu "Host utilities"
>>         source "package/jq/Config.in.host"
>>         source "package/jsmin/Config.in.host"
>>         source "package/lpc3250loader/Config.in.host"
>> +       source "package/mfgtools/Config.in.host"
>>         source "package/mke2img/Config.in.host"
>>         source "package/mkpasswd/Config.in.host"
>>         source "package/mtd/Config.in.host"
>> diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
>> new file mode 100644
>> index 0000000..8bba9e2
>> --- /dev/null
>> +++ b/package/mfgtools/Config.in.host
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_HOST_MFGTOOLS
>> +       bool "host mfgtools"
>> +       depends on BR2_arm
>> +       help
>> +         This package contains the Freescale manufacturing tool.
>> +         It is designed to program firmware to i.MX boards during
>> +         production. The communication is done over USB using the
>> +         Freescale UTP protocol.
>> +
>> +         https://github.com/NXPmicro/mfgtools
>> diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
>> new file mode 100644
>> index 0000000..e73a7fa
>> --- /dev/null
>> +++ b/package/mfgtools/mfgtools.hash
>> @@ -0,0 +1,2 @@
>> +# locally computed
>> +sha256  6ce93a33c269282df305cf7e517d2d14fde78203537d8ea75b064966afe48464  mfgtools-b219fc219a35c365010897ed093c40750f8cdac6.tar.gz
>> diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
>> new file mode 100644
>> index 0000000..c5f9ad0
>> --- /dev/null
>> +++ b/package/mfgtools/mfgtools.mk
>> @@ -0,0 +1,34 @@
>> +################################################################################
>> +#
>> +# mfgtools
>> +#
>> +################################################################################
>> +
>> +MFGTOOLS_VERSION = b219fc219a35c365010897ed093c40750f8cdac6
>> +MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,$(MFGTOOLS_VERSION))
>> +MFGTOOLS_LICENSE = Freescale Proprietary License
>
> The license is BSD-3c with a couple files covered by the Code Project License.

I'm no good with licenses, indeed I just checked the BSD-3C and it
looks like it, I expected the license name to be in the header text
(like the GPL or Apache).

>> +MFGTOOLS_LICENSE_FILES = LICENSE
>> +HOST_MFGTOOLS_DEPENDENCIES = host-cmake host-libusb
>> +
>> +MFGTOOLS_CFLAGS = $(HOST_CFLAGS)
>> +MFGTOOLS_CFLAGS += -l pthread -Wl,-rpath=$(HOST_DIR)/usr/lib
>> +MFGTOOLS_CFLAGS += -l usb-1.0 -I$(HOST_DIR)/usr/include/libusb-1.0
>> +MFGTOOLS_CFLAGS += -L . -l MfgToolLib -I$(@D)/MfgToolLib
>> +MFGTOOLS_CFLAGS += -fpermissive -Wno-write-strings
>
> I had to add "-std=c++11" to get it to compile on my system. If I
> didn't do this, I'd get errors from std:stoi not being defined. Their
> Makefile added this as well.

hmm, that is in their Makefile indeed, which GCC version are you using?

> I would add a "TestedBy", but the tool is so flaky for me that I'm not
> sure if I really tested it. It did upload u-boot and Linux to my board
> (custom iMX6) and rebooted to run the programming script, but I never
> could get it to get all the way through the programming script. I
> don't think that's your issue, though.

What happens exactly? I've generated an initramfs for the target that
includes uuc and it was ok. Actually I had to do one thing manually
which was to modprobe the g_mass_storage module manually. I need to
add it to the init scripts but I'm not sure how to do that in the
systemd service file, I need to look at it.

Regards,
Gary
