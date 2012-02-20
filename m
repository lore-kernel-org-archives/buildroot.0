From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Mon, 20 Feb 2012 17:01:48 +0100
Subject: [Buildroot] [PATCH]apply-patches.sh: remove overlay directory
	feature, add archive management
Message-ID: <1329753713-1722-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

These patches improve apply-patches.sh script in order to allow the use of
archives containing several patches.

Changes from RFC version:
- remove overlay directory feature
- remove directory management, now they are skipped


These patches have been tested on an armadeus_apf9328_defconfig build in order
to check that nothing has been broken.


To test the archive feature, I used an archive available on linux4sam to patch
a 2.6.39 kernel:

>>> linux 2.6.39 Patching /package/linux
for p in ftp://www.linux4sam.org/pub/linux/2.6.39-at91/2.6.39-at91-exp.tar.gz ; do if echo $p | grep -q -E "^ftp://|^http://" ; then support/scripts/apply-patches.sh /home/ldesroches/wor
kspace/buildroot/output/build/linux-2.6.39 /home/ldesroches/workspace/buildroot/dl `basename $p` ; elif test -d $p ; then support/scripts/apply-patches.sh /home/ldesroches/workspace/buil
droot/output/build/linux-2.6.39 $p linux-\*.patch ; else support/scripts/apply-patches.sh /home/ldesroches/workspace/buildroot/output/build/linux-2.6.39 `dirname $p` `basename $p` ; fi d
one

Applying 2.6.39-at91-exp-0001-dmaengine-at_hdmac-modify-way-to-use-interrupts.patch using plaintext: 
patching file drivers/dma/at_hdmac.c
patching file drivers/dma/at_hdmac_regs.h
...

ldesroches at ibiza:buildroot (ludo/apply-patches)$ find . -name "\.applied_patches_list"
./output/build/host-zlib-1.2.5/.applied_patches_list
./output/build/host-lzo-2.06/autoconf/.applied_patches_list
./output/build/libmad-0.15.1b/.applied_patches_list
./output/build/host-autoconf-2.65/.applied_patches_list
...

ldesroches at ibiza:buildroot (ludo/apply-patches)$ ls output/build/linux-2.6.39/.patches-2.6.39-at91-exp.tar.gz-unpacked/
2.6.39-at91-exp-0001-dmaengine-at_hdmac-modify-way-to-use-interrupts.patch       2.6.39-at91-exp-0053-sound-sam9x5_wm8731-machine-driver-for-at91sam9x5-wm.patch
2.6.39-at91-exp-0002-dmaengine-at_hdmac-add-cyclic-DMA-operation-support.patch   2.6.39-at91-exp-0054-mtd-atmel_nand-do-not-scream-while-using-PIO-instead.patch
...


Regards

Ludovic
