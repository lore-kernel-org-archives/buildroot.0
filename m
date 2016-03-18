From: Benjamin Kamath <kamath.ben@gmail.com>
Date: Fri, 18 Mar 2016 12:29:20 -0700
Subject: [Buildroot] [PATCH 1/2] toolchain-external: add basic fortran
	support
In-Reply-To: <CAHXCMMJkuwLZKUujBtBPLrGAB38jyE00DDoyip9c3h12D+uj3w@mail.gmail.com>
References: <1458258022-20613-1-git-send-email-kamath.ben@gmail.com>
 <CAHXCMMJkuwLZKUujBtBPLrGAB38jyE00DDoyip9c3h12D+uj3w@mail.gmail.com>
Message-ID: <CAJsd3z+Y+UyGiuz1BpJvmDiSj7rB3M4G8qpfVehnBtqiWopY5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Samuel,

On Fri, Mar 18, 2016 at 12:10 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Benjamin,
>
> On Fri, Mar 18, 2016 at 12:40 AM, Benjamin Kamath <kamath.ben@gmail.com> wrote:
>> From: Benjamin Kamath <bkamath@spaceflight.com>
>>
>> Add the necessary support to allow an external toolchain
>> to supply a fortran compiler. This mostly amounts to a
>> toolchain configuration option that sets BR2_INSTALL_LIBFORTRAN,
>> and then various hooks to pass along flags, as well as
>> run-time libraries.
>>
>> Additionally, gfortran needs to be invoked through the
>> toolchain-wrapper, not just symlinked to $(TARGET_FC)gfortran.
>
> Great works!
>
> You may be interested in this work as well:
> https://github.com/tSed/buildroot/commits/sma/ext-toolchain-options
>
> more specifically:
> https://github.com/tSed/buildroot/commit/82b0c580ce934c969839ce5e5029700d9bbdaff6
> https://github.com/tSed/buildroot/commit/3a0ef3799a976fbb8fcaa272cd8c86e0a2eaa4cf
> https://github.com/tSed/buildroot/commit/41a79c37bf7720b5a557a6caf054874817166d65
> https://github.com/tSed/buildroot/commit/322fe0f571b163d23f0f1008703cbf1f3affe8fd
> https://github.com/tSed/buildroot/commit/3dd490a79cba8bffa8f5a05cb5ca44e98426aa46
> https://github.com/tSed/buildroot/commit/708d6849f24b3009e3260713018affad874bea5f
> https://github.com/tSed/buildroot/commit/44243d7aa174a78000fd26342538660de1019c60
> https://github.com/tSed/buildroot/commit/fcfb46274e9e9ec8ad2671ccadbe7b2bb433f2bd
> https://github.com/tSed/buildroot/commit/290a0326ac98298adc4c454c8f75cf9da58efe89
> https://github.com/tSed/buildroot/commit/b575a3fe025de1c8a679a3f6c72fcfa166a9cd07
>
> The above branch is still a WIP, but the fortran support should be
> here and working.
> (The WIP stuff being updating the external toolchain selection.)
>
Nice! I didn't find that before when I did a google search. Very
cool/useful external toolchain
feature tool!

