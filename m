From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Aug 2020 18:13:34 +0200
Subject: [Buildroot] Error configuring eudev
In-Reply-To: <CAOiXNkBVORsGuNporGcJhsWOYy06auQ3Mkfh0kh6ZHkyt7qmxQ@mail.gmail.com>
References: <CAOiXNkBVORsGuNporGcJhsWOYy06auQ3Mkfh0kh6ZHkyt7qmxQ@mail.gmail.com>
Message-ID: <20200821161334.GB17579@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrey, All,

On 2020-08-21 14:21 +0200, Andrey Nechypurenko spake thusly:
> I am currently playing with an STM32MP157C-DK2 board (using 2020.05.1
> Buildroot's defconfig) and would like to run hardware accelerated
> graphics. Since X is not cool anymore :-) I decided to run weston.
> 
> Weston package requires udev. So I selected tmpfs+eudev for /dev
> management since this is the only option which makes weston appear in
> menuconfig. After that, attempt to build the image leads to the error
> during configuration of eudev:
> 
> checking for blkid >= 2.20... no
> configure: error: *** blkid support requested but not found

This is usually the case when you change some settings in the
menuconfig, but do not start the build from scratch:

    https://buildroot.org/downloads/manual/manual.html#full-rebuild

Did you run 'make clean' before restarting your build? If not, try so.

Regards,
Yann E. MORIN.

> However, blkid is selected as part of the util-linux and as far as I
> can tell has been built. It seams like configure script of the eudev
> trying to invoke pkg-config to find blkid, so I was searching for .pc
> files from blkid in build directory:
> 
> $ find ./ -name blkid.pc
> ./host/lib/pkgconfig/blkid.pc
> ./build/host-util-linux-2.35.1/libblkid/blkid.pc
> 
> I was slightly surprised to see them in the host/ directory. Libraries
> are also installed in host/ :
> 
> $ find ./ -name "libblkid*"
> ./host/share/man/man3/libblkid.3
> ./host/lib/libblkid.so.1
> ./host/lib/libblkid.la
> ./host/lib/libblkid.so.1.1.0
> ./host/lib/libblkid.so
> 
> Is it how it meant to be? Then what might be the reasons why eudev
> could not find it?
> 
> Anyway I would be very thankful for any hints how to overcome this
> problem and achieve my goal to run wayland/weston?
> 
> Thank you,
> Andrey.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
