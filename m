From: Martin Bark <martin@barkynet.com>
Date: Wed, 10 Feb 2016 20:50:05 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 5.6.0
Message-ID: <1455137405-20582-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is an important security release. See
https://nodejs.org/en/blog/release/v5.6.0/ for further details

Patches from 5.5.0 have been copied over except for
0003-Use-a-python-variable-instead-of-hardcoding-Python.patch which has
been updated to include some more python variables.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 ...01-Remove-dependency-on-Python-bz2-module.patch |  0
 .../0002-gyp-force-link-command-to-use-CXX.patch   |  0
 ...hon-variable-instead-of-hardcoding-Python.patch | 65 +++++++++++++---------
 .../0004-Fix-va_list-not-declared.patch            |  0
 .../0005-Fix-support-for-uClibc-ng.patch           |  0
 package/nodejs/Config.in                           |  2 +-
 package/nodejs/nodejs.hash                         |  4 +-
 7 files changed, 43 insertions(+), 28 deletions(-)
 rename package/nodejs/{5.5.0 => 5.6.0}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
 rename package/nodejs/{5.5.0 => 5.6.0}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{5.5.0 => 5.6.0}/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch (79%)
 rename package/nodejs/{5.5.0 => 5.6.0}/0004-Fix-va_list-not-declared.patch (100%)
 rename package/nodejs/{5.5.0 => 5.6.0}/0005-Fix-support-for-uClibc-ng.patch (100%)

diff --git a/package/nodejs/5.5.0/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/5.6.0/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/5.5.0/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/5.6.0/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/5.5.0/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/5.6.0/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/5.5.0/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/5.6.0/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/5.6.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
similarity index 79%
rename from package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
rename to package/nodejs/5.6.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
index 3104644..6849250 100644
--- a/package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
+++ b/package/nodejs/5.6.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
@@ -1,7 +1,7 @@
-From 4a48c65921b0f05b621aef5b902b6aa54811ad7a Mon Sep 17 00:00:00 2001
+From b0261fc14d67e47d1c59e372ea942b6b8ce6a7ad Mon Sep 17 00:00:00 2001
 From: Martin Bark <martin@barkynet.com>
-Date: Tue, 30 Jun 2015 09:44:33 +0100
-Subject: [PATCH 3/4] Use a python variable instead of hardcoding Python
+Date: Wed, 10 Feb 2016 20:33:20 +0000
+Subject: [PATCH] Use a python variable instead of hardcoding Python
 
 The nodejs build system uses python in a number of locations. However,
 there are some locations where it hardcodes 'python' as the Python
@@ -16,15 +16,31 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Martin Bark <martin@barkynet.com>
 [yann.morin.1998 at free.fr: adapt to 4.1.2]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Martin: adapt to 5.6.0]
+Signed-off-by: Martin Bark <martin@barkynet.com>
 ---
- deps/v8/tools/gyp/v8.gyp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ deps/v8/build/toolchain.gypi |  2 +-
+ deps/v8/tools/gyp/v8.gyp     | 16 ++++++++--------
+ 2 files changed, 9 insertions(+), 9 deletions(-)
 
+diff --git a/deps/v8/build/toolchain.gypi b/deps/v8/build/toolchain.gypi
+index a8a3b56..871eec7 100644
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
 diff --git a/deps/v8/tools/gyp/v8.gyp b/deps/v8/tools/gyp/v8.gyp
-index c703155..06c0b2b 100644
+index 1e5705d..e2e5dfe 100644
 --- a/deps/v8/tools/gyp/v8.gyp
 +++ b/deps/v8/tools/gyp/v8.gyp
-@@ -1696,14 +1696,14 @@
+@@ -1723,14 +1723,14 @@
                        '<(PRODUCT_DIR)/natives_blob_host.bin',
                      ],
                      'action': [
@@ -41,7 +57,7 @@ index c703155..06c0b2b 100644
                      ],
                    }],
                  ],
