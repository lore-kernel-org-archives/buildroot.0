From: Bastian Breit <bastian.breit.buildroot@gmail.com>
Date: Tue, 12 Feb 2019 17:13:08 +0100
Subject: [Buildroot] [PATCH v2] package/xmlsec1: new package
In-Reply-To: <20190210151207.18441-1-bastian.breit.buildroot@gmail.com>
References: <20190210151207.18441-1-bastian.breit.buildroot@gmail.com>
Message-ID: <CACHoAdpicM=WcFLCgcPoose_qx8Kcig-_sD6fN8uMTJmWuLCtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would summit options with later commits for the dependencies like
gnutls which is currently deactivated for this package. Should that be
mentioned in the help text? It should be clear by reading the current
dependencies. Does anyone prefer gnutls over openssl for non licencing
reasons? I am not sure how to handle licence changing by selecting
different dependencies (gnutls vs openssl)

Am So., 10. Feb. 2019 um 16:12 Uhr schrieb Bastian Breit
<bastian.breit.buildroot@gmail.com>:
>
> This fixes spaces and tab formatting in the package folder.
> Therefore an enty in DEVELOPERS is created.
> Change from md5 to sha256 for checksums.
> Remove unneeded libxslt dependency.
> ---
>  DEVELOPERS                         |  3 +++
>  package/Config.in                  |  1 +
>  package/libxmlsec1/Config.in       | 11 +++++++++++
>  package/libxmlsec1/libxmlsec1.hash |  4 ++++
>  package/libxmlsec1/libxmlsec1.mk   | 20 ++++++++++++++++++++
>  5 files changed, 39 insertions(+)
>  create mode 100644 package/libxmlsec1/Config.in
>  create mode 100644 package/libxmlsec1/libxmlsec1.hash
>  create mode 100644 package/libxmlsec1/libxmlsec1.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f2e69cc041..2bcd561805 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -250,6 +250,9 @@ F:  package/tcpdump/
>  F:     package/ti-uim/
>  F:     package/uhubctl/
>
> +N: Bastian Breit <bastian.breit.buildroot@gmail.com>
> +F: package/libxmlsec1/
> +
>  N:     Ben Boeckel <mathstuf@gmail.com>
>  F:     package/taskd/
>
> diff --git a/package/Config.in b/package/Config.in
> index 29862c478c..18acfd9db8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1428,6 +1428,7 @@ menu "JSON/XML"
>         source "package/libxml2/Config.in"
>         source "package/libxmlpp/Config.in"
>         source "package/libxmlrpc/Config.in"
> +       source "package/libxmlsec1/Config.in"
>         source "package/libxslt/Config.in"
>         source "package/libyaml/Config.in"
>         source "package/mxml/Config.in"
> diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
> new file mode 100644
> index 0000000000..ce3384e7b7
> --- /dev/null
> +++ b/package/libxmlsec1/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBXMLSEC1
> +       bool "libxmlsec1"
> +       select BR2_PACKAGE_LIBXML2
> +       select BR2_PACKAGE_OPENSSL
> +       help
> +         XMLSec library provides C based implementation for major XML
> +         Security standards:
> +         - XML Signature Syntax and Processing
> +         - XML Encryption Syntax and Processing
> +
> +         https://www.aleksey.com/xmlsec/
> diff --git a/package/libxmlsec1/libxmlsec1.hash b/package/libxmlsec1/libxmlsec1.hash
> new file mode 100644
> index 0000000000..9ff3b35454
> --- /dev/null
> +++ b/package/libxmlsec1/libxmlsec1.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256 97d756bad8e92588e6997d2227797eaa900d05e34a426829b149f65d87118eb6  xmlsec1-1.2.27.tar.gz
> +# Locally calculated
> +sha256 526285395dd39627199ba20fd7f70a2608c8c8c70e4fea04aceddd71baa53d07  Copyright
> diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
> new file mode 100644
> index 0000000000..e6a0a375e9
> --- /dev/null
> +++ b/package/libxmlsec1/libxmlsec1.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# libxmlsec1
> +#
> +################################################################################
> +
> +LIBXMLSEC1_VERSION = 1.2.27
> +LIBXMLSEC1_SOURCE = xmlsec1-$(LIBXMLSEC1_VERSION).tar.gz
> +LIBXMLSEC1_SITE = http://www.aleksey.com/xmlsec/download
> +LIBXMLSEC1_LICENSE = MIT
> +LIBXMLSEC1_LICENSE_FILES = Copyright
> +
> +LIBXMLSEC1_CONF_OPTS += --enable-crypto-dl=no
> +LIBXMLSEC1_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
> +LIBXMLSEC1_CONF_OPTS += --with-libxslt=no
> +LIBXMLSEC1_CONF_OPTS += --with-gnutls=no
> +LIBXMLSEC1_CONF_OPTS += --with-gcrypt=no
> +LIBXMLSEC1_DEPENDENCIES = libxml2 openssl
> +
> +$(eval $(autotools-package))
> --
> 2.17.1
>
