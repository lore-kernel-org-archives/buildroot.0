From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Sep 2014 22:43:05 +0200
Subject: [Buildroot] [PATCH 1/2] exfat: bump to version 1.1.0
In-Reply-To: <1410376050-21735-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 10 Sep 2014 16:07:29 -0300")
References: <1410376050-21735-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738bxevmu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Use gentoo distfiles since the download infra can't handle google docs
 > URLs.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/exfat/exfat.mk | 8 ++++----
 >  1 file changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
 > index 3c0dece..279c6a0 100644
 > --- a/package/exfat/exfat.mk
 > +++ b/package/exfat/exfat.mk
 > @@ -4,8 +4,8 @@
 >  #
 >  ################################################################################
 
 > -EXFAT_VERSION = 1.0.1
 > -EXFAT_SITE = http://exfat.googlecode.com/files
 > +EXFAT_VERSION = 1.1.0
 > +EXFAT_SITE = http://distfiles.gentoo.org/distfiles
 >  EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 >  EXFAT_DEPENDENCIES = host-scons libfuse
 >  EXFAT_LICENSE = GPLv3+
 > @@ -13,12 +13,12 @@ EXFAT_LICENSE_FILES = COPYING
 
 >  define EXFAT_BUILD_CMDS
 >  	(cd $(@D); \
 > -		$(TARGET_CONFIGURE_OPTS) $(SCONS))
 > +		$(TARGET_CONFIGURE_OPTS) CCFLAGS="-std=c99" $(SCONS))

Shouldn't this be CCFLAGS="$(TARGET_CFLAGS) -std=c99"?

From a quick test it seems like it should:

>>> exfat 1.1.0 Building
(cd /home/peko/source/buildroot/output/build/exfat-1.1.0; <snip>
 CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os "
 <snip>

/home/peko/source/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
-o fuse/main.o -c -std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -Ilibexfat
fuse/main.c

It looks like it only uses CPPFLAGS and CCFLAGS.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
