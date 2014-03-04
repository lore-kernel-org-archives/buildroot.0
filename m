From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 4 Mar 2014 15:14:43 +0100
Subject: [Buildroot] [PATCH v2 2/2] boost: make build with python an
	option
In-Reply-To: <1393941514.23823.15.camel@kuuclt18625l>
References: <1393941514.23823.15.camel@kuuclt18625l>
Message-ID: <CAHXCMMJ0qUcuFLN1bSQVUOTXxxo=PPYZHJ1gUeC=g9No01SQUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

On Tue, Mar 4, 2014 at 2:58 PM, Derycke, Johan <johan.derycke@barco.com> wrote:
> v2
> -Fixed indentations and blank lines
> -Removed package/Config.in
> -allow build with python3
>
> Signed-off-by: Johan Derycke <johan.derycke@barco.com>
> ---
>  package/boost/Config.in |    4 ++++
>  package/boost/boost.mk  |   13 +++++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 68c3909..a74c2d7 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -60,6 +60,10 @@ config BR2_PACKAGE_BOOST_MPI
>  config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>         bool "boost-program_options"
>
> +config BR2_PACKAGE_BOOST_PYTHON
> +       depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
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
>  # atomic library compile only with upstream version, wait for next
> release
>  # coroutine breaks on some weak toolchains and it's new for 1.54+
>  # log breaks with some toolchain combinations and it's new for 1.54+
> -BOOST_WITHOUT_FLAGS = atomic coroutine log python
> +BOOST_WITHOUT_FLAGS = atomic coroutine log
>
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
> @@ -40,6 +40,7 @@ BOOST_WITHOUT_FLAGS += $(if
> $(BR2_PACKAGE_BOOST_LOCALE),,locale)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
>  BOOST_WITHOUT_FLAGS += $(if
> $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
>  BOOST_WITHOUT_FLAGS += $(if
> $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
> @@ -50,6 +51,8 @@ BOOST_WITHOUT_FLAGS += $(if
> $(BR2_PACKAGE_BOOST_THREAD),,thread)
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

How do you make sure the right python interperter (python2 or python3)
will be chosen?
So far, that's right there is only one python interpreter in the host
tree (its version matching this of the interpreter in the target
tree), but this may change... ;-)

> +BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python

I doubt python3 installs its header in the same location as python2 does.

> $(PYTHON_VERSION_MAJOR)/
> +BOOST_DEPENDENCIES += python

You should also handle python/python3 dependency here.

> +endif
> +
>  HOST_BOOST_OPT += toolset=gcc threading=multi variant=release
> link=shared \
>         runtime-link=shared
>
> @@ -84,7 +93,7 @@ BOOST_FLAGS += $(if
> $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$
>
>  define BOOST_CONFIGURE_CMDS
>         (cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
> -       echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) :
> <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" >
> $(@D)/user-config.jam
> +       echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) :
> <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\"
> <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
>         echo "" >> $(@D)/user-config.jam
>  endef
>
> --
> 1.7.10.4
>
>
> This message is subject to the following terms and conditions: MAIL DISCLAIMER<http://www.barco.com/en/maildisclaimer>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards

-- 
Samuel
