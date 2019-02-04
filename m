From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 04 Feb 2019 16:15:48 +0100
Subject: [Buildroot] [PATCH 8/8] utils/check-package: warn about
 overridden variables
In-Reply-To: <20190127185943.1136-9-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-9-ricardo.martincoski@gmail.com>
Message-ID: <1549293348.7318.46.camel@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo and all,

On Sun, 2019-01-27 at 16:59 -0200, Ricardo Martincoski wrote:
> For the general case, appending values to variables is OK and also a
> good practice, like this:
> > PACKAGE_VAR = value1
> > ifeq ...
> > PACKAGE_VAR += value2
> 
> or this, when the above is not possible:
> > PACKAGE_VAR = value1
> > ifeq ...
> > PACKAGE_VAR := $(PACKAGE_VAR), value2
> 
> But this override is an error:
> > PACKAGE_VAR = value1
> > PACKAGE_VAR = value2
> 
> as well this one:
> > ifeq ...
> > PACKAGE_VAR += value1
> > endif
> > PACKAGE_VAR = value2
> 
> And this override is error-prone:
> > PACKAGE_VAR = value1
> > ifeq ...
> > PACKAGE_VAR = value2
> 
> Create a check function to warn about overridden variables.
> 
> Some variables are likely to have a default value that gets
> overridden
> in a conditional, so ignore them. The name of such variables end in
> _ARCH, _CPU, _SITE, _SOURCE or _VERSION.
> 
> After ignoring these variable names, there are a few exceptions to
> this
> rule in the tree. For them use the comment that disables the check.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>
[Test: adding an offending line in mosquitto.mk to trigger warning]

