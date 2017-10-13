From: Alejandro Ariel Fachini <alefachinic@gmail.com>
Date: Fri, 13 Oct 2017 09:44:06 -0300
Subject: [Buildroot] Fwd:  [BuildRoot] at91sam9x5ek_defconfig not booting
In-Reply-To: <CAHnuF30iK6AQeoZBn3f35q1B5Ff+SG9uGUywzKH--wPp-THVVg@mail.gmail.com>
References: <CAHnuF31sDH93MRN8nU6kdvfymwD7LOAz56YckWrk-OLSdMx3Qg@mail.gmail.com>
 <20171012220111.301bb3af@windsurf.home>
 <CAHnuF30iK6AQeoZBn3f35q1B5Ff+SG9uGUywzKH--wPp-THVVg@mail.gmail.com>
Message-ID: <CAHnuF33Z3qQeVr5o1q=K1+OgMDCEhheOQm9qCGO1TpPZrjbeVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ----------
From: Alejandro Ariel Fachini <alefachinic@gmail.com>
Date: 2017-10-12 17:30 GMT-03:00
Subject: Re: [Buildroot] [BuildRoot] at91sam9x5ek_defconfig not booting
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


Mr Thomas:
Thanks For your help. I used the tag 2017.03 and Still got the same Result
in fact the first thing i did was use the latest version of BuildRoot.
 If i understand correctly:
At first Boot after Install binaries i should set environment variables,
then saveenv and then reset. After that use bootz?

How do I make the boot into Kernel auomatic? I believe all tthis is U-Boot
Related? If thats so just tell me and i wont bother anymore.

<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Libre
de virus. www.avast.com
<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#m_6279347772450905483_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>

2017-10-12 17:01 GMT-03:00 Thomas Petazzoni <thomas.petazzoni@free-
electrons.com>:

> Hello,
>
> On Thu, 12 Oct 2017 16:11:38 -0300, Alejandro Ariel Fachini wrote:
>
> > following resulting files, I am using this buildroot tag; *2016.02-rc3*:
>
> Why use this tag, which is old *and* is a release candidate and not a
> final stable release ?
>
> > I have to flash the device with windows where my Ubuntu VM runs.
> > The flashing addresses aree found inside the script for flashing being:
> >
> >    - 0x0 for atboostrap.bin
> >
> >
> >    - 0x40000 for u-boot.bin
> >
> >
> >    - 0x180000 for at91sam9x35ek.dtb
> >
> >
> >    - 0x200000 for zImage
> >
> >
> >    - 0x800000 for rootfs.ubi
> >
> > This configuration won't boot KERNEL. System goes to u-boot> prompt and
> > when i use:
> > *bootz 0x22000000 - 0x21000000*
>
> Those addresses (0x22000000 and 0x21000000) are addresses in RAM. You
> have to load zImage from flash to RAM at 0x22000000 and
> at91sam9x35ek.dtb from flash to RAM at 0x21000000 prior to issuing the
> "bootz" command. "bootz" only starts the kernel. If you haven't loaded
> the kernel and device tree before running bootz, it obviously cannot
> work.
>
> > So i have a set of questions may be related to my inexperience:
> >
> > 1- In my Buildroots build on my Ubuntu enviroment, if the file
> > *at91bootstrap.bin* is my ATbootstrap bootloader, what is the file
> > *at91sam9x5ek-nandflashboot-uboot-3.8.bin*?
>
> They are exactly identical:
>
> $ md5sum at91bootstrap.bin at91sam9x5ek-nandflashboot-uboot-3.8.8.bin
> fef2c8c4cf8eef64e28488324b11f86b  at91bootstrap.bin
> fef2c8c4cf8eef64e28488324b11f86b  at91sam9x5ek-nandflashboot-ubo
> ot-3.8.8.bin
>
> > 2- What is the file *boot.bin*?
>
> It's again the same thing:
>
> fef2c8c4cf8eef64e28488324b11f86b  boot.bin
>
> The bootloader must be named boot.bin when you're doing SD card based
> boot, but that's not what you're doing here, so you don't care.
>
> > 3-Where is the file with the U_BOOT enviroment variables, in the compiled
> > Buildroot results?????
>
> No such file is produced. Therefore, the U-Boot environment on flash is
> empty. But the U-Boot binary embeds a default environment, which takes
> precedence when there is no environment defined in flash.
>
> > 4-I used "make at91sam9x5ek_defconfig", then "make". Does this means that
> > the default configuration in these files are not working???
>
> I believe they are working. Have you followed the instructions in
> board/atmel/readme.txt ?
>
> > 5- Where do i set for building the file with Uboot Environment Variables?
>
> You don't need this for a basic build.
>
> > 6- Do i need to apply patches to the newest Bootloader version?
>
> No, it should work as-is.
>
> > 7- How do i do to change UBI format to jffs2 for compiling? i know how to
> > do it in buildroot's menuconfig, but environment variables still sets to
> > UBI.
>
> Just don't use JFFS2. UBI is the thing you want to use.
>
> Once again, please follow the instructions in board/atmel/readme.txt,
> this should get you running.
>
> Also, I suggest that you go through Free Electrons training materials
> (both slides [1] and labs [2] are available, and labs are done on an Atmel
> SAMA5D3 Xplained, with has lots of similarities). This would help
> giving you the background necessary.
>
> [1] http://free-electrons.com/doc/training/embedded-linux/embedd
> ed-linux-slides.pdf
> [2] http://free-electrons.com/doc/training/embedded-linux/embedd
> ed-linux-labs.pdf
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171013/e7c5ad35/attachment.html>
