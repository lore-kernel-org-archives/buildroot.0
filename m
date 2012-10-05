From: SGACE at libero.it <SGACE@libero.it>
Date: Fri, 5 Oct 2012 07:16:06 +0200 (CEST)
Subject: [Buildroot] R: buildroot Digest, Vol 76, Issue 25
Message-ID: <9551168.4238871349414166587.JavaMail.root@wmail37>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, i'm using an olimex usb-h and a lpc1766 board (You can see my 
configuration 
on the bottom of the page). When i launch the openocd daemon it "works"  (see 
terminal response 1). Then i try to make the  gdb connect and i get th 
terminal 
response 2 (wich u can see on the bottom under terminal response 2). I don't 
get why it doesn't connect since with telnet it does so. I don't also know if 
this is the correct mailing list to forward this problem, if not feel free to 
ignore my message.

Ty anyw Rob.









***************************************TERMINAL RESPONSE 
1************************************************
roberto at debian:~/Scrivania/nuttx-clean/nuttx$ openocd -f prova.cfg
Open On-Chip Debugger 0.6.0 (2012-09-28-16:37)
Licensed under GNU GPL v2
For bug reports, read
http://openocd.sourceforge.net/doc/doxygen/bugs.html
Info : only one transport option; autoselect 'jtag'
adapter_nsrst_delay: 200
jtag_ntrst_delay: 200
trst_and_srst srst_pulls_trst srst_gates_jtag trst_push_pull srst_open_drain
DEPRECATED! use 'adapter_khz' not 'jtag_khz'
adapter speed: 100 kHz
Info : max TCK change to: 30000 kHz
Info : clock speed 100 kHz
Info : JTAG tap: lpc1766.cpu tap/device found: 0x4ba00477 (mfg: 0x23b, part: 
0xba00, ver: 0x4)




*******TERMINAL RESPONSE 
2*************************************************************************
roberto at debian:~/Scrivania/nuttx-clean/nuttx$ arm-none-eabi-gdb
GNU gdb (Sourcery CodeBench Lite 2012.03-56) 7.2.50.20100908-cvs
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "--host=i686-pc-linux-gnu --target=arm-none-eabi".
For bug reporting instructions, please see:
<https://support.codesourcery.com/GNUToolchain/>.
(gdb) target remote localhost:3333
localhost:3333: Timeout della connessione.
(gdb) 





****************CONFIGURATION********************************************************************************************************************************************
This is my configuration:
interface ft2232
ft2232_device_desc "Olimex OpenOCD JTAG ARM-USB-OCD-H"
ft2232_layout olimex-jtag
ft2232_vid_pid 0x15ba 0x002b

# LPC17xx chips support both JTAG and SWD transports.
# Adapt based on what transport is active.
source [find target/swj-dp.tcl]

if { [info exists CHIPNAME] } {
set  _CHIPNAME $CHIPNAME
} else {
set  _CHIPNAME lpc1766
}

# After reset the chip is clocked by the ~4MHz internal RC oscillator.
# When board-specific code (reset-init handler or device firmware)
# configures another oscillator and/or PLL0, set CCLK to match; if
# you don't, then flash erase and write operations may misbehave.
# (The ROM code doing those updates cares about core clock speed...)
#
# CCLK is the core clock frequency in KHz
if { [info exists CCLK ] } {
set _CCLK $CCLK
} else {
set _CCLK 4000
}
if { [info exists CPUTAPID ] } {
set _CPUTAPID $CPUTAPID
} else {
set _CPUTAPID 0x4ba00477
}

#delays on reset lines
adapter_nsrst_delay 200
jtag_ntrst_delay 200

# LPC2000 & LPC1700 -> SRST causes TRST
reset_config trst_and_srst srst_pulls_trst

#swj_newdap $_CHIPNAME cpu -irlen 4 -expected-id $_CPUTAPID
jtag newtap $_CHIPNAME cpu -irlen 4 -expected-id $_CPUTAPID

set _TARGETNAME $_CHIPNAME.cpu
target create $_TARGETNAME cortex_m3 -chain-position $_TARGETNAME

# LPC1766 has 32kB of SRAM In the ARMv7-M "Code" area (at 0x10000000)
# and 32K more on AHB, in the ARMv7-M "SRAM" area, (at 0x2007c000).
$_TARGETNAME configure -work-area-phys 0x10000000 -work-area-size 0x8000

# LPC1766 has 256kB of flash memory, managed by ROM code (including a
# boot loader which verifies the flash exception table's checksum).
# flash bank <name> lpc2000 <base> <size> 0 0 <target#> <variant> <clock> 
[calc checksum]
set _FLASHNAME $_CHIPNAME.flash
flash bank $_FLASHNAME lpc2000 0x0 0x40000 0 0 $_TARGETNAME \
lpc1700 $_CCLK calc_checksum

# Run with *real slow* clock by default since the
# boot rom could have been playing with the PLL, so
# we have no idea what clock the target is running at.
jtag_khz 100

$_TARGETNAME configure -event reset-init {
# Do not remap 0x0000-0x0020 to anything but the flash (i.e. select
# "User Flash Mode" where interrupt vectors are _not_ remapped,
# and reside in flash instead).
#
# See Table 612. Memory Mapping Control register (MEMMAP - 0x400F C040) bit 
description
# Bit Symbol Value Description Reset
# value
# 0 MAP Memory map control. 0
# 0 Boot mode. A portion of the Boot ROM is mapped to address 0.
# 1 User mode. The on-chip Flash memory is mapped to address 0.
# 31:1 - Reserved. The value read from a reserved bit is not defined. NA
#
# http://ics.nxp.com/support/documents/microcontrollers/?
scope=LPC1766&type=user

mww 0x400FC040 0x01
}


************************************************************************************************************************************************************
