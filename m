From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Mon, 24 Aug 2009 11:13:46 -0700 (PDT)
Subject: [Buildroot] diskimage HOWTO
In-Reply-To: <f3566d60908232239l268a7233necd10a6dd342f58f@mail.gmail.com>
Message-ID: <263477.7826.qm@web58202.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--- On Sun, 8/23/09, Bai Shuwei <baishuwei@gmail.com> wrote:

> From: Bai Shuwei <baishuwei@gmail.com>
> Subject: [Buildroot] diskimage HOWTO
> To: buildroot at busybox.net, qemu-devel at nongnu.org
> Date: Sunday, August 23, 2009, 10:39 PM
> Hi, All:
>   I want to build a test enviroment with QEMU and
> buildroot. But I don't know how to build the diskimage
> which same as linux-0.2.img offered by BUILD-ROOT. I build
> the diskimage following the  
>    buildroot-2009.05/docs/README.diskimage,
> but failure. 
>  
Hi Bai,

I tried following those instructions and failed too. It is very complicated. There are 4 things that must be correct and in sync, the kernel, busybox, uclibc (compiler and filesystem), and bootstrap. 

Yesterday I did get things to run with qemu. I intend to update the docs when I can systematically get everything to work. For one thing on Ubuntu Jaunty I have not figured out how to get kqemu to install or work.... I have not mastered emulated ethernet either.

Anyway I built buildroot from a fairly recent git version - I suspect any older release will work. I took the defaults in all the configurations, the built-in configs are missing lots of the new options. This is curious, you do a make, it starts menuconfig, it thinks awhile and then another of the 4 main things wants to be menuconfiged. Anyway, I selected plain old 386 as my cpu and built with all the built in minimal options. It built the first time (way to go Peter!).

Originally, either by default or I mistakenly selected it, I built a rootfs.i386.jffs2 file system (from the buildroot make menuconfig). This did not work because the kernel did not know how to boot from anything but an ext2 or cramfs file system. There must be a kernel parameter to fix this, but I don't know what it is. So to get things going select an ext2 file system.

I discovered a gui interface for qemu, called "qemu launcher". Use that it simplifies things. You no longer have to build another disk image with your bootstrap and kernel inside with your root filesystem. No partitioning required etc. 

IN the GUI:

I pointed hard disk 0 to "/home/calfee/buildroot/buildroot/binaries/uclibc/rootfs.i386.ext2" boot disk: "Hard disk 0".

Then on the linux boot tab I checked "boot linux kernel directly", removing the need to fiddle with grub.

I put in kernel image "/home/calfee/buildroot/buildroot/binaries/uclibc/bzImage"

Then on the kernel command line I put root=/dev/hda

At this point press the launch button, and linux will boot and ask for your login. By default your username is root, with no password. Now you are running your built system!

I would like to get the diskimage instructions to work, people like me want to test on a known platform (their development PC) before jumping directly to test hardware, it reduces the unknowns.

If you get qemu ethernet working, please post an email with instructions.

Regards, Steve


      
