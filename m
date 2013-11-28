From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Nov 2013 22:16:05 +0100
Subject: [Buildroot] [PATCH 3/5] package/rpi-firmware: move to
 bootloaders menu
In-Reply-To: <20131128210834.3c78df23@skate>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <869fff522738fdd927541a3e3a303f97143f8469.1385157864.git.yann.morin.1998@free.fr>
 <20131128210834.3c78df23@skate>
Message-ID: <20131128211605.GC3337@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-28 21:08 +0100, Thomas Petazzoni spake thusly:
> On Fri, 22 Nov 2013 23:50:56 +0100, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > rpi-firmware, although it does contain the GPU firmware, also serves as
> > the bootloader. As a reminder, here is an overview of how the RPi boots:
> >   - GPU exits reset
> >   - GPU loads its firmware from the first, FAT32-formatted partition
> >   - GPU reads its config file from the same partition
> >   - GPU loads kernel from the same partition, into RAM
> >   - GPU de-asserts the reset of the ARM core (CPU)
> >   - CPU exits reset and starts executing kernel code
> > 
> > So, although the largest part of rpi-firmware is indeed the GPU firmware,
> > the first purpose it serves is as a bootloader for the ARM core.
> > 
> > People that do not want to use the GPU (eg. headless, no multimedia...)
> > will still want to select rpi-firmware.
> > 
> > Having rpi-firmware in target packages -> hardware-handling -> firmware
> > is a bit misleading in this case.
> > 
> > Hence, move rpi-firmware from the target packages submenu, into the
> > bootloaders submenu.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I must say I am not entirely convinced this change is necessary.

It is not _necessary_. I find it more coherent with the upstream docs
(eg. all docs about the Raspberry Pi you'll find on the Raspberry Pi
foundation's forums, and on the eLinux WiKi for the RPi) about the boot
process:

http://www.elinux.org/RPi_Software#Overview
    Here, the "GPU firmware" is only refered to as par t of the boot
    process. There is references to:
      - the "first stage bootloader" in ROM,
      - the "second stage bootloader" on the SDcard
      - the "GPU firmware"

http://www.elinux.org/RPi_Software#GPU_bootloaders
    This section calls the "GPU firmware" the "GPU bootloader".

http://www.elinux.org/RPi_Easy_SD_Card_Setup#SD_card_setup
    "The Raspberry Pi will not start without a properly formatted SD
    Card, containing the bootloader and a suitable operating system."

For what it's worth, I have seen a few people being _very_ puzzled by
that situation. I told them the RPi bootloader was packaged in
Buildroot, but they just kept telling me they could not find it, since
they were looking in the "bootloaders" menu. When I showed them where it
was, they really wondered why we did put it there, and not with the
other bootloaders.

People using the RPi do not care whether rpi-firmware provides the 3D
and video stuff. They only care that it is mainly called a bootloader
in the docs, and they look for a bootloader.

> rpi-firmware is a much bootloader stuff than GPU/OpenGL stuff, so
> deciding whether it should be in Bootloaders or in Packages -> Hardware
> handling is difficult. And since it has now been in Packages ->
> Hardware Handling for a long time, and that moving it to the
> Bootloaders section involves renaming a number of Config.in options and
> therefore adding some Config.in.legacy blurb, I'm not sure it's worth
> the effort.

That is a completely different reason! :-)

> And in any case, if we decided to do this, it should be done *before*
> your PATCH 1/5 that adds 4 additional Config.in symbols, which we
> wouldn't have to carry in Config.in.legacy, because they are new.

Agreed.

But I won't be a dick with that one. I can well live with it. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
