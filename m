From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Oct 2015 09:55:06 +0200
Subject: [Buildroot] [git commit] package/nodejs: add version 4.1.2
Message-ID: <20151020075546.83B5F8040A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=827c9d2bdda929411f7fdc8a304cabd6b9c6585e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We add a new version, because it is not API-compatible with the previous
versions.

Also, nodejs-4.1.2 requires gcc >= 4.8.

Forward-port patches from 0.12.7:
  - 0001-Remove-dependency-on-Python-bz2-module.patch partially applied
    upstream;
  - 0002-gyp-force-link-command-to-use-CXX.patch slightly refreshed;
  - 0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
    largely refreshed to address new occurences of hard-coded calls;
  - 0004-fix-build-error-without-OpenSSL-support.patch applied upstream
  - 0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch
    applied upstream.

New patch:
  - 0004-fix-arm-vfpv2.patch to fix the gcc -mfpu option for VFPv2.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Cc: Martin Bark <martin@barkynet.com>
Cc: Jaap Crezee <jaap@jcz.nl>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-Remove-dependency-on-Python-bz2-module.patch |   31 +++++++
 .../0002-gyp-force-link-command-to-use-CXX.patch   |   29 +++++++
 ...hon-variable-instead-of-hardcoding-Python.patch |   88 ++++++++++++++++++++
 package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch      |   18 ++++
 package/nodejs/Config.in                           |   12 +++-
 package/nodejs/nodejs.hash                         |    3 +
 package/nodejs/nodejs.mk                           |    4 +
 7 files changed, 184 insertions(+), 1 deletions(-)

