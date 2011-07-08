From: Will Newton <will.newton@gmail.com>
Date: Fri, 8 Jul 2011 14:25:05 +0100
Subject: [Buildroot] [PATCH] libnss: Add new package.
In-Reply-To: <87k4btrfv1.fsf@macbook.be.48ers.dk>
References: <CAFbHwiRfvF=c5Lys-rc7=vXUXqML+TyJvdQogcTrm2M-MoSf2w@mail.gmail.com>
 <87k4btrfv1.fsf@macbook.be.48ers.dk>
Message-ID: <CAFbHwiQOVoxp684+zGmMB3=mg7=2MSmt3S-gqNDo3ON4UPn-+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 7, 2011 at 9:32 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

Hi Peter,

>>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:
>
> ?Will> NSS is the Network Security Services library developed as part of
> ?Will> the Mozilla project. It provides similar functions to OpenSSL but
> ?Will> allows MPL, GPL and LGPL licensing.
>
> Thanks, a few comments.

Thanks for the review!

> ?Will> + ? ? ? ? ?Network Security Services (NSS) is a set of libraries designed
> ?Will> + ? ? ? ? ?to support development of security-enabled client and server
> ?Will> + ? ? ? ? ?applications. Applications built with NSS can support SSL v2
> ?Will> + ? ? ? ? ?and v3, TLS, PKCS #5, PKCS #7, PKCS #11, PKCS #12, S/MIME,
> ?Will> + ? ? ? ? ?and X.509 v3 certificates.
> ?Will> +
> ?Will> + ? ? ? ? ?http://www.mozilla.org/projects/security/pki/nss/
> ?Will> diff --git a/package/libnss/libnss-cross.patch
> ?Will> b/package/libnss/libnss-cross.patch
> ?Will> new file mode 100644
> ?Will> index 0000000..8d01d7c
> ?Will> --- /dev/null
> ?Will> +++ b/package/libnss/libnss-cross.patch
> ?Will> @@ -0,0 +1,24 @@
> ?Will> +
> ?Will> +This patch allows us to set a value for the cross compiler via
> ?Will> TARGETCC without setting
> ?Will> +CC on the command line. CC is used for host tools as well as cross
> ?Will> compiled code so we
> ?Will> +cannot define it on the command line without breaking the host tools build.
> ?Will> +
>
> Please sign off (git-style) on patches so it is easy to see who the
> author is. What is the upstream status of this patch?

Neither of these patches has been upstreamed yet, but I'll make sure
it goes into their bug tracker.

> ?Will> diff --git a/package/libnss/libnss-uclibc.patch
> ?Will> b/package/libnss/libnss-uclibc.patch
> ?Will> new file mode 100644
> ?Will> index 0000000..46b71b4
> ?Will> --- /dev/null
> ?Will> +++ b/package/libnss/libnss-uclibc.patch
> ?Will> @@ -0,0 +1,14 @@
> ?Will> +
> ?Will> +uCLibc does not support RTLD_NOLOAD.
>
> Signed-off-by and upstream status again, please. This is because of the
> libdl check, right?
>
> ? ? ?if (!(flag & (RTLD_LAZY|RTLD_NOW))) {
> ? ? ? ? ? ? ? ?_dl_error_number = LD_BAD_HANDLE;
> ? ? ? ? ? ? ? ?return NULL;
>
> It would be good to only drop NOLOAD for uClibc, and not E.G. if you're
> using an external (e)glibc toolchain with something like:

It's actually because RTLD_NOLOAD is just not defined in uClibc. I
have redone the patch in a way that should be compatbile with glibc
etc.

> ?Will> +define LIBNSS_BUILD_CMDS
> ?Will> + ? ? ? ?$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_coreconf build_dbm all \
> ?Will> + ? ? ? ? ? ? ? ? ? ? ? ?SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
> ?Will> + ? ? ? ? ? ? ? ? ? ? ? ?DIST=$(@D)/$(LIBNSS_DISTDIR) \
> ?Will> + ? ? ? ? ? ? ? ? ? ? ? ?CHECKLOC= \
> ?Will> + ? ? ? ? ? ? ? ? ? ? ? ?$(LIBNSS_BUILD_VARS)
> ?Will> +endef
> ?Will> +
> ?Will> +define LIBNSS_INSTALL_STAGING_CMDS
> ?Will> + ? ? ? ?$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
> ?Will> + ? ? ? ? ? ? ? ?$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
> ?Will> + ? ? ? ?$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/nss
> ?Will> + ? ? ? ?$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/nss \
> ?Will> + ? ? ? ? ? ? ? ?$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
> ?Will> + ? ? ? ?$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
> ?Will> + ? ? ? ? ? ? ? ?$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
> ?Will> +endef
>
> No make install?

The build system is a little idiosyncratic. ;-)

I'll resubmit a patch that should address the issues raised.
