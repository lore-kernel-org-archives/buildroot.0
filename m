From: Daniel Price <daniel.price@gmail.com>
Date: Wed, 27 Feb 2013 19:02:55 -0800
Subject: [Buildroot] [PATCH 2/2] V4 nodejs: new package
In-Reply-To: <20130227103035.2ecc398b@skate>
References: <CAKduhSvCfsfx0Pi_ZVo2CYddDY8NW4iChiTTkGEoeddMqXpxnA@mail.gmail.com>
 <20130227103035.2ecc398b@skate>
Message-ID: <CAKduhSvKJPpuQu7EYsRAJwnSn-P5e2q3y0_-45dAEPGsUZZPQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Sorry about the line wrapping; the indentation is as per the general
style of buildroot.  I don't know what went wrong, I did use git
imap-send, but I guess gmail munched it anyway.  Sorry.  I'll find a
better way.  Thanks for the review feedback, I'll work to address it
and post V5.

      -dp

On Wed, Feb 27, 2013 at 1:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Daniel Price,
>
> On Tue, 26 Feb 2013 18:32:02 -0800, Daniel Price wrote:
>> Minor fix: qstrip list of npm modules; somehow got lost in development.
>>
>
> This sentence shouldn't go here: it should go below the "---". Also the
> "V4" in your title should be inside the [PATCH 2/2 V4] otherwise V4 is
> going to be part of the commit for ever, which we don't want. The
> beginning of a patch should look like this:
>
> =======================================================================
> [PATCH 2/2 v4] nodejs: new package
>
> nodejs is a package that allows to do bla, and also bleh. In order to
> package it, we had to do bar and foo, which required doing zoo and moo.
> Oh, and also boo.
>
> In addition to this, the requirement of the intergalactic planet to be
> aligned on an unsigned int was dumb.
>
> Everything here is going to be preserved forever in the git history of
> the project, so it should *NOT* contain any "changelog" information,
> like what was fixed between v3 and v4. However, it *MUST* contain your
> Signed-off-by line.
>
> Signed-off-by: Someone Here <someone.here@foobar.com>
> ---
> Here, you can put some changelog information.
> ---
> Here, the contents of the patch.
> =======================================================================
>
>> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
>> new file mode 100644
>> index 0000000..79787e0
>> --- /dev/null
>> +++ b/package/nodejs/Config.in
>> @@ -0,0 +1,65 @@
>> +config BR2_PACKAGE_NODEJS
>> + bool "nodejs"
>> + depends on BR2_INET_IPV6
>> + depends on BR2_LARGEFILE
>> + depends on BR2_TOOLCHAIN_HAS_THREADS
>> + depends on BR2_INSTALL_LIBSTDCPP
>> + depends on BR2_arm || BR2_i386 || BR2_x86_64
>
> I am not sure if it is your mail client or your patch that is broken.
> But indentation for "bool", "depends on" and so on should be one tab,
> not one space.
>
>> + # uses fork()
>> + depends on BR2_USE_MMU
>> + help
>> +  Event-driven I/O server-side JavaScript environment based on V8.
>> +
>> +  http://nodejs.org/
>
> Indentation for the help text is one tab + two spaces.
>
>> +
>> +comment "nodejs requires a toolchain with C++, IPv6, large files, and
>> threading"
>> + depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE ||
>> !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
>
> Your patch is line-wrapped. Probably due to your mail client. Please
> use "git send-email" to send your patches. You'll find plenty of
> tutorials on the web explaining how to configure Git to send e-mails
> through a GMail account.
>
>> +if BR2_PACKAGE_NODEJS
>> +
>> +menu "Module Selection"
>> +
>> +config BR2_PACKAGE_NODEJS_MODULES_EXPRESS
>> + bool "Express web application framework"
>> + help
>> +  Express is a minimal and flexible node.js web application
>> +  framework, providing a robust set of features for building
>> +  single and multi-page, and hybrid web applications.
>> +
>> +  http://www.expressjs.com
>> +  https://github.com/visionmedia/express
>
> Fix the indentation again (and everywhere else in the Config.in file).
>
>> +config BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT
>> + bool "CoffeeScript"
>> + help
>> +  CoffeeScript is a little language that compiles into JavaScript.
>> +
>> +  http://www.coffeescript.org
>> +
>> +config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL
>> + string "Additional modules"
>> + help
>> +  List of space-separated nodejs modules to install via npm.
>> +  See https://npmjs.org/ to find modules and 'npm help install'
>> +          for available installation methods.  For repeatable builds,
>> +  download and save tgz files or clone git repos for the
>> +  components you care about.
>> +
>> +  Example: serialport uglify-js at 1.3.4 /my/module/mymodule.tgz
>> git://github.com/isaacs/npm.git#v1.0.27
>
> The example is not entirely clear to me: the example you show will
> install the serialport module, the uglify-js in version 1.3.4, the
> local module stored in /my/module/mymodule.tgz and the module stored on
> some github repository. Is this correct?
>
>> +config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
>> + string "Additional module dependencies"
>> + help
>> +  List of space-separated buildroot recipes which must be built before
>> +  your npms can be installed.  For example, if in 'Additional modules'
>> +  you specified 'node-curl' (see:
>> +  https://github.com/jiangmiao/node-curl), you could then specify
>> +  'libcurl' here, to ensure that buildroot builds the libcurl package,
>> +  and does so before building your node modules.
>> +
>> +endmenu
>> +
>> +comment "WARNING: Note that 'npm' on the target will not work without openssl"
>> + depends on !BR2_PACKAGE_OPENSSL
>
> Since having the npm package manager on the target may or may not be
> useful, maybe we want a BR2_PACKAGE_NODEJS_NPM sub-option to enable its
> installation. This option would "select BR2_PACKAGE_OPENSSL" to ensure
> it is available.
>
> However, if npm on the target requires openssl, doesn't that mean that
> running npm on the host would require host-openssl? Remember that
> having the openssl development files installed on the build machine is
> not guaranteed: this thing is not part of the mandatory dependencies of
> Buildroot.
>
>> diff --git a/package/nodejs/nodejs-v8-gregs-fix.patch
>> b/package/nodejs/nodejs-v8-gregs-fix.patch
>> new file mode 100644
>> index 0000000..60b0253
>> --- /dev/null
>> +++ b/package/nodejs/nodejs-v8-gregs-fix.patch
>> @@ -0,0 +1,29 @@
>> +
>> +"Fix compilation for ARM/uClibc"
>> +Patch from Remi Duraffort <remi.duraffort@st.com>.
>> +
>> +https://code.google.com/p/v8/source/detail?r=12094
>> +
>
> Same thing here: we want a real patch description:
>
> ==================================================
> Fix compilation for ARM/uClibc
>
> Patch from Remi Duraffort <remi.duraffort@st.com>, taken from
> https://code.google.com/p/v8/source/detail?r=12094.
>
> Signed-off-by: Daniel Price <...>
> ==================================================
>
>> +--- a/deps/v8/src/platform-linux.cc
>> ++++ b/deps/v8/src/platform-linux.cc
>> +@@ -1025,7 +1025,8 @@ static void ProfilerSignalHandler(int signal,
>> siginfo_t* info, void* context) {
>> +   sample->fp = reinterpret_cast<Address>(mcontext.gregs[REG_RBP]);
>> + #elif V8_HOST_ARCH_ARM
>> + // An undefined macro evaluates to 0, so this applies to Android's
>> Bionic also.
>> +-#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
>> ++#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) && \
>> ++     !defined(__UCLIBC__))
>> +   sample->pc = reinterpret_cast<Address>(mcontext.gregs[R15]);
>> +   sample->sp = reinterpret_cast<Address>(mcontext.gregs[R13]);
>> +   sample->fp = reinterpret_cast<Address>(mcontext.gregs[R11]);
>> +@@ -1033,7 +1034,8 @@ static void ProfilerSignalHandler(int signal,
>> siginfo_t* info, void* context) {
>> +   sample->pc = reinterpret_cast<Address>(mcontext.arm_pc);
>> +   sample->sp = reinterpret_cast<Address>(mcontext.arm_sp);
>> +   sample->fp = reinterpret_cast<Address>(mcontext.arm_fp);
>> +-#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
>> ++#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) &&
>> ++        //  !defined(__UCLIBC__))
>> + #elif V8_HOST_ARCH_MIPS
>> +   sample->pc = reinterpret_cast<Address>(mcontext.pc);
>> +   sample->sp = reinterpret_cast<Address>(mcontext.gregs[29]);
>> +
>
> This is also line-wrapped. Use git send-email :-)
>
>> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
>> new file mode 100644
>> index 0000000..815ad1b
>> --- /dev/null
>> +++ b/package/nodejs/nodejs.mk
>> @@ -0,0 +1,120 @@
>> +#############################################################
>> +#
>> +# nodejs
>> +#
>> +#############################################################
>> +NODEJS_VERSION = 0.8.19
>
> One new line between the header and the first variable.
>
>> +NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
>> +NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>> +NODEJS_DEPENDENCIES = host-python host-nodejs \
>> +    $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
>> +HOST_NODEJS_DEPENDENCIES = host-python
>> +NODEJS_LICENSE = MIT
>> +
>> +# Headers and node-waf binary are needed in staging to build 3rd-party
>> +# native modules
>> +NODEJS_INSTALL_STAGING = YES
>> +
>> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>> + NODEJS_DEPENDENCIES += openssl
>> +endif
>> +
>> +define HOST_NODEJS_CONFIGURE_CMDS
>> + # Build with static OpenSSL on the host because NPM is
>> + # non-functional without it.
>> + (cd $(@D); \
>> +                ./configure \
>> + --prefix=$(HOST_DIR)/usr \
>> + --without-snapshot \
>> + --without-dtrace \
>> + --without-etw \
>> + )
>> +endef
>
> Please fix the indentation here. Also I'm a bit worried about the
> OpenSSL host dependency here, since we have no guarantee that the
> OpenSSL development libraries are installed.
>
> define HOST_NODEJS_CONFIGURE_CMDS
>         (cd $(@D); \
>                 ./configure \
>                         --prefix=$(HOST_DIR)/usr \
>                         --without-snapshot \
>                         --without-dtrace \
>                         --without-etw)
> endef
>
>> +define HOST_NODEJS_BUILD_CMDS
>> + $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
>> +endef
>
> Indentation should be one tab.
>
>> +
>> +define HOST_NODEJS_INSTALL_CMDS
>> + $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
>> +endef
>
> Ditto.
>
>> +# XXX: nodejs has an arm floating point config option called
>> +# --with-arm-float-abi but I don't know how to derive a setting for that from
>> +#  the user's buildroot CPU config.
>
> You could test BR2_SOFT_FLOAT. That said our soft float/hard float
> support is not entirely great at the moment.
>
>> +define NODEJS_CONFIGURE_CMDS
>> + (cd $(@D); \
>> + $(TARGET_CONFIGURE_OPTS) \
>> + LD="$(TARGET_CXX)" \
>> + ./configure \
>> + --prefix=/usr \
>> + --without-snapshot \
>> + $(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
>> + --without-dtrace \
>> + --without-etw \
>> + $(if $(BR2_i386),--dest-cpu=ia32,) \
>> + $(if $(BR2_x86_64),--dest-cpu=x64,) \
>> + $(if $(BR2_arm),--dest-cpu=arm,) \
>> + --dest-os=linux \
>> + )
>
> Fix indentation (see the HOST_CONFIGURE_CMDS example above).
>
> For the CPU, you could also do something like:
>
> ifeq ($(BR2_i386),y)
> NODEJS_CPU=ia32
> else ifeq ($(BR2_x86_64),y)
> NODEJS_CPU=x64
> else ifeq ($(BR2_arm),y)
> NODEJS_CPU=arm
> endif
>
> and then, in your configure command, so:
>
>         --dest-cpu=$(NODEJS_CPU)
>
> But it's just a matter of preference here, I don't have a strong
> opinion on this particular thing. Your solution happens to be shorter.
> You can make it even simpler by removing the last comma:
>
>         $(if $(BR2_i386),--dest-cpu=ia32)
>
>> +define NODEJS_BUILD_CMDS
>> + $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>> +endef
>
> Indentation. Pass $(TARGET_MAKE_ENV) in the environment.
>
>> +define NODEJS_INSTALL_STAGING_CMDS
>> + $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(STAGING_DIR) install
>> +endef
>
> Indentation. Pass $(TARGET_MAKE_ENV) in the environment.
>
>> +define NODEJS_UNINSTALL_STAGING_CMDS
>> + rm -f $(STAGING_DIR)/usr/bin/node
>> + rm -f $(STAGING_DIR)/usr/bin/npm
>> + rm -rf $(STAGING_DIR)/usr/include/node
>> + rm -f $(STAGING_DIR)/usr/lib/dtrace/node.d
>> + rm -rf $(STAGING_DIR)/usr/lib/node
>> + rm -rf $(STAGING_DIR)/usr/lib/node_modules
>> + rm -f $(STAGING_DIR)/usr/share/man/man1/node.1
>> +endef
>
> Don't bother implementing the uninstall commands, we are going to get
> rid of them.
>
>> +#
>> +# Build the list of modules to install based on the booleans for
>> +# popular modules, as well as the "additional modules" list.
>> +#
>> +BR2_PACKAGE_NODEJS_MODULES_LIST=$(call qstrip, \
>
> Variables in .mk should not start with BR2_, but with the package name.
>
>> + $(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express,) \
>
> Last comma not needed.
>
>> + $(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script,) \
>> + $(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
>
> I think the qstrip should only be on the
> BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL. Maybe:
>
> NODEJS_MODULES_LIST += $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
> NODEJS_MODULES_LIST += $(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express)
> NODEJS_MODULES_LIST += $(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script)
>
>> +define NODEJS_INSTALL_TARGET_CMDS
>> + # XXX Really not sure the best way to do this.  Thoughts?
>> + $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
>
> Not sure what you feel is wrong here. This looks good, except you
> should be passing $(TARGET_MAKE_ENV) in the environment.
>
>> + @echo "Attempting to install modules: $(BR2_PACKAGE_NODEJS_MODULES_LIST)"
>
> I think you could get rid of this message.
>
>> + if [[ -n "$(BR2_PACKAGE_NODEJS_MODULES_LIST)" ]]; then \
>> + (cd $(TARGET_DIR)/usr/lib; \
>> + $(TARGET_CONFIGURE_OPTS) \
>> + $(if $(BR2_i386),npm_config_arch=ia32,) \
>> + $(if $(BR2_x86_64),npm_config_arch=x64,) \
>> + $(if $(BR2_arm),npm_config_arch=arm,) \
>> + npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
>> + $(HOST_DIR)/usr/bin/npm \
>> + install \
>> + $(BR2_PACKAGE_NODEJS_MODULES_LIST) \
>> + ) \
>> + fi
>> +endef
>
> Ok, a slightly different way:
>
> ifneq ($(NODEJS_MODULES_LIST),)
> define NODEJS_INSTALL_MODULES
>         (cd $(TARGET_DIR)/usr/lib; \
>                 $(TARGET_CONFIGURE_OPTS) \
>                 npm_config_arch=$(NODEJS_CPU) \
>                 npm_config_nodedir=$(NODEJS_DIR) \
>                 $(HOST_DIR)/usr/bin/npm install \
>                 $(NODEJS_MODULES_LIST))
> endef
> endif
>
> And then:
>
> define NODEJS_INSTALL_TARGET_CMDS
>         $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
>         $(NODEJS_INSTALL_MODULES)
> endef
>
>> +define NODEJS_UNINSTALL_TARGET_CMDS
>> + rm -f $(TARGET_DIR)/usr/bin/node
>> + rm -f $(TARGET_DIR)/usr/bin/npm
>> + rm -rf $(TARGET_DIR)/usr/include/node
>> + rm -f $(TARGET_DIR)/usr/lib/dtrace/node.d
>> + rm -rf $(TARGET_DIR)/usr/lib/node
>> + rm -rf $(TARGET_DIR)/usr/lib/node_modules
>> + rm -f $(TARGET_DIR)/usr/share/man/man1/node.1
>> +endef
>
> As said above, don't bother implement uninstall commands.
>
>> +# node.js configure is a Python script and does not use autotools
>> +$(eval $(generic-package))
>> +$(eval $(host-generic-package))
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



--
Daniel.Price at gmail.com; Twitter: @danielbprice
