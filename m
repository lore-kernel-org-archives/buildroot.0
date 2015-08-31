From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Mon, 31 Aug 2015 11:11:01 +0200
Subject: [Buildroot] [PATCH 4/4] board/raspberrypi: auto-expand rootfs
 on first boot
In-Reply-To: <4057940.fE2DsQZqLb@sagittea>
References: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <1440273688-92868-4-git-send-email-benoit@wsystem.com>
 <4057940.fE2DsQZqLb@sagittea>
Message-ID: <55E41A25.9020303@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?r?me,

On 31/08/2015 10:51, J?r?me Pouiller wrote:
> On Saturday 22 August 2015 22:01:28 Beno?t Th?baudeau wrote:
>> Add init scripts to auto-expand the persistent rootfs on the first boot
>> to fill the medium.
>>
>> These scripts follow the same procedure as raspi-config. The root
>> partition is first expanded, then a reboot is required, then the rootfs
>> is expanded. Each script removes itself once run.
> [..]
>> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
>> index d63e71e..7ee783b 100644
>> --- a/board/raspberrypi/readme.txt
>> +++ b/board/raspberrypi/readme.txt
>> @@ -34,10 +34,13 @@ And for model 2 B:
>>    $ make raspberrypi2_defconfig
>>
>>  If you want to use a persistent rootfs, the generated ext4 rootfs image
>> fits its -contents with only a small (but sensible) margin of free space by
>> default, so -you might want to adjust "Filesystem images"/"ext2/3/4 root
>> filesystem"/ -"size in blocks (leave at 0 for auto calculation)" depending
>> on your needs, then -skip to "Build the rootfs", below.
>> +contents with only a small (but sensible) margin of free space by default,
>> but +it is auto-expanded on the first boot to fill the medium. You can
>> however adjust +"Filesystem images"/"ext2/3/4 root filesystem"/
>> +"size in blocks (leave at 0 for auto calculation)" to fit your needs. The
>> +auto-expansion is controlled by
>> +board/raspberrypi/rootfs-overlay/etc/init.d/S*expand-root*. Skip to
>> +"Build the rootfs", below.
> Isn't safer to auto-expand partition while flashing SD Card instead of doing 
> it online?
> 
> Maybe you can explain how to resize partition in README or provide a script 
> like the one I sent you a few days ago (named sdflash.sh), no?

It would be safer if users pull the power plug during the few seconds that the
expansion lasts, without looking at their console output, which is not a big
risk. Doing it while flashing the SD card would have a major limitation: it
prevents the publication of an autonomous image file that you can program by any
means to get the same result.

Resizing a partition on a PC is trivial if the image is programmed first. There
are plenty of tools like gparted and tutorials for that on the web, so I don't
think adding such information to the readme.txt would be worth it.

Regarding a script writing the SD card and auto-expanding the rootfs, it might
be useful. Since it would require superuser rights, it should not be added to
the post-image scripts, but launched manually. That would give users a choice.
This script would just write the generated image file, auto-expand the rootfs
and remove the auto-expansion scripts from the rootfs. I'll look into it.

Best regards,
Beno?t
