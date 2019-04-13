From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 22:35:09 +0200
Subject: [Buildroot] [PATCH v2] package/xmlsec1: new package
In-Reply-To: <20190210151207.18441-1-bastian.breit.buildroot@gmail.com>
References: <20190210151207.18441-1-bastian.breit.buildroot@gmail.com>
Message-ID: <20190413223509.20366104@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bastian,

Sorry for the very slow feedback. I wanted to apply this patch (after
some rework), but some fundamental thing is missing, which requires
another iteration: the commit log lacks your Signed-off-by line. So
I'll do a full review below.

First, the commit title should match the package name:

	package/libxmlsec1: new package

On Sun, 10 Feb 2019 16:12:07 +0100
Bastian Breit <bastian.breit.buildroot@gmail.com> wrote:

> This fixes spaces and tab formatting in the package folder.
> Therefore an enty in DEVELOPERS is created.
> Change from md5 to sha256 for checksums.
> Remove unneeded libxslt dependency.

The changelog should be after the "---" sign below, so that it doesn't
end up in the commit log when the patch is applied.

And more critically, we need your Signed-off-by at the end of the
commit log.

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
> @@ -250,6 +250,9 @@ F:	package/tcpdump/
>  F:	package/ti-uim/
>  F:	package/uhubctl/
>  
> +N: Bastian Breit <bastian.breit.buildroot@gmail.com>
> +F: package/libxmlsec1/

Please fix the indentation here to comply with the rest of the file.

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

One assignment is enough, and use --enable/--disable and
--with/--without. I.e:

LIBXMLSEC1_CONF_OPTS = \
	--disable-crypto-dl=no \
	--with-openssl=$(STAGING_DIR)/usr \
	--without-libxslt \
	--without-gnutls \
	--without-gcrypt

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
