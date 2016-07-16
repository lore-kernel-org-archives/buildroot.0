From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 15:47:36 +0200
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
 yem/libudev-4)
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <20160716154736.19dd42fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 00:16:31 +0200, Yann E. MORIN wrote:

> This series introduces the possibility to just build and install
> libudev, without requiring that the /dev management be handled by
> eudev or systemd.

Thanks. However, I am still not sure that the usefulness vs. complexity
ratio of this patch series is big enough to have it merged.

I compared the installed size of a minimal uClibc system with just
libudev, and a minimal uClibc system with eudev:

 * Minimal uClibc system with just libudev:	1.8 MB
 * Minimal uClibc system with eudev:		3.0 MB [1] [2]

[1] After removing the locales from usr/share/locale
[2] It would be further reduced to 2.8 MB by removing udevadm

So, there is indeed a 1.2 MB difference, but:

 * This comparison is done without adding any "libudev" user, which
   would make the difference in percentage smaller.

 * Many packages that use libudev are not small things (think mesa3d).
   For example, if you build libcec, the difference is then only 3.4 MB
   with full eudev against 2.4 MB with just libudev. And libcec is
   rarely used without a much bigger graphical framework to use it.

So I'm not sure if it's really worth the effort. After all, installing
only libudev without eudev is not really supported upstream (we have to
trick by building only some subdirectories).

I'm not entirely decided yet, so I'm waiting for arguments. But I'm
hesitating between merging this, or asking people who really care about
this to simply remove the eudev daemon in a post-build script.

What do others think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
