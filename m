From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 9 Oct 2015 13:51:02 +0100
Subject: [Buildroot] [PATCH 2/2] rrdtool: bump to version 1.5.4
In-Reply-To: <1444330860-31735-2-git-send-email-gustavo@zacarias.com.ar>
References: <1444330860-31735-1-git-send-email-gustavo@zacarias.com.ar>
 <1444330860-31735-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5617B836.7000102@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/08/2015 08:01 PM, Gustavo Zacarias wrote:
> Drop patches, they're no longer relevant.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

[snip]

> diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
> index 33fa677..b07c446 100644
> --- a/package/rrdtool/Config.in
> +++ b/package/rrdtool/Config.in
> @@ -1,15 +1,37 @@
>  config BR2_PACKAGE_RRDTOOL
>  	bool "rrdtool"
> -	depends on BR2_USE_WCHAR
> -	select BR2_PACKAGE_FREETYPE
> -	select BR2_PACKAGE_LIBART
> -	select BR2_PACKAGE_LIBPNG
> -	select BR2_PACKAGE_ZLIB
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	select BR2_PACKAGE_LIBGLIB2

You are doing more things here than just bumping a version and removing
some patches (which is what your commit log says). I'm not saying this
is wrong. What I mean is that it would be good writing some explanation
in the commit log about why are you removing those selects and add libglib2.

>  	help
>  	  RRDtool is the OpenSource industry standard, high performance
>  	  data logging and graphing system for time series data.
>  
>  	  http://oss.oetiker.ch/rrdtool/
>  
> -comment "rrdtool needs a toolchain w/ wchar"
> -	depends on !BR2_USE_WCHAR
> +if BR2_PACKAGE_RRDTOOL
> +
> +config BR2_PACKAGE_RRDTOOL_RRDGRAPH
> +	bool "rrd_graph"
> +	default y
> +	depends on BR2_ARCH_HAS_ATOMICS # cairo
> +	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PDF
> +	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_CAIRO_PS
> +	select BR2_PACKAGE_CAIRO_SVG
> +	select BR2_PACKAGE_PANGO
> +	help
> +	  This enables the graphing capabilities ('rrdgraph').
> +	  Without this it will only act as a database backend.
> +
> +comment "rrd_graph support needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
> +endif
> +
> +comment "rrdtool needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

And here you are adding more functionality to this package, which I
think it would be good as well to explain it in the commit log. In fact,
this is something I think that should be done in a separate patch.
"rrdtools: add rrdgraph support", for instance.

> diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
> index 20af75a..55a7f5b 100644
> --- a/package/rrdtool/rrdtool.hash
> +++ b/package/rrdtool/rrdtool.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256	3190efea410a6dd035799717948b2df09910f608d72d23ee81adad4cd0184ae9	rrdtool-1.2.30.tar.gz
> +sha256	3feea3da87c02128a27083f1c7b2cb797ef673e946564c0ce008c1c25a5c3f99	rrdtool-1.5.4.tar.gz
> diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
> index e422694..f90b137 100644
> --- a/package/rrdtool/rrdtool.mk
> +++ b/package/rrdtool/rrdtool.mk
> @@ -4,31 +4,33 @@
>  #
>  ################################################################################
>  
> -RRDTOOL_VERSION = 1.2.30
> +RRDTOOL_VERSION = 1.5.4
>  RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
>  RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
> -RRDTOOL_LICENSE_FILES = COPYING COPYRIGHT
> -
> -RRDTOOL_DEPENDENCIES = host-pkgconf freetype libart libpng zlib
> -RRDTOOL_AUTORECONF = YES
> +RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
> +RRDTOOL_DEPENDENCIES = host-pkgconf libglib2
>  RRDTOOL_INSTALL_STAGING = YES
> -RRDTOOL_CONF_ENV = \
> -	rd_cv_ieee_works=yes \
> -	rd_cv_null_realloc=nope \
> -	ac_cv_func_mmap_fixed_mapped=yes
>  RRDTOOL_CONF_OPTS = \
> +	--disable-examples \
> +	--disable-libdbi \
> +	--disable-librados \
> +	--disable-libwrap \
> +	--disable-lua \

A comment in the commit log saying that you add some disables (and why,
if there is a reason other than the default BR policy) would be great.

>  	--disable-perl \
>  	--disable-python \
>  	--disable-ruby \
> -	--disable-tcl \
> -	--program-transform-name='' \
> -	$(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthread)
> -RRDTOOL_MAKE = $(MAKE1)
> +	--disable-tcl

Again, no explanation in the commit log about why are you doing this.

> -define RRDTOOL_REMOVE_EXAMPLES
> -	rm -rf $(TARGET_DIR)/usr/share/rrdtool/examples
> -endef

Again, no explanation in the commit log about why are you doing this.

> +ifeq ($(BR2_PACKAGE_RRDTOOL_RRDGRAPH),y)
> +RRDTOOL_DEPENDENCIES += cairo pango
> +else
> +RRDTOOL_CONF_OPTS += --disable-rrd_graph
> +endif

According to one of my comments above, this should be in a separate
patch. But, hey, that's only my opinion :-)

> -RRDTOOL_POST_INSTALL_TARGET_HOOKS += RRDTOOL_REMOVE_EXAMPLES

Indeed since you remove the define. The problem is, why? ^^

> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +RRDTOOL_DEPENDENCIES += libxml2
> +else
> +RRDTOOL_CONF_OPTS += --disable-rrd_restore
> +endif

So you disable lots of things by default, but for libxml2 you add this?
Why? No explanation about that in the commit log.

Regards,

Vincent.

>  $(eval $(autotools-package))
> 
