From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 20 Jun 2007 13:36:49 +0200
Subject: [Buildroot] [patch] sysroot support in toolchain,
	use correct pathes in staging_dir
In-Reply-To: <20070515114335.GA22166@aon.at>
References: <20070410103901.GC15274@aon.at> <20070515114335.GA22166@aon.at>
Message-ID: <20070620113649.GA27263@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 15, 2007 at 01:43:35PM +0200, Bernhard Fischer wrote:
>On Tue, Apr 10, 2007 at 12:39:01PM +0200, Bernhard Fischer wrote:
>>Hi,
>>
>>This is a heads-up that i mean to correct the pathes to includes and
>>libs in the staging dir as suggested in bug 
>>http://busybox.net/bugs/view.php?id=1290
>>Doing so is ment to ease moving the staging-dir (and it's
>>cross-compiler) to a different machine for re-use.
>>
>>The theory of operation is that we aim to keep the positions of "normal"
>>desktop machines for the directory layout and also build the toolchain
>>with full sysroot-support to avoid trouble with hardcoded search pathes
>>to headers and libraries.
>>
>>A preliminary incarnation which only takes care of gcc-4.x is here:
>>
>>http://uclibc.org/~aldot/buildroot.mine.cow.20070406-1957.diff.bz2
>>(134688 Bytes)
>
>updated patch is here:
>http://uclibc.org/~aldot/buildroot.mine.cow.20070515-1321.diff.bz2
>
>I converted a few more packages to install their files into the proper
>place.
>gcc-3.x support is (still) not done, 4.x works fine. Anyone willing to
>fix gcc-3.x?

I have applied this big patch as r18864.

A few notes:
- gcc-3.4.6 builds (tested against i386 and x86_64) but doesn not have
  sysroot support (for obvious reasons).
- gcc-4.x now have sysroot support
  Now you should be able to move your cross-compiler to a different
  machine, with a completely different location (only staging_dir/*
  should be kept intact.)
- separation of /usr/lib and /lib in the staging_dir; These should be
  kept as closely to a "normal" filesystem-layout as possible.
  If you do not want usr, then symlink it according to your needs
  manually.
- the kernel headers are now fully copied to the staging area. This
  fixes e.g. x86_64 and potentially other parts that previously failed
  to find some kernel-internal headers.

The patch was tested against gcc-3.4.6 with binutils-2.17 and
2.17.50.0.16; for the gcc-4 series, gcc-4.2.0 was used.

It is possible that some packages now fail to install properly. These
need to fix their installation prefix to distinguish between usr/lib and
lib/ properly.
