From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Aug 2018 13:31:51 +0200
Subject: [Buildroot] [PATCH 1/1] cutelyst: link with libatomic when
 needed
In-Reply-To: <20180828115858.51e36981@windsurf.home>
References: <20180827164102.21147-1-fontaine.fabrice@gmail.com>
 <20180828115858.51e36981@windsurf.home>
Message-ID: <CAPi7W83BKqvoN5Uj_W3ZRYudKUuzcG=LYBAOy2SK-hbda+j8yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le mar. 28 ao?t 2018 ? 11:59, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello,
>
> On Mon, 27 Aug 2018 18:41:02 +0200, Fabrice Fontaine wrote:
> > On some architectures, atomic binutils are provided by the libatomic
> > library from gcc. Linking with libatomic is therefore necessary,
> > otherwise the build fails with:
> >
> > sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding
> symbols: DSO missing from command line
> >
> > This is often for example the case on sparcv8 32 bit.
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.net/results/9e307ab9c7067b26d7b33a572204394808e25772
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> If this package unconditionally needs atomic intrinsics, then it also
> needs to depends on BR2_TOOLCHAIN_HAS_ATOMIC. Indeed, libatomic is not
> available in gcc < 4.8.
>
cutelyst does not directly depends on atomic, this dependency is linked to
Qt 5.8.
Here is an extrat of qt5base.mk:
ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
# Qt 5.8 needs atomics, which on various architectures are in -latomic
define QT5BASE_CONFIGURE_ARCH_CONFIG
        printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
endef

So what should we do?
Should we add a dependency to BR2_TOOLCHAIN_HAS_ATOMIC if
BR2_PACKAGE_QT5_VERSION_LATEST in qt5/Config.in?

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180828/67037aa0/attachment.html>
