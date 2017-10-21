From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Oct 2017 14:26:12 +0200
Subject: [Buildroot] [PATCH v2 3/3] libmpdclient: bump to version 2.13
In-Reply-To: <20170727095527.14324-4-joerg.krause@embedded.rocks>
References: <20170727095527.14324-1-joerg.krause@embedded.rocks>
 <20170727095527.14324-4-joerg.krause@embedded.rocks>
Message-ID: <20171021142612.68b62c57@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg, Eric,

On Thu, 27 Jul 2017 11:55:27 +0200, J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2:
>  * none
> ---
>  package/libmpdclient/libmpdclient.hash |  4 ++--
>  package/libmpdclient/libmpdclient.mk   | 26 +++++++++++++++++++++++---
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
> index 2fd20a41fb..aa9434098f 100644
> --- a/package/libmpdclient/libmpdclient.hash
> +++ b/package/libmpdclient/libmpdclient.hash
> @@ -1,2 +1,2 @@
> -# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.10.tar.xz.sig, sha256 locally computed
> -sha256 4f08cde82dae70895f8e4532a6e9b54b201efd5591c6b5d6834895807ed2ff82  libmpdclient-2.10.tar.xz
> +# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.13.tar.xz.sig, sha256 locally computed
> +sha256  5115bd52bc20a707c1ecc7587e6389c17305348e2132a66cf767c62fc55ed45d  libmpdclient-2.13.tar.xz
> diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
> index 691aba9f71..9cd4f2bd2e 100644
> --- a/package/libmpdclient/libmpdclient.mk
> +++ b/package/libmpdclient/libmpdclient.mk
> @@ -5,12 +5,32 @@
>  ################################################################################
>  
>  LIBMPDCLIENT_VERSION_MAJOR = 2
> -LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).10
> +LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).13
>  LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
>  LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
> -LIBMPDCLIENT_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>  LIBMPDCLIENT_INSTALL_STAGING = YES
>  LIBMPDCLIENT_LICENSE = BSD-3-Clause
>  LIBMPDCLIENT_LICENSE_FILES = COPYING
>  
> -$(eval $(autotools-package))
> +LIBMPDCLIENT_DEPENDENCIES = host-meson host-pkgconf
> +
> +LIBMPDCLIENT_MESON_OPTS += \
> +	--prefix=/usr \
> +	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
> +	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
> +
> +define LIBMPDCLIENT_CONFIGURE_CMDS
> +	rm -rf $(@D)/build
> +	mkdir -p $(@D)/build
> +	$(TARGET_MAKE_ENV) meson $(LIBMPDCLIENT_MESON_OPTS) $(@D) $(@D)/build
> +endef
> +
> +define LIBMPDCLIENT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) ninja -C $(@D)/build

Better change to

    $(TARGET_MAKE_ENV) ninja $(if $(VERBOSE),-v) -C $(@D)/build

to honour the buildroot 'make V=1' verbose mode...

Regards,
Peter

> +endef
> +
> +define LIBMPDCLIENT_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C $(@D)/build install
> +endef
> +
> +$(eval $(generic-package))
