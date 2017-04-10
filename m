From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 15:52:12 +0200
Subject: [Buildroot] [PATCHv3] libbson: new package
In-Reply-To: <1491823008-28670-1-git-send-email-semenak94@mail.ru>
References: <libbson: new package>
 <1491823008-28670-1-git-send-email-semenak94@mail.ru>
Message-ID: <8b147fef-dc96-ad32-34ce-0f68af4bfe11@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Semyon,

 We're getting there :-)

On 10-04-17 13:16, Semyon Kolganov wrote:
> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
> 
> ---

[snip]
> diff --git a/package/libbson/Config.in b/package/libbson/Config.in
> new file mode 100644
> index 0000000..df28462
> --- /dev/null
> +++ b/package/libbson/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBBSON
> +	bool "libbson"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS # CMakeLists forces dynamic library

 Since you're no longer using cmake, this should be removed.

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
> index 0000000..b2faa4b
> --- /dev/null
> +++ b/package/libbson/libbson.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libbson
> +#
> +################################################################################
> +
> +LIBBSON_VERSION = 1.6.2
> +LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
> +LIBBSON_SOURCE = libbson-$(LIBBSON_VERSION).tar.gz
> +LIBBSON_LICENSE = Apache-2.0, MIT(jsonl), ISC(b64), Zlib(md5)

 There should be a space between the license and the object, so MIT (jsonl) etc.

> +LIBBSON_LICENSE_FILES = COPYING

LIBBSON_LICENSE_FILES = COPYING THIRD_PARTY_NOTICES

 I said this in my previous review.

 I also mentioned:

LIBBSON_CONF_OPTS = --disable-tests --disable-examples

(otherwise it will fail on NOMMU)

 Please use support/scripts/test-pkg to validate that the package builds with
all supported toolchains.


> +LIBBSON_INSTALL_STAGING = YES
> +

 For posterity, it could be useful to add:

# Also has CMake supports, but that forces shared+static libs and static
# lib has a different name.
> +$(eval $(autotools-package))


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
