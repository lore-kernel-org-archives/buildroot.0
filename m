From: Nimai Mahajan <nimaim@gmail.com>
Date: Wed, 23 Jul 2014 20:21:35 -0400
Subject: [Buildroot] Linux patch failing
Message-ID: <CALoSW67atWSVLwRy9F2Uy0bV6oQG==TZHZeSgpdYsakOn=Bbzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to patch drivers/tty/serial/8250/8250_pci.c and
include/linux/pci_ids.h to add a custom 16 port UART chip to the
3.12.* kernel series. Here is a copy/paste of the patch:

diff -purN linux-3.12.25.orig/drivers/tty/serial/8250/8250_pci.c
linux-3.12.25/drivers/tty/serial/8250/8250_pci.c
--- linux-3.12.25.orig/drivers/tty/serial/8250/8250_pci.c 2014-07-23
14:03:03.354322421 -0400
+++ linux-3.12.25/drivers/tty/serial/8250/8250_pci.c 2014-07-23
14:24:14.286374550 -0400
@@ -1435,6 +1435,8 @@ pci_xr17v35x_setup(struct serial_private
  return -ENOMEM;

  port->port.flags |= UPF_EXAR_EFR;
+ port->port.flags |= UPF_FIXED_TYPE;
+ port->port.type = PORT_16550A;

  /*
  * Setup Multipurpose Input/Output pins.
@@ -1458,6 +1460,10 @@ pci_xr17v35x_setup(struct serial_private
  writeb(128, p + UART_EXAR_TXTRG);
  writeb(128, p + UART_EXAR_RXTRG);
  iounmap(p);
+
+ if(priv->dev->device == 0x8358 && idx >= 8){
+ port->port.uartclk = 62500000;
+ }

  return pci_default_setup(priv, board, port, idx);
 }
@@ -2020,6 +2026,13 @@ static struct pci_serial_quirk pci_seria
  .subdevice = PCI_ANY_ID,
  .setup = pci_xr17v35x_setup,
  },
+ {
+ .vendor = PCI_VENDOR_ID_EXAR,
+ .device = PCI_DEVICE_ID_EXAR_XR17V358_16,
+ .subvendor = PCI_ANY_ID,
+ .subdevice = PCI_ANY_ID,
+ .setup = pci_xr17v35x_setup,
+ },
  /*
  * Xircom cards
  */
@@ -2439,6 +2452,7 @@ enum pci_board_num_t {
  pbn_exar_XR17V352,
  pbn_exar_XR17V354,
  pbn_exar_XR17V358,
+ pbn_exar_XR17V358_16,
  pbn_exar_ibm_saturn,
  pbn_pasemi_1682M,
  pbn_ni8430_2,
@@ -3103,6 +3117,14 @@ static struct pciserial_board pci_boards
  .reg_shift = 0,
  .first_offset = 0,
  },
+ [pbn_exar_XR17V358_16] = {
+ .flags = FL_BASE0,
+ .num_ports = 16,
+ .base_baud = 7812500,
+ .uart_offset = 0x400,
+ .reg_shift = 0,
+ .first_offset = 0,
+ },
  [pbn_exar_ibm_saturn] = {
  .flags = FL_BASE0,
  .num_ports = 1,
@@ -4443,6 +4465,10 @@ static struct pci_device_id serial_pci_t
  PCI_ANY_ID, PCI_ANY_ID,
  0,
  0, pbn_exar_XR17V358 },
+ { PCI_VENDOR_ID_EXAR, PCI_DEVICE_ID_EXAR_XR17V358_16,
+ PCI_ANY_ID, PCI_ANY_ID,
+ 0,
+ 0, pbn_exar_XR17V358_16 },

  /*
  * Topic TP560 Data/Fax/Voice 56k modem (reported by Evan Clarke)

diff -purN linux-3.12.25.orig/include/linux/pci_ids.h
linux-3.12.25/include/linux/pci_ids.h
--- linux-3.12.25.orig/include/linux/pci_ids.h 2014-07-23
14:13:58.162349279 -0400
+++ linux-3.12.25/include/linux/pci_ids.h 2014-07-23 14:18:40.914360877 -0400
@@ -2014,6 +2014,7 @@
 #define PCI_DEVICE_ID_EXAR_XR17V352 0x0352
 #define PCI_DEVICE_ID_EXAR_XR17V354 0x0354
 #define PCI_DEVICE_ID_EXAR_XR17V358 0x0358
+#define PCI_DEVICE_ID_EXAR_XR17V358_16 0x8358

 #define PCI_VENDOR_ID_MICROGATE 0x13c0
 #define PCI_DEVICE_ID_MICROGATE_USC 0x0010

I am keeping all customizations outside of Buildroot so the
buildroot-2014.05 folder remains untouched (all customizations are in
a folder named setup). I am also building out-of-tree so I have an
output folder where I call make as such: make BR2_EXTERNAL=../setup/
pal-pdfcs-r_defconfig O=$PWD -C ../buildroot-2014.05/ followed by a
make. I cannot figure out why the patch keeps failing but here is the
result:

>>> linux 3.12.25 Patching

Applying linux-0001-addcustomexarserialchip.patch using patch:
patching file drivers/tty/serial/8250/8250_pci.c
patching file include/linux/pci_ids.h
for p in /home/user/Desktop/br/setup/board/pal-pdfcs-r/patches/linux ;
do if echo $p | grep -q -E "^ftp://|^http://" ; then
support/scripts/apply-patches.sh
/home/user/Desktop/br/output/build/linux-3.12.25
/home/user/Desktop/br/dl `basename $p` ; elif test -d $p ; then
support/scripts/apply-patches.sh
/home/user/Desktop/br/output/build/linux-3.12.25 $p linux-\*.patch ;
else support/scripts/apply-patches.sh
/home/user/Desktop/br/output/build/linux-3.12.25 `dirname $p`
`basename $p` ; fi done

Applying linux-0001-addcustomexarserialchip.patch using patch:
patching file drivers/tty/serial/8250/8250_pci.c
Hunk #1 succeeded at 1485 (offset 50 lines).
Hunk #2 succeeded at 1515 with fuzz 2 (offset 55 lines).
Hunk #3 succeeded at 2039 (offset 13 lines).
Hunk #4 FAILED at 2452.
Hunk #5 succeeded at 3138 (offset 22 lines).
Hunk #6 succeeded at 4968 with fuzz 1 (offset 504 lines).
1 out of 6 hunks FAILED -- saving rejects to file
drivers/tty/serial/8250/8250_pci.c.rej
patching file include/linux/pci_ids.h
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file include/linux/pci_ids.h.rej
Patch failed!  Please fix linux-0001-addcustomexarserialchip.patch!

Why does hunk 4 fail? It is simply adding a line in the file. What's
wrong with the pci_ids.h addition? I'm pretty sure if I patch this
manually, it will work just fine. Is apply-patches.sh doing something
odd? What am I doing wrong so I know how to apply patches in the
future? Thanks.
