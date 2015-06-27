From: Martin Bark <martin@barkynet.com>
Date: Sat, 27 Jun 2015 03:01:35 +0100
Subject: [Buildroot] [v2 3/6] package/nodejs: Add node.js v0.12.5 and set as
	the default version
In-Reply-To: <1435370498-25473-1-git-send-email-martin@barkynet.com>
References: <1435370498-25473-1-git-send-email-martin@barkynet.com>
Message-ID: <1435370498-25473-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changed v1 -> v2
 - Added depends on !BR2_ARM_CPU_ARMV5
 - Updated from node.js v0.12.4 to v0.12.5

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 ...01-Remove-dependency-on-Python-bz2-module.patch | 38 +++++++++++++
 .../0002-gyp-force-link-command-to-use-CXX.patch   | 27 ++++++++++
 ...hon-variable-instead-of-hardcoding-Python.patch | 62 ++++++++++++++++++++++
 ...4-fix-build-error-without-OpenSSL-support.patch | 45 ++++++++++++++++
 package/nodejs/Config.in                           |  8 ++-
 package/nodejs/nodejs.hash                         |  3 ++
 6 files changed, 182 insertions(+), 1 deletion(-)
 create mode 100644 package/nodejs/0.12.5/0001-Remove-dependency-on-Python-bz2-module.patch
 create mode 100644 package/nodejs/0.12.5/0002-gyp-force-link-command-to-use-CXX.patch
 create mode 100644 package/nodejs/0.12.5/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
 create mode 100644 package/nodejs/0.12.5/0004-fix-build-error-without-OpenSSL-support.patch

