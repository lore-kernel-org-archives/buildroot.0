From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 9 Nov 2018 18:32:28 +0100
Subject: [Buildroot] [PATCH 1/1] libv4l: disable IR BPF based decoders
In-Reply-To: <20181108220134.59150c66@gmx.net>
References: <20181108192557.9268-1-fontaine.fabrice@gmail.com>
 <20181108220134.59150c66@gmx.net>
Message-ID: <CAPi7W83OBoYWP6mXke=6gmjsU5ab2XbBM4=8NL7zyaKC3Az5vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,
Le jeu. 8 nov. 2018 ? 22:01, Peter Seiderer <ps.report@gmx.net> a ?crit :
>
> Hello Fabrice,
>
> thanks for providing the patch, tested with the previous failing configurations...
>
> On Thu,  8 Nov 2018 20:25:57 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Bump to version 1.61.1 added BPF based protocols support:
> > https://git.linuxtv.org/v4l-utils.git/commit/?id=d6025b0e8c7f57b0f9390f987acc5eed57360d80
> >
> > However, this dependency needs BPF support in kernel. On old kernels
> > (before 3.18), __NR_BPF is not defined for all architectures. Moreover,
> > some platforms such as mips or risc-v does not support it yet.
>
> Not sure about risc-v but a grep for __NR_bpf in linux-4.19.1 gives:
>
> ./arch/mips/include/uapi/asm/unistd.h:#define __NR_bpf                  (__NR_Linux + 355)
> ./arch/mips/include/uapi/asm/unistd.h:#define __NR_bpf                  (__NR_Linux + 315)
> ./arch/mips/include/uapi/asm/unistd.h:#define __NR_bpf                  (__NR_Linux + 319)
>
> The syscall seems to be supported...
OK, thanks for checking, then I sent a v2 with an option depending on
headers >= 3.18.
>
> It is more about toolchains based on old linux kernel headers and additional
> missing fallbacks for __NR_bpf in the bpf.h header for out of kernel usage...
>
> > So retrieve upstream patch to disable it.
> >
> > Drop ac_cv_prog_CLANG="" as it is not needed anymore
>
> Additional the patch package/libv4l/0005-Add-missing-linux-bpf_common.h.patch can
> be removed...
OK, I drop it.
>
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/442de57cb76a7b38d71d690490faadc641036374
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...d-without-BPF-support-in-ir-keytable.patch | 124 ++++++++++++++++++
> >  package/libv4l/libv4l.mk                      |   5 +-
> >  2 files changed, 125 insertions(+), 4 deletions(-)
> >  create mode 100644 package/libv4l/0004-configure-build-without-BPF-support-in-ir-keytable.patch
> >
> > diff --git a/package/libv4l/0004-configure-build-without-BPF-support-in-ir-keytable.patch b/package/libv4l/0004-configure-build-without-BPF-support-in-ir-keytable.patch
> > new file mode 100644
> > index 0000000000..dcb724868a
> > --- /dev/null
> > +++ b/package/libv4l/0004-configure-build-without-BPF-support-in-ir-keytable.patch
> > @@ -0,0 +1,124 @@
> > +From 5c213ee065ebd7a388f153a402851be8dfcfc960 Mon Sep 17 00:00:00 2001
> > +From: Sean Young <sean@mess.org>
> > +Date: Tue, 6 Nov 2018 09:58:32 +0000
> > +Subject: configure: build without BPF support in ir-keytable
> > +
> > +It currently does not build on mips and some platforms do not have
> > +BPF support yet (risc-v, for example).
> > +
> > +Signed-off-by: Sean Young <sean@mess.org>
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +[Retrieved from:
> > +https://git.linuxtv.org/v4l-utils.git/commit/configure.ac?id=5c213ee065ebd7a388f153a402851be8dfcfc960]
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 387f853..5cc34c2 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -173,16 +173,12 @@ AM_CONDITIONAL([HAVE_X11], [test x$x11_pkgconfig = xyes])
> > + PKG_CHECK_MODULES([LIBELF], [libelf], [libelf_pkgconfig=yes], [libelf_pkgconfig=no])
> > + AC_SUBST([LIBELF_CFLAGS])
> > + AC_SUBST([LIBELF_LIBS])
> > +-AM_CONDITIONAL([HAVE_LIBELF], [test x$libelf_pkgconfig = xyes])
> > + if test "x$libelf_pkgconfig" = "xyes"; then
> > +   AC_CHECK_PROG([CLANG], clang, clang)
> > +-  AC_DEFINE([HAVE_LIBELF], [1], [libelf library is present])
> > + else
> > +   AC_MSG_WARN(libelf library not available)
> > + fi
> > +
> > +-AM_CONDITIONAL([BPF_PROTOCOLS], [test x$CLANG = xclang])
> > +-
> > + AS_IF([test "x$x11_pkgconfig" = xyes],
> > +       [PKG_CHECK_MODULES(GL, [gl], [gl_pkgconfig=yes], [gl_pkgconfig=no])], [gl_pkgconfig=no])
> > + AC_SUBST([GL_CFLAGS])
> > +@@ -453,6 +449,14 @@ AC_ARG_ENABLE(gconv,
> > +    esac]
> > + )
> > +
> > ++AC_ARG_ENABLE(bpf,build_libv4l-arm-001
> > ++  AS_HELP_STRING([--disable-bpf], [disable IR BPF decoders]),
> > ++  [case "${enableval}" in
> > ++    yes | no ) ;;
> > ++    *) AC_MSG_ERROR(bad value ${enableval} for --enable-bpf) ;;
> > ++   esac]
> > ++)
> > ++
> > + PKG_CHECK_MODULES([SDL2], [sdl2 SDL2_image], [sdl_pc=yes], [sdl_pc=no])
> > + AM_CONDITIONAL([HAVE_SDL], [test x$sdl_pc = xyes])
> > +
> > +@@ -475,6 +479,7 @@ AM_CONDITIONAL([WITH_GCONV],        [test x$enable_gconv = xyes -a x$enable_shar
> > + AM_CONDITIONAL([WITH_V4L2_CTL_LIBV4L], [test x${enable_v4l2_ctl_libv4l} != xno])
> > + AM_CONDITIONAL([WITH_V4L2_CTL_STREAM_TO], [test x${enable_v4l2_ctl_stream_to} != xno])
> > + AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x${enable_v4l2_compliance_libv4l} != xno])
> > ++AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang])
> > +
> > + # append -static to libtool compile and link command to enforce static libs
> > + AS_IF([test x$enable_libdvbv5 = xno], [AC_SUBST([ENFORCE_LIBDVBV5_STATIC], ["-static"])])
> > +@@ -505,6 +510,9 @@ AM_COND_IF([WITH_V4L_WRAPPERS], [USE_V4L_WRAPPERS="yes"], [USE_V4L_WRAPPERS="no"
> > + AM_COND_IF([WITH_GCONV], [USE_GCONV="yes"], [USE_GCONV="no"])
> > + AM_COND_IF([WITH_V4L2_CTL_LIBV4L], [USE_V4L2_CTL_LIBV4L="yes"], [USE_V4L2_CTL_LIBV4L="no"])
> > + AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE_LIBV4L="yes"], [USE_V4L2_COMPLIANCE_LIBV4L="no"])
> > ++AM_COND_IF([WITH_BPF],         [USE_BPF="yes"
> > ++                                AC_DEFINE([HAVE_BPF], [1], [BPF IR decoder support enabled])],
> > ++                            [USE_BPF="no"])
> > + AS_IF([test "x$alsa_pkgconfig" = "xtrue"], [USE_ALSA="yes"], [USE_ALSA="no"])
> > +
> > + AC_OUTPUT
> > +@@ -549,4 +557,5 @@ compile time options summary
> > +     qvidcap                    : $USE_QVIDCAP
> > +     v4l2-ctl uses libv4l       : $USE_V4L2_CTL_LIBV4L
> > +     v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE_LIBV4L
> > ++    BPF IR Decoders:           : $USE_BPF
> > + EOF
> > +diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
> > +index 90e4c8c..ddbab0f 100644
> > +--- a/utils/keytable/Makefile.am
> > ++++ b/utils/keytable/Makefile.am
> > +@@ -6,14 +6,15 @@ udevrules_DATA = 70-infrared.rules
> > +
> > + ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h
> > +
> > +-if HAVE_LIBELF
> > ++if WITH_BPF
> > + ir_keytable_SOURCES += bpf.c bpf_load.c bpf.h bpf_load.h
> > + endif
> > +
> > + ir_keytable_LDADD = @LIBINTL@
> > +-ir_keytable_LDFLAGS = $(ARGP_LIBS) $(LIBELF_LIBS)
> > ++ir_keytable_LDFLAGS = $(ARGP_LIBS)
> > +
> > +-if BPF_PROTOCOLS
> > ++if WITH_BPF
> > ++ir_keytable_LDFLAGS += $(LIBELF_LIBS)
> > + SUBDIRS = bpf_protocolsbuild_libv4l-arm-001
> > + endif
> > +
> > +diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> > +index a7ed436..6fc2235 100644
> > +--- a/utils/keytable/keytable.c
> > ++++ b/utils/keytable/keytable.c
> > +@@ -34,8 +34,11 @@
> > + #include "ir-encode.h"
> > + #include "parse.h"
> > + #include "toml.h"
> > ++
> > ++#ifdef HAVE_BPF
> > + #include "bpf.h"
> > + #include "bpf_load.h"
> > ++#endif
> > +
> > + #ifdef ENABLE_NLS
> > + # define _(string) gettext(string)
> > +@@ -1847,7 +1850,7 @@ static void device_info(int fd, char *prepend)
> > +             perror ("EVIOCGID");
> > + }
> > +
> > +-#ifdef HAVE_LIBELF
> > ++#ifdef HAVE_BPF
> > + #define MAX_PROGS 64
> > + static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct toml_table_t *toml)
> > + {
> > +--
> > +cgit v0.10.2
> > +
> > diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> > index f473c03806..aa2f07a9c4 100644bpf.h
> > --- a/package/libv4l/libv4l.mk
> > +++ b/package/libv4l/libv4l.mk
> > @@ -9,7 +9,7 @@ LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
> >  LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
> >  LIBV4L_INSTALL_STAGING = YES
> >  LIBV4L_DEPENDENCIES = host-pkgconf
>
> Nitpick: Short comment why --disable-bpf was added?
>
> > -LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
> > +LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
> >  # We're patching contrib/test/Makefile.am
> >  LIBV4L_AUTORECONF = YES
> >  # add host-gettext for AM_ICONV macro
> > @@ -56,9 +56,6 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
> >  LIBV4L_CONF_OPTS += --enable-v4l-utils
> >  LIBV4L_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
> >
> > -# Disable clang that is used to build BPF (in-kernel bytecode machine) protocols
> > -LIBV4L_CONF_ENV += ac_cv_prog_CLANG=""
> > -
> >  ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
> >  LIBV4L_CONF_OPTS += --enable-qv4l2
> >  LIBV4L_DEPENDENCIES += qt5base
>
> Regards,
> Peter
Best Regards,

Fabrice
