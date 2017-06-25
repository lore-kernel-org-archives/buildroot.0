From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Jun 2017 12:46:52 +0200
Subject: [Buildroot] [PATCH v2 1/4] libressl: new package
In-Reply-To: <20170624172900.3610-1-Adamduskett@outlook.com>
References: <20170624172900.3610-1-Adamduskett@outlook.com>
Message-ID: <05c9f4ef-b164-94f5-7f64-dc58a8a07497@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Since patches 1 and 2 need to be swapped anyway I'll give a few minor comments
as well.

On 24-06-17 19:28, Adam Duskett wrote:
> Libressl is a fork of openssl from OpenSSL in 2014.  Its goal is to
> modernize the OpenSSL codebase, improve security, and apply best
> practice development processes.
> 
> Right now, libressl is API compatible with OpenSSL 1.0.1, but does not
> yet include all new APIs from OpenSSL 1.0.2 and later.
> 
> This package has been tested with the following architectures and c
> libraries:
> 
> - armv4
> - aarch64
> - ppc
> - ppc64
> - ppc64le
> - x86_64
> - uClibc-ng
> - glibc 2.24
> - musl

 It's good to report this, but I don't think it makes much sense in the history
since it will be outdated very quickly. So for me it should be put below the ---
line.

> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[snip]
> diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
> new file mode 100644
> index 0000000..9ffe964
> --- /dev/null
> +++ b/package/libressl/libressl.hash
> @@ -0,0 +1,2 @@
> +# From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> +sha256	107a5b522fbb8318d4c3be668075e5e607296f0a9255d71674caa94571336efa	libressl-2.5.4.tar.gz
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> new file mode 100644
> index 0000000..f315165
> --- /dev/null
> +++ b/package/libressl/libressl.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libressl
> +#
> +################################################################################
> +
> +LIBRESSL_VERSION = 2.5.4
> +LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
> +LIBRESSL_SOURCE = libressl-$(LIBRESSL_VERSION).tar.gz

 This is the default so can be removed.

> +LIBRESSL_LICENSE = ISC (New additions), OpenSSL or SSLeay (Original OpenSSL code)
> +LIBRESSL_LICENSE_FILES = COPYING
> +LIBRESSL_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
> +define LIBRESSL_REMOVE_BIN
> +	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
> +endef
> +LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
> +endif
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

 Since the host package isn't used, it shouldn't be added here. Or if you do
have a reason to provide the host package, please mention in the commit log.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
