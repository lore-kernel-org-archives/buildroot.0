From: Juha Lumme <juha.lumme@gmail.com>
Date: Sat, 17 Nov 2012 20:07:28 +0900
Subject: [Buildroot] Built a file system,
 have a working kernel - how to login ?
In-Reply-To: <20121117111132.17a91542@skate>
References: <CAF-Ht3yZfCDAMpPGJ7NFd_RQ0brOwxw3pSSoA3YFtzVf7kpf2g@mail.gmail.com>
 <20121117111132.17a91542@skate>
Message-ID: <CAF-Ht3xTA8gLLFS5j64LFSQ9_U5O7+42Uj0Yq4CMZWWZb3g3YA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tomas,

First, thanks for your reply, I really appreciate it!

My reference is Olinuxino maxi, made by Olimex. It's running Freescales
i.mx233.

Regarding the inittab and getty configuuration; Actually, that is a copy
paste error for some reason there is a hash in there. In the inittab, that
line is not commented out.

I didn't compile kernel with buildroot, since kernel requires couple
patches, and also the sources are downloaded from freescale, not kernel.org(
https://github.com/koliqi/imx23-olinuxino/blob/master/Building%20a%20kernel%20%20for%20the%20OLinuXino.md
 ).
I'm not that proficient with buildroot (or building kernels) that I know
how to enable buildroot to compile this "custom kernel".. Do you see this
making my life much more difficult if I compile kernel separately ?

I checked my kernel config, and it seems it has this flag enabled:
CONFIG_DEVTMPFS=y
However: # CONFIG_DEVTMPFS_MOUNT is not set

In buildroot, I didn't change the /dev management, so it's currently set as
"static using device table". I guess there is a mismatch now..


Thank you,
Juha


On Sat, Nov 17, 2012 at 7:11 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Juha Lumme,
>
> On Sat, 17 Nov 2012 17:22:27 +0900, Juha Lumme wrote:
>
> > I'm new to buildroot, and actually also to creating linux systems. I
> really
> > need help understanding some basics of how a system bring up should
> happen..
> > I have been working on a custom system of mine, running currently on a
> > reference HW from Olimex.
> >
> > I have built a working kernel, and now I created a file system with
> > buildroot with all the settings default. Well, I did change the default
> > console to ttyAMA0, as that is passed to the kernel by the loader.
>
> Which /dev management method did you choose in the Buildroot
> configuration?
>
> > Now, the system boots up to the mounting filesystem, and then just hangs
> > there:
> > .....
> > [    3.130000] VFS: Mounted root (ext3 filesystem) on device 179:2.
> > [    3.140000] Freeing init memory: 144K
> > Starting logging: OK
> > Starting network...
> > ip: RTNETLINK answers: Operation not permitted
> > ip: SIOCSIFFLAGS: Permission denied
> >
> > (The whole boot log is here: http://paste.ubuntu.com/1364407/ )
> >
> > Can someone please educate me a bit what are the steps needed to get a
> > login prompt, and to be able to access the system ? I don't really
> > understand how the TTY links in /dev/ work, and how I need to tie them to
> > the kernel configuration..
> >
> > My understanding is that inittab is the file I should modify.. Contents
> of
> > that is:
>
> No, you shouldn't have to modify the inittab file.
>
> > # Startup the system
> > null::sysinit:/bin/mount -t proc proc /proc
> > null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
> > null::sysinit:/bin/mkdir -p /dev/pts
> > null::sysinit:/bin/mkdir -p /dev/shm
> > null::sysinit:/bin/mount -a
> > null::sysinit:/bin/hostname -F /etc/hostname
> > # now run any rc scripts
> > ::sysinit:/etc/init.d/rcS
> >
> > # Put a getty on the sttyAMA0::respawn:/sbin/getty -L ttyAMA0 115200
> vt100
> > # GENERIC_SERIAL
>
> If your inittab really looks like this, then there is no way it can
> work: the line starting getty is commented out.
>
> So:
>
>  *) Do not modify the inittab
>
>  *) Tell us what hardware you're using exactly, becausing depending on
>     the hardware, the ttyXYZn to use is different.
>
>  *) Tell us which /dev management style you've chosen. If you chose
>     devtmpfs or mdev or udev, then make sure your kernel has
>     CONFIG_DEVTMPFS + CONFIG_DEVTMPFS_MOUNT (Buildroot ensures that your
>     kernel is built with those options if Buildroot is responsible for
>     building your kernel, but if you build your kernel outside of
>     Buildroot, it's your job).
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121117/f434fdd0/attachment.html>
