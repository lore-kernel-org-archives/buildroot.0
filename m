From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 26 Oct 2019 17:29:43 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/mongodb: bump to version 4.1.10
In-Reply-To: <20191026152943.122511-1-titouan.christophe@railnova.eu>
References: <20191026152943.122511-1-titouan.christophe@railnova.eu>
Message-ID: <20191026152943.122511-5-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

- Drop !BR2_PACKAGE_PYTHON3 dependency as SConstruct requires
  host-python3 since version 4.1.10 and:
  https://github.com/mongodb/mongo/commit/8dd6d4755734ed37c1b98dfdefce3ca6bc65f1f6
- host-python-psutil is needed since 4.1.8 and
  https://github.com/mongodb/mongo/commit/ff03811e31851984617d73739de8acc7640b19a2
- Drop unneeded host-python-typing dependency
- C++17 and so gcc 7 is required since 4.1.8 and
  https://github.com/mongodb/mongo/commit/01d84b2565fc9ea9626a55dcf1f3f817968088f2
- Set --disable-minimum-compiler-version-enforcement as mongodb enforces
  gcc >= 8.2 since verson 4.1.8 and
  https://github.com/mongodb/mongo/commit/9ac90b128ebeb1bb431ebe3fe9176cb6142818cb
- Explictly disable ssl if needed as ssl is enabled by default
- Add host-python-cheetah3 dependency if needed
- Manage new http-client option added in version 4.1.2 and
  https://github.com/mongodb/mongo/commit/4d7dcca91bc2bbde65843fe88c41fa040e0d1877
- Add a patch to fix build with system libraries

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Titouan: Fix patch conflicts with master]
Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 ...0002-fix-build-with-system-libraries.patch | 64 +++++++++++++++++++
 package/mongodb/Config.in                     |  8 +--
 package/mongodb/mongodb.hash                  |  2 +-
 package/mongodb/mongodb.mk                    | 23 ++++---
 4 files changed, 83 insertions(+), 14 deletions(-)
 create mode 100644 package/mongodb/0002-fix-build-with-system-libraries.patch

diff --git a/package/mongodb/0002-fix-build-with-system-libraries.patch b/package/mongodb/0002-fix-build-with-system-libraries.patch
new file mode 100644
index 0000000000..cf8b69d221
--- /dev/null
+++ b/package/mongodb/0002-fix-build-with-system-libraries.patch
@@ -0,0 +1,64 @@
+From 40c7112d346721a57a134bd7b3d87d797d9c1a55 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 27 Apr 2019 10:55:05 +0200
+Subject: [PATCH] fix build with system libraries
+
+Since commit 66430d75e33827da60195deb317058c71f75e03f which replaced all
+InjectThirdPartyIncludePaths calls by InjectThirdParty calls, building
+with system libraries such as --use-system-boost will fail on:
+
+KeyError: 'boost':
+  File "/home/fabrice/buildroot/output/build/mongodb-r4.1.10/SConstruct", line 3876:
+    variant_dir='$BUILD_DIR',
+  File "/home/fabrice/buildroot/output/host/lib/scons-3.0.5/SCons/Script/SConscript.py", line 605:
+    return _SConscript(self.fs, *files, **subst_kw)
+  File "/home/fabrice/buildroot/output/host/lib/scons-3.0.5/SCons/Script/SConscript.py", line 286:
+    exec(compile(scriptdata, scriptname, 'exec'), call_stack[-1].globals)
+  File "/home/fabrice/buildroot/output/build/mongodb-r4.1.10/src/SConscript", line 12:
+    env.SConscript('third_party/SConscript', exports=['env'])
+  File "/home/fabrice/buildroot/output/host/lib/scons-3.0.5/SCons/Script/SConscript.py", line 605:
+    return _SConscript(self.fs, *files, **subst_kw)
+  File "/home/fabrice/buildroot/output/host/lib/scons-3.0.5/SCons/Script/SConscript.py", line 286:
+    exec(compile(scriptdata, scriptname, 'exec'), call_stack[-1].globals)
+  File "/home/fabrice/buildroot/output/build/mongodb-r4.1.10/src/third_party/SConscript", line 161:
+    murmurEnv.SConscript('murmurhash3/SConscript', exports={ 'env' : murmurEnv })
+  File "/home/fabrice/buildroot/output/host/lib/scons-3.0.5/SCons/Script/SConscript.py", line 605:
+    return _SConscript(self.fs, *files, **subst_kw)
+  File "/home/fabrice/buildroot/output/host/lib/scons-3.0.5/SCons/Script/SConscript.py", line 286:
+    exec(compile(scriptdata, scriptname, 'exec'), call_stack[-1].globals)
+  File "/home/fabrice/buildroot/output/build/mongodb-r4.1.10/src/third_party/murmurhash3/SConscript", line 5:
+    env.InjectThirdParty(libraries=['boost'])
+  File "/home/fabrice/buildroot/output/host/lib/scons-3.0.5/SCons/Environment.py", line 224:
+    return self.method(*nargs, **kwargs)
+  File "/home/fabrice/buildroot/output/build/mongodb-r4.1.10/src/third_party/SConscript", line 148:
+    mods = thirdPartyEnvironmentModifications[lib]
+
+This is due to the fact that boost is not added as an element of
+thirdPartyEnvironmentModification if --use-system-boost is set
+
+To fix this error, catch the KeyError
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/third_party/SConscript | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/third_party/SConscript b/src/third_party/SConscript
+index c129f6765e..089dad7579 100644
+--- a/src/third_party/SConscript
++++ b/src/third_party/SConscript
+@@ -183,7 +183,10 @@ def injectThirdParty(thisEnv, libraries=[], parts=[]):
+     libraries = thisEnv.Flatten([libraries])
+     parts = thisEnv.Flatten([parts])
+     for lib in libraries:
+-        mods = thirdPartyEnvironmentModifications[lib]
++        try:
++            mods = thirdPartyEnvironmentModifications[lib]
++        except KeyError:
++            continue
+         if not parts:
+             thisEnv.PrependUnique(**mods)
+         else:
+-- 
+2.20.1
+
diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 9c5dba8347..493c592413 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -8,12 +8,11 @@ config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
 config BR2_PACKAGE_MONGODB
 	bool "mongodb"
 	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_USES_GLIBC # needs glibc malloc_usable_size
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_IOSTREAMS
@@ -35,9 +34,8 @@ config BR2_PACKAGE_MONGODB
 
 	  https://www.mongodb.org/
 
-comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 6"
+comment "mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >= 7"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_PYTHON3
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index f08ffffe3b..c22091151e 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 b39c5b7bb77a547804ab6f43f9b5f09add47574356b31512fd1cc641a08b4ea5  mongodb-r4.0.12.tar.gz
+sha256 b6e0cd151f95728276a02a9b0d86a1582b1b30d5763fd6b5c0e1a0c488e7bc67  mongodb-r4.1.10.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
 sha256 09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 22ca920e12..03c7267358 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION_BASE = 4.0.12
+MONGODB_VERSION_BASE = 4.1.10
 MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 
@@ -13,9 +13,9 @@ MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
 
 MONGODB_DEPENDENCIES = \
 	boost \
-	host-python-cheetah \
+	host-python-cheetah3 \
+	host-python-psutil \
 	host-python-pyyaml \
-	host-python-typing \
 	host-scons \
 	pcre \
 	snappy \
@@ -29,6 +29,7 @@ MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
 	-j"$(PARALLEL_JOBS)"
 
 MONGODB_SCONS_OPTS = \
+	--disable-minimum-compiler-version-enforcement \
 	--disable-warnings-as-errors \
 	--use-system-boost \
 	--use-system-pcre \
@@ -60,21 +61,27 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 MONGODB_DEPENDENCIES += libcurl
-MONGODB_SCONS_OPTS += --enable-free-mon=on
+MONGODB_SCONS_OPTS += \
+	--enable-free-mon=on \
+	--enable-http-client=on
 else
-MONGODB_SCONS_OPTS += --enable-free-mon=off
+MONGODB_SCONS_OPTS += \
+	--enable-free-mon=off \
+	--enable-http-client=off
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGODB_DEPENDENCIES += openssl
 MONGODB_SCONS_OPTS += \
-	--ssl \
+	--ssl=on \
 	--ssl-provider=openssl
+else
+MONGODB_SCONS_OPTS += --ssl=off
 endif
 
 define MONGODB_BUILD_CMDS
 	(cd $(@D); \
-		$(HOST_DIR)/bin/python $(SCONS) \
+		$(HOST_DIR)/bin/python3 $(SCONS) \
 		$(MONGODB_SCONS_ENV) \
 		$(MONGODB_SCONS_OPTS) \
 		$(MONGODB_SCONS_TARGETS))
@@ -82,7 +89,7 @@ endef
 
 define MONGODB_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-		$(HOST_DIR)/bin/python $(SCONS) \
+		$(HOST_DIR)/bin/python3 $(SCONS) \
 		$(MONGODB_SCONS_ENV) \
 		$(MONGODB_SCONS_OPTS) \
 		--prefix=$(TARGET_DIR)/usr \
-- 
2.21.0
