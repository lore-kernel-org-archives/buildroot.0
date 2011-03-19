From: Barry Kauler <bkauler@gmail.com>
Date: Sat, 19 Mar 2011 17:30:35 +0800
Subject: [Buildroot] [buildroot] libdrm tries to compile before cairo
In-Reply-To: <20110319082240.7757e09c@surf>
References: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
	<20110319082240.7757e09c@surf>
Message-ID: <AANLkTi=qzgpvb9p3aKAtkQG0PhdFC98Lq8k5fT8qTUmq@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/19/11, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Hello Barry,
>
> On Fri, 18 Mar 2011 18:40:17 +0800
> Barry Kauler <bkauler@gmail.com> wrote:
>
>> Hi, I am a first-time user of Buildroot. It has been chugging along
>> nicely, but libdrm has failed to compile.
>>
>> It reports that 'cairo.h' is missing. Which it is, cairo has not yet
>> been compiled in the target.
>>
>> So, using my own reasoning, I added "cairo" onto LIBDRM_DEPENDENCIES
>> variable in file 'libdrm.mk'. I also deleted
>> output/build/libdrm-2.4.19.
>>
>> However, running 'make' again, it tries to compile libdrm again, and
>> fails.
>>
>> How do I make it compile cairo (and its deps) before libdrm?
>
> Adding "cairo" to LIBDRM_DEPENDENCIES is enough to get it compiled
> before libdrm. Something else is wrong in your setup, because that's
> really enough.
>
> However, Cairo is not required by libdrm. It seems that the problem is
> that since you have Cairo installed on your host, libdrm ./configure
> script thinks that Cairo is available. Such "information leakage" from
> the host environment to the target environment is common and is one of
> the major challenge an embedded Linux build system such as Buildroot
> faces.
>
> However, as libdrm uses pkg-config to detect the presence or absence of
> cairo, it sounds strange to me that it detects the host version. Could
> you please pastebin somewhere the output of the
> output/build/libdrm-2.4.9/config.log case in the case of a failing
> compilation ?
>
> (I couldn't reproduce here in my test environment, since I don't have
> Cairo development files installed on the host)
>
> Thanks,

Thomas,
Thanks for your reply. I don't have that build anymore. What I did to
work around the problem was create a .config file with cairo and
without libdrm. After that had completed, I then substituted another
.config with extra packages, including libdrm, and it worked.

Yes, I encountered this "information leakage" from the host several
times. I am using Puppy Linux, Wary edition 5.1.2, and some
significant differences from Ubuntu/Debian cause trouble for
Buildroot. For example, I got as far as compiling Xorg, but as Puppy
has Xorg in /usr/X11R7, not /usr. this caused trouble as Buildroot.

Next time that I run Buildroot, I might do it from a different host,
such as Ubuntu.

I could give a long list of problems that I encountered along the way
-- all solvable. For example:

udev 114
This is very old, and I don't think that this works properly with
recent kernels. In Puppy Linux we now use 151, which is intended for
the 2.6.27 kernel or later.

libdrm
complained that libudev.so (and libudev.h) is missing, and it was, the
udev build did not create it. As I am unfamiliar with Buildroot, I
chrooted into a rootfs that I had already created with Buildroot and
compiled udev 151 (and manually copied the files to staging and
target), and that satisfied libdrm. My udev config:

./configure --prefix=/usr --sysconfdir=/etc --sbindir=/sbin
--libdir=/usr/lib --with-rootlibdir=/lib --libexecdir=/lib/udev
--build=i486-pc-linux-gnu --disable-extras --disable-introspection

xorg-server 1.7.5
This is an example of information leakage from host. It complained
that xtrans is version 1.0.4, but 1.2.2 is required. However,
Buildroot has xtrans 1.2.5, it is my host system that has 1.0.4.
I "solved" this by replacing /usr/X11R7/lib/pkgconfig/xtrans.pc in my
host with the xtrans.pc from Buildroot.

cairo
it couldn't find the pixman header files. It looks in /usr/include,
but pixman has the header files in /usr/include/pixman-1/. Workaround
is to copy the header files from /usr/lib/pixman-1/ to /usr/lib/ (in
output/target).

xclipboard
Information leakage from host again. Complains missing -lXaw8, which
is in my host, not in Buildroot. I put a symlink in output/target,
libXaw8.so to libXaw7.so, and that workaround fixed it.

Native compile
Yes, I was able to build a rootfs that I can chroot into and compile
packages, however, Buildroot left out /usr/lib/crt1.0, crti.o, crtn.o,
and libc.so. I manually copied these across from output/staging, and
compiling then worked.

Ha ha, that's enough for now :)

Could I ask one question. I haven't come across the answer to this
yet. My build is "i586-unknown-linux-uclibc", for example
/usr/libexec/gcc/i586-unknown-linux-uclibc.
How can I change that to "i586-pc-linux-uclibc"?

Regards,
Barry Kauler
