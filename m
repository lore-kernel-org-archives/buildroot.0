From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 14 Sep 2011 10:58:01 +0200
Subject: [Buildroot] [PATCH 1/2] omap-u-boot-utils: add new package
In-Reply-To: <20110913194446.0ebab8c5@skate>
References: <1315934373-16561-1-git-send-email-luca@lucaceresoli.net>
 <20110913194446.0ebab8c5@skate>
Message-ID: <4E706C99.1090206@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
thanks for the review.

Thomas Petazzoni wrote:
> Le Tue, 13 Sep 2011 19:19:32 +0200,
> Luca Ceresoli<luca@lucaceresoli.net>  a ?crit :
>
>> +++ b/boot/omap-u-boot-utils/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
>> +	bool "omap-u-boot-utils"
>> +	help
>> +	  U-Boot Utilities for Texas Instrument's OMAP platforms.
>> +	  Say Y if you want these utilities on the development host.
>> +
>> +	  https://github.com/nmenon/omap-u-boot-utils
>
> This is a pure host package, so it shouldn't be present in any
> Config.in file. See package/fakeroot as an example.
>
> And even if it also was a target package, the Config.in should be in
> the package directory, not in boot/.

If I understand correctly your point, you would make omap-u-boot-utils
automatically compile if BR2_TARGET_UBOOT_OMAP_IFT (patch 2/2) is on,
without any user-visible option.

But this would reduce flexibility.

To understand why, consider this package is a set of utilities, loosely
related to each other.

gpsign is absolutely OMAP-specific, and it's what I use in patch 2/2 in
order to build a .ift image from a .bin image.

OTOH, ucmd "sends a command and expects a provided matching response
from target", and is aimed at creating automated scripts to interact
with a commandline program over a serial line. This can be used in any
architecture. I have board-specific scripts that use it to write
bootloader + kernel + rootfs onto a new (or bricked) board from files in
output/images.

So, while omap-u-boot-utils is a requirement for building a signed
image, I think it should be also available as a user option in
menuconfig.
I'm not sure boot/omap-u-boot-utils/Config.in is the correct place
anyway, I'm open to suggestions on a better location.


Oh, and to be complete, this might be a target package too; I did not
implement that because cross-compilation is a bit tricky and the use
case is possibly not interesting to anybody.

>
>> +OMAP_U_BOOT_UTILS_VERSION = d086cb5c0
>> +OMAP_U_BOOT_UTILS_SOURCE = omap-u-boot-utils-$(OMAP_U_BOOT_UTILS_VERSION).tar.gz
>
> xxx_SOURCE is useless with the git download method.

Right. Will fix.

>
>> +OMAP_U_BOOT_UTILS_TARGETS = gpsign pserial tagger ucmd ukermit
>
> Used only once, just hardcode.

Well, ok. Will do.

Luca
