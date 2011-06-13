From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jun 2011 23:39:41 +0200
Subject: [Buildroot] [PATCH 7/8] package/autotools: add --{enable,
	disable}-{shared, static} automatically
In-Reply-To: <20110613001630.1281e5c3@skate> (Thomas Petazzoni's message of
	"Mon, 13 Jun 2011 00:16:30 +0200")
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
	<87k4cq7rdq.fsf@macbook.be.48ers.dk> <20110613001630.1281e5c3@skate>
Message-ID: <874o3t9zs2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Sun, 12 Jun 2011 21:59:29 +0200,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> But it does mean that autotools stuff now gets built twice, increasing
 >> the build time..

 Thomas> It's true that I haven't checked the impact on the build time. Does it
 Thomas> really build libraries twice ? Isn't only the link stage performed
 Thomas> twice ?

Yes, in general it needs to build each source file twice because of the
different compiler flags (E.G. -fPIC).

 Thomas> If the impact on the build time is too high, then we could
 Thomas> probably make the static library generation conditional. I
 Thomas> enabled it so that the staging directory contains static
 Thomas> libraries, which allows users to statically link their programs
 Thomas> against some libraries.

Yes, I understand.

I did a quick test with a simple .config with a few libraries:

cat defconfig
BR2_arm=y
BR2_arm926t=y
BR2_JLEVEL=6
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_LZO=y
BR2_PACKAGE_LIBFUSE=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_LIBCGI=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_NEON=y
BR2_PACKAGE_LIBRSYNC=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y
BR2_PACKAGE_BASH=y

Which I first built normally (a) and then with make
SHARED_STATIC_LIBS_OPTS='--disable-static --enable-shared' (b). The
machine was busy doing other stuff, so you cannot completely trust the
build time numbers, but here they are anyway:

(a):
real    27m14.481s
user    45m4.601s
sys     12m11.738s

(b):
real    28m56.879s
user    44m16.506s
sys     10m56.337s

So no significant difference - B is even slightly slower here. Most of
the time is spent building the toolchain.

A naturally leads to a bit bigger staging though:

du -hs {a,b}/staging/
28M     a/staging/
26M     b/staging/

But it (naturally) doesn't affect the image size:
du -hs {a,b}/images
5.0M    a/images
5.0M    b/images

So I think we should just leave it as it is for now.

-- 
Bye, Peter Korsgaard
