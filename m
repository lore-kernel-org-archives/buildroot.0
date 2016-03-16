From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Wed, 16 Mar 2016 09:42:17 +0100
Subject: [Buildroot] [rpi-firmware] I can't find the file
	/usr/sbin/vcdbg after compiling
In-Reply-To: <87d1qvbv1k.fsf@dell.be.48ers.dk>
References: <CALtfCQYaW4JsQiBOC+paK2+gzPVfdOSsKWXr-qBqkv_tXC23sA@mail.gmail.com>
 <87d1qvbv1k.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQZ-5+cexaKQNks4Oa1LwCq7cdu9k5QimznEuF0xm6AJqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter

Thank you very much. I made the changes you told me:

--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -8,7 +8,7 @@ RPI_FIRMWARE_VERSION =
22d8c910f4c53118f9cf85c038d7d8e307efc110
 RPI_FIRMWARE_SITE = $(call
github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-RPI_FIRMWARE_INSTALL_TARGET = NO
+RPI_FIRMWARE_INSTALL_TARGET = YES
 RPI_FIRMWARE_INSTALL_IMAGES = YES

 RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
@@ -31,7 +31,7 @@ endif

 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS
-       $(INSTALL) -d -m 0700 $(@D)/$(if
BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
+       $(INSTALL) -D -m 0700 $(@D)/$(if
BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
                $(TARGET_DIR)/usr/sbin/vcdbg
 endef
 endif # INSTALL_VCDBG

And now the file exists in the folder:  /usr/sbin/vcdbg and I checked that
it works fine on my raspberry pi 2.

Best regards.

On 15 March 2016 at 16:49, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:
>
>  > Yes, I did both, but I've just checked again and It doesn't work.
>  > ../output/target/usr/sbin$ ls
>  > addgroup  chroot    deluser   ether-wake  i2cdetect  i2cset    loadfont
>  > setlogcons
>  > adduser   crond     dnsd      fbset       i2cdump    inetd     rdate
>  >  vcfiled
>  > arping    delgroup  dropbear  fdformat    i2cget     killall5
> readprofile
>
> Sorry, I just had a closer look, and the vcdbg handling logic is broken
> :/ I've pushed a fix to current git to correct it:
>
> commit 41276ae12aefb8a3e69df365aa2240d29ddca776
> Author: Peter Korsgaard <peter@korsgaard.com>
> Date:   Tue Mar 15 16:43:10 2016 +0100
>
>     rpi-firmware: unbreak _INSTALL_VCDBG logic
>
>     Commit d16b32a401 (package/rpi-firmware: add option to install vcdbg)
> added
>     a sub option to install the vcdbg tool, but the commit unfortunately
>     contained two errors:
>
>     - The package sets _INSTALL_TARGET = NO, so the _TARGET_CMDS are never
> used
>     - The install command used -d (handle arguments as directories)
> instead of
>       -D (create needed directories)
>
>     Fix these issues.
>
>     Cc: yann.morin.1998 at free.fr
>     Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
> --
> Venlig hilsen,
> Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160316/699922c9/attachment.html>
