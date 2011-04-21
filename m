From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 21 Apr 2011 16:28:27 +0200
Subject: [Buildroot] Problems using buildroot with crosstoll-ng
In-Reply-To: <BANLkTikpiEJaYWGHf+_3LF4D=m-ne10Gww@mail.gmail.com>
References: <BANLkTik6g3rhC1_WfRLkBodNVsOUhjKaJA@mail.gmail.com>
	<201104171740.17634.yann.morin.1998@anciens.enib.fr>
	<BANLkTikpiEJaYWGHf+_3LF4D=m-ne10Gww@mail.gmail.com>
Message-ID: <201104211628.27191.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ettore, All,

On Thursday 21 April 2011 09:42:50 Ettore Campion wrote:
> I just cloned the buildroot git repository (with your fixed applied)
> and tried again.
> With my configuration (glibc 2.9) is always missing ld.so.1 in target/lib.
> This seems to me because in
> toolchain/toolchain-crosstool-ng/crosstool-ng.mk we're looking for
> ld-linux.so and nor for ld.so.

The file should be named by its SONAME. Please run:
  readelf -d ld.so.1 |grep SONAME

That's why we usually care about ld-linux.so, and not ld.so.1.

What is requiring ld.so.1 on your target?


Quoting your original post:
> flashing the generated
> rootfs.jjfs2 led me to a "kernel panic - not syncing: no init found"
> message from the kernel.

Read below, and then run:
  readelf -d /sbin/init

> Taking again a look to crosstool-ng.mk and target/lib I noticed that
> was missing ld.so.1, manually adding the lib to target/lib I got rid
> of the missing init message but in the serial console I do not see
> either any daemons starting nor the login prompt (I got all these
> things with a rootfs created selecting a buildroot-uclibc toolchain);
                                                     ^^^^^^
[--SNIP--]
> drwxr-xr-x ?2 tora tora ? ?4096 2011-04-14 22:47 .
> drwxr-xr-x 16 tora tora ? ?4096 2011-04-14 22:19 ..
> -rwxr-xr-x ?1 tora tora ?164040 2011-04-14 22:28 ld-2.9.so
                                                   ^^^^^^^^^
This is not a uClibc library. It is a glibc library.
Ditto for all the others.

Did you mix binaries built with uClibc with others built with
glibc?

Once you have started to run buildroot, and that the toolchain is built,
and the first program is ./configured, it is not possible to switch to
another C library.

If you need to change the C library, you'll have to restart from scratch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
