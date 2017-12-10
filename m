From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 10 Dec 2017 17:49:01 +0200
Subject: [Buildroot] [PATCH] lynx: new package
In-Reply-To: <20171210143404.29210-1-mlang@blind.guru>
References: <20171210143404.29210-1-mlang@blind.guru>
Message-ID: <20171210174901.GB9766@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mario,

A couple of nitpicks below ? nothing that would block merging your patch,
I think :-)

On Sun, 10 Dec 2017 15:34:04 +0100, Mario Lang <mlang@blind.guru> wrote:
> Signed-off-by: Mario Lang <mlang@blind.guru>
> ---
>  DEVELOPERS             |  3 +++
>  package/Config.in      |  1 +
>  package/lynx/Config.in |  7 +++++++
>  package/lynx/lynx.hash |  3 +++
>  package/lynx/lynx.mk   | 31 +++++++++++++++++++++++++++++++
>  5 files changed, 45 insertions(+)
>  create mode 100644 package/lynx/Config.in
>  create mode 100644 package/lynx/lynx.hash
>  create mode 100644 package/lynx/lynx.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 77e3344fa4..63809f1afb 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1040,6 +1040,9 @@ F:	package/polkit/
>  F:	package/sg3_utils/
>  F:	package/udisks/
>  
> +N:	Mario Lang <mlang@blind.guru>
> +F:	package/lynx/
> +
>  N:	Mario Rugiero <mrugiero@gmail.com>
>  F:	package/ratpoison/
>  
> diff --git a/package/Config.in b/package/Config.in
> index cb2141b8f3..c3ebbfc8c4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1699,6 +1699,7 @@ menu "Networking applications"
>  	source "package/linuxptp/Config.in"
>  	source "package/lldpd/Config.in"
>  	source "package/lrzsz/Config.in"
> +	source "package/lynx/Config.in"
>  	source "package/macchanger/Config.in"
>  	source "package/memcached/Config.in"
>  	source "package/mii-diag/Config.in"
> diff --git a/package/lynx/Config.in b/package/lynx/Config.in
> new file mode 100644
> index 0000000000..2ccdad6f0b
> --- /dev/null
> +++ b/package/lynx/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LYNX
> +	bool "lynx"
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
> +	help
> +	  Text mode web browser.
> +

You could add one additional line in the "help" section with the project
URL (http://lynx.browser.org/)

> diff --git a/package/lynx/lynx.hash b/package/lynx/lynx.hash
> new file mode 100644
> index 0000000000..c39475aa23
> --- /dev/null
> +++ b/package/lynx/lynx.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated:
> +sha256  04318a100b052d079d0018fa371aa28cfb41ab68db3a959f3b75c2170eea1bc8  lynx2.8.9dev.16.tar.bz2
> +sha256  8406a30ff3134ec23cf752d1ceda92ddaabbe41b4f2dc07ea3cfa139de12d6d6  COPYING
> diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
> new file mode 100644
> index 0000000000..93f0b75982
> --- /dev/null
> +++ b/package/lynx/lynx.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# lynx
> +#
> +################################################################################
> +
> +LYNX_VERSION = 2.8.9dev.16
> +LYNX_SOURCE = lynx$(LYNX_VERSION).tar.bz2
> +LYNX_SITE = ftp://ftp.invisible-island.net/lynx/tarballs
> +LYNX_LICENSE = GPL-2.0
> +LYNX_LICENSE_FILES = COPYING
> +
> +LYNX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) ncurses
> +LYNX_CONF_OPTS = --with-screen=ncurses --with-curses-dir=$(TARGET_DIR)/usr

It is also possible to use "--with-screen=ncursesw", and AFAIU it should be
preferred when ncurses is being built with wide-character support (that is:
BR2_PACKAGE_NCURSES_WCHAR=y).

Lynx also supports being built with Slang instead of ncurses. There is a
"slang" package in Buildroot: You might want to consider doing a follow-up
patch which chooses slang when ncurses is not enabled (and slang is). I don't
see this is very important because most builds will have ncurses anyway, but
it could be a nice touch :-)

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LYNX_DEPENDENCIES += openssl
> +LYNX_CONF_OPTS += --with-ssl
> +else ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +LYNX_DEPENDENCIES += gnutls
> +LYNX_CONF_OPTS += --with-gnutls
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +LYNX_DEPENDENCIES += zlib
> +LYNX_CONF_OPTS += --with-zlib
> +else
> +LYNX_CONF_OPTS += --without-zlib
> +endif
> +
> +$(eval $(autotools-package))
> -- 
> 2.15.0

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171210/399b0eef/attachment.asc>
