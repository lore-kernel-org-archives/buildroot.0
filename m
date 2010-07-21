From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jul 2010 08:58:22 +0200
Subject: [Buildroot] xfsprogs 3.0.3 without libxfs in rootfs
In-Reply-To: <4C4613A2.90006@gmx.net>
References: <4C4613A2.90006@gmx.net>
Message-ID: <20100721085822.5d2a34ae@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jul 2010 23:22:42 +0200
Ossy <ossy1980@gmx.net> wrote:

> Since xfsprogs 3.0.3 doesn't build the required xfslib in the current 
> tree. I tried to bump to the newer version.
> I figured out, that that br uses the old util-linux and not 
> util-linux-ng. According to the debian package info, xfsprogs 3.1.2 
> needs at least util-linux-ng 2.16.

Good. We really need to upgrade to util-linux-ng. It has been on my
TODO-list for a while, but I haven't managed to find the time for this.

> So I ran a green try with the 
> util-linux-ng patch I've found in the mailinglist archives:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/16587/match=util+linux+ng

This patch doesn't use the AUTOTARGETS infrastructure to build
util-linux-ng, which is bad.

> Unfortunatly the build fails, because make claims about an unknown 
> option "--sysroot":
> /usr/bin/make -j2 \
>                  -C 
> /home/ossy/buildroot/buildroot-dev/output/build/util-linux-ng-2.16 \
>                  ARCH=arm \
>  
> CC=/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc 
> --sysroot=/home/ossy/buildr
> oot/buildroot-dev/output/staging \
>                  OPT="-Os -pipe -Os  -mtune=arm926ej-s -march=armv5te 
> -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURC E -D_FILE_OFFSET_BITS=64 
> -I/home/ossy/buildroot/buildroot-dev/output/staging/usr/include 
> -I/home/ossy/buildroot/buildroot-dev/output/staging
> /include" \
>                  HAVE_SLANG="NO"
> /usr/bin/make: Unbekannte Option 
> ?--sysroot=/home/ossy/buildroot/buildroot-dev/output/staging?
> 
> It is the same make, used for all the other packages....

For a quick fix, replace:

	CC=$(TARGET_CC)

by

	CC="$(TARGET_CC)"

This should solve the "unknown --sysroot option" problem that you're
having.

But clearly the correct fix is to switch to AUTOTARGETS.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