> Compare to your series, from a first and quick glance, it seems you
> better handle fortran flags than I did.
>
> Few comments inlined (this is not a full in-deep review ;-])
>
>>
>> Signed-off-by: Benjamin Kamath <bkamath@spaceflight.com>
>> ---
>>  package/Makefile.in                                |  9 +++++++++
>>  package/gcc/gcc-final/gcc-final.mk                 |  4 ++--
>>  package/pkg-cmake.mk                               |  6 ++++++
>>  support/misc/toolchainfile.cmake.in                |  2 ++
>>  toolchain/helpers.mk                               | 13 +++++++++++++
>>  toolchain/toolchain-common.in                      |  3 +++
>>  toolchain/toolchain-external/Config.in             | 12 ++++++++++++
>>  toolchain/toolchain-external/toolchain-external.mk | 10 +++++++++-
>>  8 files changed, 56 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index dd595e2..125406f 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -138,6 +138,7 @@ endif
>>  TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>>  TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
>>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>> +TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
>>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>>
>>  ifeq ($(BR2_BINFMT_FLAT),y)
>> @@ -145,28 +146,35 @@ TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FL
>>         -Wl$(comma)-elf2flt)
>>  TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>>         -Wl$(comma)-elf2flt)
>> +TARGET_FCFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>> +       -Wl$(comma)-elf2flt)
>>  TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-elf2flt)
>>  endif
>>
>>  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
>>  TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
>>  TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
>> +TARGET_FCFLAGS += -mid-shared-library -mshared-library-id=0
>>  TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
>>  endif
>>  ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
>>  TARGET_LDFLAGS += -msep-data
>>  TARGET_CFLAGS += -msep-data
>> +TARGET_FCFLAGS += -msep-data
>>  TARGET_CXXFLAGS += -msep-data
>>  endif
>>
>>  ifeq ($(BR2_SSP_REGULAR),y)
>>  TARGET_CFLAGS += -fstack-protector
>> +TARGET_FCFLAGS += -fstack-protector
>>  TARGET_CXXFLAGS += -fstack-protector
>>  else ifeq ($(BR2_SSP_STRONG),y)
>>  TARGET_CFLAGS += -fstack-protector-strong
>> +TARGET_FCFLAGS += -fstack-protector-strong
>>  TARGET_CXXFLAGS += -fstack-protector-strong
>>  else ifeq ($(BR2_SSP_ALL),y)
>>  TARGET_CFLAGS += -fstack-protector-all
>> +TARGET_FCFLAGS += -fstack-protector-all
>>  TARGET_CXXFLAGS += -fstack-protector-all
>>  endif
>>
>> @@ -378,6 +386,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
>>  SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
>>  TARGET_CFLAGS += -static
>>  TARGET_CXXFLAGS += -static
>> +TARGET_FCFLAGS += -static
>>  TARGET_LDFLAGS += -static
>>  else ifeq ($(BR2_SHARED_LIBS),y)
>>  SHARED_STATIC_LIBS_OPTS = --disable-static --enable-shared
>> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
>> index 69fdc0c..87480c7 100644
>> --- a/package/gcc/gcc-final/gcc-final.mk
>> +++ b/package/gcc/gcc-final/gcc-final.mk
>> @@ -54,7 +54,7 @@ endef
>>  # Languages supported by the cross-compiler
>>  GCC_FINAL_CROSS_LANGUAGES-y = c
>>  GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
>> -GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
>> +GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBFORTRAN) += fortran
>>  GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
>>
>>  HOST_GCC_FINAL_CONF_OPTS = \
>> @@ -152,7 +152,7 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>>  HOST_GCC_FINAL_USR_LIBS += libstdc++
>>  endif
>>
>> -ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
>> +ifeq ($(BR2_INSTALL_LIBFORTRAN),y)
>>  HOST_GCC_FINAL_USR_LIBS += libgfortran
>>  endif
>>
>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
>> index 81dcfcc..a93709e 100644
>> --- a/package/pkg-cmake.mk
>> +++ b/package/pkg-cmake.mk
>> @@ -31,6 +31,8 @@ CMAKE_HOST_C_COMPILER = $(HOSTCC)
>>  CMAKE_HOST_CXX_COMPILER = $(HOSTCXX)
>>  endif
>>
>> +CMAKE_HOST_Fortran_COMPILER ?= $(HOSTFC)
>> +
>
> Is this needed? What for?
> AFAICS, there is no host-package requiring HOSTFC...

Good point, this can be added when something requires it, removed.

>
>>  ifneq ($(QUIET),)
>>  CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
>>  endif
>> @@ -119,10 +121,12 @@ define $(2)_CONFIGURE_CMDS
>>                 -DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
>>                 -DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
>>                 -DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
>> +               -DCMAKE_FC_FLAGS="$$(HOST_FCFLAGS)" \
>
> Why setting CMAKE_FC_FLAGS instead of CMAKE_Fortran_FLAGS?

