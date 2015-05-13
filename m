From: John OSullivan <john.osullivan@cloudiumsystems.com>
Date: Wed, 13 May 2015 10:25:27 +0100
Subject: [Buildroot] Question about filesystem and Valgrind
In-Reply-To: <20150512175108.GA8540@postdiluvian.org>
References: <00a301d08cd2$050a5b50$0f1f11f0$@osullivan@cloudiumsystems.com>
 <20150512175108.GA8540@postdiluvian.org>
Message-ID: <00b401d08d5e$c0d63390$42829ab0$@osullivan@cloudiumsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mark,

Thanks for taking the time to reply, my system boots from nand and then
copies the rootfs into ram, the code is run from ram. As indicated when I
look at /proc/self/maps for libc I see a zero device id. I do not see this
on my Ubuntu machine or on my raspberypi.
Do you think the zero device ID is because my filesystem is in Ram? Has
buildroot configs any control over these Ids? I assume lots of people run
valgrind on embedded systems with similar arrangements and valgrind is
expecting a non zero id for libc.

Regards
John

-----Original Message-----
From: Mark Mason [mailto:mason+buildroot at postdiluvian.org] 
Sent: 12 May 2015 18:51
To: John OSullivan
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Question about filesystem and Valgrind

John OSullivan <john.osullivan@cloudiumsystems.com> wrote:

> Hi,
> 
> I am not sure if this is a buildroot issue, but buildroot 2015.02 is 
> the tool I use to build my filesystem for an Arm based embedded board that
I am using.
> 
> I am using libc  (rather than uclibc) and when I run Valgrind on my 
> target it fails with.
> 
> > --2993:0:aspacem  Valgrind: FATAL: aspacem assertion failed:
> > --2993:0:aspacem    segment_is_sane
> 
> The issue it is identifying is with the filesystem:
> 
> If I cat /proc/self/maps I get
> 
> 00008000-00106000 r-xp 00000000 00:00 8773       /bin/busybox
> 0010e000-0010f000 rw-p 000fe000 00:00 8773       /bin/busybox
> 0010f000-00111000 rw-p 00000000 00:00 0          [heap]
> b6dae000-b6eea000 r-xp 00000000 00:00 8937       /lib/libc-2.13.so
>                                 ^^^^^
>                                  dev & ino are always zero
> 
> the entry for /lib/libc-2.13.so should not have 00 for the device number.

0 generally means memory.  Are you running from a ramdisk with
execute-in-place?
