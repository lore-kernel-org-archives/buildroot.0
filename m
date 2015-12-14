From: Martin Bark <martin@barkynet.com>
Date: Mon, 14 Dec 2015 19:44:53 +0000
Subject: [Buildroot] [PATCH 1/3] package/nodejs: Add version 5.2.0
Message-ID: <1450122295-5311-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v5.2.0 is the current Stable release. See
https://nodejs.org/en/blog/release/v5.2.0 for details on the release.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 ...01-Remove-dependency-on-Python-bz2-module.patch |  31 +++++++
 .../0002-gyp-force-link-command-to-use-CXX.patch   |  29 ++++++
 ...hon-variable-instead-of-hardcoding-Python.patch | 101 +++++++++++++++++++++
 package/nodejs/5.2.0/0004-fix-arm-vfpv2.patch      |  46 ++++++++++
 .../5.2.0/0005-Fix-va_list-not-declared.patch      |  39 ++++++++
 package/nodejs/Config.in                           |  12 +++
 package/nodejs/nodejs.hash                         |   3 +
 package/nodejs/nodejs.mk                           |   2 +-
 8 files changed, 262 insertions(+), 1 deletion(-)
 create mode 100644 package/nodejs/5.2.0/0001-Remove-dependency-on-Python-bz2-module.patch
 create mode 100644 package/nodejs/5.2.0/0002-gyp-force-link-command-to-use-CXX.patch
 create mode 100644 package/nodejs/5.2.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
 create mode 100644 package/nodejs/5.2.0/0004-fix-arm-vfpv2.patch
 create mode 100644 package/nodejs/5.2.0/0005-Fix-va_list-not-declared.patch