diff --git a/package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch
new file mode 100644
index 0000000..65bceef
--- /dev/null
+++ b/package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch
@@ -0,0 +1,31 @@
+From 3d4817c152d6f3afddcc699949c4d1664da91e2b Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 30 Jun 2015 09:43:11 +0100
+Subject: [PATCH 1/4] Remove dependency on Python bz2 module
+
+Do not import the bz2 module, it is not used.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Martin: adapt to 0.12.5]
+Signed-off-by: Martin Bark <martin@barkynet.com>
+[yann.morin.1998 at free.fr: adapt to 4.1.2]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
+-- 
+2.1.4
+
diff --git a/package/nodejs/4.1.2/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/4.1.2/0002-gyp-force-link-command-to-use-CXX.patch
new file mode 100644
index 0000000..5746582
--- /dev/null
+++ b/package/nodejs/4.1.2/0002-gyp-force-link-command-to-use-CXX.patch
@@ -0,0 +1,29 @@
+From 90a3c113c19ec615249ab880c45c6c0a8d369098 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 30 Jun 2015 09:43:47 +0100
+Subject: [PATCH 2/4] gyp: force link command to use CXX
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Martin Bark <martin@barkynet.com>
+[yann.morin.1998 at free.fr: adapt to 4.1.2]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ tools/gyp/pylib/gyp/generator/make.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/gyp/pylib/gyp/generator/make.py b/tools/gyp/pylib/gyp/generator/make.py
+index b88a433..0a1f2e0 100644
+--- a/tools/gyp/pylib/gyp/generator/make.py
++++ b/tools/gyp/pylib/gyp/generator/make.py
+@@ -142,7 +142,7 @@ cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)
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
diff --git a/package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
new file mode 100644
index 0000000..2e266af
--- /dev/null
+++ b/package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
@@ -0,0 +1,88 @@
+From 4a48c65921b0f05b621aef5b902b6aa54811ad7a Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 30 Jun 2015 09:44:33 +0100
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
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Martin: adapt to 0.12.5]
+Signed-off-by: Martin Bark <martin@barkynet.com>
+[yann.morin.1998 at free.fr: adapat to 4.1.2]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ deps/v8/tools/gyp/v8.gyp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/deps/v8/tools/gyp/v8.gyp b/deps/v8/tools/gyp/v8.gyp
+index c703155..06c0b2b 100644
+--- a/deps/v8/tools/gyp/v8.gyp
++++ b/deps/v8/tools/gyp/v8.gyp
+@@ -1696,14 +1696,14 @@
+                       '<(PRODUCT_DIR)/natives_blob_host.bin',
+                     ],
+                     'action': [
+-                      'python', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob_host.bin'
++                      '<(python)', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob_host.bin'
+                     ],
+                   }, {
+                     'outputs': [
+                       '<(PRODUCT_DIR)/natives_blob.bin',
+                     ],
+                     'action': [
+-                      'python', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob.bin'
++                      '<(python)', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob.bin'
+                     ],
+                   }],
+                 ],
+@@ -1712,7 +1712,7 @@
+                   '<(PRODUCT_DIR)/natives_blob.bin',
+                 ],
+                 'action': [
+-                  'python', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob.bin'
++                  '<(python)', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob.bin'
+                 ],
+               }],
+             ],
+@@ -1812,7 +1812,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
+           ],
+           'action': [
+-            'python',
++            '<(python)',
+             '../../tools/js2c.py',
+             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
+             'CORE',
+@@ -1838,7 +1838,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
+           ],
+           'action': [
+-            'python',
++            '<(python)',
+             '../../tools/js2c.py',
+             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
+             'EXPERIMENTAL',
+@@ -1863,7 +1863,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/extras-libraries.cc',
+           ],
+           'action': [
+-            'python',
++            '<(python)',
+             '../../tools/js2c.py',
+             '<(SHARED_INTERMEDIATE_DIR)/extras-libraries.cc',
+             'EXTRAS',
+@@ -1900,7 +1900,7 @@
+               '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
+             ],
+             'action': [
+-              'python',
++              '<(python)',
+               '../../tools/gen-postmortem-metadata.py',
+               '<@(_outputs)',
+               '<@(heapobject_files)'
diff --git a/package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch b/package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch
new file mode 100644
index 0000000..b753dfe
--- /dev/null
+++ b/package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch
@@ -0,0 +1,18 @@
+configure: fix ARM VFPv2
+
+The gcc -mfpu flag for VFPv2 is 'vfp', not 'vfpv2'.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN a/configure b/configure
+--- a/configure
++++ b/configure
+@@ -611,7 +611,7 @@
+     o['variables']['arm_fpu'] = 'vfpv3'
+     o['variables']['arm_version'] = '7'
+   else:
+-    o['variables']['arm_fpu'] = 'vfpv2'
++    o['variables']['arm_fpu'] = 'vfp'
+     o['variables']['arm_version'] = '6' if is_arch_armv6() else 'default'
+ 
+   o['variables']['arm_thumb'] = 0      # -marm
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 034557b..5128901 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -37,7 +37,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 choice
 	prompt "Node.js version"
 	default BR2_BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
-	default BR2_BR2_PACKAGE_NODEJS_0_12_X
+	default BR2_BR2_PACKAGE_NODEJS_4_X
 	help
 	  Select the version of Node.js you wish to use.
 
@@ -48,12 +48,22 @@ config BR2_BR2_PACKAGE_NODEJS_0_12_X
 	bool "v0.12.7"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
+config BR2_BR2_PACKAGE_NODEJS_4_X
+	bool "v4.1.2"
+	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "v4.1.2 needs a toolchain w/ gcc >= 4.8"
+	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endchoice
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "0.10.40"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
 	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
+	default "4.1.2"		if BR2_BR2_PACKAGE_NODEJS_4_X
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 9be2806..ab506df 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -3,3 +3,6 @@ sha256	bae79c2fd959aebe1629af36077bebbb760128db753da226d2344cd91499149f  node-v0
 
 # From upstream URL: http://nodejs.org/dist/v0.12.7/SHASUMS256.txt
 sha256	b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d  node-v0.12.7.tar.gz
+
+# From upstream URL: http://nodejs.org/dist/v4.1.2/SHASUMS256.txt
+sha256  443c8251e812b1f2c4b3e9152a47df23c55567ade739e017e2c0ca0869b71e74  node-v4.1.2.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 414f3f3..099b3f0 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,11 @@
 ################################################################################
 
 NODEJS_VERSION = $(call qstrip,$(BR2_PACKAGE_NODEJS_VERSION_STRING))
+ifeq ($(BR2_BR2_PACKAGE_NODEJS_4_X),y)
+NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
+else
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
+endif
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