Good catch, fixed.

>
>>                 -DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
>>                 -DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
>>                 -DCMAKE_C_COMPILER="$$(CMAKE_HOST_C_COMPILER)" \
>>                 -DCMAKE_CXX_COMPILER="$$(CMAKE_HOST_CXX_COMPILER)" \
>> +               -DCMAKE_Fortran_COMPILER="$$(CMAKE_HOST_Fortran_COMPILER)" \
>>                 $(if $$(CMAKE_HOST_C_COMPILER_ARG1),\
>>                         -DCMAKE_C_COMPILER_ARG1="$$(CMAKE_HOST_C_COMPILER_ARG1)" \
>>                         -DCMAKE_CXX_COMPILER_ARG1="$$(CMAKE_HOST_CXX_COMPILER_ARG1)" \
>> @@ -243,9 +247,11 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>>                 -e 's#@@STAGING_SUBDIR@@#$(call qstrip,$(STAGING_SUBDIR))#' \
>>                 -e 's#@@TARGET_CFLAGS@@#$(call qstrip,$(TARGET_CFLAGS))#' \
>>                 -e 's#@@TARGET_CXXFLAGS@@#$(call qstrip,$(TARGET_CXXFLAGS))#' \
>> +               -e 's:@@TARGET_FCFLAGS@@:$(call qstrip,$(TARGET_FCFLAGS)):' \
>>                 -e 's#@@TARGET_LDFLAGS@@#$(call qstrip,$(TARGET_LDFLAGS))#' \
>>                 -e 's#@@TARGET_CC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC)))#' \
>>                 -e 's#@@TARGET_CXX@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX)))#' \
>> +               -e 's:@@TARGET_FC@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_FC))):' \
>>                 -e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
>>                 $(TOPDIR)/support/misc/toolchainfile.cmake.in \
>>                 > $@
>> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
>> index 5cf381e..4112604 100644
>> --- a/support/misc/toolchainfile.cmake.in
>> +++ b/support/misc/toolchainfile.cmake.in
>> @@ -15,6 +15,7 @@ set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
>>
>>  set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
>>  set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
>> +set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@ ${CMAKE_Fortran_FLAGS}" CACHE STRING "Buildroot FCFLAGS")
>>  set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
>>  set(CMAKE_INSTALL_SO_NO_EXE 0)
>>
>> @@ -29,3 +30,4 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
>>  # This toolchain file can be used both inside and outside Buildroot.
>>  set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
>>  set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
>> +set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
>
> This will set (force to set) the fortran compile path in all
> configuration, even in those that do not have it... :-/

Fixed by passing in the fortran support via sed and conditionally
setting based on that.
That said I'm new to CMake so other suggestions are welcome.
>
>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> index ee878e8..196f295 100644
>> --- a/toolchain/helpers.mk
>> +++ b/toolchain/helpers.mk
>> @@ -382,6 +382,19 @@ check_cplusplus = \
>>         fi
>>
>>  #
>> +# Check that the external toolchain supports Fortran
>> +#
>> +# $1: cross-gfortran path
>> +#
>> +check_fortran = \
>> +       __CROSS_FC=$(strip $1) ; \
>> +       $${__CROSS_FC} -v > /dev/null 2>&1 ; \
>> +       if test $$? -ne 0 ; then \
>> +               echo "Fortran support is selected but is not available in external toolchain" ; \
>> +               exit 1 ; \
>> +       fi
>> +
>> +#
>>  # Check that the cross-compiler given in the configuration exists
>>  #
>>  # $1: cross-gcc path
>> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
>> index 46970a6..1d7afa7 100644
>> --- a/toolchain/toolchain-common.in
>> +++ b/toolchain/toolchain-common.in
>> @@ -17,6 +17,9 @@ config BR2_ENABLE_LOCALE
>>  config BR2_INSTALL_LIBSTDCPP
>>         bool
>>
>> +config BR2_INSTALL_LIBFORTRAN
>> +       bool
>> +
>>  config BR2_TOOLCHAIN_HAS_THREADS
>>         bool
>>
>> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
>> index ff759a0..64027ff 100644
>> --- a/toolchain/toolchain-external/Config.in
>> +++ b/toolchain/toolchain-external/Config.in
>> @@ -24,6 +24,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
>>         select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>>         select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>>         select BR2_INSTALL_LIBSTDCPP
>> +       select BR2_INSTALL_LIBFORTRAN
>>         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
>>         select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>>         help
>> @@ -46,6 +47,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
>>         select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>>         select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>>         select BR2_INSTALL_LIBSTDCPP
>> +       select BR2_INSTALL_LIBFORTRAN
>>         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
>>         select BR2_TOOLCHAIN_GCC_AT_LEAST_5
>>         help
>> @@ -68,6 +70,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
>>         select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>>         select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>>         select BR2_INSTALL_LIBSTDCPP
>> +       select BR2_INSTALL_LIBFORTRAN
>>         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
>>         select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>>         help
>> @@ -90,6 +93,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
>>         select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>>         select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>>         select BR2_INSTALL_LIBSTDCPP
>> +       select BR2_INSTALL_LIBFORTRAN
>>         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
>>         select BR2_TOOLCHAIN_GCC_AT_LEAST_5
>>         help
>> @@ -1047,6 +1051,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
>>           support. If you don't know, leave the default value,
>>           Buildroot will tell you if it's correct or not.
>>
>> +config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
>> +       bool "Toolchain has Fortran support?"
>> +       select BR2_INSTALL_LIBFORTRAN
>> +       help
>> +         Select this option if your external toolchain has Fortran
>> +         support. If you don't know, leave the default value,
>> +         Buildroot will tell you if it's correct or not.
>> +
>>  config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
>>         string "Extra toolchain libraries to be copied to target"
>>         help
>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>> index 37e1a2e..070d0cf 100644
>> --- a/toolchain/toolchain-external/toolchain-external.mk
>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>> @@ -90,6 +90,10 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>>  USR_LIB_EXTERNAL_LIBS += libstdc++.so.*
>>  endif
>>
>> +ifeq ($(BR2_INSTALL_LIBFORTRAN),y)
>> +USR_LIB_EXTERNAL_LIBS += libgfortran.so.*
>> +endif
>> +
>>  LIB_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
>>
>>  # Details about sysroot directory selection.
>> @@ -160,6 +164,7 @@ TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
>>  TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
>>  TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
>>  TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
>> +TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
>>  TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf$(TOOLCHAIN_EXTERNAL_SUFFIX)
>>
>>  ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
>> @@ -495,6 +500,9 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
>>         if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
>>                 $(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
>>         fi ; \
>> +       if test "$(BR2_INSTALL_LIBFORTRAN)" = "y" ; then \
>> +               $(call check_fortran,$(TOOLCHAIN_EXTERNAL_FC)) ; \
>> +       fi ; \
>>         if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
>>                 $(call check_uclibc,$${SYSROOT_DIR}) ; \
>>         elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
>> @@ -719,7 +727,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>>                 *-ar|*-ranlib|*-nm) \
>>                         ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
>>                         ;; \
>> -               *cc|*cc-*|*++|*++-*|*cpp) \
>> +               *cc|*cc-*|*++|*++-*|*cpp|*fortran) \
>>                         ln -sf toolchain-wrapper $$base; \
>>                         ;; \
>>                 *gdb|*gdbtui) \
>> --
>> 2.5.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
>
> --
> Samuel

Fixed and uploading another patch set. Separated out changes to the gcc
package (more buildroot toolchain related). Very interested in your branch,
in terms of LTO support and the external toolchain helper script!

Cheers,
Ben
