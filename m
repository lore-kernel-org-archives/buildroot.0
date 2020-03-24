From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 24 Mar 2020 23:06:08 +0100
Subject: [Buildroot] [PATCH 8/8] package/mongodb: bump to version 4.2.4
In-Reply-To: <20200323104909.16765-8-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-8-yegorslists@googlemail.com>
Message-ID: <86ddbaf6-24c8-87aa-8e5a-dd7211af5127@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 23/03/2020 ? 11:49, yegorslists at googlemail.com a ?crit?:
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> - Drop !BR2_PACKAGE_PYTHON3 dependency as SConstruct requires
>   host-python3 since version 4.1.10 and:
>   https://github.com/mongodb/mongo/commit/8dd6d4755734ed37c1b98dfdefce3ca6bc65f1f6
> - host-python-psutil is needed since 4.1.8 and
>   https://github.com/mongodb/mongo/commit/ff03811e31851984617d73739de8acc7640b19a2
> - Drop unneeded host-python-typing dependency
> - C++17 and so gcc 7 is required since 4.1.8 and
>   https://github.com/mongodb/mongo/commit/01d84b2565fc9ea9626a55dcf1f3f817968088f2
> - Set --disable-minimum-compiler-version-enforcement as mongodb enforces
>   gcc >= 8.2 since verson 4.1.8 and
>   https://github.com/mongodb/mongo/commit/9ac90b128ebeb1bb431ebe3fe9176cb6142818cb
> - Explictly disable ssl if needed as ssl is enabled by default
> - Add host-python-cheetah dependency if needed
> - Manage new http-client option added in version 4.1.2 and
>   https://github.com/mongodb/mongo/commit/4d7dcca91bc2bbde65843fe88c41fa040e0d1877

This series superseed the previous one from Titouan:
http://patchwork.ozlabs.org/project/buildroot/list/?series=138894

Best regards,
Romain

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> [Titouan: Fix patch conflicts with master]
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/mongodb/Config.in    |  8 +++-----
>  package/mongodb/mongodb.hash |  2 +-
>  package/mongodb/mongodb.mk   | 27 ++++++++++++++++++---------
>  3 files changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
> index 9c5dba8347..493c592413 100644
> --- a/package/mongodb/Config.in
> +++ b/package/mongodb/Config.in
> @@ -8,12 +8,11 @@ config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
>  config BR2_PACKAGE_MONGODB
>  	bool "mongodb"
>  	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
> -	depends on !BR2_PACKAGE_PYTHON3
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # needs glibc malloc_usable_size
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
>  	select BR2_PACKAGE_BOOST_IOSTREAMS
> @@ -35,9 +34,8 @@ config BR2_PACKAGE_MONGODB
>  
>  	  https://www.mongodb.org/
>  
> -comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 6"
> +comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 7"
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
> -	depends on !BR2_PACKAGE_PYTHON3
> diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
> index f08ffffe3b..01793e02e9 100644
> --- a/package/mongodb/mongodb.hash
> +++ b/package/mongodb/mongodb.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256 b39c5b7bb77a547804ab6f43f9b5f09add47574356b31512fd1cc641a08b4ea5  mongodb-r4.0.12.tar.gz
> +sha256 033839fe43adb13351f9e0ef361d4731d7e917b2d7ad12f09df73e6e9c8bf6db  mongodb-r4.2.4.tar.gz
>  sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
>  sha256 09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
> diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
> index 22ca920e12..f7f8b4bd05 100644
> --- a/package/mongodb/mongodb.mk
> +++ b/package/mongodb/mongodb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MONGODB_VERSION_BASE = 4.0.12
> +MONGODB_VERSION_BASE = 4.2.4
>  MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
>  MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
>  
> @@ -13,9 +13,11 @@ MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
>  
>  MONGODB_DEPENDENCIES = \
>  	boost \
> -	host-python-cheetah \
> -	host-python-pyyaml \
> -	host-python-typing \
> +	host-python3-cheetah \
> +	host-python3-psutil \
> +	host-python3-pyyaml \
> +	host-python3-regex \
> +	host-python3-requests \
>  	host-scons \
>  	pcre \
>  	snappy \
> @@ -29,6 +31,7 @@ MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
>  	-j"$(PARALLEL_JOBS)"
>  
>  MONGODB_SCONS_OPTS = \
> +	--disable-minimum-compiler-version-enforcement \
>  	--disable-warnings-as-errors \
>  	--use-system-boost \
>  	--use-system-pcre \
> @@ -60,21 +63,27 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  MONGODB_DEPENDENCIES += libcurl
> -MONGODB_SCONS_OPTS += --enable-free-mon=on
> +MONGODB_SCONS_OPTS += \
> +	--enable-free-mon=on \
> +	--enable-http-client=on
>  else
> -MONGODB_SCONS_OPTS += --enable-free-mon=off
> +MONGODB_SCONS_OPTS += \
> +	--enable-free-mon=off \
> +	--enable-http-client=off
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  MONGODB_DEPENDENCIES += openssl
>  MONGODB_SCONS_OPTS += \
> -	--ssl \
> +	--ssl=on \
>  	--ssl-provider=openssl
> +else
> +MONGODB_SCONS_OPTS += --ssl=off
>  endif
>  
>  define MONGODB_BUILD_CMDS
>  	(cd $(@D); \
> -		$(HOST_DIR)/bin/python $(SCONS) \
> +		$(HOST_DIR)/bin/python3 $(SCONS) \
>  		$(MONGODB_SCONS_ENV) \
>  		$(MONGODB_SCONS_OPTS) \
>  		$(MONGODB_SCONS_TARGETS))
> @@ -82,7 +91,7 @@ endef
>  
>  define MONGODB_INSTALL_TARGET_CMDS
>  	(cd $(@D); \
> -		$(HOST_DIR)/bin/python $(SCONS) \
> +		$(HOST_DIR)/bin/python3 $(SCONS) \
>  		$(MONGODB_SCONS_ENV) \
>  		$(MONGODB_SCONS_OPTS) \
>  		--prefix=$(TARGET_DIR)/usr \
> 
