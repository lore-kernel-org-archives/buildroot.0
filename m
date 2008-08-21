From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 21 Aug 2008 06:38:48 +0200
Subject: [Buildroot] Adding new processors and boards to buildroot
References: <1CD05B980C94AC408B37C82BBABAA3E60D554DB5@mtsexchange.dc.multitech.prv>
Message-ID: <077E03F486254B29A4EA37B07774600A@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Message
  From: Tim Barr 
  To: buildroot at uclibc.org 
  Sent: Wednesday, August 20, 2008 5:13 PM
  Subject: [Buildroot] Adding new processors and boards to buildroot


  How does something like this actually get done in buildroot?

The board definitions basically define the configuration (.config) for 

1) Buildroot root fs
2) Linux configuration
3) Busybox configuration
4) uCLibc configuration

The easiest way to support the AT91SAM9G20 is to start with the
AT91SAM9260DFC support and do

You may have to edit the buildroot linux configuration to add any patches
you have developed for the AT91SAM9G20.

$ make at91sam9260dfc_defconfig
$ make configured

This will create the linux, uClibc, busybox directories.
You then change the configurations to suit the SAM9G20

Once ready you can do

make saveconfig

which will create a BSP in the "local" directory.
You can have the "local" directory outside the buuildroot tree
by setting an environment variable (IIRC "BUILDROOT_LOCAL")


  We have a design based on the Atmel AT91SAM9G20 part, 
  and the guy working with me on software had to make a lot of modifications to the Timesys 
  build in order to support a different Ethernet MAC chip using the MII interface, 
  use the 32Mbit DataFlash, Use a 16 bit NAND Flash, boot from the NAND Flash, 
  and make some other I/O pin assignment different from the the EK board. 
  We are also using uboot 1.3.3 and had to modify it to work with MII and a 16 bit NAND Flash. 
  He is creating diff files so that other people can setup the same compile code, 
  how do you do something like this in buildroot? 

diff -urN <old> <new> > <diff>.patch
Then submit the patch to the mailing list.

U-Boot 1.3.3 is not supported in buildroot.
There was some issue with mkimage.

I am definitely interested in having SAM9G20 support in buildroot
but I do not have a target board yet.


  I assume it has something to do with the config files in the target directory.

  And how do you set up buildroot to create a JFFS2 root filesystem for the NAND Flash? 
  Is it considered a parallel flash??

If you can figure out the correct parameters for generating the JFFS2 system
you can modify the target/jffs2/jffs2.mk and Config.in and propose a patch.
IIRC you can supply parameters as freetext to JFFS2 


  There is only an option for DataFlash or parallel flash when I run menuconfig.


  Timothy Barr
  Hardware Development Engineer
  for Multi-Tech Systems, Inc.
  tbarr at multitech.com 






------------------------------------------------------------------------------


  _______________________________________________
  buildroot mailing list
  buildroot at uclibc.org
  http://busybox.net/mailman/listinfo/buildroot


Best Regards
Ulf Samuelsson
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080821/24f3ae74/attachment-0001.htm 
