From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 29 May 2015 00:19:19 +0200
Subject: [Buildroot] [PATCH v2 2/2] fcgiwrap: new package
In-Reply-To: <1432827404-1096-3-git-send-email-thomas.claveirole@green-communications.fr>
References: <1432827404-1096-1-git-send-email-thomas.claveirole@green-communications.fr>
 <1432827404-1096-3-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <55679467.7090801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/28/15 17:36, Thomas Claveirole wrote:
> Add package fcgiwrap from https://nginx.localdomain.pl/wiki/FcgiWrap
> 
> fcgiwrap is a simple server for running CGI applications over
> FastCGI. It hopes to provide clean CGI support to Nginx (and other web
> servers that may need it).
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/Config.in            |  1 +
>  package/fcgiwrap/Config.in   | 10 ++++++++++
>  package/fcgiwrap/fcgiwrap.mk | 13 +++++++++++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 package/fcgiwrap/Config.in
>  create mode 100644 package/fcgiwrap/fcgiwrap.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e0c2e2a..188ff0d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1168,6 +1168,7 @@ endif
>  	source "package/ejabberd/Config.in"
>  	source "package/ethtool/Config.in"
>  	source "package/faifa/Config.in"
> +	source "package/fcgiwrap/Config.in"
>  	source "package/fmc/Config.in"
>  	source "package/foomatic-filters/Config.in"
>  	source "package/fping/Config.in"
> diff --git a/package/fcgiwrap/Config.in b/package/fcgiwrap/Config.in
> new file mode 100644
> index 0000000..a5c15a0
> --- /dev/null
> +++ b/package/fcgiwrap/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_FCGIWRAP
> +	bool "fcgiwrap"
> +	depends on BR2_USE_MMU # Transitive dependency from libfcgi.

 Just say # libfcgi

> +	select BR2_PACKAGE_LIBFCGI
> +	help
> +	  fcgiwrap is a simple server for running CGI applications
> +	  over FastCGI. It hopes to provide clean CGI support to Nginx
> +	  (and other web servers that may need it).
> +
> +	  https://nginx.localdomain.pl/wiki/FcgiWrap
> diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
> new file mode 100644
> index 0000000..844f1a3
> --- /dev/null
> +++ b/package/fcgiwrap/fcgiwrap.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# fcgiwrap
> +#
> +################################################################################
> +
> +FCGIWRAP_VERSION = 1.1.0
> +FCGIWRAP_SITE = $(call github,gnosek,fcgiwrap,$(FCGIWRAP_VERSION))
> +FCGIWRAP_DEPENDENCIES = host-pkgconf libfcgi
> +FCGIWRAP_LICENSE = MIT

 Please add a license file. There isn't a separate one, so just use fcgiwrap.c.

> +FCGIWRAP_AUTORECONF = YES

 This package also has an optional dependency on systemd, so add:

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
FCGIWRAP_DEPENDENCIES += systemd
FCGIWRAP_CONF_OPTS += --with-systemd
else
FCGIWRAP_CONF_OPTS += --without-systemd
endif

> +
> +$(eval $(autotools-package))

 This doesn't work because it's not a proper autotools package: it doesn't have
a Makefile.am, only a Makefile.in. Because of this, CC etc. don't get set in the
generated Makefile.

 Normally we say to make it a generic package, but that means you also have to
define the autoreconf expansion. So in this case, I'd say to just define
FCGIWRAP_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)


 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
