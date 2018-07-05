From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Jul 2018 09:58:41 +0200
Subject: [Buildroot] [PATCH] toolchain: improve musl check to support
 static toolchains
In-Reply-To: <20180705025418.dkit5uzdtwfezkgc@tarshish>
References: <20180704214257.6849-1-thomas.petazzoni@bootlin.com>
 <20180705025418.dkit5uzdtwfezkgc@tarshish>
Message-ID: <20180705095841.1d115a1a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 Jul 2018 05:54:18 +0300, Baruch Siach wrote:

> On Wed, Jul 04, 2018 at 11:42:57PM +0200, Thomas Petazzoni wrote:
> > The check_musl function currently builds a program and verifies if the
> > program interpreter starts with /lib/ld-musl. While this works fine
> > for dynamically linked programs, this obviously doesn't work for a
> > purely static musl toolchain such as [1].
> > 
> > There is no easy way to identify a toolchain as using the musl C
> > library. For glibc, dynamic linking is always supported, so we look at
> > the dynamic linker name. For uClibc, there is a distinctive
> > uClibc_config.h header file. There is no such distinctive feature in
> > musl.
> > 
> > We end up resorting to looking for the string MUSL_LOCPATH, which is
> > used by musl locale_map.c source file. This string has been present in
> > musl since 2014. It certainly isn't a very stable or convincing
> > solution to identify the C library as being musl, but it's the best we
> > could find.
> > 
> > Note that we are sure there is a libc.a file, because the
> > check_unusable_toolchain function checks that there is a such a file.  
> 
> So the check should work even for dynamic only toolchains, right?

Yes, it should. I just verified by building a dynamic only musl
toolchain and a dynamic only uclibc toolchain, and then do have libc.a:

MUSL:

$ grep BR2_SHARED_LIBS .config
BR2_SHARED_LIBS=y
$ find host/ -name 'libc.a'
host/arm-buildroot-linux-musleabi/sysroot/lib/libc.a
$ strings host/arm-buildroot-linux-musleabi/sysroot/lib/libc.a | grep MUSL_LOCPATH
MUSL_LOCPATH

UCLIBC:

$ grep BR2_SHARED_LIBS .config
BR2_SHARED_LIBS=y
$ find host/ -name 'libc.a'
host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
