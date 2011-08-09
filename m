From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Aug 2011 16:39:48 +0200
Subject: [Buildroot] [PATCH] New packages: gssdp, gupnp and gupnp-av
In-Reply-To: <1312893243-24424-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Tue, 9 Aug 2011 14:34:03 +0200")
References: <1312893243-24424-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87d3gek5sb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> GUPnP is an elegant, object-oriented open source framework
 Sven> for creating UPnP devices and control points, written in C
 Sven> using GObject and libsoup.

I won't apply this before the tree opens again post-2011.08, but here's
a few initial comments:

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/Config.in            |    3 +++
 Sven>  package/gssdp/Config.in      |    8 ++++++++
 Sven>  package/gssdp/gssdp.mk       |   20 ++++++++++++++++++++
 Sven>  package/gupnp-av/Config.in   |    9 +++++++++
 Sven>  package/gupnp-av/gupnp-av.mk |   18 ++++++++++++++++++
 Sven>  package/gupnp/Config.in      |   12 ++++++++++++
 Sven>  package/gupnp/gupnp.mk       |   18 ++++++++++++++++++

Why are you adding 3 packages in a single patch? Please split it up in 3
patches.

 Sven> +++ b/package/gssdp/Config.in
 Sven> @@ -0,0 +1,8 @@
 Sven> +config BR2_PACKAGE_GSSDP
 Sven> +	bool "gssdp"
 Sven> +	default n

'n' is default anyway, so this can be dropped.

 Sven> +	select BR2_PACKAGE_LIBSOUP

libsoup depends on wchar, so you need to depend on that as well (and
show a comment if not available).

 Sven> +++ b/package/gssdp/gssdp.mk
 Sven> @@ -0,0 +1,20 @@
 Sven> +#############################################################
 Sven> +#
 Sven> +# gssdp
 Sven> +#
 Sven> +#############################################################
 Sven> +
 Sven> +GSSDP_VERSION:=0.8.2
 Sven> +GSSDP_SOURCE:=gssdp-$(GSSDP_VERSION).tar.gz
 Sven> +GSSDP_SITE:=http://www.gupnp.org/sites/all/files/sources

Please use VAR = value everywhere.

 Sven> +GSSDP_INSTALL_STAGING = YES
 Sven> +GSSDP_INSTALL_TARGET = YES

_INSTALL_TARGET = YES is default, so you can drop this.

 Sven> +
 Sven> +GSSDP_CONF_ENV = \
 Sven> +	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
 Sven> +
 Sven> +GSSDP_DEPENDENCIES = host-pkg-config host-libglib2 libsoup
 Sven> +
 Sven> +$(eval $(call AUTOTARGETS,package,gssdp))
 Sven> +
 Sven> +

You can skip those 2 empty lines here.

 Sven> diff --git a/package/gupnp-av/Config.in b/package/gupnp-av/Config.in
 Sven> new file mode 100755
 Sven> index 0000000..5669af0
 Sven> --- /dev/null
 Sven> +++ b/package/gupnp-av/Config.in
 Sven> @@ -0,0 +1,9 @@
 Sven> +config BR2_PACKAGE_GUPNP_AV
 Sven> +	bool "gupnp-av"
 Sven> +	default n
 Sven> +	depends on BR2_PACKAGE_GUPNP
 Sven> +	help
 Sven> +          GUPnP-AV is a collection of helpers for building AV (audio/video)
 Sven> +          applications using GUPnP.
 Sven> +
 Sven> +          http://www.gupnp.org/

Same comments as above.

 Sven> diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
 Sven> new file mode 100755
 Sven> index 0000000..96cc3f3
 Sven> --- /dev/null
 Sven> +++ b/package/gupnp-av/gupnp-av.mk
 Sven> @@ -0,0 +1,18 @@
 Sven> +#############################################################
 Sven> +#
 Sven> +# gupnp-av
 Sven> +#
 Sven> +#############################################################
 Sven> +
 Sven> +GUPNP_AV_VERSION:=0.6.3
 Sven> +GUPNP_AV_SOURCE:=gupnp-av-$(GUPNP_AV_VERSION).tar.gz
 Sven> +GUPNP_AV_SITE:=http://www.gupnp.org/sites/all/files/sources
 Sven> +GUPNP_AV_INSTALL_STAGING = YES
 Sven> +GUPNP_AV_INSTALL_TARGET = YES

Same comments as above.

 Sven> +
 Sven> +GUPNP_AV_CONF_ENV = \
 Sven> +	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
 Sven> +
 Sven> +GUPNP_AV_DEPENDENCIES = host-pkg-config host-libglib2 gupnp
 Sven> +
 Sven> +$(eval $(call AUTOTARGETS,package,gupnp-av))
 Sven> diff --git a/package/gupnp/Config.in b/package/gupnp/Config.in
 Sven> new file mode 100755
 Sven> index 0000000..830958c
 Sven> --- /dev/null
 Sven> +++ b/package/gupnp/Config.in
 Sven> @@ -0,0 +1,12 @@
 Sven> +config BR2_PACKAGE_GUPNP
 Sven> +	bool "gupnp"
 Sven> +	default n
 Sven> +	select BR2_PACKAGE_GSSDP
 Sven> +        select BR2_PACKAGE_LIBXML2
 Sven> +        select BR2_PACKAGE_UTIL_LINUX_LIBUUID

Same comments as above. You afaik need to select BR2_PACKAGE_UTIL_LINUX
as well (which needs largefile/wchar).

 Sven> +	help
 Sven> +          GUPnP implements the UPnP specification: resource announcement
 Sven> +          and discovery, description, control, event notification, and
 Sven> +          presentation.
 Sven> +
 Sven> +          http://www.gupnp.org/
 Sven> diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
 Sven> new file mode 100755
 Sven> index 0000000..a9ba4dc
 Sven> --- /dev/null
 Sven> +++ b/package/gupnp/gupnp.mk
 Sven> @@ -0,0 +1,18 @@
 Sven> +#############################################################
 Sven> +#
 Sven> +# gupnp
 Sven> +#
 Sven> +#############################################################
 Sven> +
 Sven> +GUPNP_VERSION:=0.14.1
 Sven> +GUPNP_SOURCE:=gupnp-$(GUPNP_VERSION).tar.gz
 Sven> +GUPNP_SITE:=http://www.gupnp.org/sites/all/files/sources
 Sven> +GUPNP_INSTALL_STAGING = YES
 Sven> +GUPNP_INSTALL_TARGET = YES

Same comments as above.

 Sven> +
 Sven> +GUPNP_CONF_ENV = \
 Sven> +	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
 Sven> +
 Sven> +GUPNP_DEPENDENCIES = host-pkg-config host-libglib2 libxml2 gssdp util-linux
 Sven> +
 Sven> +$(eval $(call AUTOTARGETS,package,gupnp))
 Sven> -- 
 Sven> 1.7.4.1


-- 
Bye, Peter Korsgaard
