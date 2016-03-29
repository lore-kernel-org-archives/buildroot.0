From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 29 Mar 2016 23:56:41 +0200
Subject: [Buildroot] [PATCH] raspberrypi,
 raspberrypi2: add a serial console
In-Reply-To: <56FAE674.6080004@mind.be>
References: <1459202897-21440-1-git-send-email-luca@lucaceresoli.net>
 <56FAE674.6080004@mind.be>
Message-ID: <56FAFA19.9090406@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

On 29/03/2016 22:32, Arnout Vandecappelle wrote:
> On 03/29/16 00:08, Luca Ceresoli wrote:
>> The current Buildroot defconfigs for Raspberry Pi and Raspberry Pi 2
>> instantiate a console on tty1, which appears on HDMI. Add a console on
>> the serial port (ttyAMA0) to be more consistent with other defconfigs
>> and provide a better out-of-the-box experience to users used to have a
>> serial console from Buildroot defconfigs.
>>
>> This requires two changes:
>>   1. have two 'console=' entries in the kernel command line;
>>   2. add a new getty process to the generated inittab.
>>
>> Step 2 requires a post-build script since the Buildroot makefiles can
>> configure only one console. But instead of simply adding a new getty
>> on ttyAMA0 (which would work) this patch actually changes
>> BR2_TARGET_GENERIC_GETTY_PORT from tty1 to ttyAMA0, then adds back
>> tty1 via post-build.sh. This is done only to avoid the
>> "GENERIC_SERIAL" comment where we instantiate an HDMI console, then
>> instantiate a really-serial console on another line.
>>
>> The result is these two inittab lines:
>>
>>    ttyAMA0::respawn:/sbin/getty -L  ttyAMA0 0 vt100 # GENERIC_SERIAL
>>    tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console
>>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> ---
>>
>> Tested on both Raspberry Pi B and Raspberry Pi 2, each on serial and
>> HDMI console.
>> ---
>>   board/raspberrypi/post-build.sh  | 9 +++++++++
>>   configs/raspberrypi2_defconfig   | 3 ++-
>>   configs/raspberrypi_defconfig    | 3 ++-
>>   package/rpi-firmware/cmdline.txt | 2 +-
>>   4 files changed, 14 insertions(+), 3 deletions(-)
>>   create mode 100755 board/raspberrypi/post-build.sh
>>
>> diff --git a/board/raspberrypi/post-build.sh
>> b/board/raspberrypi/post-build.sh
>> new file mode 100755
>> index 000000000000..7eae14a88569
>> --- /dev/null
>> +++ b/board/raspberrypi/post-build.sh
>> @@ -0,0 +1,9 @@
>> +#!/bin/sh
>> +
>> +set -u
>> +set -e
>> +
>> +# Add a console on tty1
>> +grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
>> +sed -i '/GENERIC_SERIAL/a\
>> +tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console'
>> ${TARGET_DIR}/etc/inittab
>> diff --git a/configs/raspberrypi2_defconfig
>> b/configs/raspberrypi2_defconfig
>> index ce41ee31adba..0ffc6cdaf158 100644
>> --- a/configs/raspberrypi2_defconfig
>> +++ b/configs/raspberrypi2_defconfig
>> @@ -5,7 +5,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
>>
>>   BR2_TOOLCHAIN_BUILDROOT_CXX=y
>>
>> -BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> 
>  Why not keep the default "console"? That should work, no? Or doesn't
> that work if there are two consoles?

What improvement you expect from using "console" instead of "ttyAMA0"?

OTOH I think ttyAMA0 or tty1 is explicit about the device to use. And as
Yann pointed out on IRC, "console is not a controlling tty, so no Ctrl-C
for example".

-- 
Luca
