From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Jul 2014 22:41:05 +0200
Subject: [Buildroot] [PATCH] flickcurl: new package
In-Reply-To: <1406545017-29163-1-git-send-email-peter@korsgaard.com>
References: <1406545017-29163-1-git-send-email-peter@korsgaard.com>
Message-ID: <20140728204105.GB4224@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-07-28 12:56 +0200, Peter Korsgaard spake thusly:
> We need two patches from upstream git as flickr now requires https access.
> It hardcodes openssl for https support in libcurl as Kconfig complains about
> circular dependencies if we use logic like:
> 
> select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBNSS)

That's becasue lftp does the opposite select:
    package/lftp/Config.in: select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_OPENSSL

We must do the select always in the same direction.

Regards,
Yann E. MORIN.

> I'm not sure what we can do about that though.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in                                  |  1 +
>  package/flickcurl/Config.in                        | 21 ++++++++++++
>  ...ttps-for-all-service-endpoints.-HTTP-EOL-.patch | 40 ++++++++++++++++++++++
>  ...auth-services-are-on-https-www.flickr.com.patch | 30 ++++++++++++++++
>  package/flickcurl/flickcurl.mk                     | 23 +++++++++++++
>  5 files changed, 115 insertions(+)
>  create mode 100644 package/flickcurl/Config.in
>  create mode 100644 package/flickcurl/flickcurl-0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch
>  create mode 100644 package/flickcurl/flickcurl-0002-Oauth-services-are-on-https-www.flickr.com.patch
>  create mode 100644 package/flickcurl/flickcurl.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 559b895..11087da 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -753,6 +753,7 @@ menu "Networking"
>  	source "package/cppzmq/Config.in"
>  	source "package/czmq/Config.in"
>  	source "package/filemq/Config.in"
> +	source "package/flickcurl/Config.in"
>  	source "package/fmlib/Config.in"
>  	source "package/geoip/Config.in"
>  	source "package/glib-networking/Config.in"
> diff --git a/package/flickcurl/Config.in b/package/flickcurl/Config.in
> new file mode 100644
> index 0000000..54fecc0
> --- /dev/null
> +++ b/package/flickcurl/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_FLICKCURL
> +	bool "flickcurl"
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBXML2
> +	# For https support in libcurl. Gnutls/libnss could also work,
> +	# but kconfig gets confused if we try to be clever here
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_CA_CERTIFICATES # runtime
> +	help
> +	  Flickcurl is a C library for the Flickr API, handling
> +	  creating the requests, signing, token management, calling
> +	  the API, marshalling request parameters and decoding
> +	  responses.
> +
> +	  http://librdf.org/flickcurl/
> +
> +config BR2_PACKAGE_FLICKCURL_UTILS
> +	bool "flickcurl utilities"
> +	depends on BR2_PACKAGE_FLICKCURL
> +	help
> +	  Install flickcurl utilites (flickcurl + flickrdf) to target.
> diff --git a/package/flickcurl/flickcurl-0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch b/package/flickcurl/flickcurl-0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch
> new file mode 100644
> index 0000000..576b611
> --- /dev/null
> +++ b/package/flickcurl/flickcurl-0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch
> @@ -0,0 +1,40 @@
> +From 1f5e208a4709a3030258024ea63834aab41bca3c Mon Sep 17 00:00:00 2001
> +From: Dave Beckett <dave@dajobe.org>
> +Date: Sat, 31 May 2014 12:10:35 -0700
> +Subject: [PATCH] Switch to https for all service endpoints. HTTP EOL
> + 2014-06-27
> +
> +2014-04-30 Flickr announced that it would be HTTPS only from 2014-06-27
> +http://code.flickr.net/2014/04/30/flickr-api-going-ssl-only-on-june-27th-2014/
> +
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + src/common.c | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/common.c b/src/common.c
> +index ef05e08..245db18 100644
> +--- a/src/common.c
> ++++ b/src/common.c
> +@@ -73,12 +73,12 @@ const char* const flickcurl_home_url_string = "http://librdf.org/flickcurl/";
> + const char* const flickcurl_version_string = VERSION;
> + 
> + 
> +-const char* const flickcurl_flickr_service_uri =  "http://www.flickr.com/services/rest/";
> +-const char* const flickcurl_flickr_upload_service_uri =  "http://api.flickr.com/services/upload/";
> +-const char* const flickcurl_flickr_replace_service_uri =  "http://api.flickr.com/services/replace/";
> +-const char* const flickcurl_flickr_oauth_request_token_uri =  "http://www.flickr.com/services/oauth/request_token";
> +-const char* const flickcurl_flickr_oauth_authorize_uri =  "http://www.flickr.com/services/oauth/authorize";
> +-const char* const flickcurl_flickr_oauth_access_token_uri =  "http://www.flickr.com/services/oauth/access_token";
> ++const char* const flickcurl_flickr_service_uri =  "https://api.flickr.com/services/rest/";
> ++const char* const flickcurl_flickr_upload_service_uri =  "https://up.flickr.com/services/upload/";
> ++const char* const flickcurl_flickr_replace_service_uri =  "https://up.flickr.com/services/replace/";
> ++const char* const flickcurl_flickr_oauth_request_token_uri =  "https://api.flickr.com/services/oauth/request_token";
> ++const char* const flickcurl_flickr_oauth_authorize_uri =  "https://api.flickr.com/services/oauth/authorize";
> ++const char* const flickcurl_flickr_oauth_access_token_uri =  "https://api.flickr.com/services/oauth/access_token";
> + 
> + 
> + static void
> +-- 
> +2.0.0
> +
> diff --git a/package/flickcurl/flickcurl-0002-Oauth-services-are-on-https-www.flickr.com.patch b/package/flickcurl/flickcurl-0002-Oauth-services-are-on-https-www.flickr.com.patch
> new file mode 100644
> index 0000000..1ed9af2
> --- /dev/null
> +++ b/package/flickcurl/flickcurl-0002-Oauth-services-are-on-https-www.flickr.com.patch
> @@ -0,0 +1,30 @@
> +From 3e65bbfc1c556ac8bd1d30db66d6e63957066b75 Mon Sep 17 00:00:00 2001
> +From: Dave Beckett <dave@dajobe.org>
> +Date: Sat, 31 May 2014 12:56:22 -0700
> +Subject: [PATCH] Oauth services are on https www.flickr.com
> +
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + src/common.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/common.c b/src/common.c
> +index 245db18..c697a7d 100644
> +--- a/src/common.c
> ++++ b/src/common.c
> +@@ -76,9 +76,9 @@ const char* const flickcurl_version_string = VERSION;
> + const char* const flickcurl_flickr_service_uri =  "https://api.flickr.com/services/rest/";
> + const char* const flickcurl_flickr_upload_service_uri =  "https://up.flickr.com/services/upload/";
> + const char* const flickcurl_flickr_replace_service_uri =  "https://up.flickr.com/services/replace/";
> +-const char* const flickcurl_flickr_oauth_request_token_uri =  "https://api.flickr.com/services/oauth/request_token";
> +-const char* const flickcurl_flickr_oauth_authorize_uri =  "https://api.flickr.com/services/oauth/authorize";
> +-const char* const flickcurl_flickr_oauth_access_token_uri =  "https://api.flickr.com/services/oauth/access_token";
> ++const char* const flickcurl_flickr_oauth_request_token_uri =  "https://www.flickr.com/services/oauth/request_token";
> ++const char* const flickcurl_flickr_oauth_authorize_uri =  "https://www.flickr.com/services/oauth/authorize";
> ++const char* const flickcurl_flickr_oauth_access_token_uri =  "https://www.flickr.com/services/oauth/access_token";
> + 
> + 
> + static void
> +-- 
> +2.0.0
> +
> diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
> new file mode 100644
> index 0000000..7fb212f
> --- /dev/null
> +++ b/package/flickcurl/flickcurl.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# flickcurl
> +#
> +################################################################################
> +
> +FLICKCURL_VERSION = 1.25
> +FLICKCURL_SITE = http://download.dajobe.org/flickcurl/
> +FLICKCURL_LICENSE = LGPLv2.1+ or GPLv2+ or Apache 2.0+
> +FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
> +FLICKCURL_INSTALL_STAGING = YES
> +FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
> +FLICKCURL_CONF_OPT = --without-curl-config --without-xml2-config --without-raptor
> +FLICKCURL_DEPENDENCIES = libcurl libxml2 openssl ca-certificates host-pkgconf
> +
> +ifeq ($(BR2_PACKAGE_FLICKCURL_UTILS),)
> +define FLICKCURL_REMOVE_UTILS
> +	rm -f $(TARGET_DIR)/usr/bin/flickcurl $(TARGET_DIR)/usr/bin/flickrdf
> +endef
> +FLICKCURL_POST_INSTALL_TARGET_HOOKS += FLICKCURL_REMOVE_UTILS
> +endif
> +
> +$(eval $(autotools-package))
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
