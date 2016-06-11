From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 11 Jun 2016 18:48:11 +0300
Subject: [Buildroot] [PATCH v2] board: add support for LinkSprite pcDuino
In-Reply-To: <20160611151904.36d1a0cb@free-electrons.com>
References: <1464291692-28094-1-git-send-email-geomatsi@gmail.com>
 <1465587642-14400-1-git-send-email-geomatsi@gmail.com>
 <20160611151904.36d1a0cb@free-electrons.com>
Message-ID: <CAFGfvX4VMf88CT+5174whXOzxnSMM-s+kOo_2DO5+Pnfxit4+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

2016-06-11 16:19 GMT+03:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Fri, 10 Jun 2016 22:40:42 +0300, Sergey Matyukevich wrote:
> > Add basic support for LinkSprite pcDuino board series
> > including pcDuino, pcDuino-Lite, pcDuino-Lite-WiFi.
> > Tested on pcDuino-Lite-WiFi.
> >
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
>
> Thanks for this new version! It looks pretty good overall, but I have a
> few comments here and there


Thanks for review. See my answers and questions below.


> First of all, you should use pcduino-v1 everywhere, since there are
> multiple versions of the pcduino, and not all of them use the same SoC,
> nor use the same Device Tree or U-Boot configuration.
>
> >  board/linksprite/pcduino/boot.cmd            |  8 ++++
> >  board/linksprite/pcduino/genimage.cfg        | 44 +++++++++++++++++++
> >  board/linksprite/pcduino/linux-extras.config | 16 +++++++
> >  board/linksprite/pcduino/post-build.sh       | 11 +++++
> >  board/linksprite/pcduino/post-image.sh       | 17 ++++++++
> >  board/linksprite/pcduino/readme.txt          | 34 +++++++++++++++
> >  board/linksprite/pcduino/uboot-env.txt       | 38 ++++++++++++++++
>
> The directory should be named board/linksprite/pcduino-v1/
>
> >  configs/pcduino_defconfig                    | 65
> ++++++++++++++++++++++++++++
>
> I think the defconfig should be named linksprite_pcduinov1_defconfig
>
> > +fatload mmc 0 $kernel_addr_r zImage
> > +fatload mmc 0 $fdt_addr_r sun4i-a10-pcduino.dtb
>
> So the dtb name does not carry the "v1" thing ?


That is correct. Neither kernel nor U-Boot have this 'v1' thing for the
first pcduino board series.


> then run scan_dev_for_boot; fi; done
> > +scan_dev_for_extlinux=if test -e ${devtype}
> ${devnum}:${distro_bootpart} ${prefix}extlinux/extlinux.conf; then echo
> Found ${prefix}extlinux/extlinux.conf; run boot_extlinux; echo SCRIPT
> FAILED: continuing...; fi
> > +scan_dev_for_scripts=for script in ${boot_scripts}; do if test -e
> ${devtype} ${devnum}:${distro_bootpart} ${prefix}${script}; then echo Found
> U-Boot script ${prefix}${script}; run boot_a_script; echo SCRIPT FAILED:
> continuing...; fi; done
> > +scriptaddr=0x43100000
> > +serial#=162367080980bb50
> > +stderr=serial,vga
> > +stdin=serial,usbkbd
> > +stdout=serial,vga
> > +usb_boot=usb start; if usb dev ${devnum}; then setenv devtype usb; run
> scan_dev_for_boot_part; fi
>
> Why do you need such a big U-Boot environment? U-Boot doesn't come with
> a sane default environment?
>

U-Boot indeed comes with a sane default environment. And this is exactly
the copy of default environment for pcduino. I assume that I have to put
something reasonable to u-boot-env mmc partition from the start.


> > +# Target packages: board access
> > +BR2_PACKAGE_LRZSZ=y
> > +BR2_PACKAGE_DROPBEAR=y
>
> Those two packages are not needed.
>

What is wrong with lrzsz package ? It is very handy for the board with WiFi
networking only: one can upload/download files via serial port until proper
networking setup is worked out.


> Could you rework those minor details, and send an updated version?
>
> Thanks!
>

Sure, I will introduce the changes according to your comments and re-submit
the patch.

Regards,
Sergey
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160611/e25efdee/attachment.html>
