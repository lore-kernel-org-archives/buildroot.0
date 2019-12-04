From: Heiko Thiery <Heiko.Thiery@kontron.com>
Date: Wed, 4 Dec 2019 13:23:14 +0000
Subject: [Buildroot] [PATCH 1/7] libyang: Optional C++ bindings
In-Reply-To: <f70195c8c44e4950257e1548b25083254362b266.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <f70195c8c44e4950257e1548b25083254362b266.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <a1c13f5fbde94306927af21515935249@kontron.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> -----Urspr?ngliche Nachricht-----
> Von: buildroot [mailto:buildroot-bounces at busybox.net] Im Auftrag von Jan
> Kundr?t
> Gesendet: Mittwoch, 4. Oktober 2017 07:49
> An: buildroot at buildroot.org
> Cc: Heiko Thiery; Fabrice Fontaine
> Betreff: [Buildroot] [PATCH 1/7] libyang: Optional C++ bindings
> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> ---
>  package/libyang/Config.in  | 10 ++++++++++  package/libyang/libyang.mk |  7
> +++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/libyang/Config.in b/package/libyang/Config.in index
> fec1160a6f..fc598af8e1 100644
> --- a/package/libyang/Config.in
> +++ b/package/libyang/Config.in
> @@ -10,5 +10,15 @@ config BR2_PACKAGE_LIBYANG
> 
>  	  https://github.com/CESNET/libyang
> 
> +if BR2_PACKAGE_LIBYANG
> +
> +config BR2_PACKAGE_LIBYANG_CPP
> +	bool "Enable libyang C++ bindings"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	help
> +	  Build the C++ wrapper around libyang.
> +
> +endif
> +
>  comment "libyang needs a toolchain w/ threads, dynamic library"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS diff
> --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk index
> cfec08cd16..87a1a4ef7c 100644
> --- a/package/libyang/libyang.mk
> +++ b/package/libyang/libyang.mk
> @@ -21,5 +21,12 @@ HOST_LIBYANG_CONF_OPTS = \
>  	-DENABLE_VALGRIND_TESTS=OFF \
>  	-DGEN_PYTHON_BINDINGS=OFF
> 
> +ifdef BR2_PACKAGE_LIBYANG_CPP
> +	LIBYANG_DEPENDENCIES += host-swig
> +	HOST_LIBYANG_DEPENDENCIES += host-swig
> +	LIBYANG_CONF_OPTS += -DGEN_LANGUAGE_BINDINGS=ON -DGEN_CPP_BINDINGS=ON -DGEN_PYTHON_BINDINGS=OFF -DGEN_JAVA_BINDINGS=OFF

GEN_PYTHON_BINDINGS=OFF is already set for target and host config above.  Should we disable JAVA bindings there also by default?

> +	HOST_LIBYANG_CONF_OPTS += -DGEN_LANGUAGE_BINDINGS=ON -DGEN_CPP_BINDINGS=ON -DGEN_PYTHON_BINDINGS=OFF -DGEN_JAVA_BINDINGS=OFF
> +endif
> +
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> --
> 2.21.0
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
