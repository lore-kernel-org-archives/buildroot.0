From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Fri, 28 Aug 2015 12:36:36 +0200
Subject: [Buildroot] [PATCH 4/4] board/raspberrypi: auto-expand rootfs
 on first boot
In-Reply-To: <5881659.QqO7LoEYvS@sagittea>
References: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <1440273688-92868-4-git-send-email-benoit@wsystem.com>
 <55DED20A.5030800@wsystem.com> <5881659.QqO7LoEYvS@sagittea>
Message-ID: <55E039B4.1040005@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On 27/08/2015 23:22, J?r?me Pouiller wrote:
> On Thursday 27 August 2015 11:02:02 Beno?t Th?baudeau wrote:
>> Hi Vivien, Yann, all,
>>
>> On 22/08/2015 22:01, Beno?t Th?baudeau wrote:
> [...]
>> So the initial contents of the unused space on the SD card seem to have an
>> influence, and there seems to be a bug somewhere (Linux, resize2fs,
>> genext2fs, tune2fs, or lack of call to e2fsck before calling resize2fs but
>> this would not be reliable with an online partition).
>>
>> Then I retried with a 16-GiB SD card on a Raspberry Pi B, and it was very
>> slow too. Same if the resize is performed on a PC. However, it's very quick
>> with raspi-config and the latest Raspbian image. The main difference seemed
>> to be the block size (4 KiB on Raspbian vs. 1 KiB with mke2img), so I
>> hacked mke2img to test with genext2fs -B 4096 and tune2fs -J size=4, but it
>> did not make things faster, only the image bigger (about 512 MiB, probably
>> the minimal size for 4-KiB blocks). So I don't know which ones, but it's
>> probably some ext4 parameters that are having an influence on the resize2fs
>> speed here. Any idea?
> Yes, I have an idea :-) Did you try sparse_super?

[...]

Awesome, it works, even if resizing the partition online. Thanks for the tip!

I'll send a patch changing mke2img to allow the use of this option.

Best regards,
Beno?t
