From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Nov 2020 07:33:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcap: fix libcap.pc
In-Reply-To: <20201129230456.564bd562@gmx.net>
References: <20201128215432.2326411-1-fontaine.fabrice@gmail.com>
 <20201129230456.564bd562@gmx.net>
Message-ID: <CAPi7W83s6kJa54XUOs_1hnLupVbS3wKkLTgbiMF=45xgSXo1XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le dim. 29 nov. 2020 ? 23:04, Peter Seiderer <ps.report@gmx.net> a ?crit :
>
> Hello Fabrice,
>
> On Sat, 28 Nov 2020 22:54:32 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > libcap builds an incorrect libcap.pc because libdir is pulled from the
> > host os:
> >
> > ifndef lib
> > lib=$(shell ldd /usr/bin/ld|egrep "ld-linux|ld.so"|cut -d/ -f2)
> > endif
> >
> > Fix this error by passing lib=lib in {HOST_LIBCAP,LIBCAP}_BUILD_CMDS
> >
> > Fixes:
> >  - https://bugs.buildroot.org/show_bug.cgi?id=13276
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/libcap/libcap.mk | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> > index 2b80a3cb7d..a4a9170193 100644
> > --- a/package/libcap/libcap.mk
> > +++ b/package/libcap/libcap.mk
> > @@ -19,6 +19,7 @@ LIBCAP_MAKE_FLAGS = \
> >       CROSS_COMPILE="$(TARGET_CROSS)" \
> >       BUILD_CC="$(HOSTCC)" \
> >       BUILD_CFLAGS="$(HOST_CFLAGS)" \
> > +     lib=lib \
> >       SHARED=$(if $(BR2_STATIC_LIBS),,yes) \
> >       PTHREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,)
> >
> > @@ -38,21 +39,21 @@ endef
> >  define LIBCAP_INSTALL_STAGING_CMDS
> >       $(foreach d,$(LIBCAP_MAKE_DIRS), \
> >               $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
> > -                     DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib install
> > +                     DESTDIR=$(STAGING_DIR) prefix=/usr install
> >       )
> >  endef
> >
> >  define LIBCAP_INSTALL_TARGET_CMDS
> >       $(foreach d,$(LIBCAP_MAKE_DIRS), \
> >               $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
> > -                     DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
> > +                     DESTDIR=$(TARGET_DIR) prefix=/usr install
> >       )
> >  endef
> >
> >  define HOST_LIBCAP_BUILD_CMDS
> >       $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
> >               DYNAMIC=yes \
> > -             RAISE_SETFCAP=no GOLANG=no
> > +             RAISE_SETFCAP=no GOLANG=no lib=lib
> >  endef
> >
> >  define HOST_LIBCAP_INSTALL_CMDS
>
> Before the patch:
>
>         $ cat ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig/libcap.pc
> prefix=/usr
> exec_prefix=
> libdir=/lib64
> includedir=/usr/include
>
> Name: libcap
> Description: libcap - linux capabilities library
> Version: 2.45
> Libs: -L${libdir} -lcap
> Libs.private:
> Cflags: -I${includedir}
>
>
>
> After the patch:
>
>         $ cat ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig/libcap.pc
> prefix=/usr
> exec_prefix=
> libdir=/lib
> includedir=/usr/include
>
> Name: libcap
> Description: libcap - linux capabilities library
> Version: 2.45
> Libs: -L${libdir} -lcap
> Libs.private:
> Cflags: -I${includedir}
>
> Some (random) other package:
>
>         $ cat ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig/fmt.pc
> prefix=/usr
> exec_prefix=/usr
> libdir=${exec_prefix}/lib
> includedir=${prefix}/include
>
> Name: fmt
> Description: A modern formatting library
> Version: 7.1.3
> Libs: -L${libdir} -lfmt
> Cflags: -I${includedir}
>
>
>         $ find ./host/arm-buildroot-linux-gnueabihf/sysroot/ -name libcap.so
> ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libcap.so
>
>         $ find ./host/arm-buildroot-linux-gnueabihf/sysroot/ -name libfmt.so
> ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libfmt.so
>
>
> Should libcap.pc not use something resulting in 'libdir=/usr/lib'?
Thanks for spotting this issue, I'll send a patch to fix this.
>
> Regards,
> Peter
Best Regards,

Fabrice
