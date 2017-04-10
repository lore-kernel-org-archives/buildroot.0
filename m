From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 16:59:07 +0200
Subject: [Buildroot] [PATCHv4] libbson: new package
In-Reply-To: <1491834587-2489-1-git-send-email-semenak94@mail.ru>
References: <libbson: new package>
 <1491834587-2489-1-git-send-email-semenak94@mail.ru>
Message-ID: <195dfc5d-cf24-48c3-2cfc-1f239ed5ed3f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Two minor things that I missed previous time...

On 10-04-17 16:29, Semyon Kolganov wrote:
> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
> ---
> Changes between v3 and v4:
>  - removed force dynamic library
>  - formatting fixes
>  - added configure options
> 
> Changes between v2 and v3:
>  - changed cmake method to autotools
>  - append licenses
>  - change download from github to prepared tarball on github
>  - added dependency from BR2_TOOLCHAIN_HAS_THREADS
>  - added force dynamic library
> 
> Changes between v1 and v2:
>  - changed license to right one
>  - formatting fix
> ---
>  package/Config.in            |  1 +
>  package/libbson/Config.in    |  6 ++++++
>  package/libbson/libbson.hash |  2 ++
>  package/libbson/libbson.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 31 insertions(+)
>  create mode 100644 package/libbson/Config.in
>  create mode 100644 package/libbson/libbson.hash
>  create mode 100644 package/libbson/libbson.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index c12e5b5..3683578 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1159,6 +1159,7 @@ menu "JSON/XML"
>  	source "package/json-c/Config.in"
>  	source "package/json-glib/Config.in"
>  	source "package/jsoncpp/Config.in"
> +	source "package/libbson/Config.in"
>  	source "package/libfastjson/Config.in"
>  	source "package/libjson/Config.in"
>  	source "package/libroxml/Config.in"
> diff --git a/package/libbson/Config.in b/package/libbson/Config.in
> new file mode 100644
> index 0000000..719271c
> --- /dev/null
> +++ b/package/libbson/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBBSON
> +	bool "libbson"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  libbson is a library providing useful routines related to
> +	  building, parsing, and iterating BSON documents.
> diff --git a/package/libbson/libbson.hash b/package/libbson/libbson.hash
> new file mode 100644
> index 0000000..27abe90
> --- /dev/null
> +++ b/package/libbson/libbson.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	aad410123e4bd8a9804c3c3d79e03344e2df104872594dc2cf19605d492944ba libbson-1.6.2.tar.gz
> diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
> new file mode 100644
> index 0000000..24c1abd
> --- /dev/null
> +++ b/package/libbson/libbson.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libbson
> +#
> +################################################################################
> +
> +LIBBSON_VERSION = 1.6.2
> +LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
> +LIBBSON_SOURCE = libbson-$(LIBBSON_VERSION).tar.gz

 This line should be removed, it's the default.

> +LIBBSON_LICENSE = Apache-2.0, MIT (jsonl), ISC (b64), Zlib (md5)
> +LIBBSON_LICENSE_FILES = COPYING THIRD_PARTY_NOTICES
> +LIBBSON_CONF_OPTS = \
> +	--disable-tests \
> +	--disable-examples \
> +	--disable-man-pages \
> +	--disable-html-docs
> +
> +LIBBSON_INSTALL_STAGING = YES
> +
> +# Also has CMake supports, but that forces shared+static libs and static
                    ^^^^^^^^ support

 Since it's trivial and I already did it locally, I'll just resend myself. No
need to resend.

 Regards,
 Arnout

> +# lib has a different name.
> +$(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
