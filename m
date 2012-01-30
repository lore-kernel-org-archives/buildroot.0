From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Jan 2012 23:35:31 +0100
Subject: [Buildroot] [PATCH 2/2] openssl: split out ocf
In-Reply-To: <1327667762-10831-2-git-send-email-gustavo@zacarias.com.ar>
References: <1327667762-10831-1-git-send-email-gustavo@zacarias.com.ar>
 <1327667762-10831-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201201302335.31863.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 27 January 2012 13:36:02 Gustavo Zacarias wrote:
> Ditch OCF and switch to the proper package.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssl/Config.in                |    1 +
>  package/openssl/ocf-cryptodev-20101223.h |  480 ------------------------------
>  package/openssl/openssl.mk               |   10 +-
>  3 files changed, 3 insertions(+), 488 deletions(-)
>  delete mode 100644 package/openssl/ocf-cryptodev-20101223.h
> 
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index 3e09d88..0240603 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -25,6 +25,7 @@ config BR2_PACKAGE_OPENSSL_ENGINES
>  config BR2_PACKAGE_OPENSSL_OCF
>         bool "openssl ocf support"
>         depends on BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_OCF
>         help
>           Enable openssl cryptodev (OCF) hardware acceleration support.
>           This requires kernel patches from the ocf-linux project otherwise
> 
 Maybe it's useful to refer to the OCF kernel extension in the help
text.

[snip]
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index cb29fe4..d638ce1 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -12,14 +12,8 @@ OPENSSL_TARGET_ARCH = generic32
> 
>  OPENSSL_CFLAGS = $(TARGET_CFLAGS)
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
> 
> -OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
> -
> -define OPENSSL_INSTALL_CRYPTODEV_H
> -$(INSTALL) -D package/openssl/ocf-cryptodev-20101223.h \
> -       $(STAGING_DIR)/usr/include/crypto/cryptodev.h
> -endef
> -
> -OPENSSL_POST_EXTRACT_HOOKS += OPENSSL_INSTALL_CRYPTODEV_H
> +       OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
> +       OPENSSL_DEPENDENCIES += ocf
 I don't think we usually put indentation in make conditionals.

 Regards,
 Arnout

> 
>  endif
>  
>  # Some architectures are optimized in OpenSSL
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
