From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2011 10:58:33 +0100
Subject: [Buildroot] [buildroot] libdrm tries to compile before cairo
In-Reply-To: <AANLkTi=qzgpvb9p3aKAtkQG0PhdFC98Lq8k5fT8qTUmq@mail.gmail.com>
References: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
	<20110319082240.7757e09c@surf>
	<AANLkTi=qzgpvb9p3aKAtkQG0PhdFC98Lq8k5fT8qTUmq@mail.gmail.com>
Message-ID: <20110319105833.329c099a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2011 17:30:35 +0800
Barry Kauler <bkauler@gmail.com> wrote:

> Thanks for your reply. I don't have that build anymore.

Could you reproduce it ? Without this, we will not be able to fix the
problem.

> What I did to
> work around the problem was create a .config file with cairo and
> without libdrm. After that had completed, I then substituted another
> .config with extra packages, including libdrm, and it worked.

This is an ugly way of workarounding the problem. The whole purpose of
Buildroot is to provide a *automated* and *reproducible* way of
building an embedded Linux system. So, if you need to do several
builds and need to adjust the configuration between builds, something
is really wrong and needs to be fixed.

To be honest, I'm quite impressed by the uglyness of the workarounds
people are ready to accept.

> Yes, I encountered this "information leakage" from the host several
> times. I am using Puppy Linux, Wary edition 5.1.2, and some
> significant differences from Ubuntu/Debian cause trouble for
> Buildroot. For example, I got as far as compiling Xorg, but as Puppy
> has Xorg in /usr/X11R7, not /usr. this caused trouble as Buildroot.

Which troubles ?

> udev 114
> This is very old, and I don't think that this works properly with
> recent kernels. In Puppy Linux we now use 151, which is intended for
> the 2.6.27 kernel or later.

Yes, our udev is very old. We have patches to bump udev, but they
haven't been merged yet. I hope we can get them merged for the next
Buildroot release, but recent udev versions were causing problems with
uClibc.

> libdrm
> complained that libudev.so (and libudev.h) is missing, and it was, the
> udev build did not create it. As I am unfamiliar with Buildroot, I
> chrooted into a rootfs that I had already created with Buildroot and
> compiled udev 151 (and manually copied the files to staging and
> target), and that satisfied libdrm. My udev config:
> 
> ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/sbin
> --libdir=/usr/lib --with-rootlibdir=/lib --libexecdir=/lib/udev
> --build=i486-pc-linux-gnu --disable-extras --disable-introspection

libdrm can use libudev, but it is not mandatory, just like cairo. I
suspect that libdrm also discovered that libudev was installed on the
host, which led it thinking that it was available on the target as well.

> xorg-server 1.7.5
> This is an example of information leakage from host. It complained
> that xtrans is version 1.0.4, but 1.2.2 is required. However,
> Buildroot has xtrans 1.2.5, it is my host system that has 1.0.4.
> I "solved" this by replacing /usr/X11R7/lib/pkgconfig/xtrans.pc in my
> host with the xtrans.pc from Buildroot.

Ugly. Really.

> cairo
> it couldn't find the pixman header files. It looks in /usr/include,
> but pixman has the header files in /usr/include/pixman-1/. Workaround
> is to copy the header files from /usr/lib/pixman-1/ to /usr/lib/ (in
> output/target).

Similar. With Buildroot, if you need to do anything manually, it
defeats the whole purpose of having an *automated* and *reproducible*
build. So *please* report bugs when you have problems.

> xclipboard
> Information leakage from host again. Complains missing -lXaw8, which
> is in my host, not in Buildroot. I put a symlink in output/target,
> libXaw8.so to libXaw7.so, and that workaround fixed it.

Same thing.

> Native compile
> Yes, I was able to build a rootfs that I can chroot into and compile
> packages, however, Buildroot left out /usr/lib/crt1.0, crti.o, crtn.o,
> and libc.so. I manually copied these across from output/staging, and
> compiling then worked.

Yes, I think native compilation is broken in 2011.02, and I haven't had
the time to dig into it. Buildroot is designed for *cross-compilation*,
so the availability of a native toolchain in the target is not our top
priority. But we would happily accept patches to improve the situation.

> Could I ask one question. I haven't come across the answer to this
> yet. My build is "i586-unknown-linux-uclibc", for example
> /usr/libexec/gcc/i586-unknown-linux-uclibc.
> How can I change that to "i586-pc-linux-uclibc"?

You can change the value of REAL_GNU_TARGET_NAME in
package/Makefile.in, and it should probably work.

But again, please report bugs when you have issues, and don't
workaround them in ugly ways. If you face issues, others are probably
facing similar issues.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
