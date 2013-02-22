From: Daniel Price <daniel.price@gmail.com>
Date: Thu, 21 Feb 2013 16:12:18 -0800
Subject: [Buildroot] [PATCH 2/2] V3 nodejs: new package
Message-ID: <CAKduhSuDBhEZYedf3Fr5tf_1stfo4+3k-HaoxTNzrsSj--=jOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[V3: a small fixup to Config.in]

Based off of patches posted by (and Signed-off-by:) Jonathan Liu
<net147@gmail.com>

Signed-off-by: Daniel Price <daniel.price@gmail.com>
---
 package/Config.in                        |    1 +
 package/nodejs/Config.in                 |   65 ++++++++++++++++
 package/nodejs/nodejs-v8-gregs-fix.patch |   29 +++++++
 package/nodejs/nodejs.mk                 |  120 ++++++++++++++++++++++++++++++
 4 files changed, 215 insertions(+), 0 deletions(-)
 create mode 100644 package/nodejs/Config.in
 create mode 100644 package/nodejs/nodejs-v8-gregs-fix.patch
 create mode 100644 package/nodejs/nodejs.mk

diff --git a/package/Config.in b/package/Config.in
index 2fad94d..4c44818 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ source "package/cpanminus/Config.in"
 endmenu
 endif
 source "package/microperl/Config.in"
