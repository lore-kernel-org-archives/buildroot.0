From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2019 17:59:22 +0100
Subject: [Buildroot] [PATCH/next v2 1/5] package/ti-sgx-libgbm: new
 package
In-Reply-To: <20191114124215.12985-2-unixmania@gmail.com>
References: <20191114124215.12985-1-unixmania@gmail.com>
 <20191114124215.12985-2-unixmania@gmail.com>
Message-ID: <20191114165922.GC26360@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, Lothar, All,

On 2019-11-14 09:42 -0300, unixmania at gmail.com spake thusly:
> From: Lothar Felten <lothar.felten@gmail.com>
> 
> A custom ti version of libgbm for SGX graphics accelerator, required by
> the binary libraries of the ti-sgx-um package.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
[--SNIP--]

We'd need an entry in the DEVELOPPERS file too, please.

> diff --git a/package/ti-sgx-libgbm/Config.in b/package/ti-sgx-libgbm/Config.in
> new file mode 100644
> index 0000000000..24427c8112
> --- /dev/null
> +++ b/package/ti-sgx-libgbm/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_TI_SGX_LIBGBM
> +        bool "libgbm, ti variant"

We usually just have the prompt repeat just the name of the package,
hence:
    bool "ti-sgx-libgbm"

> +        help
> +	  TI SGX libgbm variant

Indentation is wrong: run  'make check-package' to get the details and
hints on how to fix it.

> diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.hash b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
> new file mode 100644
> index 0000000000..d316a84e45
> --- /dev/null
> +++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 7be13eed8c357da8060f3db52de48ad8e76bf4784e8b2979f19ddc3bb725ca45 ti-sgx-libgbm-f316cf4b98ca3f4a1ca92a48ddd8aa559894a45c.tar.gz

Please also add a hash for the license file (gbm.h).

> diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
> new file mode 100644
> index 0000000000..9c7bd43881
> --- /dev/null
> +++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# ti-sgx-libgbm
> +#
> +################################################################################
> +
> +# This correpsonds to SDK 06.00.00.07
> +TI_SGX_LIBGBM_VERSION = f316cf4b98ca3f4a1ca92a48ddd8aa559894a45c

There is a newer commit now...

> +TI_SGX_LIBGBM_SITE = git://git.ti.com/glsdk/libgbm.git

Please use the https-based URI visible on the upstream website:
    https://git.ti.com/gitweb?p=glsdk/libgbm.git;a=summary
    https://git.ti.com/git/glsdk/libgbm.git

> +TI_SGX_LIBGBM_LICENSE = MIT License
> +TI_SGX_LIBGBM_LICENSE_FILES = gbm.h
> +TI_SGX_LIBGBM_INSTALL_STAGING = YES
> +
> +TI_SGX_LIBGBM_DEPENDENCIES = libdrm udev
> +
> +# This package uses autoconf, but not automake, so we need to call
> +# their special autogen.sh script, and have custom target and staging
> +# installation commands.

I fail to see what the problem is. The autogen.sh basically does just;
    autoreconf -v --install

which is basically what we would do with TI_SGX_LIBGBM_AUTORECONF = YES

If that does not work, then please expand the commit log to explain the
problem.

> +define TI_SGX_LIBGBM_RUN_AUTOGEN
> +        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +TI_SGX_LIBGBM_PRE_CONFIGURE_HOOKS += TI_SGX_LIBGBM_RUN_AUTOGEN
> +
> +define TI_SGX_LIBGBM_INSTALL_TARGET_CMDS
> +        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +                PREFIX=/usr \
> +                STRIP=/bin/true \
> +                DESTDIR=$(TARGET_DIR) \
> +                install
> +endef

Would it not be possible to keep using the standard install commands,
and just set:

    TI_SGX_LIBGBM_INSTALL_STAGING_OPTS = \
        PREFIX=/usr STRIP=/bin/true \
        DESTDIR=$(TARGET_DIR) \
        install

> +define TI_SGX_LIBGBM_INSTALL_STAGING_CMDS
> +        $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +                PREFIX=/usr \
> +                STRIP=/bin/true \
> +                DESTDIR=$(STAGING_DIR) \
> +                install
> +endef

Ditto with DESTDIR set to staging?

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> -- 
> 2.18.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
