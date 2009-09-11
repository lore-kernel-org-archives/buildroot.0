From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 11 Sep 2009 12:34:38 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901CBED29@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
	<20090825190153.GA29206@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
	<87fxbemhjh.fsf@macbook.be.48ers.dk>
	<BD79186B4FD85F4B8E60E381CAEE190901C554E3@mi8nycmail19.Mi8.com>
	<20090827074957.GB19075@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C558CA@mi8nycmail19.Mi8.com>
	<20090830110318.GD7953@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901CBED29@mi8nycmail19.Mi8.com>
Message-ID: <20090911103438.GB29175@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 10, 2009 at 07:57:29PM -0400, H Hartley Sweeten wrote:

>I was able to get the compiler to work correctly at one point but still had
>problems with the linker.  I verified this by doing a clean "make V=1" and
>then examining all the output.  I would see the -march=armv4t in all the
>compile steps but it was missing in some of the link steps.  I think this 
>was happening due to the following in TARGET_CONFIGURE_OPTS:
>
>		AR="$(TARGET_AR)" \
>		AS="$(TARGET_AS)" \
>		LD="$(TARGET_LD)" \
>		NM="$(TARGET_NM)" \
>		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
>		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
>		CPP="$(TARGET_CPP) $(TARGET_CFLAGS)" \
>		CXX="$(TARGET_CXX) $(TARGET_CXXFLAGS)" \
>		FC="$(TARGET_FC) $(TARGET_FCFLAGS)" \
>
>If the package build used CC (or equiv.) for the link it would get the
>necessary flags.  But if it used LD, no flags.

So whatever buildroot you're using it's handling flags in an incomplete
way (this is nothing new; see archives).
My tree does:

AUTO_CONFIGURE_TARGET=\
        $(TARGET_CONFIGURE_OPTS) \
        $(TARGET_CONFIGURE_ARGS) \
        $(TARGET_CONFIGURE_ENV) \
        $(if $(THIS_SRCDIR),$(THIS_SRCDIR)/,./)configure \
        --cache-file="$(PROJECT_BUILD_DIR)/tgt-config.cache" \
        --target=$(REAL_GNU_TARGET_NAME) \
        --host=$(REAL_GNU_TARGET_NAME) \
        --build=$(GNU_HOST_NAME)

TARGET_CONFIGURE_OPTS=\
        PATH=$(TARGET_PATH) \
        AR="$(TARGET_AR)" \
        AS="$(TARGET_AS)" \
        LD="$(TARGET_LD)$(if $(TARGET_LD_FLAGS), $(TARGET_LD_FLAGS))" \
        NM="$(TARGET_NM)" \
        CC="$(TARGET_CC)$(if $(TARGET_CC_FLAGS), $(TARGET_CC_FLAGS))" \
        GCC="$(TARGET_CC)$(if $(TARGET_CC_FLAGS), $(TARGET_CC_FLAGS))" \
        CPP="$(TARGET_CPP)$(if $(TARGET_CC_FLAGS), $(TARGET_CC_FLAGS))"
\
        CXX="$(if $(BR2_GCC_CROSS_CXX),$(TARGET_CXX)$(if
$(TARGET_CXXFLAGS), $(TARGET_CXXFLAGS)))" \
        GCJ="$(if $(BR2_GCC_CROSS_GCJ),$(TARGET_GCJ)$(if
$(TARGET_GCJFLAGS), $(TARGET_GCJFLAGS)))" \
        FC="$(TARGET_FC)$(if $(TARGET_FC_FLAGS), $(TARGET_FC_FLAGS))" \
        RANLIB="$(TARGET_RANLIB)" \

>
>Then there are the packages that just use CROSS=$(TARGET_CROSS).  For
>those packages none of the flags are getting passed.
>
>Also, I'm not sure having the $(TARGET_CFLAGS) directly in CC, GCC, etc.

care must be taken which stuff you put into CC (see above).
I think that i resorted to only putting the bare necessities in it.
Again, my tree:

ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
TARGET_CFLAGS=
TARGET_LDFLAGS=
# flags that are inherent part of the tool
TARGET_CC_FLAGS=
TARGET_LD_FLAGS=

ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
TARGET_CC_FLAGS+= $(BR2_SYSROOT) $(BR2_ISYSROOT) -I=/usr/include
TARGET_LD_FLAGS+= $(BR2_SYSROOT)
else
# for old gcc's, as fallback
TARGET_CC_FLAGS+= -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
endif
ifeq ($(BR2_ENABLE_MULTILIB),y)
TARGET_LD_FLAGS+= -L$(STAGING_DIR)/lib64 -L$(STAGING_DIR)/usr/lib64
endif
TARGET_LD_FLAGS+= -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
TARGET_CFLAGS += $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)

ifeq ($(BR2_bfin),y)
CC_TARGET_CPU_SUB_:=$(strip $(subst ",,$(BR2_bfin_sirevision)))
#"))
CC_TARGET_CPU_SUB_:=$(if $(CC_TARGET_CPU_SUB_),-$(CC_TARGET_CPU_SUB_))
endif

##############################################################################
#disabled
ifneq (XXX,XXX)
# gcc configury --with-foo
CC_TARGET_CPU_:=$(strip $(subst ",,$(BR2_GCC_TARGET_CPU)))
#"))
CC_TARGET_TUNE_:=$(strip $(subst ",,$(BR2_GCC_TARGET_TUNE)))
#"))
CC_TARGET_ARCH_:=$(strip $(subst ",,$(BR2_GCC_TARGET_ARCH)))
#"))
CC_TARGET_ABI_:=$(strip $(subst ",,$(BR2_GCC_TARGET_ABI)))
#"))

# fixup for MOTOROLA
ifeq ($(BR2_m68k),y)
CC_TARGET_ARCH_:=$(filter-out cf m68k,$(CC_TARGET_ARCH_))
endif

ifneq ($(strip $(CC_TARGET_CPU_)),)
TARGET_CFLAGS+=-mcpu=$(CC_TARGET_CPU_)$(CC_TARGET_CPU_SUB_)
endif
ifneq ($(strip $(CC_TARGET_TUNE_)),)
TARGET_CFLAGS+=-mtune=$(CC_TARGET_TUNE_)
endif
ifneq ($(strip $(CC_TARGET_ARCH_)),)
TARGET_CFLAGS+=-march=$(CC_TARGET_ARCH_)
endif
ifneq ($(strip $(CC_TARGET_ABI_)),)
TARGET_CFLAGS+=-mabi=$(CC_TARGET_ABI_)
endif

endif


>is correct.  At one point I got an error during the ./configure for one
>of the packages due to a -V option passed to the compiler.  I think this
>had something to due with determining the version of the compiler.  It
>appears that the -V option must come at the start of the command line
>with gcc.  Of course this could also be a problem with the ./configure
>stuff.

gcc: '-V' must come at the start of the command line
so yes.

HTH,
