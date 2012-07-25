From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2012 01:02:06 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile.in: add CPPFLAGS support
In-Reply-To: <1343247287-14160-1-git-send-email-s.martin49@gmail.com>
References: <1343247287-14160-1-git-send-email-s.martin49@gmail.com>
Message-ID: <50107AEE.3050108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/25/12 22:14, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 6fad224..d12bf5e 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -85,18 +85,20 @@ ifeq ($(BR2_DEBUG_3),y)
>   TARGET_DEBUGGING=-g3
>   endif
>
> -TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> +TARGET_CPPFLAGS = -I$(STAGING_DIR)/usr/include

  This is redundant for the target, because cpp uses the sysroot as well.
(I checked this with an external toolchain and a buildroot toolchain.)

> -ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
> -TARGET_CFLAGS+=-fno-pic -mno-abicalls
> +ifeq ($(BR2_LARGEFILE),y)
> +TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>   endif
>
> -ifeq ($(BR2_LARGEFILE),y)
> -TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> +TARGET_CFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_CPPFLAGS)

  It shouldn't be needed to add the CPPFLAGS to the CFLAGS, since the build system will
normally combine the two for compilation.  However, it doesn't hurt to have them both,
so it's probably a good idea to duplicate it in CFLAGS so that build systems which
don't observe CPPFLAGS will not break down.

  Just one thing: I'd put the CPPFLAGS at the front of the list.

> +
> +ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
> +TARGET_CFLAGS += -fno-pic -mno-abicalls
>   endif
>
> -TARGET_CXXFLAGS=$(TARGET_CFLAGS)
> -TARGET_LDFLAGS=$(call qstrip,$(BR2_TARGET_LDFLAGS))
> +TARGET_CXXFLAGS  = $(TARGET_CFLAGS)
> +TARGET_LDFLAGS   = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>
>   ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
>   TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
> @@ -153,9 +155,10 @@ FLEX:=$(shell which flex || type -p flex)
>   BISON:=$(shell which bison || type -p bison)
>   SED:=$(shell which sed || type -p sed) -i -e
>
> +HOST_CPPFLAGS ?= -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include

  Actually the $(HOST_DIR)/include can be left out: it doesn't exist.
Also I don't see the point of using ?=.  If it is specified on the
command line, it will anyway override this definition, and we know
it is not specified in any other Makefile.


  Regards,
  Arnout


>   HOST_CFLAGS   ?= -O2
> -HOST_CFLAGS   += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
> -HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
> +HOST_CFLAGS   += $(HOST_CPPFLAGS)
> +HOST_CXXFLAGS += $(HOST_CFLAGS)
>   HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
>   HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
>
> @@ -184,12 +187,14 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
>   		CXX_FOR_BUILD="$(HOSTCXX)" \
>   		FC_FOR_BUILD="$(HOSTFC)" \
>   		LD_FOR_BUILD="$(HOSTLD)" \
> +		CPPFLAGS_FOR_BUILD="$(HOST_CPPFLAGS)" \
>   		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
>   		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
>   		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
>   		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
>   		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
>   		DEFAULT_LINKER="$(TARGET_LD)" \
> +		CPPFLAGS="$(TARGET_CPPFLAGS)" \
>   		CFLAGS="$(TARGET_CFLAGS)" \
>   		CXXFLAGS="$(TARGET_CXXFLAGS)" \
>   		LDFLAGS="$(TARGET_LDFLAGS)" \
> @@ -210,6 +215,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
>   		GCC="$(HOSTCC)" \
>   		CXX="$(HOSTCXX)" \
>   		CPP="$(HOSTCPP)" \
> +		CPPFLAGS="$(HOST_CPPFLAGS)" \
>   		CFLAGS="$(HOST_CFLAGS)" \
>   		CXXFLAGS="$(HOST_CXXFLAGS)" \
>   		LDFLAGS="$(HOST_LDFLAGS)" \

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
