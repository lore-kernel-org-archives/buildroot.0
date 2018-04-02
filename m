From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 08:38:28 +0200
Subject: [Buildroot] [PATCH 1/1] rust: make sure the cxx compiler is
 also set for the target
In-Reply-To: <7E1DAB3C-F973-4E41-8E6F-E603021DCFF9@storagecraft.com>
References: <20180228173852.66069-1-charles.hardin@storagecraft.com>
 <20180402004857.7e7e46c1@windsurf>
 <F8479AD1-B731-4235-A6C6-A517165DD553@storagecraft.com>
 <20180402005738.1d603538@windsurf>
 <1B48158D-B250-46BC-A4B8-7A2816D2573A@storagecraft.com>
 <7E1DAB3C-F973-4E41-8E6F-E603021DCFF9@storagecraft.com>
Message-ID: <20180402083828.54d43b63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[Side note: it is customary on open-source mailing list to avoid
 top-posting, and instead reply below the text you are replying to.
 Thanks!]

On Sun, 1 Apr 2018 23:05:11 +0000, Charles Hardin wrote:

> Oh, I think I might remember the problem on TARGET - HOST, notice the core_avx2
> is our target and our buildslaves don?t have avx2 and rust has some stage where it
> built a local tool and it didn?t run on the buildslave because it used the cross compiler

Well, that's a severe bug. If Rust uses the cross-compiler to build a
program that it then runs on the host, this is not going to work on a
number of situations. Your defconfig uses glibc for the target, and
your host most likely uses glibc as well, so there are some chances
that a tool built with the cross-compiler will also run on the host.
But if the CPU optimization options are different (like you had with
AVX2) or the C library is different than glibc, then the tool built
with the cross-compiler will definitely not run on the host.

However, we do have a x86-64 uClibc configuration in our autobuilders,
which is built on a x86-64 machine, and I don't think we have seen any
issue. So, I'm a bit puzzled.

Which specific internal tool was causing the problem ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
