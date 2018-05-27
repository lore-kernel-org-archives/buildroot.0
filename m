From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 May 2018 17:47:42 +0200
Subject: [Buildroot] [PATCH] Add new packge Shadowsocks-libev v3.1.3
In-Reply-To: <20180524171204.5959-1-xuminready@gmail.com>
References: <20180524171204.5959-1-xuminready@gmail.com>
Message-ID: <57349f19-8017-8f29-f44c-dd085f38c132@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Min,

 Thank you for your contributions. There are several problems with your patch,
could you fix them and resubmit?

 First of all, the subject line should be:

shadowsocks-libev: new package

On 24-05-18 19:12, Min Xu wrote:
> Signed-off-by: Min Xu <xuminready@gmail.com>
> ---
>  package/Config.in                              |  1 +
>  package/shadowsocks-libev/Config.in            | 12 ++++++++++++
>  package/shadowsocks-libev/shadowsocks-libev.mk | 20 ++++++++++++++++++++

 Please also add a hash file, containing a hash for the tarball and for all
license files.

>  3 files changed, 33 insertions(+)
>  create mode 100644 package/shadowsocks-libev/Config.in
>  create mode 100644 package/shadowsocks-libev/shadowsocks-libev.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index ecee493..1427665 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1846,6 +1846,7 @@ endif
>  	source "package/samba4/Config.in"
>  	source "package/sconeserver/Config.in"
>  	source "package/ser2net/Config.in"
> +        source "package/shadowsocks-libev/Config.in"

 Indentation should be with tabs.

 Similar problems exist elsewhere as well. Please use the utils/check-package
script to find such mistakes.

>  	source "package/shairport-sync/Config.in"
>  	source "package/shellinabox/Config.in"
>  	source "package/smcroute/Config.in"
> diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
> new file mode 100644
> index 0000000..78fd35a
> --- /dev/null
> +++ b/package/shadowsocks-libev/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_SHADOWSOCKS_LIBEV
> +        bool "shadowsocks-libev"
> +        select BR2_PACKAGE_LIBSODIUM
> +        select BR2_PACKAGE_MBEDTLS
> +        select BR2_PACKAGE_PCRE
> +        select BR2_PACKAGE_C_ARES
> +        select BR2_PACKAGE_LIBEV

 Please keep the select lines alphabetical. So c-ares should be first.

> +        help
> +          Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
> +          embedded devices and low-end boxes.
> +
> +          https://github.com/shadowsocks/shadowsocks-libev
> diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
> new file mode 100644
> index 0000000..1c7f76a
> --- /dev/null
> +++ b/package/shadowsocks-libev/shadowsocks-libev.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# SHADOWSOCKS_LIBEV

 This should be lower case.

> +#
> +################################################################################
> +
> +SHADOWSOCKS_LIBEV_VERSION = 3.1.3
> +SHADOWSOCKS_LIBEV_SOURCE = shadowsocks-libev-$(SHADOWSOCKS_LIBEV_VERSION).tar.gz

 This is the default so you can omit it.

> +SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
> +SHADOWSOCKS_LIBEV_LICENSE = GPLv3

 Use SPDX tags, so GPL-3.0.

 It looks to me like it has 'or later' everywhere, so GPL-3.0+.

 It looks like it includes additional libraries under different licenses. So it
should be (I think, please check)

SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), \
	BSD-3-Clause (libcork, libipset)

Note that murmur2 is public domain and doesn't need to be mentioned.

 Also the LICENSE_FILES should immediately follow it, and include the license
files for all of these:

SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/COPYING libcork/COPYING

(libipset is a bit problematic because it doesn't have a license file in the
tarball. The git repo does have it, though, and it's identical to the one lin
libcork as far as I can tell.)

 Also please add hashes for all these files.


> +SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf

 You need to specify all build dependencies here, alphabetically. So:

SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre


> +SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING
> +SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
> +SHADOWSOCKS_LIBEV_CONF_ENV = PCRECONFIG=$(STAGING_DIR)/usr/bin/pcre-config
> +SHADOWSOCKS_LIBEV_DEPENDENCIES += pcre
> +SHADOWSOCKS_LIBEV_CONF_OPTS = --disable-documentation --with-pcre=$(STAGING_DIR)/usr/bin/
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

 You should only add a host version of the package if it is needed for something.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
