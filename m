From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 23 Dec 2013 09:20:32 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 06/10] luarocks: new
	infrastructure
In-Reply-To: <20131222183153.4c2c90c8@skate>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-6-git-send-email-francois.perrad@gadz.org>
 <20131222183153.4c2c90c8@skate>
Message-ID: <CAB0FRsszw9RAY+SBdfU5HOA7rHtv8gvx0HBEip38=FgRAEfmsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/12/22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Fri, 15 Nov 2013 14:07:35 +0100, Francois Perrad wrote:
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  Config.in               |    8 ++++++
>>  Makefile                |    1 +
>>  package/Makefile.in     |    1 +
>>  package/pkg-luarocks.mk |   71 +++++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 81 insertions(+)
>>  create mode 100644 package/pkg-luarocks.mk
>>
>> diff --git a/Config.in b/Config.in
>> index d87e0f0..cb41c36 100644
>> --- a/Config.in
>> +++ b/Config.in
>> @@ -207,6 +207,14 @@ config BR2_DEBIAN_MIRROR
>>
>>  endif
>>
>> +config BR2_LUAROCKS_MIRROR
>> +     string "LuaRocks mirror"
>> +     default "http://luarocks.org/repositories/rocks"
>> +     help
>> +       LuaRocks repository.
>> +
>> +       See http://luarocks.org
>> +
>>  endmenu
>>
>>  config BR2_JLEVEL
>> diff --git a/Makefile b/Makefile
>> index c7a0a6d..0dde760 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -473,6 +473,7 @@ endif
>>  ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
>>       find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
>>  endif
>> +     rm -rf $(TARGET_DIR)/usr/lib/luarocks
>>       $(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
>>       if test -d $(TARGET_DIR)/lib/modules; then \
>>               find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index 612f3c7..f7fd8f9 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -363,4 +363,5 @@ include package/pkg-utils.mk
>>  include package/pkg-download.mk
>>  include package/pkg-autotools.mk
>>  include package/pkg-cmake.mk
>> +include package/pkg-luarocks.mk
>>  include package/pkg-generic.mk
>> diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
>> new file mode 100644
>> index 0000000..2a20413
>> --- /dev/null
>> +++ b/package/pkg-luarocks.mk
>> @@ -0,0 +1,71 @@
>> +################################################################################
>> +# LuaRocks package infrastructure
>> +# see http://luarocks.org/
>> +#
>> +# This file implements an infrastructure that eases development of
>> +# package .mk files for LuaRocks packages.
>> +# LuaRocks supports various build.type : builtin, make, cmake.
>> +# This luarocks infrastructure supports only the builtin mode,
>> +# the make & cmake modes could be directly handled by generic & cmake infrastructure.
>> +#
>> +# See the Buildroot documentation for details on the usage of this
>> +# infrastructure
>> +#
>> +# In terms of implementation, this LuaRocks infrastructure requires
>> +# the .mk file to only specify metadata informations about the
>> +# package: name, version, etc.
>> +#
>> +################################################################################
>> +
>> +LUAROCKS_RUN = $(HOST_DIR)/usr/bin/luarocks
>
> This variable could probably be provided by
> package/luarocks/luarocks.mk.
>
>> +
>> +################################################################################
>> +# inner-luarocks-package -- defines how the configuration, compilation and
>> +# installation of a LuaRocks package should be done, implements a few hooks to
>> +# tune the build process and calls the generic package infrastructure to
>> +# generate the necessary make targets
>> +#
>> +#  argument 1 is the lowercase package name
>> +#  argument 2 is the uppercase package name, including an HOST_ prefix
>> +#             for host packages
>> +#  argument 3 is the uppercase package name, without the HOST_ prefix
>> +#             for host packages
>> +#  argument 4 is the package directory prefix
>> +#  argument 5 is the type (target or host)
>> +################################################################################
>> +
>> +define inner-luarocks-package
>> +
>> +$(2)_BUILD_OPT                               ?=
>> +$(2)_SUBDIR                          ?= $(1)-$(shell echo "$($(3)_VERSION)" | sed -e "s/-[0-9]$$//")
>
> Can we avoid this subdir for all packages?

No, the `rock` format implies this structure with a subdirectory.
Note: the name of the subdirectory is not 'standardized' by LuaRocks,
so in some package, this value is overloaded.

Fran?ois

>
>> +$(2)_ROCKSPEC                                ?= $(1)-$($(3)_VERSION).rockspec
>> +$(2)_SOURCE                          ?= $(1)-$($(3)_VERSION).src.rock
>> +$(2)_SITE                            ?= $(call qstrip,$(BR2_LUAROCKS_MIRROR))
>> +
>> +#
>> +# Extract step
>> +#
>> +$(2)_EXTRACT_CMDS ?= \
>> +     cd $$($(2)_DIR)/.. && $(LUAROCKS_RUN) unpack $(DL_DIR)/$$($(2)_SOURCE)
>> +
>> +# $(2)_DEPENDENCIES are handled for configure step (too late)
>> +$(1)-extract: host-luarocks
>
> Ok, I see the problem. However I believe I'd still like to see
> host-luarocks added to $(2)_DEPENDENCIES so that the dependency graph
> is correct, and "make source" / "make external-deps" properly show
> luarocks.
>
>> +#
>> +# Build/install step.
>> +#
>> +$(2)_INSTALL_TARGET_CMDS ?= \
>> +     cd $$($(2)_SRCDIR) && $(LUAROCKS_RUN) build --minimal $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPT)
>
> Maybe the extract and install target steps could be written using a
> define ... endef block instead, for better readability?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