> Cc: Simon Dawson <spdawson@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gcc/gcc-final/gcc-final.mk |  2 +
>  package/zmqpp/zmqpp.mk             |  1 +
>  utils/checkpackagelib/lib_mk.py    | 60
> ++++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-
> final/gcc-final.mk
> index 37b645d252..49f16f699e 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -55,36 +55,38 @@ endef
>  # Languages supported by the cross-compiler
>  GCC_FINAL_CROSS_LANGUAGES-y = c
>  GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
>  GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) +=
> fortran
>  GCC_FINAL_CROSS_LANGUAGES = $(subst
> $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
>  
>  HOST_GCC_FINAL_CONF_OPTS = \
>  	$(HOST_GCC_COMMON_CONF_OPTS) \
>  	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
>  	--with-build-time-tools=$(HOST_DIR)/$(GNU_TARGET_NAME)/bin
>  
>  HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
>  # The kernel wants to use the -m4-nofpu option to make sure that it
>  # doesn't use floating point operations.
>  ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
>  HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
> +# check-package OverriddenVariable
>  HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
>  endif
>  ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
>  HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
> +# check-package OverriddenVariable
>  HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
>  endif
>  
>  ifeq ($(BR2_GCC_SUPPORTS_LIBCILKRTS),y)
>  
>  # libcilkrts does not support v8
>  ifeq ($(BR2_sparc),y)
>  HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
>  endif
>  
>  # Pthreads are required to build libcilkrts
>  ifeq ($(BR2_PTHREADS_NONE),y)
>  HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
>  endif
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
> diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
> index 801766a7d8..ea6b50e826 100644
> --- a/package/zmqpp/zmqpp.mk
> +++ b/package/zmqpp/zmqpp.mk
> @@ -6,32 +6,33 @@
>  
>  ZMQPP_VERSION = 4.2.0
>  ZMQPP_SITE = $(call github,zeromq,zmqpp,$(ZMQPP_VERSION))
>  ZMQPP_INSTALL_STAGING = YES
>  ZMQPP_DEPENDENCIES = zeromq
>  ZMQPP_LICENSE = MPL-2.0
>  ZMQPP_LICENSE_FILES = LICENSE
>  ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
>  ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
>  ZMQPP_CONFIG = $(if $(BR2_ENABLE_DEBUG),debug,release)
>  
>  # gcc bug internal compiler error: in merge_overlapping_regs, at
>  # regrename.c:304. This bug is fixed since gcc 6.
>  # By setting CONFIG to empty, all optimizations such as -funroll-
> loops
>  # -ffast-math -finline-functions -fomit-frame-pointer are disabled
>  ifeq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
> +# check-package OverriddenVariable
>  ZMQPP_CONFIG =
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  ZMQPP_LDFLAGS += -latomic
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ZMQPP_CLIENT),y)
>  ZMQPP_DEPENDENCIES += boost
>  endif
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  ZMQPP_MAKE_OPTS += BUILD_STATIC=yes BUILD_SHARED=no
>  else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
>  ZMQPP_MAKE_OPTS += BUILD_STATIC=yes BUILD_SHARED=yes
>  else ifeq ($(BR2_SHARED_LIBS),y)
> diff --git a/utils/checkpackagelib/lib_mk.py
> b/utils/checkpackagelib/lib_mk.py
> index 51c6577d2c..00efeb7fb2 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -60,32 +60,92 @@ class Indent(_CheckFunction):
>          # comment can be indented or not inside define ... endef, so
> ignore it
>          if self.define and self.COMMENT.search(text):
>              return
>  
>          if expect_tabs:
>              if not text.startswith("\t"):
>                  return ["{}:{}: expected indent with tabs"
>                          .format(self.filename, lineno),
>                          text]
>          else:
>              if text.startswith("\t"):
>                  return ["{}:{}: unexpected indent with tabs"
>                          .format(self.filename, lineno),
>                          text]
>  
>  
> +class OverriddenVariable(_CheckFunction):
> +    CONCATENATING = re.compile("^([A-Z0-
> 9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
> +    END_CONDITIONAL =
> re.compile("^\s*({})".format("|".join(end_conditional)))
> +    OVERRIDING_ASSIGNMENTS = [':=', "="]
> +    START_CONDITIONAL =
> re.compile("^\s*({})".format("|".join(start_conditional)))
> +    VARIABLE = re.compile("^([A-Z0-9_]+)\s*((\+|:|)=)")
> +    USUALLY_OVERRIDDEN = re.compile("^[A-Z0-
> 9_]+({})".format("|".join([
> +        "_ARCH\s*=\s*",
> +        "_CPU\s*=\s*",
> +        "_SITE\s*=\s*",
> +        "_SOURCE\s*=\s*",
> +        "_VERSION\s*=\s*"])))
> +
> +    def before(self):
> +        self.conditional = 0
> +        self.unconditionally_set = []
> +        self.conditionally_set = []
> +
> +    def check_line(self, lineno, text):
> +        if self.START_CONDITIONAL.search(text):
> +            self.conditional += 1
> +            return
> +        if self.END_CONDITIONAL.search(text):
> +            self.conditional -= 1
> +            return
> +
> +        m = self.VARIABLE.search(text)
> +        if m is None:
> +            return
> +        variable, assignment = m.group(1, 2)
> +
> +        if self.conditional == 0:
> +            if variable in self.conditionally_set:
> +                self.unconditionally_set.append(variable)
> +                if assignment in self.OVERRIDING_ASSIGNMENTS:
> +                    return ["{}:{}: unconditional override of
> variable {} previously conditionally set"
> +                            .format(self.filename, lineno,
> variable),
> +                            text]
> +
> +            if variable not in self.unconditionally_set:
> +                self.unconditionally_set.append(variable)
> +                return
> +            if assignment in self.OVERRIDING_ASSIGNMENTS:
> +                return ["{}:{}: unconditional override of variable
> {}"
> +                        .format(self.filename, lineno, variable),
> +                        text]
> +        else:
> +            if variable not in self.unconditionally_set:
> +                self.conditionally_set.append(variable)
> +                return
> +            if self.CONCATENATING.search(text):
> +                return
> +            if self.USUALLY_OVERRIDDEN.search(text):
> +                return
> +            if assignment in self.OVERRIDING_ASSIGNMENTS:
> +                return ["{}:{}: conditional override of variable {}"
> +                        .format(self.filename, lineno, variable),
> +                        text]
> +
> +
>  class PackageHeader(_CheckFunction):
>      def before(self):
>          self.skip = False
>  
>      def check_line(self, lineno, text):
>          if self.skip or lineno > 6:
>              return
>  
>          if lineno in [1, 5]:
>              if lineno == 1 and text.startswith("include "):
>                  self.skip = True
>                  return
>              if text.rstrip() != "#" * 80:
>                  return ["{}:{}: should be 80 hashes ({}#writing-
> rules-mk)"
>                          .format(self.filename, lineno,
> self.url_to_manual),
>                          text,


Thanks !

Titouan
