From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 17 Mar 2016 13:58:20 +0200
Subject: [Buildroot] [PATCH 1/1] raptor: new package
In-Reply-To: <1458214161-17159-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
References: <1458214161-17159-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
Message-ID: <20160317115820.GI5528@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nitin,

On Thu, Mar 17, 2016 at 04:59:21PM +0530, Nitin Mendiratta wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> Raptor is a free software / Open Source C library that provides a set of parsers
> and serializers that generate Resource Description Framework (RDF) triples
> by parsing syntaxes or serialize the triples into a syntax.
> 
> http://librdf.org/raptor/
> 
> Patch added in the package:
> 0001-configure.ac-remove-conditional-lib-inclusion.patch
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Changes v1:
>   - Added 0001-configure.ac-remove-conditional-lib-inclusion.patch.
>   - Added optional dependencies libcurl,yajl and icu.
> 
> Signed-off-by: Nitin Mendiratta <nitin.mendiratta@rockwellcollins.com>

Your sign-off should be above the --- separator just below Matt's. Otherwise 
it won't appear in the commit log when this patch applies using 'git am'.

> ---
>  package/Config.in                                  |  1 +
>  ...igure.ac-remove-conditional-lib-inclusion.patch | 20 +++++++++++++++
>  package/raptor/Config.in                           | 11 ++++++++
>  package/raptor/raptor.hash                         |  2 ++
>  package/raptor/raptor.mk                           | 30 ++++++++++++++++++++++
>  5 files changed, 64 insertions(+)
>  create mode 100644 package/raptor/0001-configure.ac-remove-conditional-lib-inclusion.patch
>  create mode 100644 package/raptor/Config.in
>  create mode 100644 package/raptor/raptor.hash
>  create mode 100644 package/raptor/raptor.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index c4d98c4..430cef8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1036,6 +1036,7 @@ menu "JSON/XML"
>  	source "package/mxml/Config.in"
>  	source "package/rapidjson/Config.in"
>  	source "package/rapidxml/Config.in"
> +	source "package/raptor/Config.in"
>  	source "package/tinyxml/Config.in"
>  	source "package/tinyxml2/Config.in"
>  	source "package/xerces/Config.in"
> diff --git a/package/raptor/0001-configure.ac-remove-conditional-lib-inclusion.patch b/package/raptor/0001-configure.ac-remove-conditional-lib-inclusion.patch
> new file mode 100644
> index 0000000..0fd0495
> --- /dev/null
> +++ b/package/raptor/0001-configure.ac-remove-conditional-lib-inclusion.patch
> @@ -0,0 +1,20 @@
> +Removed condition for header path inclusion from the configure file.

You should mention here that this include path is from the host, which is 
wrong for cross compilation.

[snip]

> diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
> new file mode 100644
> index 0000000..965ef0c
> --- /dev/null
> +++ b/package/raptor/raptor.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# raptor
> +#
> +################################################################################
> +
> +RAPTOR_VERSION = 2.0.15
> +RAPTOR_SOURCE = raptor2-$(RAPTOR_VERSION).tar.gz
> +RAPTOR_SITE = http://download.librdf.org/source
> +RAPTOR_DEPENDENCIES = libxml2 libxslt
> +RAPTOR_LICENSE = GPLv2+ or LGPLv2.1+ or Apache-2.0+
> +RAPTOR_LICENSE_FILES = LICENSE.txt

Since you patch configure.ac, you need 'RAPTOR_AUTORECONF = YES' here. Also, 
please add a comment explaining that we need this because we are patching 
configure.ac.

> +
> +RAPTOR_CONF_OPTS = --with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
> +		--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
> +
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +RAPTOR_DEPENDENCIES += libcurl
> +endif

If the configure scripts uses --with-libcurl/--without-libcurl please add this 
options to RAPTOR_CONF_OPTS as appropriate. The same goes for the rest of the 
optional dependencies below.

> +
> +ifeq ($(BR2_PACKAGE_YAJL),y)
> +RAPTOR_DEPENDENCIES += yajl
> +RAPTOR_CONF_ENV += LIBS="-lm"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_YAJL),y)

Typo.

> +RAPTOR_DEPENDENCIES += icu
> +endif
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
