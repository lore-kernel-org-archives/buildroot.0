From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Fri, 21 Aug 2020 14:21:02 +0200
Subject: [Buildroot] Error configuring eudev
Message-ID: <CAOiXNkBVORsGuNporGcJhsWOYy06auQ3Mkfh0kh6ZHkyt7qmxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am currently playing with an STM32MP157C-DK2 board (using 2020.05.1
Buildroot's defconfig) and would like to run hardware accelerated
graphics. Since X is not cool anymore :-) I decided to run weston.

Weston package requires udev. So I selected tmpfs+eudev for /dev
management since this is the only option which makes weston appear in
menuconfig. After that, attempt to build the image leads to the error
during configuration of eudev:

checking for blkid >= 2.20... no
configure: error: *** blkid support requested but not found

However, blkid is selected as part of the util-linux and as far as I
can tell has been built. It seams like configure script of the eudev
trying to invoke pkg-config to find blkid, so I was searching for .pc
files from blkid in build directory:

$ find ./ -name blkid.pc
./host/lib/pkgconfig/blkid.pc
./build/host-util-linux-2.35.1/libblkid/blkid.pc

I was slightly surprised to see them in the host/ directory. Libraries
are also installed in host/ :

$ find ./ -name "libblkid*"
./host/share/man/man3/libblkid.3
./host/lib/libblkid.so.1
./host/lib/libblkid.la
./host/lib/libblkid.so.1.1.0
./host/lib/libblkid.so

Is it how it meant to be? Then what might be the reasons why eudev
could not find it?

Anyway I would be very thankful for any hints how to overcome this
problem and achieve my goal to run wayland/weston?

Thank you,
Andrey.