diff --git a/package/nodejs/0.12.5/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/0.12.5/0001-Remove-dependency-on-Python-bz2-module.patch
new file mode 100644
index 0000000..d2cb0b7
--- /dev/null
+++ b/package/nodejs/0.12.5/0001-Remove-dependency-on-Python-bz2-module.patch
@@ -0,0 +1,38 @@
+From 2f57d17b8b1a8cb78bd9cff874a006adba3afd4a Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Thu, 11 Jun 2015 20:05:11 +0100
+Subject: [PATCH 1/4] Remove dependency on Python bz2 module
+
+The Python bz2 module is only needed in certain cases, so only import
+it when needed. In the normal nodejs build, this allows to remove the
+dependency on this module.
+
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ deps/v8/tools/js2c.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/v8/tools/js2c.py b/deps/v8/tools/js2c.py
+index 77485f6..371caf5 100755
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
+@@ -492,6 +491,7 @@ def CompressMaybe(sources, compression_type):
+   if compression_type == "off":
+     return sources_bytes
+   elif compression_type == "bz2":
++    import bz2
+     return bz2.compress(sources_bytes)
+   else:
+     raise Error("Unknown compression type %s." % compression_type)
+-- 
+2.1.4
+
diff --git a/package/nodejs/0.12.5/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.12.5/0002-gyp-force-link-command-to-use-CXX.patch
new file mode 100644
index 0000000..ef86e5f
--- /dev/null
+++ b/package/nodejs/0.12.5/0002-gyp-force-link-command-to-use-CXX.patch
@@ -0,0 +1,27 @@
+From 04bda7143f7ea6c6e6b659b73547b463f7e28c65 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Thu, 11 Jun 2015 19:27:46 +0100
+Subject: [PATCH 2/4] gyp: force link command to use CXX
+
+Cc: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ tools/gyp/pylib/gyp/generator/make.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/gyp/pylib/gyp/generator/make.py b/tools/gyp/pylib/gyp/generator/make.py
+index b88a433..0a1f2e0 100644
+--- a/tools/gyp/pylib/gyp/generator/make.py
++++ b/tools/gyp/pylib/gyp/generator/make.py
+@@ -141,7 +141,7 @@ cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)
+ # special "figure out circular dependencies" flags around the entire
+ # input list during linking.
+ quiet_cmd_link = LINK($(TOOLSET)) $@
+-cmd_link = $(LINK.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
++cmd_link = $(CXX.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
+ 
+ # We support two kinds of shared objects (.so):
+ # 1) shared_library, which is just bundling together many dependent libraries
+-- 
+2.1.4
+
diff --git a/package/nodejs/0.12.5/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/0.12.5/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
new file mode 100644
index 0000000..0a21a61
--- /dev/null
+++ b/package/nodejs/0.12.5/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
@@ -0,0 +1,62 @@
+From d6cc10f0765c97c402b1c1be0968f9d9eb112da9 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Thu, 11 Jun 2015 19:25:09 +0100
+Subject: [PATCH 3/4] Use a python variable instead of hardcoding Python
+
+The nodejs build system uses python in a number of locations. However,
+there are some locations where it hardcodes 'python' as the Python
+interpreter. However, this causes problems when we need to use python2
+instead of just python.
+
+This patch fixes that by using the python variable already in place in
+the nodejs build system.
+
+Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ deps/v8/tools/gyp/v8.gyp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/deps/v8/tools/gyp/v8.gyp b/deps/v8/tools/gyp/v8.gyp
+index c703155..06c0b2b 100644
+--- a/deps/v8/tools/gyp/v8.gyp
++++ b/deps/v8/tools/gyp/v8.gyp
+@@ -1353,7 +1353,7 @@
+             'outputs': [
+               '<(PRODUCT_DIR)/natives_blob.bin',
+             ],
+-            'action': ['python', '<@(_inputs)', '<@(_outputs)'],
++            'action': ['<(python)', '<@(_inputs)', '<@(_outputs)'],
+           }],
+         }],
+         ['want_separate_host_toolset==1', {
+@@ -1435,7 +1435,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
+           ],
+           'action': [
+-            'python',
++            '<(python)',
+             '../../tools/js2c.py',
+             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
+             'CORE',
+@@ -1462,7 +1462,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
+           ],
+           'action': [
+-            'python',
++            '<(python)',
+             '../../tools/js2c.py',
+             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
+             'EXPERIMENTAL',
+@@ -1500,7 +1500,7 @@
+               '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
+             ],
+             'action': [
+-              'python',
++              '<(python)',
+               '../../tools/gen-postmortem-metadata.py',
+               '<@(_outputs)',
+               '<@(heapobject_files)'
+-- 
+2.1.4
+
diff --git a/package/nodejs/0.12.5/0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.12.5/0004-fix-build-error-without-OpenSSL-support.patch
new file mode 100644
index 0000000..aab6a31
--- /dev/null
+++ b/package/nodejs/0.12.5/0004-fix-build-error-without-OpenSSL-support.patch
@@ -0,0 +1,45 @@
+From ce288a677d89c72c2f4cd832dc4afb2e21ae060e Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Thu, 11 Jun 2015 19:57:40 +0100
+Subject: [PATCH 4/4] fix build error without OpenSSL support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Cc: J?rg Krause <jkrause@posteo.de>
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ src/node.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/node.cc b/src/node.cc
+index e669706..d43b791 100644
+--- a/src/node.cc
++++ b/src/node.cc
+@@ -2934,8 +2934,10 @@ static void PrintHelp() {
+          "                       present.\n"
+ #endif
+ #endif
++#if HAVE_OPENSSL
+          "  --enable-ssl2        enable ssl2\n"
+          "  --enable-ssl3        enable ssl3\n"
++#endif
+          "\n"
+          "Environment variables:\n"
+ #ifdef _WIN32
+@@ -3003,10 +3005,12 @@ static void ParseArgs(int* argc,
+     } else if (strcmp(arg, "--version") == 0 || strcmp(arg, "-v") == 0) {
+       printf("%s\n", NODE_VERSION);
+       exit(0);
++#if HAVE_OPENSSL
+     } else if (strcmp(arg, "--enable-ssl2") == 0) {
+       SSL2_ENABLE = true;
+     } else if (strcmp(arg, "--enable-ssl3") == 0) {
+       SSL3_ENABLE = true;
++#endif
+     } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
+       PrintHelp();
+       exit(0);
+-- 
+2.1.4
+
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 61419fd..8a8de94 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -24,18 +24,24 @@ if BR2_PACKAGE_NODEJS
 
 choice
 	prompt "Node.js Version"
-	default BR2_BR2_PACKAGE_NODEJS_0_10_39
+	default BR2_BR2_PACKAGE_NODEJS_0_12_5
 	help
 	  Select the version of Node.js you wish to use.
 
 	config BR2_BR2_PACKAGE_NODEJS_0_10_39
 		bool "v0.10.39"
 
+	config BR2_BR2_PACKAGE_NODEJS_0_12_5
+		# Needs minimum of ARMv6 with VFPv2
+		depends on !BR2_ARM_CPU_ARMV5
+		bool "v0.12.5"
 endchoice
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "0.10.39"	if BR2_BR2_PACKAGE_NODEJS_0_10_39
+	default "0.12.5"	if BR2_BR2_PACKAGE_NODEJS_0_12_5
+
 menu "Module Selection"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index bc1f15f..816d602 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.39/SHASUMS256.txt
 sha256	68f8d8f9515c4e77e2a06034b742e19e9848c1fee5bcadedc1d68f3e4302df37  node-v0.10.39.tar.gz
+
+# From upstream URL: http://nodejs.org/dist/v0.12.5/SHASUMS256.txt
+sha256	4bc1e25f4c62ac65324d3cf4aa9de2d801cd708757c3567b6ad2ced7df30cdd2  node-v0.12.5.tar.gz
-- 
2.1.4
