From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 May 2016 00:41:28 +0200
Subject: [Buildroot] [RFC/PATCH next 2/2] couchdb: New package.
In-Reply-To: <1463673580-10676-2-git-send-email-nicolas.cavallari@green-communications.fr>
References: <1463673580-10676-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1463673580-10676-2-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <b4651105-f652-0bd1-b5ef-4cf0be436522@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/19/16 17:59, Nicolas Cavallari wrote:
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

 My first reaction was: can't we use a more recent version from git instead of
an almost-two-years-old release, but that won't be easy because of all the
submodules.

 Just small comments all over.

> ---
>  package/Config.in                              |  1 +
>  package/couchdb/0001-remove-unsafe-paths.patch | 41 ++++++++++++++++++++
>  package/couchdb/Config.in                      | 22 +++++++++++
>  package/couchdb/S96prepare-couchdb             |  5 +++
>  package/couchdb/couchdb.hash                   |  7 ++++
>  package/couchdb/couchdb.mk                     | 52 ++++++++++++++++++++++++++
>  6 files changed, 128 insertions(+)
>  create mode 100644 package/couchdb/0001-remove-unsafe-paths.patch
>  create mode 100644 package/couchdb/Config.in
>  create mode 100644 package/couchdb/S96prepare-couchdb
>  create mode 100644 package/couchdb/couchdb.hash
>  create mode 100644 package/couchdb/couchdb.mk
> 
[snip]
> diff --git a/package/couchdb/Config.in b/package/couchdb/Config.in
> new file mode 100644
> index 0000000..20899bf
> --- /dev/null
> +++ b/package/couchdb/Config.in
> @@ -0,0 +1,22 @@
> +comment "CouchDB need a toolchain with C++, wchar, threads, dynamic libs."
> +	depends on !BR2_BINFMT_FLAT
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> +
> +config BR2_PACKAGE_COUCHDB
> +	bool "couchdb"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
> +	depends on !BR2_BINFMT_FLAT # icu
> +	depends on BR2_USE_MMU # erlang, spidermonkey185
> +	depends on !BR2_STATIC_LIBS # erlang
> +	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # erlang
> +	depends on BR2_INSTALL_LIBSTDCPP # icu, spidermonkey185
> +	depends on BR2_USE_WCHAR # icu

 Could you order the dependencies with arch deps first, and then toolchain deps?
So it's consistent with the comment deps.

> +
> +	select BR2_PACKAGE_ERLANG
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_SPIDERMONKEY185
> +	select BR2_PACKAGE_LIBCURL
> diff --git a/package/couchdb/S96prepare-couchdb b/package/couchdb/S96prepare-couchdb
> new file mode 100644
> index 0000000..065395b
> --- /dev/null
> +++ b/package/couchdb/S96prepare-couchdb
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +case "$1" in
> +	start)
> +		install -d -o couchdb /var/log/couchdb;;

 I like this solution for creating the log directory!

 Should group be set to couchdb as well?

> +esac
> diff --git a/package/couchdb/couchdb.hash b/package/couchdb/couchdb.hash
> new file mode 100644
> index 0000000..22be689
> --- /dev/null
> +++ b/package/couchdb/couchdb.hash
> @@ -0,0 +1,7 @@
> +# From https://archive.apache.org/dist/couchdb/source/1.6.1/apache-couchdb-1.6.1.tar.gz.{md5,sha}
> +sha1	6275f3818579d7b307052e9735c42a8a64313229	apache-couchdb-1.6.1.tar.gz
> +md5	01a2c8ab4fcde457529428993901a060		apache-couchdb-1.6.1.tar.gz
> +
> +# Locally generated after checking PGP signature
> +sha256	5a601b173733ce3ed31b654805c793aa907131cd70b06d03825f169aa48c8627	apache-couchdb-1.6.1.tar.gz
> +

 Redundant empty line.

> diff --git a/package/couchdb/couchdb.mk b/package/couchdb/couchdb.mk
> new file mode 100644
> index 0000000..5e8a8cf
> --- /dev/null
> +++ b/package/couchdb/couchdb.mk
> @@ -0,0 +1,52 @@
> +################################################################################
> +#
> +# CouchDB
> +#
> +################################################################################
> +
> +COUCHDB_VERSION = 1.6.1
> +COUCHDB_SITE = \
> +	http://archive.apache.org/dist/couchdb/source/${COUCHDB_VERSION}
> +COUCHDB_SOURCE = apache-couchdb-${COUCHDB_VERSION}.tar.gz
> +
> +COUCHDB_LICENSE = Apache-2.0
> +COUCHDB_LICENSE_FILES = LICENSE
> +
> +COUCHDB_DEPENDENCIES = host-autoconf-archive host-pkgconf \
> +	openssl icu libcurl spidermonkey185 erlang host-pkgconf

 You got host-pkgconf twice. Sort them alphabetically to avoid that.

> +
> +# configure.ac is patched.
> +COUCHDB_AUTORECONF = YES
> +COUCHDB_AUTORECONF_OPTS = -I $(HOST_DIR)/usr/share/autoconf-archive
> +
> +COUCHDB_CONF_ENV = \
> +	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config \
> +	ICU_CONFIG=$(STAGING_DIR)/usr/bin/icu-config
> +COUCHDB_CONF_OPTS = --disable-init
> +
> +# CouchDB's build system mixes the erl for the host and the erl for the
> +# target.
> +define COUCHDB_FIX_ERL_PATH
> +	sed -i -re 's*$(HOST_DIR)**' \

 We usually use , and sometimes %, not *.

> +		$(TARGET_DIR)/usr/bin/couchdb \
> +		$(TARGET_DIR)/usr/bin/couch-config
> +endef
> +COUCHDB_POST_INSTALL_TARGET_HOOKS += COUCHDB_FIX_ERL_PATH
> +
> +define COUCHDB_INSTALL_INIT_SYSV
> +install -m 755 -D $(@D)/etc/init/couchdb $(TARGET_DIR)/etc/init.d/S97couchdb
> +install -m 755 package/couchdb/S96prepare-couchdb $(TARGET_DIR)/etc/init.d/
> +install -m 755 -D $(@D)/etc/default/couchdb $(TARGET_DIR)/etc/default/couchdb

 Stuff inside "define" is indented with a tab.

> +endef
> +
> +define COUCHDB_USERS
> +couchdb -1 couchdb -1 ! - /bin/sh - CouchDB Server

 Same here.

> +endef
> +
> +define COUCHDB_PERMISSIONS
> +/etc/couchdb		r	755	couchdb	couchdb - - - -
> +/var/lib/couchdb	d	750	couchdb	couchdb - - - -

 Same here.

 Regards,
 Arnout

> +endef
> +
> +$(eval $(autotools-package))
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
