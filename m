From: Martin Bark <martin@barkynet.com>
Date: Thu, 17 Dec 2015 23:20:23 +0000
Subject: [Buildroot] [PATCH v2 2/5] package/nodejs: removed version 0.12.9
In-Reply-To: <1450394426-3349-1-git-send-email-martin@barkynet.com>
References: <1450394426-3349-1-git-send-email-martin@barkynet.com>
Message-ID: <1450394426-3349-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0.12.9 to rationalise the number of nodejs releases supported by
buildroot.  Going forward buildroot will only support the latest release
of nodejs and the 0.10.x branch for armv5 support.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - New in v2
---
 Config.in.legacy                                   |  9 ++++
 ...01-Remove-dependency-on-Python-bz2-module.patch | 39 --------------
 .../0002-gyp-force-link-command-to-use-CXX.patch   | 27 ----------
 ...hon-variable-instead-of-hardcoding-Python.patch | 63 ----------------------
 ...c-fix-build-error-without-OpenSSL-support.patch | 44 ---------------
 ...or-arm-predefined-macro-in-atomicops_inte.patch | 30 -----------
 package/nodejs/Config.in                           |  5 --
 package/nodejs/nodejs.hash                         |  3 --
 8 files changed, 9 insertions(+), 211 deletions(-)
 delete mode 100644 package/nodejs/0.12.9/0001-Remove-dependency-on-Python-bz2-module.patch
 delete mode 100644 package/nodejs/0.12.9/0002-gyp-force-link-command-to-use-CXX.patch
 delete mode 100644 package/nodejs/0.12.9/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
 delete mode 100644 package/nodejs/0.12.9/0004-src-fix-build-error-without-OpenSSL-support.patch
 delete mode 100644 package/nodejs/0.12.9/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index ee67720..db1eeae 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -186,6 +186,15 @@ config BR2_PACKAGE_INFOZIP
 	  to avoid ambiguities with Info-Zip's UnZip which has been added
 	  in the unzip package.
 
+config BR2_BR2_PACKAGE_NODEJS_0_12_X
+	bool "nodejs version 0.12.x has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_NODEJS
+	help
+	  nodejs version 0.12.x has been removed.  As an alternative,
+	  the latest nodejs version has been automatically selected in
+	  your configuration.
+
 config BR2_BR2_PACKAGE_NODEJS_4_X
 	bool "nodejs version 4.x has been removed"
 	select BR2_LEGACY