diff --git a/package/nodejs/5.2.0/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/5.2.0/0001-Remove-dependency-on-Python-bz2-module.patch
new file mode 100644
index 0000000..65bceef
--- /dev/null
+++ b/package/nodejs/5.2.0/0001-Remove-dependency-on-Python-bz2-module.patch
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
diff --git a/package/nodejs/5.2.0/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/5.2.0/0002-gyp-force-link-command-to-use-CXX.patch
new file mode 100644
index 0000000..5746582
--- /dev/null
+++ b/package/nodejs/5.2.0/0002-gyp-force-link-command-to-use-CXX.patch
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
diff --git a/package/nodejs/5.2.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/5.2.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
new file mode 100644
index 0000000..3104644
--- /dev/null
+++ b/package/nodejs/5.2.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
@@ -0,0 +1,101 @@
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
+[yann.morin.1998 at free.fr: adapt to 4.1.2]
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
+diff --git a/deps/v8/build/toolchain.gypi b/deps/v8/build/toolchain.gypi
+index c703155..06c0b2b 100644
+--- a/deps/v8/build/toolchain.gypi
++++ b/deps/v8/build/toolchain.gypi
+@@ -38,7 +38,7 @@
+     'ubsan%': 0,
+     'ubsan_vptr%': 0,
+     'v8_target_arch%': '<(target_arch)',
+-    'v8_host_byteorder%': '<!(python -c "import sys; print sys.byteorder")',
++    'v8_host_byteorder%': '<!(<(python) -c "import sys; print sys.byteorder")',
+     # Native Client builds currently use the V8 ARM JIT and
+     # arm/simulator-arm.cc to defer the significant effort required
+     # for NaCl JIT support. The nacl_target_arch variable provides
diff --git a/package/nodejs/5.2.0/0004-fix-arm-vfpv2.patch b/package/nodejs/5.2.0/0004-fix-arm-vfpv2.patch
new file mode 100644
index 0000000..7ff280b
--- /dev/null
+++ b/package/nodejs/5.2.0/0004-fix-arm-vfpv2.patch
@@ -0,0 +1,46 @@
+From 0b07d813adcfdc13ef6a0c56f88b864eb3dc4be9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 8 Dec 2015 21:53:06 +0100
+Subject: [PATCH] configure: fix arm vfpv2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The gcc -mfpu flag for VFPv2 is 'vfp', not 'vfpv2' [1].
+
+Patch status: Sent upstream [2]
+
+[1] https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
+[2] https://github.com/nodejs/node/pull/4202
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[J?rg Krause: adapt to version 4.2.3]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index d4aff36..c783bab 100755
+--- a/configure
++++ b/configure
+@@ -30,7 +30,7 @@ valid_os = ('win', 'mac', 'solaris', 'freebsd', 'openbsd', 'linux',
+ valid_arch = ('arm', 'arm64', 'ia32', 'mips', 'mipsel', 'ppc', 'ppc64', 'x32',
+               'x64', 'x86')
+ valid_arm_float_abi = ('soft', 'softfp', 'hard')
+-valid_arm_fpu = ('vfp', 'vfpv2', 'vfpv3', 'vfpv3-d16', 'neon')
++valid_arm_fpu = ('vfp', 'vfpv3', 'vfpv3-d16', 'neon')
+ valid_mips_arch = ('loongson', 'r1', 'r2', 'r6', 'rx')
+ valid_mips_fpu = ('fp32', 'fp64', 'fpxx')
+ valid_mips_float_abi = ('soft', 'hard')
+@@ -622,7 +622,7 @@ def configure_arm(o):
+   else:
+     arm_float_abi = 'default'
+
+-  arm_fpu = 'vfpv2'
++  arm_fpu = 'vfp'
+
+   if is_arch_armv7():
+     arm_fpu = 'vfpv3'
+--
+2.6.3
diff --git a/package/nodejs/5.2.0/0005-Fix-va_list-not-declared.patch b/package/nodejs/5.2.0/0005-Fix-va_list-not-declared.patch
new file mode 100644
index 0000000..aec8e12
--- /dev/null
+++ b/package/nodejs/5.2.0/0005-Fix-va_list-not-declared.patch
@@ -0,0 +1,39 @@
+From 5b3dd2599ebde1846750aaf7c79576ad45246ffa Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 8 Dec 2015 11:41:08 +0000
+Subject: [PATCH] Fix va_list not declared
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling with uClibc-ng the following error is seen.
+
+In file included from ../deps/v8/src/log-utils.cc:5:0:
+../deps/v8/src/log-utils.h:64:39: error: ?va_list? has not been declared
+     void AppendVA(const char* format, va_list args);
+
+This patch fixes the issue by adding the missing #include <cstdarg>.  Note
+that this fix has already be included upstream, see
+https://github.com/nodejs/node/blob/8a43a3d/deps/v8/src/log-utils.h
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ deps/v8/src/log-utils.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/deps/v8/src/log-utils.h b/deps/v8/src/log-utils.h
+index 87dab52..6714307 100644
+--- a/deps/v8/src/log-utils.h
++++ b/deps/v8/src/log-utils.h
+@@ -5,6 +5,8 @@
+ #ifndef V8_LOG_UTILS_H_
+ #define V8_LOG_UTILS_H_
+ 
++#include <cstdarg>
++
+ #include "src/allocation.h"
+ #include "src/base/platform/mutex.h"
+ #include "src/flags.h"
+-- 
+2.5.0
+
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index b0f4f2b..7b53b93 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -57,6 +57,17 @@ comment "v4.2.3 needs a toolchain w/ gcc >= 4.8"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
+config BR2_BR2_PACKAGE_NODEJS_5_X
+	bool "v5.2.0"
+	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_USE_WCHAR
+
+comment "v5.2.0 needs a toolchain w/ gcc >= 4.8, wchar"
+	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_USE_WCHAR
+
 endchoice
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
@@ -64,6 +75,7 @@ config BR2_PACKAGE_NODEJS_VERSION_STRING
 	default "0.10.41"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
 	default "0.12.9"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
 	default "4.2.3"		if BR2_BR2_PACKAGE_NODEJS_4_X
+	default "5.2.0"		if BR2_BR2_PACKAGE_NODEJS_5_X
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 7d58a54..97bae66 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -6,3 +6,6 @@ sha256	35daad301191e5f8dd7e5d2fbb711d081b82d1837d59837b8ee224c256cfe5e4  node-v0
 
 # From upstream URL: http://nodejs.org/dist/v4.2.3/SHASUMS256.txt
 sha256  9e8aef1e47b317575c421c8d10a80e6c319b26969b566d3b84e49e65a92837f4  node-v4.2.3.tar.xz
+
+# From upstream URL: http://nodejs.org/dist/v5.2.0/SHASUMS256.txt
+sha256  0cda6254aea3330a711f5b30425ad363568456ee1fd70336b21890b1c605f356  node-v5.2.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 7ede89d..f3faac2 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NODEJS_VERSION = $(call qstrip,$(BR2_PACKAGE_NODEJS_VERSION_STRING))
-ifeq ($(BR2_BR2_PACKAGE_NODEJS_4_X),y)
+ifneq (,$(filter y,$(BR2_BR2_PACKAGE_NODEJS_4_X) $(BR2_BR2_PACKAGE_NODEJS_5_X)))
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 else
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
-- 
2.5.0
