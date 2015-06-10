From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Jun 2015 10:18:51 +0200
Subject: [Buildroot] Kernel zImage under 1MB
In-Reply-To: <CADMiy=JZSro09MASQy51wKeDy2uES0D-kWwNgtL95s6z1AmxrA@mail.gmail.com>
 (Michal Gonda's message of "Wed, 10 Jun 2015 09:20:43 +0200")
References: <CADMiy=KWH-W4VGUjaMF8mmFTSRUxT13xbTeoWigo=gme8GDwKw@mail.gmail.com>
 <87pp54jzw1.fsf@dell.be.48ers.dk>
 <CADMiy=JZSro09MASQy51wKeDy2uES0D-kWwNgtL95s6z1AmxrA@mail.gmail.com>
Message-ID: <87lhfsj7ro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michal" == Michal Gonda <gonda.miso@gmail.com> writes:

 > Thank you Yegor for link.
 > Hi Peter,

 > Yes I ment 1MB, sorry for the typo :)
 > To specify little bit more the setup. Altera SoC cyclon 5 arm 9.
 > 1GB sdRam but unfortunatelly just around ~6MB qspi flash for kernel +
 > rootfs image.

6MB? I thought you said 1MB for kernel+rootfs? 6MB is a lot more doable
with minimal effort.

 > But what you described is exactly what I need to accomplish.
 > A static uClibc based build with busybox +
 > dropbear as smallest possible image is perfect.
 > As you said I can drop probably more later on but few kB here and there if
 > kernel is ~1MB is perfect.
 > Even better ~450kB as you did.

Notice that the 450KB was for the rootfs. I don't know how big your
socfgpa kernel image is, but I would guess it is significantly bigger
than 1MB even with XZ compression?

 > If you have a time could you briefly point out the steps and parts I should
 > focused on ?

For the kernel? Basically just turn off all options that you don't need
and compress the kernel with XZ (config KERNEL_XZ).

For Buildroot just enable static linking (Build
options->libraries->static only) and only busybox+dropbear. For
filesystem you can either use an initramfs embedded in the kernel or
squashfs (with XZ compression).

 > As a question aside, Is it enough just
 > "make manuconfig" and "make" rebuild the kernel and rootfs or do i need to

Buildroot doesn't track changes in the configuration file / what files
were added by a package, so it will not remove a package if you do a
build and then use menuconfig to remove the package again.

It WILL rebuild the kernel or busybox after you used make
linux-menuconfig or make busybox-menuconfig to tweak the configuration.

-- 
Venlig hilsen,
Peter Korsgaard 
