From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 13 Sep 2016 19:08:43 +0200
Subject: [Buildroot] [PATCH] board: add support for liteBoard
In-Reply-To: <20160913173753.03f99f51@free-electrons.com>
References: <20160913112747.3886-1-m.niestroj@grinn-global.com>
 <20160913173753.03f99f51@free-electrons.com>
Message-ID: <cc4a8663-d5cf-6669-32c6-bd242f09e48a@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 13.09.2016 17:37, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 13 Sep 2016 13:27:47 +0200, Marcin Niestroj wrote:
>> Board support package includes:
>>
>>  * Buildroot defconfig
>>  * Mainline Linux kernel v4.7.3 with board support patches
>>  * Mainline U-Boot v2016.09 with board support patch
>>  * genimage config to create sdcard image
>>  * Board readme.txt
>>
>> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>
> This generally looks very good. I've seen on the LAKML that you have
> submitted upstream the support of this platform to the Linux kernel, I
> assume you've done the same for the U-Boot part. We generally don't
> like carrying the entire support for a new board in Buildroot in the
> form of patches, but if those patches are clean and on their way
> upstream (which is the case here, then it's fine).

I've not posted U-Boot patch yet, but will do so in near future. For now
I wait for response on mainling list about separate liteSOM and
liteBoard support in U-Boot. Anyway, there should be not much
difference between this patch and the one I will post to mainline
U-Boot.

>
>
>> +++ b/board/grinn/liteboard/genimage.cfg
>> @@ -0,0 +1,48 @@
>> +# Minimal microSD card image for Grinn's liteBoard
>> +#
>> +# We mimic the .sdcard Freescale's image format for i.MX6UL:
>> +# * the microSD card must have 1 kB free space at the beginning,
>> +# * SPL is dumped as is,
>> +# * U-Boot is dumped at 69K offset, as configured in SPL
>> +# * a FAT partition at offset 8 MB is containing zImage and dtbs,
>> +# * a single root filesystem partition is required (Ext4 in this case).
>> +#
>
> Can you instead use the generic freescale genimage.cfg and post-image
> script ? See board/freescale/common/.
>
> It's not exactly identical to your genimage file as it's using a single
> U-Boot image called u-boot.imx instead of the split SPL / u-boot.img
> that you're using. But since your platform is i.MX6 based, I suppose
> the u-boot.imx should also work (Cc'ing Fabio on this).

I've added SPL on purpose. We will have boards with 256 and 512 MB RAM.
So right now we check in SPL how much RAM we have and configure memory
subsystem accordingly. I believe we cannot configure it in full U-Boot.

In single U-Boot image there are hardcoded values that are copied to
processor's registers (DDR configuration is among them) from the "IMX"
U-Boot image just before running it.

Also, in mainline U-Boot there is support for imx6ul EVK with separate
SPL by default.

>
> The rest if perfectly fine.
>
> Thomas
>

-- 
Marcin Niestroj