+source "package/nodejs/Config.in"
 source "package/php/Config.in"
 source "package/python/Config.in"
 source "package/python3/Config.in"
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
new file mode 100644
index 0000000..79787e0
--- /dev/null
+++ b/package/nodejs/Config.in
@@ -0,0 +1,65 @@
+config BR2_PACKAGE_NODEJS
+ bool "nodejs"
+ depends on BR2_INET_IPV6
+ depends on BR2_LARGEFILE
+ depends on BR2_TOOLCHAIN_HAS_THREADS
+ depends on BR2_INSTALL_LIBSTDCPP
+ depends on BR2_arm || BR2_i386 || BR2_x86_64
+ # uses fork()
+ depends on BR2_USE_MMU
+ help
+  Event-driven I/O server-side JavaScript environment based on V8.
+
+  http://nodejs.org/
+
+comment "nodejs requires a toolchain with C++, IPv6, large files, and
threading"
+ depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE ||
!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+
+if BR2_PACKAGE_NODEJS
+
+menu "Module Selection"
+
+config BR2_PACKAGE_NODEJS_MODULES_EXPRESS
+ bool "Express web application framework"
+ help
+  Express is a minimal and flexible node.js web application
+  framework, providing a robust set of features for building
+  single and multi-page, and hybrid web applications.
+
+  http://www.expressjs.com
+  https://github.com/visionmedia/express
+
+config BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT
+ bool "CoffeeScript"
+ help
+  CoffeeScript is a little language that compiles into JavaScript.
+
+  http://www.coffeescript.org
+
+config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL
+ string "Additional modules"
+ help
+  List of space-separated nodejs modules to install via npm.
+  See https://npmjs.org/ to find modules and 'npm help install'
+          for available installation methods.  For repeatable builds,
+  download and save tgz files or clone git repos for the
+  components you care about.
+
+  Example: serialport uglify-js at 1.3.4 /my/module/mymodule.tgz
git://github.com/isaacs/npm.git#v1.0.27
+
+config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
+ string "Additional module dependencies"
+ help
+  List of space-separated buildroot recipes which must be built before
+  your npms can be installed.  For example, if in 'Additional modules'
+  you specified 'node-curl' (see:
+  https://github.com/jiangmiao/node-curl), you could then specify
+  'libcurl' here, to ensure that buildroot builds the libcurl package,
+  and does so before building your node modules.
+
+endmenu
+
+comment "WARNING: Note that 'npm' on the target will not work without openssl"
+ depends on !BR2_PACKAGE_OPENSSL
+
+endif
diff --git a/package/nodejs/nodejs-v8-gregs-fix.patch
b/package/nodejs/nodejs-v8-gregs-fix.patch
new file mode 100644
index 0000000..60b0253
--- /dev/null
+++ b/package/nodejs/nodejs-v8-gregs-fix.patch
@@ -0,0 +1,29 @@
+
+"Fix compilation for ARM/uClibc"
+Patch from Remi Duraffort <remi.duraffort@st.com>.
+
+https://code.google.com/p/v8/source/detail?r=12094
+
+--- a/deps/v8/src/platform-linux.cc
++++ b/deps/v8/src/platform-linux.cc
+@@ -1025,7 +1025,8 @@ static void ProfilerSignalHandler(int signal,
siginfo_t* info, void* context) {
+   sample->fp = reinterpret_cast<Address>(mcontext.gregs[REG_RBP]);
+ #elif V8_HOST_ARCH_ARM
+ // An undefined macro evaluates to 0, so this applies to Android's
Bionic also.
+-#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
++#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) && \
++     !defined(__UCLIBC__))
+   sample->pc = reinterpret_cast<Address>(mcontext.gregs[R15]);
+   sample->sp = reinterpret_cast<Address>(mcontext.gregs[R13]);
+   sample->fp = reinterpret_cast<Address>(mcontext.gregs[R11]);
+@@ -1033,7 +1034,8 @@ static void ProfilerSignalHandler(int signal,
siginfo_t* info, void* context) {
+   sample->pc = reinterpret_cast<Address>(mcontext.arm_pc);
+   sample->sp = reinterpret_cast<Address>(mcontext.arm_sp);
+   sample->fp = reinterpret_cast<Address>(mcontext.arm_fp);
+-#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
++#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) &&
++        //  !defined(__UCLIBC__))
+ #elif V8_HOST_ARCH_MIPS
+   sample->pc = reinterpret_cast<Address>(mcontext.pc);
+   sample->sp = reinterpret_cast<Address>(mcontext.gregs[29]);
+
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
new file mode 100644
index 0000000..fc4ff06
--- /dev/null
+++ b/package/nodejs/nodejs.mk
@@ -0,0 +1,120 @@
+#############################################################
+#
+# nodejs
+#
+#############################################################
+NODEJS_VERSION = 0.8.19
+NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
+NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
+NODEJS_DEPENDENCIES = host-python host-nodejs \
+    $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
+HOST_NODEJS_DEPENDENCIES = host-python
+NODEJS_LICENSE = MIT
+
+# Headers and node-waf binary are needed in staging to build 3rd-party
+# native modules
+NODEJS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ NODEJS_DEPENDENCIES += openssl
+endif
+
+define HOST_NODEJS_CONFIGURE_CMDS
+ # Build with static OpenSSL on the host because NPM is
+ # non-functional without it.
+ (cd $(@D); \
+                ./configure \
+ --prefix=$(HOST_DIR)/usr \
+ --without-snapshot \
+ --without-dtrace \
+ --without-etw \
+ )
+endef
+
+define HOST_NODEJS_BUILD_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_NODEJS_INSTALL_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+# XXX: nodejs has an arm floating point config option called
+# --with-arm-float-abi but I don't know how to derive a setting for that from
+#  the user's buildroot CPU config.
+define NODEJS_CONFIGURE_CMDS
+ (cd $(@D); \
+ $(TARGET_CONFIGURE_OPTS) \
+ LD="$(TARGET_CXX)" \
+ ./configure \
+ --prefix=/usr \
+ --without-snapshot \
+ $(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
+ --without-dtrace \
+ --without-etw \
+ $(if $(BR2_i386),--dest-cpu=ia32,) \
+ $(if $(BR2_x86_64),--dest-cpu=x64,) \
+ $(if $(BR2_arm),--dest-cpu=arm,) \
+ --dest-os=linux \
+ )
+endef
+
+define NODEJS_BUILD_CMDS
+ $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define NODEJS_INSTALL_STAGING_CMDS
+ $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define NODEJS_UNINSTALL_STAGING_CMDS
+ rm -f $(STAGING_DIR)/usr/bin/node
+ rm -f $(STAGING_DIR)/usr/bin/npm
+ rm -rf $(STAGING_DIR)/usr/include/node
+ rm -f $(STAGING_DIR)/usr/lib/dtrace/node.d
+ rm -rf $(STAGING_DIR)/usr/lib/node
+ rm -rf $(STAGING_DIR)/usr/lib/node_modules
+ rm -f $(STAGING_DIR)/usr/share/man/man1/node.1
+endef
+
+#
+# Build the list of modules to install based on the booleans for
+# popular modules, as well as the "additional modules" list.
+#
+BR2_PACKAGE_NODEJS_MODULES_LIST=\
+ $(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express,) \
+ $(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script,) \
+ $(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL)
+
+define NODEJS_INSTALL_TARGET_CMDS
+ # XXX Really not sure the best way to do this.  Thoughts?
+ $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
+
+ @echo "Attempting to install modules: $(BR2_PACKAGE_NODEJS_MODULES_LIST)"
+ if [[ -n "$(BR2_PACKAGE_NODEJS_MODULES_LIST)" ]]; then \
+ (cd $(TARGET_DIR)/usr/lib; \
+ $(TARGET_CONFIGURE_OPTS) \
+ $(if $(BR2_i386),npm_config_arch=ia32,) \
+ $(if $(BR2_x86_64),npm_config_arch=x64,) \
+ $(if $(BR2_arm),npm_config_arch=arm,) \
+ npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
+ $(HOST_DIR)/usr/bin/npm \
+ install \
+ $(BR2_PACKAGE_NODEJS_MODULES_LIST) \
+ ) \
+ fi
+endef
+
+define NODEJS_UNINSTALL_TARGET_CMDS
+ rm -f $(TARGET_DIR)/usr/bin/node
+ rm -f $(TARGET_DIR)/usr/bin/npm
+ rm -rf $(TARGET_DIR)/usr/include/node
+ rm -f $(TARGET_DIR)/usr/lib/dtrace/node.d
+ rm -rf $(TARGET_DIR)/usr/lib/node
+ rm -rf $(TARGET_DIR)/usr/lib/node_modules
+ rm -f $(TARGET_DIR)/usr/share/man/man1/node.1
+endef
+
+# node.js configure is a Python script and does not use autotools
+$(eval $(generic-package))
+$(eval $(host-generic-package))
--
1.7.6.5
