From: Daniel Price <daniel.price@gmail.com>
Date: Fri, 8 Mar 2013 01:32:23 -0800
Subject: [Buildroot] [PATCH V6] nodejs: new package
In-Reply-To: <1362706276-11111-1-git-send-email-daniel.price@gmail.com>
References: <1362706276-11111-1-git-send-email-daniel.price@gmail.com>
Message-ID: <CAKduhSuoWX9o=OF2hTuiC=k--cVFen6bga+XUebfQsdGbq4Jew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just as a quick followup to this patch: Thomas had previously
commented about the call to qstrip at: "NODEJS_MODULES_LIST= $(call
qstrip,\".

I wanted to say that I have tested this both ways and again found that
it was necessary to qstrip the whole thing.  You can better appreciate
why with a trivial example makefile as follows.  Some other buildroot
recipes use other mechanisms like string concatenation of a series of
variables, but that seemed more ugly to me than this method.

-------------8<-------------8<------------------
TEST = $(FOO) $(BAR) $(BAZ)

ifneq ($(TEST),)
define MORESTUFF
        @echo "as seen by ifneq, TEST was not empty"
endef
endif

all:
        @echo "number of characters in TEST:"
        @echo "$(TEST)" | wc -c
        $(MORESTUFF)
-------------8<-------------8<------------------

So in order to make this work as intended, one needs to qstrip $(TEST)
to collapse out whitespace.  I believe that this is because whitespace
which trails a variable is preserved, and so in this example $(TEST)
has two spaces in it.

       -dp

