From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 4 Mar 2014 10:42:55 +0200
Subject: [Buildroot] [PATCH 2/2] boost: make build with python an option
In-Reply-To: <E1CF8EFE2042404B87DE2B6D662128020ED58B9D@KUUMEX10.barco.com>
References: <E1CF8EFE2042404B87DE2B6D662128020ED58B9D@KUUMEX10.barco.com>
Message-ID: <20140304084255.GZ3874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

On Tue, Mar 04, 2014 at 08:32:56AM +0000, Derycke, Johan wrote:
> Add an option to boost to build the Boost.Python library.
> http://www.boost.org/doc/libs/1_55_0/libs/python/doc/index.html
> 
> Signed-off-by: Johan Derycke <johan.derycke@barco.com>
> ---
>  package/Config.in       |    1 +
>  package/boost/Config.in |    4 ++++
>  package/boost/boost.mk  |   13 +++++++++++--
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 6edf18e..47e345a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -442,6 +442,7 @@ source "package/python-id3/Config.in"
>  source "package/python-ipy/Config.in"
>  source "package/python-json-schema-validator/Config.in"
>  source "package/python-keyring/Config.in"
> +source "package/python-libconfig/Config.in"

This hunk should move to the previous patch.

baruch

>  source "package/python-mad/Config.in"
>  source "package/python-meld3/Config.in"
>  source "package/python-msgpack/Config.in"
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 68c3909..a4fb745 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -60,6 +60,10 @@ config BR2_PACKAGE_BOOST_MPI
>  config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>         bool "boost-program_options"
> 
> +config BR2_PACKAGE_BOOST_PYTHON
> +       depends on BR2_PACKAGE_PYTHON
> +       bool "boost-python"
> +
>  config BR2_PACKAGE_BOOST_RANDOM
>         bool "boost-random"
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 7aab614..53d2b4d 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -26,7 +26,7 @@ HOST_BOOST_FLAGS = --without-icu \
>  # atomic library compile only with upstream version, wait for next release
>  # coroutine breaks on some weak toolchains and it's new for 1.54+
>  # log breaks with some toolchain combinations and it's new for 1.54+
> -BOOST_WITHOUT_FLAGS = atomic coroutine log python
> +BOOST_WITHOUT_FLAGS = atomic coroutine log
> 
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
> @@ -40,6 +40,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
> @@ -50,6 +51,8 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
> 
> +BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
>  ifeq ($(BR2_PACKAGE_ICU),y)
>  BOOST_FLAGS += --with-icu=$(STAGING_DIR)/usr
>  BOOST_DEPENDENCIES += icu
> @@ -61,6 +64,12 @@ ifeq ($(BR2_PACKAGE_BOOST_IOSTREAMS),y)
>  BOOST_DEPENDENCIES += bzip2 zlib
>  endif
> 
> +ifeq ($(BR2_PACKAGE_BOOST_PYTHON),y)
> +BOOST_FLAGS += --with-python-root=$(HOST_DIR)
> +BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/
> +BOOST_DEPENDENCIES += python
> +endif
> +
>  HOST_BOOST_OPT += toolset=gcc threading=multi variant=release link=shared \
>         runtime-link=shared
> 
> @@ -84,7 +93,7 @@ BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$
> 
>  define BOOST_CONFIGURE_CMDS
>         (cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
> -       echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) : <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
> +       echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) : <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
>         echo "" >> $(@D)/user-config.jam
>  endef
> 
> --
> 1.7.10.4

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
