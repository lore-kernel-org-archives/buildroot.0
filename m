From: =?utf-8?Q?S=C3=A9bastien?= Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed, 19 Feb 2014 14:50:02 -0500 (EST)
Subject: [Buildroot] SoCkit support question?
In-Reply-To: <940580837.479152.1392839319094.JavaMail.root@mail>
Message-ID: <179193548.492145.1392839402433.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to submit the support for the SoCkit from Altera, but i have some questions regarding the bootloader step and need some advices on the best way to handle it.

The SoC combines a hard processing system (HPS) and an FPGA, so the board design can change and the bootloader must provide a preloader.

This preloader is normally generated using the Altera tools (Quartus, Qsys, bsp-editor) and results in source files defining the board that will be used in a patched u-boot from rocketboard (rocketboard is altera i guess).
For more informations on this step, please look at : http://www.rocketboards.org/foswiki/Documentation/PreloaderUbootCustomization

Then the preloader must be sign using an other tool from Altera (mkpimage) that comes with all the Altera dev environment.
Maxime Hadjinlian has done a fork of this tool in GO (https://github.com/maximeh/mkpimage)

If i use the sources from the rocketboard repository (http://git.rocketboards.org/?p=u-boot-socfpga.git;a=summary),
regardless the branch, the preloader generated doesn't work, even if i'm signing it with the mkpimage tool from Altera (may be i'm missing something here).

If i use the Altera tools to generate my preloader using Qsys and an example design from Altera, then use the result sources files that define the u-boot/board/altera/socfpga/*, built u-boot and sign it with the mkpimage from Altera then it works.

So my question is what the best way to provide the support for this board in buildroot ?

Assuming I have not made mistake, if you want to provide support for the bootloader of this board without using any tools from Altera, you must :

- Use the patched u-boot from rocketboard
- Define the board with a sample design, ie patch the sources in u-boot/board/altera/socfpga/*
- Generate the bootloader (u-boot) and preloader (u-boot SPL)
- Sign the preloader with a fork to mkpimage tools (recode the mkpimage from Maxim  Hadjinlian in C ?)

Another approach would be to consider that the end user must provide their bootloader and flash it, the buildroot board config take care of building only Linux and the rootfs.