diff --git a/package/nodejs/0.12.9/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/0.12.9/0001-Remove-dependency-on-Python-bz2-module.patch
deleted file mode 100644
index 24a78a4..0000000
--- a/package/nodejs/0.12.9/0001-Remove-dependency-on-Python-bz2-module.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3d4817c152d6f3afddcc699949c4d1664da91e2b Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Tue, 30 Jun 2015 09:43:11 +0100
-Subject: [PATCH 1/4] Remove dependency on Python bz2 module
-
-The Python bz2 module is only needed in certain cases, so only import
-it when needed. In the normal nodejs build, this allows to remove the
-dependency on this module.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Martin: adapt to 0.12.5]
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- deps/v8/tools/js2c.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/v8/tools/js2c.py b/deps/v8/tools/js2c.py
-index 77485f6..371caf5 100755
---- a/deps/v8/tools/js2c.py
-+++ b/deps/v8/tools/js2c.py
-@@ -34,7 +34,6 @@
- import os, re, sys, string
- import optparse
- import jsmin
--import bz2
- import textwrap
- 
- 
-@@ -492,6 +491,7 @@ def CompressMaybe(sources, compression_type):
-   if compression_type == "off":
-     return sources_bytes
-   elif compression_type == "bz2":
-+    import bz2
-     return bz2.compress(sources_bytes)
-   else:
-     raise Error("Unknown compression type %s." % compression_type)
--- 
-2.1.4
-
diff --git a/package/nodejs/0.12.9/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.12.9/0002-gyp-force-link-command-to-use-CXX.patch
deleted file mode 100644
index 3b007f1..0000000
--- a/package/nodejs/0.12.9/0002-gyp-force-link-command-to-use-CXX.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 90a3c113c19ec615249ab880c45c6c0a8d369098 Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Tue, 30 Jun 2015 09:43:47 +0100
-Subject: [PATCH 2/4] gyp: force link command to use CXX
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- tools/gyp/pylib/gyp/generator/make.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/gyp/pylib/gyp/generator/make.py b/tools/gyp/pylib/gyp/generator/make.py
-index b88a433..0a1f2e0 100644
---- a/tools/gyp/pylib/gyp/generator/make.py
-+++ b/tools/gyp/pylib/gyp/generator/make.py
-@@ -141,7 +141,7 @@ cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)
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
diff --git a/package/nodejs/0.12.9/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/0.12.9/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
deleted file mode 100644
index 37ceda3..0000000
--- a/package/nodejs/0.12.9/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 4a48c65921b0f05b621aef5b902b6aa54811ad7a Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Tue, 30 Jun 2015 09:44:33 +0100
-Subject: [PATCH 3/4] Use a python variable instead of hardcoding Python
-
-The nodejs build system uses python in a number of locations. However,
-there are some locations where it hardcodes 'python' as the Python
-interpreter. However, this causes problems when we need to use python2
-instead of just python.
-
-This patch fixes that by using the python variable already in place in
-the nodejs build system.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Martin: adapt to 0.12.5]
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- deps/v8/tools/gyp/v8.gyp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/deps/v8/tools/gyp/v8.gyp b/deps/v8/tools/gyp/v8.gyp
-index c703155..06c0b2b 100644
---- a/deps/v8/tools/gyp/v8.gyp
-+++ b/deps/v8/tools/gyp/v8.gyp
-@@ -1353,7 +1353,7 @@
-             'outputs': [
-               '<(PRODUCT_DIR)/natives_blob.bin',
-             ],
--            'action': ['python', '<@(_inputs)', '<@(_outputs)'],
-+            'action': ['<(python)', '<@(_inputs)', '<@(_outputs)'],
-           }],
-         }],
-         ['want_separate_host_toolset==1', {
-@@ -1435,7 +1435,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
-           ],
-           'action': [
--            'python',
-+            '<(python)',
-             '../../tools/js2c.py',
-             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
-             'CORE',
-@@ -1462,7 +1462,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
-           ],
-           'action': [
--            'python',
-+            '<(python)',
-             '../../tools/js2c.py',
-             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
-             'EXPERIMENTAL',
-@@ -1500,7 +1500,7 @@
-               '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
-             ],
-             'action': [
--              'python',
-+              '<(python)',
-               '../../tools/gen-postmortem-metadata.py',
-               '<@(_outputs)',
-               '<@(heapobject_files)'
--- 
-2.1.4
-
diff --git a/package/nodejs/0.12.9/0004-src-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.12.9/0004-src-fix-build-error-without-OpenSSL-support.patch
deleted file mode 100644
index 62966eb..0000000
--- a/package/nodejs/0.12.9/0004-src-fix-build-error-without-OpenSSL-support.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ba6142dbaebe06738686da150043abbd1ef1fbf5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Tue, 8 Dec 2015 21:22:45 +0100
-Subject: [PATCH] src: fix build error without OpenSSL support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-PR #3890 [1] introduced the variable ALLOW_INSECURE_SERVER_DHPARAM defined
-in src/node_crypto.cc. However, if nodejs is built without OpenSSL support,
-the build fails:
- error: ?ALLOW_INSECURE_SERVER_DHPARAM? was not declared in this scope
-       ALLOW_INSECURE_SERVER_DHPARAM = true;
-
-Fix this by using the preprocessor macro HAVE_OPENSSL to opt-out the use of
-ALLOW_INSECURE_SERVER_DHPARAM in non-OpenSSL builds.
-
-Patch status: Sent upstream [2]
-
-[1] https://github.com/nodejs/node/pull/3890
-[2] https://github.com/nodejs/node/pull/4201
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/node.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/node.cc b/src/node.cc
-index 1da8328..e5239ac 100644
---- a/src/node.cc
-+++ b/src/node.cc
-@@ -3042,7 +3042,9 @@ static void ParseArgs(int* argc,
-       SSL3_ENABLE = true;
- #endif
-     } else if (strcmp(arg, "--allow-insecure-server-dhparam") == 0) {
-+#if HAVE_OPENSSL
-       ALLOW_INSECURE_SERVER_DHPARAM = true;
-+#endif
-     } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
-       PrintHelp();
-       exit(0);
--- 
-2.6.3
-
diff --git a/package/nodejs/0.12.9/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch b/package/nodejs/0.12.9/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch
deleted file mode 100644
index 94d9eff..0000000
--- a/package/nodejs/0.12.9/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b7b69cdcdb4e2d80a85e303cc3230666d565bc39 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 11 Oct 2015 09:14:52 +0200
-Subject: [PATCH] Fix typo for arm predefined macro in
- atomicops_internals_arm_gcc.h
-
-Fix typo  __ARM_ARCH_6KZ__ vs.  __ARM_ARCH_6ZK__, fixes
-compile for raspberry pi.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- deps/v8/src/base/atomicops_internals_arm_gcc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/v8/src/base/atomicops_internals_arm_gcc.h b/deps/v8/src/base/atomicops_internals_arm_gcc.h
-index 069b1ff..b924981 100644
---- a/deps/v8/src/base/atomicops_internals_arm_gcc.h
-+++ b/deps/v8/src/base/atomicops_internals_arm_gcc.h
-@@ -63,7 +63,7 @@ inline void MemoryBarrier() {
-     defined(__ARM_ARCH_7R__) || defined(__ARM_ARCH_7M__) || \
-     defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6J__) || \
-     defined(__ARM_ARCH_6K__) || defined(__ARM_ARCH_6Z__) || \
--    defined(__ARM_ARCH_6KZ__) || defined(__ARM_ARCH_6T2__)
-+    defined(__ARM_ARCH_6ZK__) || defined(__ARM_ARCH_6T2__)
- 
- inline Atomic32 NoBarrier_CompareAndSwap(volatile Atomic32* ptr,
-                                          Atomic32 old_value,
--- 
-2.1.4
-
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 769710c..cba320c 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -44,10 +44,6 @@ choice
 config BR2_BR2_PACKAGE_NODEJS_0_10_X
 	bool "v0.10.41"
 
-config BR2_BR2_PACKAGE_NODEJS_0_12_X
-	bool "v0.12.9"
-	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-
 config BR2_PACKAGE_NODEJS_5_X
 	bool "v5.3.0"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
@@ -64,7 +60,6 @@ endchoice
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "0.10.41"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
-	default "0.12.9"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
 	default "5.3.0"		if BR2_PACKAGE_NODEJS_5_X
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index c3bdc44..dc56efa 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.41/SHASUMS256.txt
 sha256	79f694e2a5c42543b75d0c69f6860499d7593136d0f6b59e7163b9e66fb2c995  node-v0.10.41.tar.gz
 
-# From upstream URL: http://nodejs.org/dist/v0.12.9/SHASUMS256.txt
-sha256	35daad301191e5f8dd7e5d2fbb711d081b82d1837d59837b8ee224c256cfe5e4  node-v0.12.9.tar.gz
-
 # From upstream URL: http://nodejs.org/dist/v5.3.0/SHASUMS256.txt
 sha256  e5115ee78c31ac3af0f2b3553aa84fff2f49ae59bd6e01e11d78ce86c544569e  node-v5.3.0.tar.xz
-- 
2.5.0
