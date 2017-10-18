From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 18 Oct 2017 20:48:44 +0200
Subject: [Buildroot] [PATCH 1/1] boost: bump to 1.65.1
In-Reply-To: <20171017204407.27704-1-Adamduskett@outlook.com>
References: <20171017204407.27704-1-Adamduskett@outlook.com>
Message-ID: <1508352524.9366.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Tue, 2017-10-17 at 16:44 -0400, Adam Duskett wrote:
> Other changes:
> - The coroutine2 library has been removed.  As such it has been removed
>   from the boost.mk file, the boost Config.in file, and a new entry has
>   been added to Config.in.legacy explaining that it has been removed.
> 
> - Add LICENSE_1_0.txt sha256sum to boost.hash
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  Config.in.legacy         | 6 ++++++
>  package/boost/Config.in  | 4 ----
>  package/boost/boost.hash | 7 +++++--
>  package/boost/boost.mk   | 9 ++++-----
>  4 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 748876880c..9c2fe84def 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,12 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.11"
>  
> +config BR2_PACKAGE_BOOST_COROUTINE2
> +	bool "boost coroutine2 option removed"
> +	select BR2_LEGACY
> +	help
> +	  Boost 1.65.1 no longer offers the coroutine2 library.
> +
>  config BR2_PACKAGE_OPENOBEX_BLUEZ
>  	bool "openobex bluez option removed"
>  	select BR2_LEGACY
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 50d0ff8e01..3b3c89b8c1 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -73,10 +73,6 @@ config BR2_PACKAGE_BOOST_COROUTINE
>  	bool "boost-coroutine"
>  	depends on BR2_PACKAGE_BOOST_CONTEXT
>  
> -config BR2_PACKAGE_BOOST_COROUTINE2
> -	bool "boost-coroutine2"
> -	depends on BR2_PACKAGE_BOOST_CONTEXT
> -
>  config BR2_PACKAGE_BOOST_DATE_TIME
>  	bool "boost-date_time"
>  
> diff --git a/package/boost/boost.hash b/package/boost/boost.hash
> index 7494c0cb26..6e40c0d3b4 100644
> --- a/package/boost/boost.hash
> +++ b/package/boost/boost.hash
> @@ -1,2 +1,5 @@
> -# From http://www.boost.org/users/history/version_1_64_0.html
> -sha256 7bcc5caace97baa948931d712ea5f37038dbb1c5d89b43ad4def4ed7cb683332  boost_1_64_0.tar.bz2
> +# From http://www.boost.org/users/history/version_1_65_1.html
> +sha256 9807a5d16566c57fd74fb522764e0b134a8bbe6b6e8967b83afefd30dcd3be81  boost_1_65_1.tar.bz2
> +
> +# Locally computed
> +sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index e515faf1f9..8ba88a7b7c 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BOOST_VERSION = 1.64.0
> +BOOST_VERSION = 1.65.1
>  BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
>  BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
>  BOOST_INSTALL_STAGING = YES
> @@ -14,9 +14,9 @@ BOOST_LICENSE_FILES = LICENSE_1_0.txt
>  # keep host variant as minimal as possible
>  HOST_BOOST_FLAGS = --without-icu \
>  	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
> -	coroutine coroutine2 date_time exception filesystem graph \
> -	graph_parallel iostreams locale log math mpi program_options python \
> -	random regex serialization signals system test thread timer type_erasure \
> +	coroutine date_time exception filesystem graph graph_parallel iostreams \
> +	locale log math mpi program_options python random regex serialization \
> +	signals system test thread timer type_erasure \
>  	wave)
>  
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
> @@ -24,7 +24,6 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE2),,coroutine2)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)

Did you tried to build boost (especially the fiber module) with a musl-
toolchain? There is a build issue reported upstream [1]. However, it
turned out that the issue was not caused by boost, but by musl itself.
Meanwhile, the issue has been fixed in musl [2].

In my opinion it would be best to simple apply the workaround proposed
in [1] to allow building boost-fiber with musl.

[1] https://github.com/boostorg/fiber/pull/142
[2] https://git.musl-libc.org/cgit/musl/commit/?id=48be5b6313d7b827acf5
55769e93b389fa9f6307

Best regards,
J?rg Krause
