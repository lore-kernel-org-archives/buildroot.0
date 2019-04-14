From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 23:25:14 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: Fix paths in
 libstdc++ gdb python file
In-Reply-To: <20190401204813.31424-1-tpiepho@impinj.com>
References: <20190401204813.31424-1-tpiepho@impinj.com>
Message-ID: <088c75b8-1b45-5696-8c45-601716a74a11@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/04/2019 22:48, Trent Piepho wrote:
> In the ARM ARM 2018.11 toolchain, the python file
> libstdc++.so.6.0.25-gdb.py contains two paths:
> pythondir = '/share/gcc-8.2.1/python'
> libdir = '/arm-linux-gnueabihf/lib'
> 
> The latter is the location of the file in the toolchain and the former
> the location of a python module to be used by gdb.  The python code in
> the file subtracts libdir from the end of the current
> libstdc++.so.6.0.25-gdb.py location and appends pythondir, to find the
> current path to the python module.

 Note that this (AFAICS) works correctly both for the ARM 2018.11 case and all
the other cases (which have a full absolute path to the original installation
directory), as long as the files remain in their original location.

 The only exception I could find is the ARC toolchain, which puts libstdc++ in
arceb-snps-linux-uclibc/sysroot/usr/lib but the .py file thinks it is installed
in arceb-snps-linux-uclibc/lib. This will cause it (I guess, I haven't tested)
to generate the wrong number of ..s.

> Buildroot installs this file into the stage, at which point the paths
> above are no longer correct.

 This is really the problem.


> In the Linaro ARM 2018.05 toolchain, these paths absolute paths on the
> toolchain's build host and not even current before buildroot moves the
> py file.

 That doesn't matter, because the common part is eliminated by the script.

 The issue really is twofold:

1. Buildroot moves the libstdc++.so.*-gdb.py file, but not the extra pythondir.
So the pythondir is not in $(STAGING_DIR).

2. Buildroot puts libstdc++.so in /usr/lib, while the toolchain usually has it
in <tuple>/lib (with the exception of that ARC toolchain that anyway doesn't work).

 Actually, many toolchains have two identical copies of the file: one in
<tuple>/lib and the other in <tuple>/sysroot/usr/lib (or <tuple>/libc/usr/lib).
In these cases, the one in <tuple>/libc/usr/lib doesn't work either. And I
believe (but I haven't tested) that the situation is the same for a
Buildroot-generated toolchain: two copies, we use the one in
<tuple>/sysroot/usr/lib (because <tuple>/sysroot is $(STAGING_DIR)), and the
path is wrong. So it's not even just an external toolchain issue.

 Why does this happen? Because we (and apparently other toolchain providers as
well) *copy* this stuff from the place where gcc installs it (host/<tuple>/lib)
to staging: host/<tuple>/sysroot/usr/lib.


 Bottom line: we clearly need a generic solution for this, that works across
internal and external toolchains, and doesn't require us to explicitly specify
the python dir and the -gdb.py file.

 The -gdb.py file is easy to find: it's /lib/libstdc++*-gdb.py or
/usr/lib/libstdc++-*gdb.py.

 The python dir is a little more tricky. We can try to derive it from the
existing values in -gdb.py, but I think that can get complicated. An easier way,
I think, is to just do

find $(TOOLCHAIN_BASE_DIR) -path '*/python/libstdcxx'

 TOOLCHAIN_BASE_DIR is $(HOST_DIR)/$(GNU_TARGET_NAME) for the internal toolchain
and $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR) for the external toolchain. So I
think it is best to make a macro with TOOLCHAIN_BASE_DIR as argument that does
the fixup, and call it with the right argument from a post-install hook of
toolchain-internal and toolchain-external.

 Trent, do you feel up to that?


> 
> This patch uses sed to fixup the paths to reflect the installed
> location, relative to HOST_DIR, and the location of the python module
> relative to HOST_DIR.
> 
> External toolchains can have this fixup invoked by setting
> $(PKG)_LIBSTDCPP_GDB_PY and $(PKG)_PYTHON_DIR.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---

 BTW, please provide a patch changelog below the --- line, here.

>  toolchain/toolchain-external/pkg-toolchain-external.mk        | 11 +++++++++++
>  .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk  |  4 ++++
>  .../toolchain-external-linaro-arm.mk                          |  4 ++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index db3570d96f..e900507ddc 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -486,6 +486,16 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
>  	fi
>  endef
>  
> +define TOOLCHAIN_EXTERNAL_FIXUP_LIBSTDCPP_PYTHON
> +	$(Q)if [ -n "$($(PKG)_LIBSTDCPP_GDB_PY)" ]; then \
> +		echo Fixing paths in $($(PKG)_LIBSTDCPP_GDB_PY); \

 Use the MESSAGE function instead.

> +		sed -Ei \

 We normally use $(SED), which already includes the -i and -e. We normally don't
use -E unless there's a good reason for it.

> +			-e "s:^(pythondir = ').*':\1$(patsubst $(HOST_DIR)/%,/%,$(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR))$($(PKG)_PYTHON_DIR)':" \

 There is no need for the exact substitution, you can just make it:

	"s:^pythondir = .*:pythondir = '$${PYTHON_DIR}':"

 Note that I would also have preferred , instead of : as a delimiter, since
that's what we currently use the most in Buildroot:

$ git grep -h '\(SED\|sed\|-e\).*\bs[@!|,#+%^:]' -- \*.mk | grep -o
'\bs[@!|,#+%^:]' | sort | uniq -c
     23 s#
     56 s%
     60 s,
     50 s:
      2 s@
      3 s^
     11 s|

 However, the rest of the file is using : so it's better to stay consistent. Hm,
actually, in toolchain/helpers.mk, the comma is already used, and the macro is
going to move to that file, so let's make it a comma!


 Regards,
 Arnout

> +			-e "s:^(libdir = ').*':\1$(patsubst $(HOST_DIR)/%,/%,$(STAGING_DIR)/usr/lib)':" \
> +			$(STAGING_DIR)/usr/lib/$($(PKG)_LIBSTDCPP_GDB_PY); \
> +	fi
> +endef
> +
>  
>  ################################################################################
>  # inner-toolchain-external-package -- defines the generic installation rules
> @@ -562,6 +572,7 @@ define $(2)_INSTALL_STAGING_CMDS
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
>  	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
> +	$$(TOOLCHAIN_EXTERNAL_FIXUP_LIBSTDCPP_PYTHON)
>  endef
>  
>  # Even though we're installing things in both the staging, the host
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> index 0c21affd7b..4d9e27e7e1 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> +++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
> @@ -9,4 +9,8 @@ TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downlo
>  
>  TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-linux-gnueabihf.tar.xz
>  
> +# Fix up paths in python file so they points at the PYTHON_DIR
> +TOOLCHAIN_EXTERNAL_ARM_ARM_LIBSTDCPP_GDB_PY = libstdc++.so.6.0.25-gdb.py
> +TOOLCHAIN_EXTERNAL_ARM_ARM_PYTHON_DIR = /share/gcc-8.2.1/python
> +
>  $(eval $(toolchain-external-package))
> diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
> index fda356bcea..77afc6d30f 100644
> --- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
> +++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
> @@ -13,4 +13,8 @@ else
>  TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
>  endif
>  
> +# Fix up paths in python file so they points at the PYTHON_DIR
> +TOOLCHAIN_EXTERNAL_LINARO_ARM_LIBSTDCPP_GDB_PY = libstdc++.so.6.0.24-gdb.py
> +TOOLCHAIN_EXTERNAL_LINARO_ARM_PYTHON_DIR = /share/gcc-7.3.1/python
> +
>  $(eval $(toolchain-external-package))
> 
