From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 May 2018 22:52:24 +0200
Subject: [Buildroot] [PATCH] shadowsocks-libev: new package
In-Reply-To: <20180529065539.7263-1-xuminready@gmail.com>
References: <20180529065539.7263-1-xuminready@gmail.com>
Message-ID: <e6e8ed38-0fd8-c39e-e43b-751e8faf87f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Min,

On 29-05-18 08:55, Min Xu wrote:
> Signed-off-by: Min Xu <xuminready@gmail.com>
> ---

 Please add a patch changelog below the --- line, and also add the version in
the subject using the -v3 option to git format-patch. See [1].

[snip]
> diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
> new file mode 100644
> index 0000000..07f10f4
> --- /dev/null
> +++ b/package/shadowsocks-libev/shadowsocks-libev.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 58fb438d2cfe33cfa6ac8c50e587e2138c50e59a4b943f88d22883bf2e192a96  shadowsocks-libev-3.1.3.tar.gz

 As I mentioned in my first review: please also include hashes for the license
files. Oh, and don't forget to run a 'make shadowsocks-libev-legal-info' to
check that they're correct.


> +################################################################################
> +#
> +# shadowsocks-libev
> +#
> +################################################################################
> +
> +SHADOWSOCKS_LIBEV_VERSION = 3.1.3
> +SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
> +SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, MIT(c-ares), BSD-2-Clause or GPL-2.0+(libev), ISC(libsodium), Apache-2.0(mbedtls), BSD-3-Clause(pcre)

 Although there are bundled versions of all these packages in the tarball, we
don't use them, so you don't need to mention their licenses here. Just the ones
where we do use the bundled libraries: libbloom, libcork, libipset.

> +SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING c-ares/COPYING libev/COPYING libsodium/COPYING mbedtls/COPYING pcre/COPYING

 Same here.

> +SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
> +SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
> +SHADOWSOCKS_LIBEV_CONF_ENV = PCRECONFIG=$(STAGING_DIR)/usr/bin/pcre-config
> +SHADOWSOCKS_LIBEV_CONF_OPTS = --disable-documentation --with-pcre=$(STAGING_DIR)/usr/bin/

 Didn't mention it in my first review: is it really needed to specify both
--with-pcre=... *and* PCRECONFIG? Normally the --with-pcre is
$(STAGING_DIR)/usr, cfr. e.g. clamav. Sometimes it is
$(STAGING_DIR)/usr/bin/pcre-config, cfr. apache. But $(STAGING_DIR)/usr/bin is
unlikely to be correct.

 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog

> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
