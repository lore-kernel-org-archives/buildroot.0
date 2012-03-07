From: Attila Kinali <attila@kinali.ch>
Date: Wed, 7 Mar 2012 11:45:28 +0100
Subject: [Buildroot] Building a kernel for i.MX23 (and probably other from
 the i.MX family)
Message-ID: <20120307114528.0304fc3d8061b683b66c7230@kinali.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Moin,

I originally thought i would provide a full patch for
Buildroot that allows to directly build a kernel image
for the i.MX23 processor (and probably others from the
i.MX family). But unfortunately, it doesn't seem like
i have the time to do this. Thus i have decided to just
write a mail here in order to document it for other people.

You should first read the "i.MX23 Linux BSP User's Guide".
It explains the way how the i.MX processors boot linux
and how the bootstreams work. You also need an installation
of LTIB to extract the necessary packages. Because LTIB
is horribly outdated it will not build on any current linux
distribution. I was able to build it in a debian/squeeze chroot
successfully. Please note that you should do this running on
a system with a 32bit kernel. Using a 64bit kernel will cause
the LTIB buildsystem to guess that you want to build for a 64bit
system and fail with compile errors (depending on your config).
To successfully build LTIB, you have to use the one version for
your i.MX processer by freescale (they are each sightly different),
leave everything at the default settings unless it is absolutely
necessary to change it (like if it selects the wrong processor) and
follow the instructions in the BSP user guide exaclty. Otherwise it
will not build correctly. After you've started the build, go grab a
coffee and some cake. It will take a while.

After you have build LTIB you have to extract the elftosb2 binary
from it (/opt/freescale/ltib/usr/bin/elftosb2) and the imx-bootlets
package (/opt/freescale/pkgs/imx-bootlets-src-10.05.02.tar.gz)

Put the elftosb2 binary somewhere in your path, and unpack the
imx-bootlets somewhere.

Now build your rootfs using Buildroot. You can use any arm9 based
config. It should work fine. Important here is that you have to
use ttyAMA0 as console instead of the ttyAM0 that's mentioned in
the BSP user guide (notice the very small difference!).

Untar your kernel somewhere, and change into the kernel root directory.
Add the /path/to/buildroot/output/host/usr/bin directory to your PATH.
then run
$ make ARCH=arm CROSS_COMPILE=arm-linux- mxs_defconfig
$ make ARCH=arm CROSS_COMPILE=arm-linux- zImage

copy the zImage to the root directory of the imx-bootlets source and
cd to that directory, then change the file
linux_prep/cmdlines/stmp378x_dev.txt to use the correct console tty
(see above) and root device. Edit the linux.db file to point to the
right zImage file. Then run
$ make -C linux_prep ARCH=mx23 BOARD=stmp378x_dev
CROSS_COMPILE=arm-linux- $ make -C boot_prep  ARCH=mx23
BOARD=stmp378x_dev CROSS_COMPILE=arm-linux- $ make -C power_prep
ARCH=mx23 BOARD=stmp378x_dev CROSS_COMPILE=arm-linux- $ elftosb2 -z
-c ./linux.db -o imx23_linux.sb

You will get a imx23_linux.sb that you can use as described in the BSP
user guide. I guess you can do the same with u-boot using the uboot.db
but i have not tried that.

A few additional notes here:
Over the last weeks, i had a few times contact with the freescale
support and, although they are always available for a chat (very nice
feature!), they are not helpfull at all. None of my questions were ever
answered in a way that would have helped me to get anything done.
Opening tickets (or Serivce Requests, as they call it) and get a second
level support to answer my questions didn't help either. Either the
tickets were just closed without further comment or the answer was
exactly that what my question was about (eg "i do X and it does not
work, because..." - "you should do X") and then closed.

Also freescale only provides drivers for the one linux kernel version
they have in the LTIB which is ... outdated at best (2.6.31). The over
600 patches they have there are neither documented nor is there any
chance to figure out which ones you would need to port over to a newer
kernel version. My question about whether there is support for any
newer kernel version or why the patches have never been send upstream
was answered with "Linux is not our porduct, we do not support it. If
you need drivers ask a third party to write them for you". You can
imagine that i was not very happy about this answer. I have not figured
out yet, why they have not send their patches upstream but instead
decided to let them rott in their buildsystem.

Overall i do not suggest using the i.MX processors for linux based
systems due to very bad support from freescale.

Special thanks go to Huang Shijie, an engineer at freescale who i
found during my quest for getting the build system working. He was
very helpfull and helped me to fill my gaps of understanding. With
just a couple of mails, he was able to tell me what i'm doing wrong
and thus help me to get the build running.

			Attila Kinali

-- 
The trouble with you, Shev, is you don't say anything until you've saved
up a whole truckload of damned heavy brick arguments and then you dump
them all out and never look at the bleeding body mangled beneath the
heap
		-- Tirin, The Dispossessed, U. Le Guin
