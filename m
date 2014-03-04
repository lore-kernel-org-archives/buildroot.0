From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:02:32 +0100
Subject: [Buildroot] [PATCH v3 2/2] boost: make build with python an
 option
In-Reply-To: <1393952027-21201-2-git-send-email-johan.derycke@barco.com>
References: <1393952027-21201-1-git-send-email-johan.derycke@barco.com>
 <1393952027-21201-2-git-send-email-johan.derycke@barco.com>
Message-ID: <20140304190232.4a927d29@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Derycke,

Thanks a lot for your persistence with those patches, really
appreciated!

On Tue,  4 Mar 2014 17:53:47 +0100, Johan Derycke wrote:

> +config BR2_PACKAGE_BOOST_PYTHON
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	bool "boost-python"

Ok, so this means that boost::python is compatible with Python 3, which
seems to match various claims I've seen on the web.

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

Ok.

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

Depending on what Boost needs exactly, this might be correct or not. It
is correct to find a Python interpreter that runs on the build machine.
But Boost uses that to ask the Python interpreter various details about
the Python installation (such as the location of Python modules, the
cross-compiler to use, etc.), then it will be wrong. I guess I'll have
to have a look.

> +BOOST_TARGET_CXXFLAGS 
> += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/
> +BOOST_DEPENDENCIES += python

This isn't going to work with Python 3. It should be:

ifeq ($(BR2_PACKAGE_PYTHON3),y)
BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
BOOST_DEPENDENCIES += python3
else
BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
BOOST_DEPENDENCIES += python
endif

> +endif
> +
>  HOST_BOOST_OPT += toolset=gcc threading=multi variant=release link=shared 
> \
>  	runtime-link=shared
> 
> @@ -84,7 +93,7 @@ BOOST_FLAGS += $(if 
> $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$
> 
>  define BOOST_CONFIGURE_CMDS
>  	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
> -	echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) : 
> <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > 
> $(@D)/user-config.jam
> +	echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) : 
> <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" 
>  > $(@D)/user-config.jam
>  	echo "" >> $(@D)/user-config.jam
>  endef
> 

Ok.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
