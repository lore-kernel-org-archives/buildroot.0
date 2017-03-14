From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 22:02:23 +0100
Subject: [Buildroot] [git commit] package/nodejs: remove 0.10.x support
Message-ID: <20170314215450.02657825C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfb3cf2ef4fc1dfb16adc92f019df90928755f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nodejs 0.10.x is now end of life and is no longer maintained so remove it.
See https://github.com/nodejs/LTS

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-remove-python-bz2-dependency.patch        | 27 -------------
 .../0002-gyp-force-link-command-to-use-CXX.patch   | 26 ------------
 .../0003-fix-musl-USE-MISC-build-issue.patch       | 47 ----------------------
 .../0.10.48/0004-Fix-support-for-uClibc-ng.patch   | 33 ---------------
 .../0001-gyp-force-link-command-to-use-CXX.patch   |  0
 ...-don-t-build-when-ssl-support-is-disabled.patch |  0
 package/nodejs/Config.in                           | 32 +++++----------
 package/nodejs/nodejs.hash                         |  3 --
 package/nodejs/nodejs.mk                           |  7 +---
 9 files changed, 11 insertions(+), 164 deletions(-)

diff --git a/package/nodejs/0.10.48/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.48/0001-remove-python-bz2-dependency.patch
deleted file mode 100644
index 75fe437..0000000
--- a/package/nodejs/0.10.48/0001-remove-python-bz2-dependency.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Remove dependency on Python bz2 module
-
-The Python bz2 module is only needed in certain cases, so only import
-it when needed. In the normal nodejs build, this allows to remove the
-dependency on this module.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Index: b/deps/v8/tools/js2c.py
-===================================================================
---- a/deps/v8/tools/js2c.py
-+++ b/deps/v8/tools/js2c.py
-@@ -33,7 +33,6 @@
- 
- import os, re, sys, string
- import jsmin
--import bz2
- 
- 
- def ToCAsciiArray(lines):
-@@ -344,6 +343,7 @@
-   else:
-     raw_sources_declaration = RAW_SOURCES_COMPRESSION_DECLARATION
-     if env['COMPRESSION'] == 'bz2':
-+      import bz2
-       all_sources = bz2.compress("".join(all_sources))
-     total_length = len(all_sources)
-     sources_data = ToCArray(all_sources)
diff --git a/package/nodejs/0.10.48/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.48/0002-gyp-force-link-command-to-use-CXX.patch
deleted file mode 100644
index a2f02ab..0000000
--- a/package/nodejs/0.10.48/0002-gyp-force-link-command-to-use-CXX.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 00d809e9305241f8636a2d75e22c493293e6971a Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 20 Apr 2014 15:03:01 +0200
-Subject: [PATCH] gyp: force link command to use CXX
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- tools/gyp/pylib/gyp/generator/make.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/gyp/pylib/gyp/generator/make.py b/tools/gyp/pylib/gyp/generator/make.py
-index 0de510e..54e4c96 100644
---- a/tools/gyp/pylib/gyp/generator/make.py
-+++ b/tools/gyp/pylib/gyp/generator/make.py
-@@ -134,7 +134,7 @@ cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)
- # special "figure out circular dependencies" flags around the entire
- # input list during linking.
- quiet_cmd_link = LINK($(TOOLSET)) $@
--cmd_link = $(LINK.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
-+cmd_link = $(CXX.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
- 
- # We support two kinds of shared objects (.so):
- # 1) shared_library, which is just bundling together many dependent libraries
--- 
-1.9.2
-
diff --git a/package/nodejs/0.10.48/0003-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.48/0003-fix-musl-USE-MISC-build-issue.patch
deleted file mode 100644
index 128058d..0000000
--- a/package/nodejs/0.10.48/0003-fix-musl-USE-MISC-build-issue.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0bc482abeb814573251ecafb5a1e045c885b13a2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 25 May 2015 16:22:57 +0200
-Subject: [PATCH 1/1] Fix musl __USE_MISC issue
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The musl C library does not define __USE_MISC and so libuv (built-in dependency)
-does not use the correct struct stat definition for musl.
-
-The feature test macro __USE_MISC is defined by glibc if _BSD_SOURCE or
-_SVID_SOURCE is defined.
-
-The libuv build system enables the feature test macro _GNU_SOURCE for linux
-builds.
-
-Since glibc 2.19, defining _GNU_SOURCE also has the effect of implicitly
-defining _DEFAULT_SOURCE - the replacement for _BSD_SOURCE and _SVID_SOURCE.
-
-In glibc versions before 2.20, defining _GNU_SOURCE also had the effect of
-implicitly defining _BSD_SOURCE and _SVID_SOURCE. This is also true for uClibc.
-
-Alltogether, we can safely replace __USE_MISC by _GNU_SOURCE to support building
-nodejs 0.10.x with the musl C library.
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- deps/uv/src/fs-poll.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/uv/src/fs-poll.c b/deps/uv/src/fs-poll.c
-index ad27f18..094447e 100644
---- a/deps/uv/src/fs-poll.c
-+++ b/deps/uv/src/fs-poll.c
-@@ -198,7 +198,7 @@ static int statbuf_eq(const uv_statbuf_t* a, const uv_statbuf_t* b) {
- 
-   /* Jump through a few hoops to get sub-second granularity on Linux. */
- # if defined(__linux__)
--#  if defined(__USE_MISC) /* _BSD_SOURCE || _SVID_SOURCE */
-+#  if defined(_GNU_SOURCE) /* _BSD_SOURCE || _SVID_SOURCE */
-   if (a->st_ctim.tv_nsec != b->st_ctim.tv_nsec) return 0;
-   if (a->st_mtim.tv_nsec != b->st_mtim.tv_nsec) return 0;
- #  else
--- 
-2.4.1
-
diff --git a/package/nodejs/0.10.48/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/0.10.48/0004-Fix-support-for-uClibc-ng.patch
deleted file mode 100644
index 59b9d50..0000000
--- a/package/nodejs/0.10.48/0004-Fix-support-for-uClibc-ng.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1cc08f6ceacbb0e5ba1f4638ca3a97ac002d7792 Mon Sep 17 00:00:00 2001
-From: "Bark, Martin" <martin.bark@te.com>
-Date: Mon, 14 Dec 2015 13:26:10 +0000
-Subject: [PATCH 2/2] Fix support for uClibc-ng
-
-uClibc-ng is currently at v1.0.9.  The patch corrects the uClibc
-version test so that HAVE_IFADDRS_H is defined for uClibc versions
-after v0.9.32.
-
-Submitted upstream to libuv and accepted, see
-https://github.com/libuv/libuv/pull/653 and
-https://github.com/libuv/libuv/commit/c861972
-
-Signed-off-by: Bark, Martin <martin.bark@te.com>
----
- deps/uv/src/unix/linux-core.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/uv/src/unix/linux-core.c b/deps/uv/src/unix/linux-core.c
-index e6e6828..6cbbb71 100644
---- a/deps/uv/src/unix/linux-core.c
-+++ b/deps/uv/src/unix/linux-core.c
-@@ -39,7 +39,7 @@
- #define HAVE_IFADDRS_H 1
-
- #ifdef __UCLIBC__
--# if __UCLIBC_MAJOR__ < 0 || __UCLIBC_MINOR__ < 9 || __UCLIBC_SUBLEVEL__ < 32
-+# if __UCLIBC_MAJOR__ < 0 && __UCLIBC_MINOR__ < 9 && __UCLIBC_SUBLEVEL__ < 32
- #  undef HAVE_IFADDRS_H
- # endif
- #endif
---
-2.6.2
diff --git a/package/nodejs/6.9.4/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.9.4/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.9.4/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
similarity index 100%
rename from package/nodejs/6.9.4/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
rename to package/nodejs/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index b8c45f5..4810d59 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -1,8 +1,13 @@
+config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
+	bool
+	# On ARM,@least ARMv6+ with VFPv2+ is needed
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
+	default y if BR2_mipsel && !BR2_MIPS_SOFT_FLOAT
+	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
+
 comment "nodejs needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.8, wchar"
 	depends on BR2_USE_MMU
-	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel
-	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on !BR2_ARM_CPU_ARMV4
+	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
 
@@ -10,12 +15,7 @@ config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel
-	depends on !BR2_MIPS_SOFT_FLOAT
-	# ARM needs BLX, so v5t+
-	depends on !BR2_ARM_CPU_ARMV4
-	# 0.10.x could be built without the following toolchain dependencies but
-	# simplify things by requiring these basic dependencies for all versions.
+	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_USE_WCHAR
@@ -32,20 +32,6 @@ config BR2_PACKAGE_NODEJS
 
 if BR2_PACKAGE_NODEJS
 
-# Starting with 0.12.x, on ARM, V8 (the JS engine)
-# now requires an armv6+ and a VFPv2+.
-config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	bool
-	# On supported architectures other than ARM, no special requirement
-	default y if !BR2_arm
-	# On ARM, at least ARMv6+ with VFPv2+ is needed
-	default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
-
-config BR2_PACKAGE_NODEJS_VERSION_STRING
-	string
-	default "6.9.4"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	default "0.10.48"
-
 config BR2_PACKAGE_NODEJS_NPM
 	bool "NPM for the target"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 8c8c5a3..02ad8f3 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
-sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
-
 # From upstream URL: http://nodejs.org/dist/v6.9.4/SHASUMS256.txt
 sha256  c51d7c61db40455d57428abcadc7eb0f0a08a8878cb1d8ea3c1e211c54532c35  node-v6.9.4.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 042cc3f..858626a 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = $(call qstrip,$(BR2_PACKAGE_NODEJS_VERSION_STRING))
+NODEJS_VERSION = 6.9.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
@@ -27,15 +27,12 @@ else
 NODEJS_CONF_OPTS += --without-ssl
 endif
 
-# 0.10.x does not have icu support
-ifeq ($(findstring 0.10.,$(NODEJS_VERSION)),)
 ifeq ($(BR2_PACKAGE_ICU),y)
 NODEJS_DEPENDENCIES += icu
 NODEJS_CONF_OPTS += --with-intl=system-icu
 else
 NODEJS_CONF_OPTS += --with-intl=none
 endif
-endif
 
 ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
 NODEJS_CONF_OPTS += --without-npm
@@ -63,7 +60,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--without-dtrace \
 		--without-etw \
 		--shared-zlib \
-		$(if $(BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS),--with-intl=none) \
+		--with-intl=none \
 	)
 endef
 
