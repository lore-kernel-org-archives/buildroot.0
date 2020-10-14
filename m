From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Wed, 14 Oct 2020 05:16:15 +0000
Subject: [Buildroot] [PATCH 1/1] tpm2-tss: bump version to 3.0.1
In-Reply-To: <87d01lv3z4.fsf@tarshish>
References: <COPsCRIZhewi95TaMVvld-zedMAwc-Ff1p20qFw7EDM-BwB13DgMpLclzXA2PX-Rpv7UrNQs-W4LDV0zfIzRy_fhPtDac-9Bvd_6FlRsDpk=@protonmail.com>
 <87d01lv3z4.fsf@tarshish>
Message-ID: <69RZ2p-Gwm-JjRsAYhf0w9MsMqytqY-MIuRMHJTiI6bkQ0OmVVafdWz2HvFxu_DqbkW24t31nmbxchKnG-2wOzHV_bcQ1N34EKH0ySm_jVI=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wednesday, October 14, 2020 6:14 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> On Wed, Oct 14 2020, Yair Ben-Avraham via buildroot wrote:
>
> > -   Remove 0001-configure-Only-use-CXX-when-fuzzing.patch since
> >     AC_PROG_CXX added to configure.ac
> >
> > -   Makefile-fuzz-generated.am now in size zero.
> >
> > Signed-off-by: Yair Ben-Avraham yairba at protonmail.com
> >

[snip]

> > diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
> > index 2d619750f8..13275af9aa 100644
> > --- a/package/tpm2-tss/Config.in
> > +++ b/package/tpm2-tss/Config.in
> > @@ -1,6 +1,8 @@
> > config BR2_PACKAGE_TPM2_TSS
> > bool "tpm2-tss"
> > depends on !BR2_STATIC_LIBS # dlfcn.h
> >
> > -   select BR2_PACKAGE_LIBCURL_CURL
> > -   select BR2_PACKAGE_JSON_C
>
> Is curl a new mandatory run-time dependencies? json-c is just a library,
> so it is a build-time dependency. In that case you need to add it to
> DEPENDENCIES. In any case, you should mention new dependencies in the
> commit log.

Yes, since tpm2-tss version 2.4.0

> > select BR2_PACKAGE_LIBURIPARSER
> > select BR2_PACKAGE_OPENSSL
> > select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

[snip]

> > diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> > index 470020857a..a3e64e7edd 100644
> > --- a/package/tpm2-tss/tpm2-tss.mk
> > +++ b/package/tpm2-tss/tpm2-tss.mk
> > @@ -4,26 +4,16 @@
> >
> > ==
> >
> > ################################################################################
> > -TPM2_TSS_VERSION = 2.3.3
> > +TPM2_TSS_VERSION = 3.0.1
> > TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
> > TPM2_TSS_LICENSE = BSD-2-Clause
> > TPM2_TSS_LICENSE_FILES = LICENSE
> > TPM2_TSS_INSTALL_STAGING = YES
> > TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
> > TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc --disable-defaultflags
> > -# 0001-configure-Only-use-CXX-when-fuzzing.patch
> > TPM2_TSS_AUTORECONF = YES
>
> Why do we still need autoreconf then?

I'll remove this

Yair

> baruch
>
> > uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
> >
> > ===============================================================================
> >
> > TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
> > -# The 2.3.3 tarball accidently contains a Makefile-fuzz-generated.am
> > -# with content from a fuzz testing run rather than an empty file,
> > -# confusing autoreconf with
> > -# 0001-configure-Only-use-CXX-when-fuzzing.patch
> > -define TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
> >
> > -   truncate -s 0 $(@D)/Makefile-fuzz-generated.am
> >     -endef
> >     -TPM2_TSS_POST_PATCH_HOOKS += TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
> >
> > -
> >
> > $(eval $(autotools-package))
>
> --
>
>                                                      ~. .~   Tk Open Systems
>
>
> =}------------------------------------------------ooO--U--Ooo------------{=
>
> -   baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
