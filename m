From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 22:06:33 +0100
Subject: [Buildroot] [git commit] package/nodejs: bump version to 7.7.2
Message-ID: <20170314215450.13FE8825C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30e562d0e0c8837241283302c23905a3b4ef4672
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v7.7.2/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...001-check-if-uclibc-has-backtrace-support.patch | 26 ++++++++++++
 .../0001-gyp-force-link-command-to-use-CXX.patch   | 29 -------------
 ...-don-t-build-when-ssl-support-is-disabled.patch | 35 ----------------
 ...-HAVE_OPENSSL-directive-to-openssl_config.patch | 47 ++++++++++++++++++++++
 package/nodejs/nodejs.hash                         |  4 +-
 package/nodejs/nodejs.mk                           |  7 +++-
 6 files changed, 81 insertions(+), 67 deletions(-)

diff --git a/package/nodejs/0001-check-if-uclibc-has-backtrace-support.patch b/package/nodejs/0001-check-if-uclibc-has-backtrace-support.patch
new file mode 100644
index 0000000..079bbb4
--- /dev/null
+++ b/package/nodejs/0001-check-if-uclibc-has-backtrace-support.patch
@@ -0,0 +1,26 @@
+From 7c69553d7275bbcaa88fada8ccd0d2d9f787e1ad Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Sat, 4 Mar 2017 20:41:40 +0000
+Subject: [PATCH] check if uclibc has backtrace support
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ deps/v8/src/base/debug/stack_trace_posix.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/v8/src/base/debug/stack_trace_posix.cc b/deps/v8/src/base/debug/stack_trace_posix.cc
+index 87c0a73..d2c182a 100644
+--- a/deps/v8/src/base/debug/stack_trace_posix.cc
++++ b/deps/v8/src/base/debug/stack_trace_posix.cc
+@@ -25,7 +25,7 @@
+ #include <string>
+ #include <vector>
+ 
+-#if V8_LIBC_GLIBC || V8_LIBC_BSD || V8_LIBC_UCLIBC || V8_OS_SOLARIS
++#if V8_LIBC_GLIBC || V8_LIBC_BSD || ( V8_LIBC_UCLIBC && __UCLIBC_HAS_BACKTRACE__ ) || V8_OS_SOLARIS
+ #define HAVE_EXECINFO_H 1
+ #endif
+ 
+-- 
+2.7.4
+
diff --git a/package/nodejs/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0001-gyp-force-link-command-to-use-CXX.patch
deleted file mode 100644
index 5746582..0000000
--- a/package/nodejs/0001-gyp-force-link-command-to-use-CXX.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 90a3c113c19ec615249ab880c45c6c0a8d369098 Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Tue, 30 Jun 2015 09:43:47 +0100
-Subject: [PATCH 2/4] gyp: force link command to use CXX
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Martin Bark <martin@barkynet.com>
-[yann.morin.1998 at free.fr: adapt to 4.1.2]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- tools/gyp/pylib/gyp/generator/make.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/gyp/pylib/gyp/generator/make.py b/tools/gyp/pylib/gyp/generator/make.py
-index b88a433..0a1f2e0 100644
---- a/tools/gyp/pylib/gyp/generator/make.py
-+++ b/tools/gyp/pylib/gyp/generator/make.py
-@@ -142,7 +142,7 @@ cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)
- # special "figure out circular dependencies" flags around the entire
- # input list during linking.
- quiet_cmd_link = LINK($(TOOLSET)) $@
--cmd_link = $(LINK.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
-+cmd_link = $(CXX.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
- 
- # We support two kinds of shared objects (.so):
- # 1) shared_library, which is just bundling together many dependent libraries
--- 
-2.1.4
-
diff --git a/package/nodejs/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
deleted file mode 100644
index c07cbf8..0000000
--- a/package/nodejs/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7fa541f6c0a31e3ddcab6ea85040b531bbaa4651 Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Tue, 12 Jul 2016 19:03:28 +0100
-Subject: [PATCH] inspector: don't build when ssl support is disabled
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- node.gyp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/node.gyp b/node.gyp
-index 8a8bd00..fdccd60 100644
---- a/node.gyp
-+++ b/node.gyp
-@@ -302,7 +302,7 @@
-             'deps/v8/src/third_party/vtune/v8vtune.gyp:v8_vtune'
-           ],
-         }],
--        [ 'v8_inspector=="true"', {
-+        [ 'v8_inspector=="true" and node_use_openssl =="true"', {
-           'defines': [
-             'HAVE_INSPECTOR=1',
-             'V8_INSPECTOR_USE_STL=1',
-@@ -828,7 +828,7 @@
-       ],
- 
-       'conditions': [
--        ['v8_inspector=="true"', {
-+        ['v8_inspector=="true" and node_use_openssl =="true"', {
-           'sources': [
-             'src/inspector_socket.cc',
-             'test/cctest/test_inspector_socket.cc'
--- 
-2.7.4
-
diff --git a/package/nodejs/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch b/package/nodejs/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
new file mode 100644
index 0000000..c28b967
--- /dev/null
+++ b/package/nodejs/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
@@ -0,0 +1,47 @@
+From bfc6d25318e3bbf3d9c0389b33ad45ae1bc401f0 Mon Sep 17 00:00:00 2001
+From: Daniel Bevenius <daniel.bevenius@gmail.com>
+Date: Tue, 28 Feb 2017 20:04:12 +0100
+Subject: [PATCH] src: add HAVE_OPENSSL directive to openssl_config
+
+Currently when building with the following configuration options:
+$ ./configure --without-ssl && make
+
+The following link error is reported:
+
+Undefined symbols for architecture x86_64:
+  "node::openssl_config", referenced from:
+      node::Init(int*, char const**, int*, char const***) in node.o
+ld: symbol(s) not found for architecture x86_64
+clang: error: linker command failed with exit code 1 (use -v to see
+invocation)
+
+Adding an HAVE_OPENSSL directive around this code allows the build to
+pass.
+
+PR-URL: https://github.com/nodejs/node/pull/11618
+Reviewed-By: Anna Henningsen <anna@addaleax.net>
+Reviewed-By: James M Snell <jasnell@gmail.com>
+Reviewed-By: Colin Ihrig <cjihrig@gmail.com>
+Reviewed-By: Ben Noordhuis <info@bnoordhuis.nl>
+Reviewed-By: Sam Roberts <vieuxtech@gmail.com>
+[Martin: patch from https://github.com/nodejs/node/pull/11734]
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ src/node.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/node.cc b/src/node.cc
+index 35d29bd..68362a7 100644
+--- a/src/node.cc
++++ b/src/node.cc
+@@ -4203,8 +4203,10 @@ void Init(int* argc,
+         SafeGetenv("NODE_PRESERVE_SYMLINKS", &text) && text[0] == '1';
+   }
+ 
++#if HAVE_OPENSSL
+   if (openssl_config.empty())
+     SafeGetenv("OPENSSL_CONF", &openssl_config);
++#endif
+ 
+   // Parse a few arguments which are specific to Node.
+   int v8_argc;
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 02ad8f3..f0a4968 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v6.9.4/SHASUMS256.txt
-sha256  c51d7c61db40455d57428abcadc7eb0f0a08a8878cb1d8ea3c1e211c54532c35  node-v6.9.4.tar.xz
+# From upstream URL: http://nodejs.org/dist/v7.7.2/SHASUMS256.txt
+sha256  e7448d8e44d32c2c63347c822508cf5c87b9662c07db290056fec66d37c4f584  node-v7.7.2.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 858626a..0db97e8 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 6.9.4
+NODEJS_VERSION = 7.7.2
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
@@ -76,6 +76,8 @@ define HOST_NODEJS_INSTALL_CMDS
 		$(MAKE) -C $(@D) install \
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH)
+
+	$(INSTALL) -m755 -D $(@D)/out/Release/mkpeephole $(HOST_DIR)/usr/bin/mkpeephole
 endef
 
 ifeq ($(BR2_i386),y)
@@ -123,6 +125,9 @@ define NODEJS_CONFIGURE_CMDS
 		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
 		$(NODEJS_CONF_OPTS) \
 	)
+
+	# use host version of mkpeephole
+	sed "s#<(mkpeephole_exec)#$(HOST_DIR)/usr/bin/mkpeephole#g" -i $(@D)/deps/v8/src/v8.gyp
 endef
 
 define NODEJS_BUILD_CMDS
