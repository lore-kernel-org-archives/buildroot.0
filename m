From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 8 Jul 2016 12:06:01 -0400 (EDT)
Subject: [Buildroot] [PATCH v4 2/2] configs: add defconfig for TS-4800
In-Reply-To: <87mvlyu33u.fsf@dell.be.48ers.dk>
References: <1465498542-7333-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1465498542-7333-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <87mvlyu33u.fsf@dell.be.48ers.dk>
Message-ID: <1392650574.138668.1467993961754.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thank you for the review. I've followed every suggestion except two:

----- On Jul 3, 2016, at 11:56 AM, Peter Korsgaard peter at korsgaard.com wrote:
>>>>>> "Patrick" == Patrick Keroulas <patrick.keroulas@savoirfairelinux.com> writes:
>> +++ b/board/technologic/ts4800/genimage.cfg
>> @@ -0,0 +1,37 @@
>> +image boot.vfat {
>> + vfat {
>> + files = {
>> + "zImage",
>> + "imx51-ts4800.dtb"
>> + }
>> + }
>> + size = 8M
>> +}
>> +
>> +image sdcard.img {
>> + hdimage {
>> + }
>> +
>> + partition mbrboot {
>> + in-partition-table = "no"
>> + image = "mbrboot.bin"
>> + offset = 0
>> + }
> 
> Does genimage really handle this correctly (E.G. doesn't overwrite the
> bootloader when it writes the MBR)? I know that we at least postprocess
> the genimage output for odroid2 where a similar boot logic is used
> (board/hardkernel/odroidc2/post-image.sh)

mbrboot.bin size is 238B and genimage writes the partition table @ offset=446 
and the bootloader partition @offset=512. So, nothing should be overwritten.
The output image was fully tested on target.

>> +BR2_PACKAGE_BUSYBOX_WATCHDOG=y
>> +BR2_PACKAGE_FBTERM=y
> 
> Are these _REALLY_ needed for anything?

The tested base board has a touchscreen, but FBTERM is not absolutely
necessary for ts-4800 module and will be removed. 
However, the watchdog is needed because it is enabled by u-boot and
the associated driver is part of the kernel config.

Thank you,

Patrick 
