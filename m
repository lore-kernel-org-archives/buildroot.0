From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 15:59:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfreefare: fix static build
 with latomic
In-Reply-To: <20190412171045.18584-1-fontaine.fabrice@gmail.com>
References: <20190412171045.18584-1-fontaine.fabrice@gmail.com>
Message-ID: <09bf8543-4101-4324-abe7-553a36a8fd49@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2019 19:10, Fabrice Fontaine wrote:
> Use pkg-config to retrieve openssl dependencies such as lz or latomic
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9bf69f238a63ea28690f7c0dbb8c30feb0afc5ad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libfreefare/libfreefare.mk | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
> index 13e6f2ad5e..16f15b34e4 100644
> --- a/package/libfreefare/libfreefare.mk
> +++ b/package/libfreefare/libfreefare.mk
> @@ -9,13 +9,9 @@ LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
>  # Do not use the github helper here, the generated tarball is *NOT*
>  # the same as the one uploaded by upstream for the release.
>  LIBFREEFARE_SITE = https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-$(LIBFREEFARE_VERSION)
> -LIBFREEFARE_DEPENDENCIES = libnfc openssl
> +LIBFREEFARE_DEPENDENCIES = host-pkgconf libnfc openssl
>  LIBFREEFARE_LICENSE = LGPL-3.0+ with exception
>  LIBFREEFARE_LICENSE_FILES = COPYING
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -# openssl needs zlib even if the libfreefare example itself doesn't
> -LIBFREEFARE_CONF_ENV += LIBS='-lz'
> -endif
> +LIBFREEFARE_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
>  
>  $(eval $(autotools-package))
> 
