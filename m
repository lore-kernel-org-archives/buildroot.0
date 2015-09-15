From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 15 Sep 2015 11:41:58 +0100
Subject: [Buildroot] [PATCH v2 1/3] gssdp: new package
In-Reply-To: <1442304281-16222-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1442304281-16222-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1442304281-16222-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <55F7F5F6.30704@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

please mark your previous patch as superseded:

http://patchwork.ozlabs.org/patch/517338/

On 09/15/2015 09:04 AM, Rahul Bedarkar wrote:
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/lib/libgssdp-1.0.so.3.0.0
output/target/usr/lib/libgssdp-1.0.so.3.0.0: ELF 32-bit MSB shared
object, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, with
unknown capability 0x41000000 = 0xf676e75, with unknown capability
0x10000 = 0x70403, stripped

Regards,

Vincent.

> ---
> Changes v1 -> v2:
> 	- libsoup also needs threads and MMU so add it to list in comment
> 	- add <PKG>-VERSION_MAJOR variable (suggested by Vincent Olivert Riera)
> ---
>  package/Config.in        |  1 +
>  package/gssdp/Config.in  | 15 +++++++++++++++
>  package/gssdp/gssdp.hash |  2 ++
>  package/gssdp/gssdp.mk   | 16 ++++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/gssdp/Config.in
>  create mode 100644 package/gssdp/gssdp.hash
>  create mode 100644 package/gssdp/gssdp.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 030477a..25cc6df 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -981,6 +981,7 @@ menu "Networking"
>  	source "package/fmlib/Config.in"
>  	source "package/geoip/Config.in"
>  	source "package/glib-networking/Config.in"
> +	source "package/gssdp/Config.in"
>  	source "package/ibrcommon/Config.in"
>  	source "package/ibrdtn/Config.in"
>  	source "package/libcgi/Config.in"
> diff --git a/package/gssdp/Config.in b/package/gssdp/Config.in
> new file mode 100644
> index 0000000..8314971
> --- /dev/null
> +++ b/package/gssdp/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_GSSDP
> +	bool "gssdp"
> +	depends on BR2_USE_WCHAR # glib2, libsoup
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libsoup
> +	depends on BR2_USE_MMU # glib2, libsoup
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBSOUP
> +	help
> +	  GSSDP implements resource discovery and announcement over SSDP.
> +
> +	  http://www.gupnp.org
> +
> +comment "gssdp needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
> new file mode 100644
> index 0000000..09b8532
> --- /dev/null
> +++ b/package/gssdp/gssdp.hash
> @@ -0,0 +1,2 @@
> +# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/0.13/gssdp-0.13.2.sha256sum:
> +sha256 8f663f8a72b66254f5c20a3610ff853ac8d00bf6f253828e37e51579caa34dce  gssdp-0.13.2.tar.xz
> diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
> new file mode 100644
> index 0000000..d9459a1
> --- /dev/null
> +++ b/package/gssdp/gssdp.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# gssdp
> +#
> +################################################################################
> +
> +GSSDP_VERSION_MAJOR = 0.13
> +GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).2
> +GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
> +GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
> +GSSDP_LICENSE = LGPLv2+
> +GSSDP_LICENSE_FILES = COPYING
> +GSSDP_INSTALL_STAGING = YES
> +GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
> +
> +$(eval $(autotools-package))
> 
