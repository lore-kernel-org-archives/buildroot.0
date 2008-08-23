From: steve at fl-eng.com <steve@fl-eng.com>
Date: Sat, 23 Aug 2008 8:27:36 -0500
Subject: [Buildroot] ### ARM11 Buildroot for MX31
Message-ID: <6u80qt$757icq@rrcs-agw-02b.hrndva.rr.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI

Thanks for the reply. I will try the securetty file and add ttymxc0. The serial 
port drivers for the MX31 use ttymxc0 as their device ID. I was also thinking 
of changing the driver to use ttyS so it came up as a standard serial port 
driver because probably everything else may be thinking ttyS and not ttymxc. 
I had to add ttymxc and its major/minor number to the devices.txt file in the 
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
