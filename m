From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Thu, 15 Jan 2015 00:38:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/iojs: new package
Message-ID: <1421278696-15122-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

io.js is a fork of Node.js. This package is mainly based on the nodejs
package, except for the patches.

io.js is currently marked as unstable and there is no stable release for now.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/Config.in                                  |   1 +
 ...-deps-remove-python-import-of-bz2-in-js2c.patch |  30 +++++
 .../0002-deps-fix-musl-build-error-for-v8.patch    |  30 +++++
 .../0003-deps-fix-uClibc-build-errors-for-v8.patch |  97 ++++++++++++++++
 package/iojs/Config.in                             |  87 ++++++++++++++
 package/iojs/iojs.hash                             |   2 +
 package/iojs/iojs.mk                               | 128 +++++++++++++++++++++
 7 files changed, 375 insertions(+)
 create mode 100644 package/iojs/0001-deps-remove-python-import-of-bz2-in-js2c.patch
 create mode 100644 package/iojs/0002-deps-fix-musl-build-error-for-v8.patch
 create mode 100644 package/iojs/0003-deps-fix-uClibc-build-errors-for-v8.patch
 create mode 100644 package/iojs/Config.in
 create mode 100644 package/iojs/iojs.hash
 create mode 100644 package/iojs/iojs.mk

diff --git a/package/Config.in b/package/Config.in
index 7bd31e8..418026c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -400,6 +400,7 @@ menu "Interpreter languages and scripting"
 	source "package/erlang/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
+	source "package/iojs/Config.in"
 	source "package/jamvm/Config.in"
 	source "package/jimtcl/Config.in"
 	source "package/lua/Config.in"
