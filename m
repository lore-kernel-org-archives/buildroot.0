From: Tim Barr <tbarr@multitech.com>
Date: Mon, 22 Dec 2008 16:10:49 -0600
Subject: [Buildroot] Issues with patching the kernel in buildroot--- fix
	found
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60F3F78CF@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the help of a member of my software team, I have found a fix for
patch-kernel.sh that seems to solve the file pattern expansion problem I
am seeing.
 
In the file "toolchain/patch-kernel.sh", if the following line is
changed:
 
line 12 from:
 
patchpattern=${@-*}
 
to:
 
patchpattern='eval "echo ${@-*}"' <mailto:${@-*}> 
 
Then the patchpattern variable gets expanded correctly from buildroot
and I see the kernel get patched from the patch file I put in the
kernel-patches directory.
 
Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

-----Original Message-----
From: buildroot-bounces@busybox.net
[mailto:buildroot-bounces at busybox.net] On Behalf Of Tim Barr
Sent: Friday, December 19, 2008 11:05 AM
To: buildroot at uclibc.org
Subject: [Buildroot] Issues with patching the kernel in buildroot


I am trying to create a BSP in buildroot for my design so that I have a
working point for the software team. I have created a directory in the
target/device/Atmel directory for my 9g20 design and put in the proper
files and subdirectories, including a kernel-patches. I have populated
this design directory and sub directories with files that have the
proper names based on the kernel and board name I am using. Everything
seems to work properly, except for the board patch of the kernel. I have
a patch file in the kernel-patches directory, but when I run "make
configured" the patch file does not run. The kernel I am using is the
baseline 2.6.25 version, and the name of my patchfile is
linux-2.6.25-100-mt-at91sam9g20-20081217.patch. Here is what I see when
I run "make configured" with the patch file in the kernel-patches
directory. I have added some "echos" to the patch-kernel.sh script to
see what is happening.
 
if [ -d target/device/Atmel/mtcba2sam9g20/kernel-patches/ ] ; then \
toolchain/patch-kernel.sh
/home/falingtrea/buildroot/project_build_arm/MTCBA_G1_SS/linux-2.6.25
target/device/Atmel/mtcba2sam9g20/kernel-patches/ \
linux-2.6.25\*.patch{,.gz,.bz2} ; \
fi
target/device/Atmel/mtcba2sam9g20/kernel-patches/
linux-2.6.25*.patch{,.gz,.bz2}
still running
got here
 
I "echo" out the patchdir and patchpattern variables to see what was
created. The "still running" echo was just after the section of the
script that tests the patchdir and kerneldir parameters to make sure
they are directories. The "got here" echo was right after the "for ...
do" section of the script that does the actual patching.
 
I then executed the following command line from a prompt:
 
toolchain/patch-kernel.sh
/home/falingtrea/buildroot/project_build_arm/MTCBA_G1_SS/linux-2.6.25
target/device/Atmel/mtcba2sam9g20/kernel-patches/
linux-2.6.25-100-mt-at91sam9g20-20081217.patch
 
Which is basically the same command buildroot sends, but with a specific
patch filename. And the patch ran successfully.
 
Then I executed the following command line from a prompt:
 
toolchain/patch-kernel.sh
/home/falingtrea/buildroot/project_build_arm/MTCBA_G1_SS/linux-2.6.25
target/device/Atmel/mtcba2sam9g20/kernel-patches/
linux-2.6.25\*.patch{,.gz,.bz2}
 
And got the following result:
 
target/device/Atmel/mtcba2sam9g20/kernel-patches/
linux-2.6.25*.patch linux-2.6.25*.patch.gz linux-2.6.25*.patch.bz2
still running
Applying linux-2.6.25-100-mt-at91sam9g20-20081217.patch using plaintext:

.
.
.
got here
 
Which again was a sucessful patch. So it seems for some reason the
search pattern buildroot sends is not getting expanded correctly. Does
anyone have any ideas on what is wrong?
 
Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 







 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20081222/6870ff11/attachment.htm 
