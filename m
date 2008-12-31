From: Andrew Wiley <debio264@gmail.com>
Date: Wed, 31 Dec 2008 13:11:48 -0600
Subject: [Buildroot] Can't Login to New System
In-Reply-To: <ecbbfeda0812311103q219eea7evdb366ae3cfa8ae4e@mail.gmail.com>
References: <ecbbfeda0812301520k69461096nbb27f0c5ca65c11@mail.gmail.com>
	<87iqp03ivp.fsf@macbook.be.48ers.dk>
	<ecbbfeda0812311103q219eea7evdb366ae3cfa8ae4e@mail.gmail.com>
Message-ID: <ecbbfeda0812311111ra2182ach9eefaa4a47bda8d2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 31, 2008 at 1:26 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Andrew" == Andrew Wiley <debio264@gmail.com> writes:
>
> Hi,
>
>  Andrew> As you can see, I didn't change the login message or
>  Andrew> anything. All I've done to the root filesystem is moved /dev
>  Andrew> from an out of date (but working) root to buildroot's
>  Andrew> root. As far as I can tell, this has caused no problems. The
>  Andrew> lines in /etc/inittab that start the getty you see here are:
>
>  Andrew> # Put a getty on the serial port
>  Andrew> ttyAM0::respawn:/sbin/getty -L ttyAM0 57600 vt100
>
>  Andrew> ttyAM0 is a serial port.
>
> You need to add ttyAMx to /etc/securetty. If you tell me the
> major/minor numbers of /dev/ttyAMx, then I'll add device nodes +
> securetty entries for them to the default rootfs.
>
> --
> Bye, Peter Korsgaard
>

There's a good chance you already have these somewhere, but when I
moved the old /dev filesystem over, I had little to no idea what I was
doing (I'm used to having good old uDev there to work magic for me).
Anyway, hopefully this is all the info you need:
[arew264 at CaitSith dev]$ stat ttyAM*
 File: `ttyAM0'
 Size: 0               Blocks: 0          IO Block: 1024   character
special file
Device: 702h/1794d      Inode: 113         Links: 1     Device type: cc,10
Access: (0640/crw-r-----)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2007-09-28 14:15:05.000000000 -0500
Modify: 2007-09-28 14:15:05.000000000 -0500
Change: 2008-12-30 16:10:00.000000000 -0600
 File: `ttyAM1'
 Size: 0               Blocks: 0          IO Block: 1024   character
special file
Device: 702h/1794d      Inode: 114         Links: 1     Device type: cc,11
Access: (0640/crw-r-----)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2007-09-28 14:15:05.000000000 -0500
Modify: 2007-09-28 14:15:05.000000000 -0500
Change: 2008-12-30 16:10:00.000000000 -0600
[arew264 at CaitSith dev]$

These are the two serial ports on the EDB9302. There are actually
three, but the third one isn't actually connected to a jack, and thus
can't be used.

Anyway, my /etc/securetty looks like this:
[arew264 at CaitSith etc]$ cat securetty
tty1
tty2
tty3
tty4
tty5
tty6
tty7
tty8
ttyS0
ttyS1
ttyS2
ttyS3
ttyAMA0
ttyAMA1
ttyAMA2
ttyAMA3
ttyUL0
ttyUL1
ttyUL2
ttyUL3
ttyPSC0
ttyPSC1
ttyPSC2
ttyPSC3
ttyAM0
ttyAM1

[arew264 at CaitSith etc]$

The issue is still there.

Thanks for the help so far,
Andrew Wiley