diff --git a/package/iojs/0001-deps-remove-python-import-of-bz2-in-js2c.patch b/package/iojs/0001-deps-remove-python-import-of-bz2-in-js2c.patch
new file mode 100644
index 0000000..e23ea06
--- /dev/null
+++ b/package/iojs/0001-deps-remove-python-import-of-bz2-in-js2c.patch
@@ -0,0 +1,30 @@
+From 7ab03529c34c43c147f09b21c3346130d075928d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
+Date: Mon, 12 Jan 2015 23:00:13 +0100
+Subject: [PATCH 1/3] deps: remove python import of bz2 in js2c
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The bz2 module is never used in this python script. In the io.js build, this
+allows to remove the dependency on this module.
+
+Signed-off-by: J?rg Krause <jkrause@posteo.de>
+---
+ deps/v8/tools/js2c.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/deps/v8/tools/js2c.py b/deps/v8/tools/js2c.py
+index 621ed5a..096a4eb 100755
+--- a/deps/v8/tools/js2c.py
++++ b/deps/v8/tools/js2c.py
+@@ -34,7 +34,6 @@
+ import os, re, sys, string
+ import optparse
+ import jsmin
+-import bz2
+ import textwrap
+
+
+--
+2.2.2
diff --git a/package/iojs/0002-deps-fix-musl-build-error-for-v8.patch b/package/iojs/0002-deps-fix-musl-build-error-for-v8.patch
new file mode 100644
index 0000000..3bfa3cd
--- /dev/null
+++ b/package/iojs/0002-deps-fix-musl-build-error-for-v8.patch
@@ -0,0 +1,30 @@
+From 9adaa4f87cbbd56362f0d3fba204e147a74b22c3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
+Date: Mon, 12 Jan 2015 23:14:13 +0100
+Subject: [PATCH 2/3] deps: fix musl build error for v8
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With the musl C library, building V8 fails because __ARM_NR_cacheflush is
+undeclared. Fix this by including <asm/unistd.h>.
+
+Signed-off-by: J?rg Krause <jkrause@posteo.de>
+---
+ deps/v8/src/arm/cpu-arm.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/deps/v8/src/arm/cpu-arm.cc b/deps/v8/src/arm/cpu-arm.cc
+index 4a34070..c94e30c 100644
+--- a/deps/v8/src/arm/cpu-arm.cc
++++ b/deps/v8/src/arm/cpu-arm.cc
+@@ -16,6 +16,7 @@
+
+ #if V8_TARGET_ARCH_ARM
+
++#include <asm/unistd.h>
+ #include "src/assembler.h"
+ #include "src/macro-assembler.h"
+ #include "src/simulator.h"  // for cache flushing.
+--
+2.2.2
diff --git a/package/iojs/0003-deps-fix-uClibc-build-errors-for-v8.patch b/package/iojs/0003-deps-fix-uClibc-build-errors-for-v8.patch
new file mode 100644
index 0000000..ee3a339
--- /dev/null
+++ b/package/iojs/0003-deps-fix-uClibc-build-errors-for-v8.patch
@@ -0,0 +1,97 @@
+From 2932d9636d75337e2b3b2121d112d4753c2618b6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
+Date: Wed, 14 Jan 2015 23:40:30 +0100
+Subject: [PATCH 3/3] deps: fix uClibc build errors for v8
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With the uClibc library, building V8 fails for:
+  - src/base/logging.cc: In V8, V8_LIBC_GLIBC is true for uClibc. Since uClibc
+    does not have a <execinfo.h> header file and does not provide backtracing,
+    exclude.
+  - src/compiler/graph-visualizer.h: NULL undeclared. Include <stddef.h>.
+  - src/sampler.cc: uClibc says it is an Glibc version 2.2, but the comment
+    about the old Glibc ARM versions and the gregs[] array are not valid for
+    uClibc. Exclude uClibc from this condition.
+
+Signed-off-by: J?rg Krause <jkrause@posteo.de>
+---
+ deps/v8/src/base/logging.cc             | 8 ++++----
+ deps/v8/src/compiler/graph-visualizer.h | 1 +
+ deps/v8/src/sampler.cc                  | 4 ++--
+ 3 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/deps/v8/src/base/logging.cc b/deps/v8/src/base/logging.cc
+index c3f609f..a055e9c 100644
+--- a/deps/v8/src/base/logging.cc
++++ b/deps/v8/src/base/logging.cc
+@@ -4,12 +4,12 @@
+
+ #include "src/base/logging.h"
+
+-#if V8_LIBC_GLIBC || V8_OS_BSD
++#if (V8_LIBC_GLIBC && !defined(__UCLIBC__)) || V8_OS_BSD
+ # include <cxxabi.h>
+ # include <execinfo.h>
+ #elif V8_OS_QNX
+ # include <backtrace.h>
+-#endif  // V8_LIBC_GLIBC || V8_OS_BSD
++#endif  // (V8_LIBC_GLIBC && !defined(__UCLIBC__)) || V8_OS_BSD
+ #include <stdio.h>
+ #include <stdlib.h>
+
+@@ -20,7 +20,7 @@ namespace base {
+
+ // Attempts to dump a backtrace (if supported).
+ void DumpBacktrace() {
+-#if V8_LIBC_GLIBC || V8_OS_BSD
++#if (V8_LIBC_GLIBC && !defined(__UCLIBC__)) || V8_OS_BSD
+   void* trace[100];
+   int size = backtrace(trace, arraysize(trace));
+   char** symbols = backtrace_symbols(trace, size);
+@@ -65,7 +65,7 @@ void DumpBacktrace() {
+   }
+   bt_unload_memmap(&memmap);
+   bt_release_accessor(&acc);
+-#endif  // V8_LIBC_GLIBC || V8_OS_BSD
++#endif  // (V8_LIBC_GLIBC && !defined(__UCLIBC__)) || V8_OS_BSD
+ }
+
+ } }  // namespace v8::base
+diff --git a/deps/v8/src/compiler/graph-visualizer.h b/deps/v8/src/compiler/graph-visualizer.h
+index 3dd66ea..3898177 100644
+--- a/deps/v8/src/compiler/graph-visualizer.h
++++ b/deps/v8/src/compiler/graph-visualizer.h
+@@ -5,6 +5,7 @@
+ #ifndef V8_COMPILER_GRAPH_VISUALIZER_H_
+ #define V8_COMPILER_GRAPH_VISUALIZER_H_
+
++#include <stddef.h>
+ #include <iosfwd>
+
+ namespace v8 {
+diff --git a/deps/v8/src/sampler.cc b/deps/v8/src/sampler.cc
+index 760df80..ef2ff4b 100644
+--- a/deps/v8/src/sampler.cc
++++ b/deps/v8/src/sampler.cc
+@@ -374,7 +374,7 @@ void SignalHandler::HandleProfilerSignal(int signal, siginfo_t* info,
+   state.sp = reinterpret_cast<Address>(mcontext.gregs[REG_RSP]);
+   state.fp = reinterpret_cast<Address>(mcontext.gregs[REG_RBP]);
+ #elif V8_HOST_ARCH_ARM
+-#if V8_LIBC_GLIBC && !V8_GLIBC_PREREQ(2, 4)
++#if V8_LIBC_GLIBC && !V8_GLIBC_PREREQ(2, 4) && !defined(__UCLIBC__)
+   // Old GLibc ARM versions used a gregs[] array to access the register
+   // values from mcontext_t.
+   state.pc = reinterpret_cast<Address>(mcontext.gregs[R15]);
+@@ -384,7 +384,7 @@ void SignalHandler::HandleProfilerSignal(int signal, siginfo_t* info,
+   state.pc = reinterpret_cast<Address>(mcontext.arm_pc);
+   state.sp = reinterpret_cast<Address>(mcontext.arm_sp);
+   state.fp = reinterpret_cast<Address>(mcontext.arm_fp);
+-#endif  // V8_LIBC_GLIBC && !V8_GLIBC_PREREQ(2, 4)
++#endif  // V8_LIBC_GLIBC && !V8_GLIBC_PREREQ(2, 4) && !defined(__UCLIBC__)
+ #elif V8_HOST_ARCH_ARM64
+   state.pc = reinterpret_cast<Address>(mcontext.pc);
+   state.sp = reinterpret_cast<Address>(mcontext.sp);
+--
+2.2.2
diff --git a/package/iojs/Config.in b/package/iojs/Config.in
new file mode 100644
index 0000000..189b89f
--- /dev/null
+++ b/package/iojs/Config.in
@@ -0,0 +1,87 @@
+config BR2_PACKAGE_IOJS
+	bool "iojs"
+	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on !BR2_MIPS_SOFT_FLOAT
+	# ARM needs BLX, so v5t+
+	depends on !BR2_ARM_CPU_ARMV4
+	# uses fork()
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_ZLIB
+	help
+	  io.js is a JavaScript platform built on Chrome's V8 runtime. io.js
+	  originally based on Node.js and is compatible with the npm ecosystem.
+
+	  http://iojs.org/
+
+comment "iojs needs a toolchain w/ C++, IPv6, largefile, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+
+if BR2_PACKAGE_IOJS
+
+menu "Module Selection"
+
+config BR2_PACKAGE_IOJS_NPM
+	bool "NPM for the target"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  NPM is the package manager for the Node JavaScript platform.
+	  Note that enabling NPM on the target also selects OpenSSL for the
+	  target.
+
+	  http://www.npmjs.org
+
+	  Note that NPM is always built for the buildroot host.
+
+config BR2_PACKAGE_IOJS_MODULES_EXPRESS
+	bool "Express web application framework"
+	help
+	  Express is a minimal and flexible node.js web application
+	  framework, providing a robust set of features for building
+	  single and multi-page, and hybrid web applications.
+
+	  http://www.expressjs.com
+	  https://github.com/visionmedia/express
+
+config BR2_PACKAGE_IOJS_MODULES_COFFEESCRIPT
+	bool "CoffeeScript"
+	help
+	  CoffeeScript is a little language that compiles into JavaScript.
+
+	  http://www.coffeescript.org
+
+config BR2_PACKAGE_IOJS_MODULES_ADDITIONAL
+	string "Additional modules"
+	help
+	  List of space-separated io.js/node.js modules to install via npm.
+	  See https://npmjs.org/ to find modules and 'npm help install'
+	  for available installation methods. For repeatable builds,
+	  download and save tgz files or clone git repos for the
+	  components you care about.
+
+	  Example: serialport uglify-js at 1.3.4 /my/module/mymodule.tgz git://github.com/someuser/somemodule.git#v1.2
+
+	  This would install the serialport module (at the newest version),
+	  the uglify-js module at 1.3.4, a module from a filesystem path,
+	  and a module from a git repository.
+
+config BR2_PACKAGE_IOJS_MODULES_ADDITIONAL_DEPS
+	string "Additional module dependencies"
+	help
+	  List of space-separated buildroot recipes which must be built before
+	  your npms can be installed.  For example, if in 'Additional modules'
+	  you specified 'node-curl' (see:
+	  https://github.com/jiangmiao/node-curl), you could then specify
+	  'libcurl' here, to ensure that buildroot builds the libcurl package,
+	  and does so before building your node modules.
+
+endmenu
+
+endif
diff --git a/package/iojs/iojs.hash b/package/iojs/iojs.hash
new file mode 100644
index 0000000..8ed3d3e
--- /dev/null
+++ b/package/iojs/iojs.hash
@@ -0,0 +1,2 @@
+# From https://iojs.org/dist/v1.0.1/SHASUMS256.txt
+sha256	c26052dad5d9ccd8a7b9134806994ebf2d217a57d6efd5633e01c5cc1dcdedc5  iojs-v1.0.1.tar.gz
diff --git a/package/iojs/iojs.mk b/package/iojs/iojs.mk
new file mode 100644
index 0000000..143b527
--- /dev/null
+++ b/package/iojs/iojs.mk
@@ -0,0 +1,128 @@
+################################################################################
+#
+# iojs
+#
+################################################################################
+
+IOJS_VERSION = 1.0.1
+IOJS_SOURCE = iojs-v$(IOJS_VERSION).tar.gz
+IOJS_SITE = http://iojs.org/dist/v$(IOJS_VERSION)
+IOJS_DEPENDENCIES = host-python host-iojs zlib \
+	$(call qstrip,$(BR2_PACKAGE_IOJS_MODULES_ADDITIONAL_DEPS))
+HOST_IOJS_DEPENDENCIES = host-python host-zlib
+IOJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
+IOJS_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	IOJS_DEPENDENCIES += openssl
+endif
+
+# iojs build system is based on python, but only support python-2.6 or
+# python-2.7. So, we have to enforce PYTHON interpreter to be python2.
+define HOST_IOJS_CONFIGURE_CMDS
+	# Build with the static, built-in OpenSSL which is supplied as part of
+	# the iojs source distribution.  This is needed on the host because
+	# NPM is non-functional without it, and host-openssl isn't part of
+	# buildroot.
+	(cd $(@D); \
+		$(HOST_CONFIGURE_OPTS) \
+		PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(HOST_DIR)/usr/bin/python2 ./configure \
+		--prefix=$(HOST_DIR)/usr \
+		--without-snapshot \
+		--without-dtrace \
+		--without-etw \
+		--shared-zlib \
+	)
+endef
+
+define HOST_IOJS_BUILD_CMDS
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS)
+endef
+
+define HOST_IOJS_INSTALL_CMDS
+	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(MAKE) -C $(@D) install \
+		$(HOST_CONFIGURE_OPTS)
+endef
+
+ifeq ($(BR2_i386),y)
+IOJS_CPU = ia32
+else ifeq ($(BR2_x86_64),y)
+IOJS_CPU = x64
+else ifeq ($(BR2_mipsel),y)
+IOJS_CPU = mipsel
+else ifeq ($(BR2_arm),y)
+IOJS_CPU = arm
+# V8 needs to know what floating point ABI the target is using.
+IOJS_ARM_FP = $(BR2_GCC_TARGET_FLOAT_ABI)
+endif
+
+define IOJS_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		LD="$(TARGET_CXX)" \
+		PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(HOST_DIR)/usr/bin/python2 ./configure \
+		--prefix=/usr \
+		--without-snapshot \
+		--shared-zlib \
+		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
+		$(if $(BR2_PACKAGE_IOJS_NPM),,--without-npm) \
+		--without-dtrace \
+		--without-etw \
+		--dest-cpu=$(IOJS_CPU) \
+		$(if $(IOJS_ARM_FP),--with-arm-float-abi=$(IOJS_ARM_FP)) \
+		--dest-os=linux \
+	)
+endef
+
+define IOJS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		LD="$(TARGET_CXX)"
+endef
+
+#
+# Build the list of modules to install based on the booleans for
+# popular modules, as well as the "additional modules" list.
+#
+IOJS_MODULES_LIST= $(call qstrip,\
+	$(if $(BR2_PACKAGE_IOJS_MODULES_EXPRESS),express) \
+	$(if $(BR2_PACKAGE_IOJS_MODULES_COFFEESCRIPT),coffee-script) \
+	$(BR2_PACKAGE_IOJS_MODULES_ADDITIONAL))
+
+#
+# We can only call NPM if there's something to install.
+#
+ifneq ($(IOJS_MODULES_LIST),)
+define IOJS_INSTALL_MODULES
+	# If you're having trouble with module installation, adding -d to the
+	# npm install call below and setting npm_config_rollback=false can both
+	# help in diagnosing the problem.
+	(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
+		$(TARGET_CONFIGURE_OPTS) \
+		LD="$(TARGET_CXX)" \
+		npm_config_arch=$(IOJS_CPU) \
+		npm_config_nodedir=$(BUILD_DIR)/iojs-$(IOJS_VERSION) \
+		$(HOST_DIR)/usr/bin/npm install \
+		$(IOJS_MODULES_LIST) \
+	)
+endef
+endif
+
+define IOJS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
+		$(MAKE) -C $(@D) install \
+		DESTDIR=$(TARGET_DIR) \
+		$(TARGET_CONFIGURE_OPTS) \
+		LD="$(TARGET_CXX)"
+	$(IOJS_INSTALL_MODULES)
+endef
+
+# node.js configure is a Python script and does not use autotools
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.2.2