On Thu, Mar 7, 2013 at 5:31 PM, Daniel Price <daniel.price@gmail.com> wrote:
> Based off of patches posted by (and Signed-off-by:) Jonathan Liu <net147@gmail.com>
>
> Signed-off-by: Daniel Price <daniel.price@gmail.com>
> ---
>  package/Config.in                                  |    1 +
>  package/nodejs/Config.in                           |   79 ++++++++++++++
>  .../nodejs-remove-python-bz2-dependency.patch      |   27 +++++
>  package/nodejs/nodejs-v8-gregs-fix.patch           |   29 +++++
>  package/nodejs/nodejs.mk                           |  114 ++++++++++++++++++++
>  5 files changed, 250 insertions(+), 0 deletions(-)
>  create mode 100644 package/nodejs/Config.in
>  create mode 100644 package/nodejs/nodejs-remove-python-bz2-dependency.patch
>  create mode 100644 package/nodejs/nodejs-v8-gregs-fix.patch
>  create mode 100644 package/nodejs/nodejs.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 22e64f8..e46d7a8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -310,6 +310,7 @@ source "package/wsapi/Config.in"
>  source "package/xavante/Config.in"
>  endmenu
>  endif
> +source "package/nodejs/Config.in"
>  source "package/perl/Config.in"
>  if BR2_PACKAGE_PERL
>  menu "Perl libraries/modules"
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> new file mode 100644
> index 0000000..1f4d671
> --- /dev/null
> +++ b/package/nodejs/Config.in
> @@ -0,0 +1,79 @@
> +config BR2_PACKAGE_NODEJS
> +       bool "nodejs"
> +       depends on BR2_INET_IPV6
> +       depends on BR2_LARGEFILE
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_arm || BR2_i386 || BR2_x86_64
> +       # uses fork()
> +       depends on BR2_USE_MMU
> +       help
> +         Event-driven I/O server-side JavaScript environment based on V8.
> +
> +         http://nodejs.org/
> +
> +comment "nodejs requires a toolchain with C++, IPv6, large files, and threading"
> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
> +               !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
> +
> +if BR2_PACKAGE_NODEJS
> +
> +menu "Module Selection"
> +
> +config BR2_PACKAGE_NODEJS_NPM
> +       bool "NPM for the target"
> +       select BR2_PACKAGE_OPENSSL
> +       help
> +         NPM is the package manager for the Node JavaScript platform.
> +         Note that enabling NPM on the target also selects OpenSSL for the
> +         target.
> +
> +         http://www.npmjs.org
> +
> +         Note that NPM is always built for the buildroot host.
> +
> +config BR2_PACKAGE_NODEJS_MODULES_EXPRESS
> +       bool "Express web application framework"
> +       help
> +         Express is a minimal and flexible node.js web application
> +         framework, providing a robust set of features for building
> +         single and multi-page, and hybrid web applications.
> +
> +         http://www.expressjs.com
> +         https://github.com/visionmedia/express
> +
> +config BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT
> +       bool "CoffeeScript"
> +       help
> +         CoffeeScript is a little language that compiles into JavaScript.
> +
> +         http://www.coffeescript.org
> +
> +config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL
> +       string "Additional modules"
> +       help
> +         List of space-separated nodejs modules to install via npm.
> +         See https://npmjs.org/ to find modules and 'npm help install'
> +         for available installation methods.  For repeatable builds,
> +         download and save tgz files or clone git repos for the
> +         components you care about.
> +
> +         Example: serialport uglify-js at 1.3.4 /my/module/mymodule.tgz git://github.com/someuser/somemodule.git#v1.2
> +
> +         This would install the serialport module (at the newest version),
> +         the uglify-js module at 1.3.4, a module from a filesystem path,
> +         and a module from a git repository.
> +
> +config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
> +       string "Additional module dependencies"
> +       help
> +         List of space-separated buildroot recipes which must be built before
> +         your npms can be installed.  For example, if in 'Additional modules'
> +         you specified 'node-curl' (see:
> +         https://github.com/jiangmiao/node-curl), you could then specify
> +         'libcurl' here, to ensure that buildroot builds the libcurl package,
> +         and does so before building your node modules.
> +
> +endmenu
> +
> +endif
> diff --git a/package/nodejs/nodejs-remove-python-bz2-dependency.patch b/package/nodejs/nodejs-remove-python-bz2-dependency.patch
> new file mode 100644
> index 0000000..75fe437
> --- /dev/null
> +++ b/package/nodejs/nodejs-remove-python-bz2-dependency.patch
> @@ -0,0 +1,27 @@
> +Remove dependency on Python bz2 module
> +
> +The Python bz2 module is only needed in certain cases, so only import
> +it when needed. In the normal nodejs build, this allows to remove the
> +dependency on this module.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Index: b/deps/v8/tools/js2c.py
> +===================================================================
> +--- a/deps/v8/tools/js2c.py
> ++++ b/deps/v8/tools/js2c.py
> +@@ -33,7 +33,6 @@
> +
> + import os, re, sys, string
> + import jsmin
> +-import bz2
> +
> +
> + def ToCAsciiArray(lines):
> +@@ -344,6 +343,7 @@
> +   else:
> +     raw_sources_declaration = RAW_SOURCES_COMPRESSION_DECLARATION
> +     if env['COMPRESSION'] == 'bz2':
> ++      import bz2
> +       all_sources = bz2.compress("".join(all_sources))
> +     total_length = len(all_sources)
> +     sources_data = ToCArray(all_sources)
> diff --git a/package/nodejs/nodejs-v8-gregs-fix.patch b/package/nodejs/nodejs-v8-gregs-fix.patch
> new file mode 100644
> index 0000000..4af33bc
> --- /dev/null
> +++ b/package/nodejs/nodejs-v8-gregs-fix.patch
> @@ -0,0 +1,29 @@
> +Fix compilation for ARM/uClibc
> +Patch from Remi Duraffort <remi.duraffort@st.com>, taken from
> +https://code.google.com/p/v8/source/detail?r=12094
> +
> +Signed-off-by: Daniel Price <daniel.price@gmail.com>
> +
> +--- a/deps/v8/src/platform-linux.cc
> ++++ b/deps/v8/src/platform-linux.cc
> +@@ -1025,7 +1025,8 @@ static void ProfilerSignalHandler(int signal, siginfo_t* info, void* context) {
> +   sample->fp = reinterpret_cast<Address>(mcontext.gregs[REG_RBP]);
> + #elif V8_HOST_ARCH_ARM
> + // An undefined macro evaluates to 0, so this applies to Android's Bionic also.
> +-#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
> ++#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) && \
> ++     !defined(__UCLIBC__))
> +   sample->pc = reinterpret_cast<Address>(mcontext.gregs[R15]);
> +   sample->sp = reinterpret_cast<Address>(mcontext.gregs[R13]);
> +   sample->fp = reinterpret_cast<Address>(mcontext.gregs[R11]);
> +@@ -1033,7 +1034,8 @@ static void ProfilerSignalHandler(int signal, siginfo_t* info, void* context) {
> +   sample->pc = reinterpret_cast<Address>(mcontext.arm_pc);
> +   sample->sp = reinterpret_cast<Address>(mcontext.arm_sp);
> +   sample->fp = reinterpret_cast<Address>(mcontext.arm_fp);
> +-#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
> ++#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) &&
> ++        //  !defined(__UCLIBC__))
> + #elif V8_HOST_ARCH_MIPS
> +   sample->pc = reinterpret_cast<Address>(mcontext.pc);
> +   sample->sp = reinterpret_cast<Address>(mcontext.gregs[29]);
> +
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> new file mode 100644
> index 0000000..a77709d
> --- /dev/null
> +++ b/package/nodejs/nodejs.mk
> @@ -0,0 +1,114 @@
> +#############################################################
> +#
> +# nodejs
> +#
> +#############################################################
> +
> +NODEJS_VERSION = 0.8.22
> +NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
> +NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
> +NODEJS_DEPENDENCIES = host-python host-nodejs \
> +    $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
> +HOST_NODEJS_DEPENDENCIES = host-python
> +NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
> +NODEJS_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +       NODEJS_DEPENDENCIES += openssl
> +endif
> +
> +define HOST_NODEJS_CONFIGURE_CMDS
> +       # Build with the static, built-in OpenSSL which is supplied as part of
> +       # the nodejs source distribution.  This is needed on the host because
> +       # NPM is non-functional without it, and host-openssl isn't part of
> +       # buildroot.
> +       (cd $(@D); \
> +                ./configure \
> +               --prefix=$(HOST_DIR)/usr \
> +               --without-snapshot \
> +               --without-dtrace \
> +               --without-etw \
> +       )
> +endef
> +
> +define HOST_NODEJS_BUILD_CMDS
> +       $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define HOST_NODEJS_INSTALL_CMDS
> +       $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
> +endef
> +
> +ifeq ($(BR2_i386),y)
> +NODEJS_CPU=ia32
> +else ifeq ($(BR2_x86_64),y)
> +NODEJS_CPU=x64
> +else ifeq ($(BR2_arm),y)
> +NODEJS_CPU=arm
> +# V8 needs to know what floating point ABI the target is using.  There's also
> +# a 'hard' option which we're not exposing here at the moment, because
> +# buildroot itself doesn't really support it at present.
> +ifeq ($(BR2_SOFT_FLOAT),y)
> +NODEJS_ARM_FP=soft
> +else
> +NODEJS_ARM_FP=softfp
> +endif
> +endif
> +
> +define NODEJS_CONFIGURE_CMDS
> +       (cd $(@D); \
> +               $(TARGET_CONFIGURE_OPTS) \
> +               LD="$(TARGET_CXX)" \
> +               ./configure \
> +               --prefix=/usr \
> +               --without-snapshot \
> +               $(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
> +               $(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
> +               --without-dtrace \
> +               --without-etw \
> +               --dest-cpu=$(NODEJS_CPU) \
> +               $(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
> +               --dest-os=linux \
> +       )
> +endef
> +
> +define NODEJS_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +#
> +# Build the list of modules to install based on the booleans for
> +# popular modules, as well as the "additional modules" list.
> +#
> +NODEJS_MODULES_LIST= $(call qstrip,\
> +       $(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express) \
> +       $(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
> +       $(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
> +
> +#
> +# We can only call NPM if there's something to install.
> +#
> +ifneq ($(NODEJS_MODULES_LIST),)
> +define NODEJS_INSTALL_MODULES
> +       # If you're having trouble with module installation, adding -d to the
> +       # npm install call below and setting npm_config_rollback=false can both
> +       # help in diagnosing the problem.
> +       (cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
> +               $(TARGET_CONFIGURE_OPTS) \
> +               LD="$(TARGET_CXX)" \
> +               npm_config_arch=$(NODEJS_CPU) \
> +               npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
> +               $(HOST_DIR)/usr/bin/npm install \
> +               $(NODEJS_MODULES_LIST) \
> +       )
> +endef
> +endif
> +
> +define NODEJS_INSTALL_TARGET_CMDS
> +       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +       $(NODEJS_INSTALL_MODULES)
> +endef
> +
> +# node.js configure is a Python script and does not use autotools
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> --
> 1.7.6.5
>



--
Daniel.Price at gmail.com; Twitter: @danielbprice
