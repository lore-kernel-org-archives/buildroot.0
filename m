From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 10 Jan 2015 21:36:50 +0100
Subject: [Buildroot] [PATCH] Linux kernel module for Waveshare 3.2inch
 RPi LCD (B) V3 touch controller
Message-ID: <trinity-cbe01d4d-fd87-49aa-8ede-917724c6d5a9-1420922210427@3capp-gmx-bs51>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sat, Jan 10, 2015 at 12:03:01PM +0100, Yann E. MORIN wrote:
> Peter, All,
> 
> On 2015-01-10 02:13 +0100, Peter Seiderer spake thusly:
> [--SNIP--]
> > Thanks, great work. My RaspberryPi B+ booted with the new linux-kernel/DT support.
> 
> Thanks for the report. Great! :-)
> 
> > The only thing I had to change is the kernel compression standard
> > (in the kernel config file) from CONFIG_KERNEL_XZ=y to CONFIG_KERNEL_GZIP=y
> > because otherweise the script mkknlimg failed with:
> > "* Is this a valid kernel? In pass-through mode."
> 
> Weird, it is working for me... 
> 
> > Maybe some uncompress tool is missing or is to old on my host?
> 
> My xz is:
> 
>     $ xz --version
>     xz (XZ Utils) 5.1.0alpha
>     liblzma 5.1.0alpha
>

$  xz --version
xz (XZ Utils) 5.0.7
liblzma 5.0.7

> Can you check that your xz supports the --single-stream option?
> 

$ unxz --single-stream
unxz: unrecognized option '--single-stream'
unxz: Try `unxz --help' for more information.

Seems xz package on openSUSE 13.2 is not up to date....

> > Is
> > it possible to run mkknlimg automatically (with buildroot host/usr/bin path)
> > to avoid such errors (and avoid someone installing zImage without running
> > mkknlimg)?
> 
> OK, so it seems you do not have xz on your host, and that you rely on
> the one built by Buildroot, right?
> 
> And no, it is not possible to do it in the current Buildroot
> infrastructure:
> 
>   - there's no way a package can declare hook (whichever) for another
>     package,
> 
>   - we do not want to add anything platform-specific to the kernel.
>

But for other tools buildroot provides host support packages?

Would something like the following be feasible with buildroot (host-xz
has to be done, totally untested):

--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -12,7 +12,7 @@ RPI_FIRMWARE_INSTALL_TARGET = NO
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
-RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
+RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware host-xz linux
 # Override the version in this case.
 RPI_FIRMWARE_VERSION = e42ddc0b04353cc292ce5215eea81484d72c5d09
 define RPI_FIRMWARE_INSTALL_DTB
@@ -40,6 +40,7 @@ HOST_RPI_FIRMWARE_DEPENDENCIES =
 
 define HOST_RPI_FIRMWARE_INSTALL_CMDS
        $(INSTALL) -D -m 0755 package/rpi-firmware/mkknlimg $(HOST_DIR)/usr/bin/mkknlimg
+       $(HOST_DIR)/usr/bin/mkknlimg $(BINARIES_DIR)/zImage $(BINARIES_DIR)/rpi_zImage
 endef
 
 $(eval $(generic-package))

Regards,
Peter

> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
