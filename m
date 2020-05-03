From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 03 May 2020 05:09:07 +0000
Subject: [Buildroot] [Bug 12846] New: SAMA5D3-Xplained Default configuration
 can't start U-Boot
Message-ID: <bug-12846-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12846

            Bug ID: 12846
           Summary: SAMA5D3-Xplained Default configuration can't start
                    U-Boot
           Product: buildroot
           Version: 2020.02.1
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: therealergo at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

OS: Ubuntu 20.04 LTS

Following the instructions in board/atmel/readme.txt for the SAMA5D3-Xplained
boot from NAND with either atmel_sama5d3_xplained_defconfig or
atmel_sama5d3_xplained_dev_defconfig, the image does not boot past
AT91Bootstrap.

Only the following is output from the board:

  RomBOOT

  AT91Bootstrap 3.9.0 (Sat 02 May 2020 09:50:11 PM CDT)

  ACT8865: Set REG1/REG2/REG3 Power-saving mode
  ACT8865: Disable ACT8865's I2C interface
  NAND: ONFI flash detected
  NAND: Manufacturer ID: 0x2c Chip ID: 0xda
  NAND: Page Bytes: 2048, Spare Bytes: 64
  NAND: ECC Correctability Bits: 4, ECC Sector Bytes: 512
  NAND: Disable On-Die ECC
  NAND: Initialize PMECC params, cap: 4, sector: 512
  NAND: Image: Copy 0xc0000 bytes from 0x40000 to 0x26f00000
  NAND: Done to load image

However, when the U-Boot version is changed to "linux4sam_5.5" by changing the
"U-Boot Version" from "Custom tarball" to "Custon Git Repository," changing
"URL of custom repository" to "https://github.com/linux4sam/u-boot-at91.git"
and changing "Custom repository version" to "801b789," the image boots
successfully.

I've done the debugging that I can, and I'm certain that AT91Bootstrap is
copying the U-Boot image into RAM and jumping to it, but I haven't been able to
narrow down the issue any further.

Steps to reproduce:
> make atmel_sama5d3_xplained_defconfig
> make
> Put board into RomBOOT (open JP5, power up, close JP5)
> ./board/atmel/flasher.sh ./output /dev/ttyACM0 sama5d3_xplained
> (flash completes successfully)
> Restart board

-- 
You are receiving this mail because:
You are on the CC list for the bug.
