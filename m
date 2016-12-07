From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 7 Dec 2016 10:59:09 +0100
Subject: [Buildroot] [PATCH] package/reactcpp: new package
In-Reply-To: <20161206163136.23d44f9f@free-electrons.com>
References: <20161206132643.27141-1-m.niestroj@grinn-global.com>
 <20161206163136.23d44f9f@free-electrons.com>
Message-ID: <74b2df33-0865-c6b6-d731-f0e9191223b9@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for fast review!

On 06.12.2016 16:31, Thomas Petazzoni wrote:
> Hello,
>
> Thanks for this contribution! See some comments below.
>
> On Tue,  6 Dec 2016 14:26:43 +0100, Marcin Niestroj wrote:
>
>> diff --git a/package/reactcpp/0001-Makefile-Cleanup-compiler-and-linker-flags.patch b/package/reactcpp/0001-Makefile-Cleanup-compiler-and-linker-flags.patch
>> new file mode 100644
>> index 0000000..a0b065a
>> --- /dev/null
>> +++ b/package/reactcpp/0001-Makefile-Cleanup-compiler-and-linker-flags.patch
>> @@ -0,0 +1,82 @@
>> +From 583b934dbd712e661e7c4eb994174bf71d88690c Mon Sep 17 00:00:00 2001
>> +From: Marcin Niestroj <m.niestroj@grinn-global.com>
>> +Date: Tue, 15 Nov 2016 14:51:47 +0100
>> +Subject: [PATCH] Makefile: Cleanup compiler and linker flags
>> +
>> +Cleanup compiler and linker flags, so the library can be easily
>> +cross-compiled by overwriting CPPFLAGS, CXXFLAGS and LDFLAGS:
>> +
>> +* Rename CPP into CXX, as we use this command for compiling, not
>> +  preprocessing.
>> +* Remove separate LD usage, use CXX instead. This is to still launch
>> +  compiler command when user overrides CXX and LD commands.
>> +* Define MY_CXXFLAGS and MY_LDFLAGS, which should always take place and
>> +  not get overridden by user.
>> +* Define AR command, which can be overidden by user.
>> +---
>> + src/Makefile | 26 +++++++++++++-------------
>> + 1 file changed, 13 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/src/Makefile b/src/Makefile
>> +index 54e938a..5fb9763 100644
>> +--- a/src/Makefile
>> ++++ b/src/Makefile
>> +@@ -1,8 +1,8 @@
>> +-CPP		= g++
>> ++AR		= ar
>> ++CXX		= g++
>> + RM		= rm -f
>> +-CPPFLAGS	= -Wall -MMD -c -I. -std=c++11
>> +-LD		= g++
>> +-LD_FLAGS	= -Wall -shared
>> ++MY_CXXFLAGS	= -Wall -MMD -c -I. -std=c++11
>> ++MY_LDFLAGS	= -Wall -shared
>
> You can also do:
>
> override CXXFLAGS += ...
> override LDFLAGS += ...

Thanks for pointing it. Didn't know that :)

>
>> diff --git a/package/reactcpp/Config.in b/package/reactcpp/Config.in
>> new file mode 100644
>> index 0000000..f6989e5
>> --- /dev/null
>> +++ b/package/reactcpp/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_REACTCPP
>> +	bool "reactcpp"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>
> You have two dependencies here.
>
>> +	select BR2_PACKAGE_C_ARES
>> +	select BR2_PACKAGE_LIBEV
>> +	help
>> +	  REACT-CPP is an event loop library that utilizes the new
>> +	  C++11 lambda functions to notify you when there is activity
>> +	  on a filedescriptor or on a timer. Internally, it is a wrapper
>> +	  around the libev library, and does therefore also depend on
>> +	  that library.
>> +
>> +	  https://github.com/CopernicaMarketingSoftware/REACT-CPP
>
> So you need a Config.in comment here about those dependencies. Check
> other packages and the Buildroot manual for details.
>
>> diff --git a/package/reactcpp/reactcpp.hash b/package/reactcpp/reactcpp.hash
>> new file mode 100644
>> index 0000000..c30dab6
>> --- /dev/null
>> +++ b/package/reactcpp/reactcpp.hash
>> @@ -0,0 +1,2 @@
>> +# Locally calculated
>> +sha256 4af5d6a535ff7d8835d05db3490f2b62d6d791a4968ab45f479023868d7acdc8  reactcpp-v1.0.3.tar.gz
>> diff --git a/package/reactcpp/reactcpp.mk b/package/reactcpp/reactcpp.mk
>> new file mode 100644
>> index 0000000..e198c3d
>> --- /dev/null
>> +++ b/package/reactcpp/reactcpp.mk
>> @@ -0,0 +1,34 @@
>> +################################################################################
>> +#
>> +# reactcpp
>> +#
>> +################################################################################
>> +
>> +REACTCPP_VERSION_MAJOR = 1.0
>> +REACTCPP_VERSION_RAW = $(REACTCPP_VERSION_MAJOR).3
>> +REACTCPP_VERSION = v$(REACTCPP_VERSION_RAW)
>
> Just define the version as v$(REACTCPP_VERSION_MAJOR).3

I am using $(REACTCPP_VERSION_RAW) below to define $(REACTCPP_SO).

>
>> +REACTCPP_SITE = $(call github,CopernicaMarketingSoftware,REACT-CPP,$(REACTCPP_VERSION))
>> +REACTCPP_LICENSE = Apache-2.0
>> +REACTCPP_LICENSE_FILES = LICENSE
>> +REACTCPP_DEPENDENCIES = c-ares libev
>> +REACTCPP_INSTALL_STAGING = YES
>> +
>> +define REACTCPP_BUILD_CMDS
>> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>
> Please pass $(TARGET_MAKE_ENV) in the environment.
>
>> +endef
>> +
>> +define REACTCPP_INSTALL_STAGING_CMDS
>> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
>
> Ditto.
>
>> +endef
>> +
>> +REACTCPP_SO = libreactcpp.so.$(REACTCPP_VERSION_RAW)
>> +
>> +ifeq ($(BR2_STATIC_LIBS),)
>> +define REACTCPP_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/src/$(REACTCPP_SO) $(TARGET_DIR)/usr/lib/$(REACTCPP_SO)
>> +	ln -sf $(REACTCPP_SO) $(TARGET_DIR)/usr/lib/libreactcpp.so.$(REACTCPP_VERSION_MAJOR)
>> +	ln -sf $(REACTCPP_SO) $(TARGET_DIR)/usr/lib/libreactcpp.so
>> +endef
>> +endif
>
> Why are you doing this instead of calling "make install" for
> $(TARGET_DIR) ?

Because make install also copies header files and static library.

>
> Thanks,
>
> Thomas
>

-- 
Marcin Niestroj
