From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 3 Nov 2018 15:06:57 +0100
Subject: [Buildroot] [PATCH 3/4] libv4l: add elfutils optional dependency
In-Reply-To: <20181103141824.6e47adbc@windsurf>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
 <20181103122758.10578-3-fontaine.fabrice@gmail.com>
 <20181103141824.6e47adbc@windsurf>
Message-ID: <CAPi7W83KME_2=P9Ke9RQHE54brQqBPmc9hM5YjwS19p4h8OhYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le sam. 3 nov. 2018 ? 14:18, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat,  3 Nov 2018 13:27:57 +0100, Fabrice Fontaine wrote:
> > Bump to version 1.61.1 added an optional dependency to elfutils:
> > https://git.linuxtv.org/v4l-utils.git/commit/?id=d6025b0e8c7f57b0f9390f987acc5eed57360d80
> >
> > host-clang is also needed to build PBF protocols, see:
>
> PBF -> BPF
>
> > https://git.linuxtv.org/v4l-utils.git/commit/?id=91b37c0d9cb71fc2d5f78cc96aa2ef9f3bba145b
>
> I'm not sure to understand: there are two separate commits upstream,
> one that adds the elfutils dependency, one that adds the clang
> dependency. Are they both needed to have BPF protocols ? If so, why
> were those two dependencies introduced in separate commits upstream ?
Yes, BPF protocols are enabled only if elfutils is available:

AM_CONDITIONAL([HAVE_LIBELF], [test x$libelf_pkgconfig = xyes])
if test "x$libelf_pkgconfig" = "xyes"; then
AC_CHECK_PROG([CLANG], clang, clang)
AC_DEFINE([HAVE_LIBELF], [1], [libelf library is present])
else
AC_MSG_WARN(libelf library not available)
fi
>
> > +ifeq ($(BR2_PACKAGE_ELFUTILS),y)
> > +# host-clang is needed to build BPF protocols
> > +LIBV4L_DEPENDENCIES += elfutils host-clang
> > +endif
>
> I think an explicit sub-option would make sense in this case, because
> it's not trivial at all to know that you need elfutils. So I would
> prefer to have
>
> config BR2_PACKAGE_LIBV4L_KEYTABLE_BPF_PROTOCOLS
>         bool "keytable BPF protocols"
>         select BR2_PACKAGE_ELFUTILS
>         depends on BR2_USE_WCHAR # elfutils
>         depends on !BR2_STATIC_LIBS # elfutils
>         depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
OK, I will update the patch to add this option.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
