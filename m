From: Steve Spano <steve@fl-eng.com>
Date: Sat, 23 Aug 2008 14:54:57 -0400
Subject: [Buildroot] ### ARM11 Buildroot for MX31
In-Reply-To: <6u80qt$757icq@rrcs-agw-02b.hrndva.rr.com>
Message-ID: <000601c90551$bcde1290$1a01a8c0@flexeon32>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

 

I fixed my issue with Buildroot and here was my process for getting
Buildroot to play with the MX31 board that I have

 

1) I started with the ltlib configuration from freescale and built a
filesystem and kernel

 

2) I copied the kernel sources generated from #1 into its own directory so I
can have a dedicated kernel source to work with. I then applied some changes
in the kernel to work with my board. The changes I applied were to
disable/comnment-out most of the MX31ADS related power management/etc. The
board that I have is sort of like the LiteKit 31 but has some of the MX31
ADS features on it. This is kernel 2.6.22 with a lot of freescale patches
that are not in the mainline kernel.

 

3) I then downloaded buildroot again today and did a make menuconfig

 

4) At #3, I changed the configuration to build a JFFS2 filesystem and target
ARM11. I also change the MTD-UTILITIES to not build an MX31/ARM11 version of
mkfs.jffs2. This kept giving me issues before looking for lzo1.h. I don't
have any plans to build a filesystem image on the MX31, so I just need the
mkfs.jffs2 on the my host PC. One thing I think here that may have been
hanging me up before, was that this time - I set the option to "make all
files owned by root". I didn't do this before and it appeared that this was
the standard option set for the ext2 filesystem.

 

5) I kicked off a build of buildroot and let it generate the JFFS2 image.

 

6) After it was done, I went into the target/generic folder and changed the
device_table.txt to add the following line (very important!)

 

/dev/ttymxc c 660 0 0 207 16 0 1 4

 

This will build a /dev entry for the MX31 internal uarts which are called
through the Freescale driver as ttymxc0 (1,2,3). The above line will give me
a dev entry for major 207 minor 16 for ttymxc0

 

7) Then I went into the project build folder and into my root/etc MX31
filesystem. In the etc folder I changed the following files

 

In inittab, add this line

ttymxc0::respawn:/sbin/getty -L ttymxc0 115200 vt100

 

This will put a login prompt up on my UART#1 (or #0 - the first MX31
internal uart)

 

In securtty, add these lines

ttymcx0

ttymcx1

ttymcx2

ttymcx3

 

So all four internal MX31 uarts (I only use one right now) can allow a root
login

 

I flashed the JFFS2 filesystem into my NOR flash (the filesystem I built was
1.2Meg) and boot it up. I got a login prompt and used the standard
username=root 

 

It took about 20-30 seconds after I hit enter and then I got my # prompt and
I can access my linux now on my MX31.

 

I am also using U-boot to boot linux which has been taken right for the
u-boot git tree and built for the LiteKit31. I hacked u-boot a bit to
account for my NOR flash (which is the same flash that's on the MX31ADS) a
few other minor changes, such as working with the LAN9210 network port that
I have.

 

In a month or so, I would like to post a reference build for the MX31
platform on my company's website and include the u-boot, kernel, and
buildroot system - for others who may want to do this.

 

However, is there anyway a patch-set of some kind can be generated so that
buildroot has a menu-option specifically for the MX31 and automatically
implements the above (minor) changes.

 

On to other issues now! 

 

Thanks

 

Steve Spano, President

Finger Lakes Engineering

 

 

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of steve at fl-eng.com
Sent: Saturday, August 23, 2008 9:28 AM
To: Peter Korsgaard
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] ### ARM11 Buildroot for MX31

 

HI

 

Thanks for the reply. I will try the securetty file and add ttymxc0. The
serial 

port drivers for the MX31 use ttymxc0 as their device ID. I was also
thinking 

of changing the driver to use ttyS so it came up as a standard serial port 

driver because probably everything else may be thinking ttyS and not ttymxc.


I had to add ttymxc and its major/minor number to the devices.txt file in
the 

target/generic  folder.

 

I'll try some more tests and post results later today.

 

Thanks for the reply!

 

Steve

> 

> From: Peter Korsgaard <jacmet@uclibc.org>

> Date: 2008/08/23 Sat AM 02:44:44 EST

> To: <steve@fl-eng.com>

> CC: <buildroot@uclibc.org>

> Subject: Re: [Buildroot] ### ARM11 Buildroot for MX31

> 

> >>>>>   <steve@fl-eng.com> writes:

> 

> Hi,

> 

>  > Hello I have downloaded the buildroot package and have built it for

>  > the ARM11 MX31 processor from Freescale. It is running with kernel

>  > 2.6.22

> 

>  > Everything compiles and loads up, I can get a login prompt for

>  > username/password from the filesystem produced by buildroot.

> 

>  > However, I cannot seem to login. I assumed that the login would be

>  > "root" and no password. I looked into the /etc/passwd and

>  > /etc/shadow files which seemed to confirm that perhaps

>  > root(nopassword) and maybe user(user) was also a login.

> 

> Yes, if you use the generic target skeleton (E.G. don't specify

> anything special) you will have a root account without a password (but

> no "user" account).

> 

> From below it seems like you try to login over the serial port using a

> ttymxc0 device. If so, then the reason why you cannot login is that

> you don't have ttymxc0 listed in /etc/securetty.

> 

> The file comes from target/generic/target_skeleton/etc, but you can

> simply edit it under project_build_arm/uclibc/root/etc and rerun make

> to regenerate your filesystem image.

> 

> I don't see any mention of /dev/ttymxcN in Documentation/devices.txt

> in the kernel sources? I take it that the serial driver isn't in the

> mainline kernel?

> 

>  > THe other thing I tried to do was pass init=/dev/sh and

>  > init=/dev/bash to try to get a direct shell prompt. I don't think

>  > it was connecting to the MX31's serial port because I never saw any

>  > outputs after the filesystem was mounted. Is there a recommended

>  > way to force /dev/sh to appear on a ttyS0 (or actually ttymxc0 for

>  > the MX31)

> 

> I take it you mean /bin/sh not /dev/sh?

> 

> Strange. And you do get output from init and login with the same

> filesystem if you boot without init=/bin/sh?

> 

> -- 

> Bye, Peter Korsgaard

> 

_______________________________________________

buildroot mailing list

buildroot at uclibc.org

http://busybox.net/mailman/listinfo/buildroot

 

 

-- 

Internal Virus Database is out-of-date.

Checked by AVG. 

Version: 7.5.524 / Virus Database: 270.6.0/1602 - Release Date: 8/9/2008
1:22 PM

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080823/e9992f47/attachment-0001.htm 
