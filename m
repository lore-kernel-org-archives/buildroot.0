From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 15:24:07 +0200
Subject: [Buildroot] [PATCH 1/1] cutelyst: link with libatomic when
 needed
In-Reply-To: <CAPi7W83BKqvoN5Uj_W3ZRYudKUuzcG=LYBAOy2SK-hbda+j8yw@mail.gmail.com>
References: <20180827164102.21147-1-fontaine.fabrice@gmail.com>
 <20180828115858.51e36981@windsurf.home>
 <CAPi7W83BKqvoN5Uj_W3ZRYudKUuzcG=LYBAOy2SK-hbda+j8yw@mail.gmail.com>
Message-ID: <20180828152407.6928da55@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 13:31:51 +0200, Fabrice Fontaine wrote:

> cutelyst does not directly depends on atomic, this dependency is linked to
> Qt 5.8.

Argh. Ideally, cutelyst should pick this up from Qt's pkg-config file
or something like that. But I guess "ideal" and "build system" are not
always aligned :-)

> Here is an extrat of qt5base.mk:
> ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
> # Qt 5.8 needs atomics, which on various architectures are in -latomic
> define QT5BASE_CONFIGURE_ARCH_CONFIG
>         printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
> endef
> 
> So what should we do?
> Should we add a dependency to BR2_TOOLCHAIN_HAS_ATOMIC if
> BR2_PACKAGE_QT5_VERSION_LATEST in qt5/Config.in?

It depends whether Qt needs atomic intrinsics unconditionally or not.
If it does need atomic intrinsics unconditionally, then yes, it needs a
BR2_TOOLCHAIN_HAS_ATOMIC dependency.

We should perhaps have an older toolchain that doesn't provide atomic
intrinsics to be able to verify this.

*But*, BR2_PACKAGE_QT5_VERSION_LATEST already depends on
BR2_TOOLCHAIN_GCC_AT_LEAST_4_8, so anyway libatomic will always be
available, which makes the entire discussion moot.

Except for cutelyst built against Qt5.6, which doesn't need libatomic.
So perhaps the link of cutelyst on libatomic should be conditional on
the version of Qt5 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
