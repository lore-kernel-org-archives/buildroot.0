From: brm <brm@hyac.in.th>
Date: Fri, 31 Aug 2007 19:29:43 +0700
Subject: [Buildroot] White space problem in
	target/device/Atmel/u-boot/u-boot.mk
Message-ID: <a512d1250708310529w5311ec48haf12635551fa51da@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
      Today when I try to build buildroot for some old ARM board using
AT914xxx.
I got this error:

| echo setenv linux /opt/buildroot/binaries/ev40/ev40-linux-2.6.22.1>>
/opt/buildroot/binaries/ev40/autoscript
| echo setenv kernel-version 2.6.22.1>> /opt/buildroot/binaries/ev40/autoscript
| echo setenv kernel-date 20070831>> /opt/buildroot/binaries/ev40/autoscript
| /bin/sh: 20070831: Bad file descriptor
| make: *** [/opt/buildroot/binaries/ev40/autoscript] Error 1

       After spend sometime track down the problem, I found that "u-boot.mk"
in target/device/Atmel/u-boot/ directory contains that portion of shell script.
       I'm using bash on debian etch. Bach will interpret number in
front of ">" or ">>" as file descriptor. So that cause the problem.
Checking using svn diff, I think that the patch revision 19644 that
update this file from 19639 cause this, especially the part

| -       echo setenv linux               $(LINUX26_KERNEL)
           >> $(UBOOT_SCR)
| -       echo setenv kernel-version      $(LINUX26_VERSION)
           >> $(UBOOT_SCR)
| -       echo setenv kernel-date         $(DATE)
           >> $(UBOOT_SCR)
| -       echo setenv hostname            $(TARGET_HOSTNAME)
           >> $(UBOOT_SCR)
| -       echo setenv fs-date             $(DATE)
           >> $(UBOOT_SCR)
| -       echo setenv rd-1
rootfs.$(BR2_ARCH)-$(DATE).ext2         >> $(UBOOT_SCR)
| -       echo setenv rd-2
rootfs.$(BR2_ARCH)-$(DATE).jffs2        >> $(UBOOT_SCR)
| -       echo setenv rd
rootfs.$(BR2_ARCH)-$(DATE).ext2         >> $(UBOOT_SCR)
| -       echo setenv ver                 1
           >> $(UBOOT_SCR)
| -ifneq  ($(TARGET_UBOOT_ETHADDR),)
| -       echo setenv ethaddr             $(TARGET_UBOOT_ETHADDR)
           >> $(UBOOT_SCR)
| +       echo setenv linux $(LINUX26_KERNEL)>> $(UBOOT_SCR)
| +       echo setenv kernel-version $(LINUX26_VERSION)>> $(UBOOT_SCR)
| +       echo setenv kernel-date $(DATE)>> $(UBOOT_SCR)
| +       echo setenv hostname $(TARGET_HOSTNAME) >> $(UBOOT_SCR)
| +       echo setenv fs-date $(DATE)>> $(UBOOT_SCR)
| +       echo setenv rd-1 rootfs.$(BR2_ARCH)-$(DATE).ext2>> $(UBOOT_SCR)
| +       echo setenv rd-2 rootfs.$(BR2_ARCH)-$(DATE).jffs2>> $(UBOOT_SCR)
| +       echo setenv rd rootfs.$(BR2_ARCH)-$(DATE).ext2>> $(UBOOT_SCR)
| +       echo setenv ver 1>> $(UBOOT_SCR)
| +ifneq ($(TARGET_UBOOT_ETHADDR),)
| +       echo setenv ethaddr $(TARGET_UBOOT_ETHADDR)>> $(UBOOT_SCR)

        At least these lines

|   echo setenv kernel-date $(DATE)>> $(UBOOT_SCR)
|   echo setenv fs-date $(DATE)>> $(UBOOT_SCR)
|   echo setenv ver 1>> $(UBOOT_SCR)

        need to be fixed to allow script built correctly, if bash is
used on the host computer, that is.

Cheers,
cj
