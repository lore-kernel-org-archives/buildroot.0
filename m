From: Robert Smigielski <ptdropper@gmail.com>
Date: Fri, 7 Apr 2017 10:49:16 -0400
Subject: [Buildroot] issue with Linux ARM start_kernel
Message-ID: <CABWt4evkoeQ6deMoLCWSuaZaxKzuR4=_BLEp8g4MKh1KELzjrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I am a long time Linux device driver writer (about 16 years) and now for 3
years creating BSP's using Buildroot.

I am working on a Buildroot project with much back porting on the following
combination of old hardware and old software. The board has a BSP created
by a vendor who no longer supports any of this stuff so now it is in my
hands to make this work so I can add security updates to this pile.

Digi NS9215 ARM 926ejs single core
Linux 2.6.34
CodeSourcery ARM 2010 09 tool chain
GLibC
UBoot

I have been adding packages to this platform and testing each software
image after each package I add. The board is booting and running nicely up
until I added the required old version of NetworkManager at 0.8.1. I am
stuck with the hardware and software versions for this back port.

When I build using "make clean" then "make" - without NetworkManager in the
.config the board boots and runs for days. Great.
When I build using "make clean", reconfigure Buildroot to enable my custom
added NetworkManager=y, the build succeeds, the image is loaded on the
board, and I get the problem:

"Uncompressing Linux... done, booting the kernel."

and then silence. I have this issue repeatedly after doing code clean
up, multiple rounds of make clean and then rebuilding. It is not a
console issue. It is not a machine ID issue. Both of these values are
not altered in this process of building and in bringing up the board
since I am using one single set of sources with and without
NetworkManager. UBoot remains un changed and is in flash on the board.

I am using a JTAG Debugger - the BDI 3000, on the JTAG port to load
the uImage. I followed the BDI 3000 document on how to debug the Linux
Kernel.

Step 1 - verify I can us the BDI to stop the Linux boot, single step,
then release it to boot to a user prompt.

I go through the process of adding a BDI breakpoint at "start_kernel"
address 0xc0008734 via the BDI 3000 on the known good uImage, the
board boots, the BDI stops the ARM, and I can single step the kernel
and then watch the kernel boot to a user prompt. So the process of
breaking, stepping, and then releasing the kernel is a working
process. Great.

When I do the same process on the problematic uImage, the BDI 3000
does NOT STOP at the "start_kernel" entry point at address 0xc00088b4
(different from the known good uImage). I issue the BDI "halt" command
to see what is going on in the ARM. The ARM is stuck looping in this
state:

Current PC 0x00000004

Current CPSR 0xdb (Undefined)

Current PC 0x00000008

Current CPSR 0xdb (Undefined)

Current PC 0x0000000C

Current CPSR 0xdb (Undefined)

Current PC 0x00000010

Current CPSR 0xd7 (Abort)

Current PC 0x00000014

Current CPSR 0xd7 (Abort)

Current PC 0x00000018

Current CPSR 0xd7 (Abort)

Then it loops around back to address 0x4, and the cycle seems to be
repeating forever, which is consistent with what I observe on the console.

I have no idea what this is about nor where to look for solutions. I need
your great wisdom to get me looking at what is going wrong to complete this
porting effort. Thanks very much everyone.

-- 

Robert Smigielski
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170407/62e030ab/attachment.html>