-@@ -1712,7 +1712,7 @@
+@@ -1739,7 +1739,7 @@
                    '<(PRODUCT_DIR)/natives_blob.bin',
                  ],
                  'action': [
@@ -50,7 +66,7 @@ index c703155..06c0b2b 100644
                  ],
                }],
              ],
-@@ -1812,7 +1812,7 @@
+@@ -1847,7 +1847,7 @@
              '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
            ],
            'action': [
@@ -59,7 +75,7 @@ index c703155..06c0b2b 100644
              '../../tools/js2c.py',
              '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
              'CORE',
-@@ -1838,7 +1838,7 @@
+@@ -1873,7 +1873,7 @@
              '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
            ],
            'action': [
@@ -68,7 +84,16 @@ index c703155..06c0b2b 100644
              '../../tools/js2c.py',
              '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
              'EXPERIMENTAL',
-@@ -1863,7 +1863,7 @@
+@@ -1898,7 +1898,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/code-stub-libraries.cc',
+           ],
+           'action': [
+-            'python',
++            '<(python)',
+             '../../tools/js2c.py',
+             '<(SHARED_INTERMEDIATE_DIR)/code-stub-libraries.cc',
+             'CODE_STUB',
+@@ -1923,7 +1923,7 @@
              '<(SHARED_INTERMEDIATE_DIR)/extras-libraries.cc',
            ],
            'action': [
@@ -77,7 +102,7 @@ index c703155..06c0b2b 100644
              '../../tools/js2c.py',
              '<(SHARED_INTERMEDIATE_DIR)/extras-libraries.cc',
              'EXTRAS',
-@@ -1900,7 +1900,7 @@
+@@ -1960,7 +1960,7 @@
                '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
              ],
              'action': [
@@ -86,16 +111,6 @@ index c703155..06c0b2b 100644
                '../../tools/gen-postmortem-metadata.py',
                '<@(_outputs)',
                '<@(heapobject_files)'
-diff --git a/deps/v8/build/toolchain.gypi b/deps/v8/build/toolchain.gypi
-index c703155..06c0b2b 100644
---- a/deps/v8/build/toolchain.gypi
-+++ b/deps/v8/build/toolchain.gypi
-@@ -38,7 +38,7 @@
-     'ubsan%': 0,
-     'ubsan_vptr%': 0,
-     'v8_target_arch%': '<(target_arch)',
--    'v8_host_byteorder%': '<!(python -c "import sys; print sys.byteorder")',
-+    'v8_host_byteorder%': '<!(<(python) -c "import sys; print sys.byteorder")',
-     # Native Client builds currently use the V8 ARM JIT and
-     # arm/simulator-arm.cc to defer the significant effort required
-     # for NaCl JIT support. The nacl_target_arch variable provides
+-- 
+2.5.0
+
diff --git a/package/nodejs/5.5.0/0004-Fix-va_list-not-declared.patch b/package/nodejs/5.6.0/0004-Fix-va_list-not-declared.patch
similarity index 100%
rename from package/nodejs/5.5.0/0004-Fix-va_list-not-declared.patch
rename to package/nodejs/5.6.0/0004-Fix-va_list-not-declared.patch
diff --git a/package/nodejs/5.5.0/0005-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.6.0/0005-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/5.5.0/0005-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/5.6.0/0005-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index cdf7705..bec0eee 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "5.5.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "5.6.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.41"
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index e65f14a..ccad648 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.41/SHASUMS256.txt
 sha256	79f694e2a5c42543b75d0c69f6860499d7593136d0f6b59e7163b9e66fb2c995  node-v0.10.41.tar.gz
 
-# From upstream URL: http://nodejs.org/dist/v5.5.0/SHASUMS256.txt
-sha256  9c46b4dc9548e43826f71f6571f56e39783c456b9516045b496ea73321731e22  node-v5.5.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v5.6.0/SHASUMS256.txt
+sha256  588341e466ac72f6b8e9fa500f04edf149f7d4e8141c4175c495d6d1484405e3  node-v5.6.0.tar.xz
-- 
2.5.0
