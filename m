From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 15:13:33 +0100
Subject: [Buildroot] [git commit] package/nodejs: force the use of python2
Message-ID: <20160306144245.2C5F98025A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12010acc621444c214f94a82988a5fa8460e0811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the patches to use a python variable and instead force python2
into the PATH.

Upstream the python variable was recently removed
(see https://github.com/nodejs/node/commit/c3e50ca) and due to dependencies
directly calling python there is a reluctance to change this.  Instead it
is recommended to add python2 into PATH as the nodejs build machines do
(see https://github.com/nodejs/node/issues/418 and
https://github.com/nodejs/node/issues/2735).

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ch => 0003-fix-musl-USE-MISC-build-issue.patch} |   0
 .../nodejs/0.10.42/0003-use-python-variable.patch  |  43 --------
 .../0004-Fix-support-for-uClibc-ng.patch}          |   0
 ...d.patch => 0003-Fix-va_list-not-declared.patch} |   0
 ...hon-variable-instead-of-hardcoding-Python.patch | 112 ---------------------
 .../0004-Fix-support-for-uClibc-ng.patch}          |   0
 package/nodejs/nodejs.mk                           |  18 +++-
 7 files changed, 16 insertions(+), 157 deletions(-)

diff --git a/package/nodejs/0.10.42/0004-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.42/0003-fix-musl-USE-MISC-build-issue.patch
similarity index 100%
rename from package/nodejs/0.10.42/0004-fix-musl-USE-MISC-build-issue.patch
rename to package/nodejs/0.10.42/0003-fix-musl-USE-MISC-build-issue.patch
diff --git a/package/nodejs/0.10.42/0003-use-python-variable.patch b/package/nodejs/0.10.42/0003-use-python-variable.patch
deleted file mode 100644
index f231f4c..0000000
--- a/package/nodejs/0.10.42/0003-use-python-variable.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Use a python variable instead of hardcoding Python
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
-
-Index: b/deps/v8/tools/gyp/v8.gyp
-===================================================================
---- a/deps/v8/tools/gyp/v8.gyp
-+++ b/deps/v8/tools/gyp/v8.gyp
-@@ -792,7 +792,7 @@
-                 '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
-               ],
-               'action': [
--                'python',
-+                '<(python)',
-                 '../../tools/js2c.py',
-                 '<@(_outputs)',
-                 'CORE',
-@@ -810,7 +810,7 @@
-                 '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
-               ],
-               'action': [
--                'python',
-+                '<(python)',
-                 '../../tools/js2c.py',
-                 '<@(_outputs)',
-                 'EXPERIMENTAL',
-@@ -840,7 +840,7 @@
-                   '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
-                 ],
-                 'action': [
--                  'python',
-+                  '<(python)',
-                   '../../tools/gen-postmortem-metadata.py',
-                   '<@(_outputs)',
-                   '<@(heapobject_files)'
diff --git a/package/nodejs/5.6.0/0005-Fix-support-for-uClibc-ng.patch b/package/nodejs/0.10.42/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/5.6.0/0005-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/0.10.42/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/5.6.0/0004-Fix-va_list-not-declared.patch b/package/nodejs/5.6.0/0003-Fix-va_list-not-declared.patch
similarity index 100%
rename from package/nodejs/5.6.0/0004-Fix-va_list-not-declared.patch
rename to package/nodejs/5.6.0/0003-Fix-va_list-not-declared.patch
diff --git a/package/nodejs/5.6.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/5.6.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
deleted file mode 100644
index 4d8d715..0000000
--- a/package/nodejs/5.6.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
+++ /dev/null
@@ -1,112 +0,0 @@
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
-[yann.morin.1998 at free.fr: adapt to 4.1.2]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[Martin: adapt to 5.5.0]
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- deps/v8/tools/gyp/v8.gyp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/deps/v8/tools/gyp/v8.gyp b/deps/v8/tools/gyp/v8.gyp
-index 1e5705d..e2e5dfe 100644
---- a/deps/v8/tools/gyp/v8.gyp
-+++ b/deps/v8/tools/gyp/v8.gyp
-@@ -1723,14 +1723,14 @@
-                       '<(PRODUCT_DIR)/natives_blob_host.bin',
-                     ],
-                     'action': [
--                      'python', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob_host.bin'
-+                      '<(python)', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob_host.bin'
-                     ],
-                   }, {
-                     'outputs': [
-                       '<(PRODUCT_DIR)/natives_blob.bin',
-                     ],
-                     'action': [
--                      'python', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob.bin'
-+                      '<(python)', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob.bin'
-                     ],
-                   }],
-                 ],
-@@ -1739,7 +1739,7 @@
-                   '<(PRODUCT_DIR)/natives_blob.bin',
-                 ],
-                 'action': [
--                  'python', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob.bin'
-+                  '<(python)', '<@(_inputs)', '<(PRODUCT_DIR)/natives_blob.bin'
-                 ],
-               }],
-             ],
-@@ -1847,7 +1847,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
-           ],
-           'action': [
--            'python',
-+            '<(python)',
-             '../../tools/js2c.py',
-             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
-             'CORE',
-@@ -1873,7 +1873,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
-           ],
-           'action': [
--            'python',
-+            '<(python)',
-             '../../tools/js2c.py',
-             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
-             'EXPERIMENTAL',
-@@ -1898,7 +1898,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/code-stub-libraries.cc',
-           ],
-           'action': [
--            'python',
-+            '<(python)',
-             '../../tools/js2c.py',
-             '<(SHARED_INTERMEDIATE_DIR)/code-stub-libraries.cc',
-             'CODE_STUB',
-@@ -1923,7 +1923,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/extras-libraries.cc',
-           ],
-           'action': [
--            'python',
-+            '<(python)',
-             '../../tools/js2c.py',
-             '<(SHARED_INTERMEDIATE_DIR)/extras-libraries.cc',
-             'EXTRAS',
-@@ -1960,7 +1960,7 @@
-               '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
-             ],
-             'action': [
--              'python',
-+              '<(python)',
-               '../../tools/gen-postmortem-metadata.py',
-               '<@(_outputs)',
-               '<@(heapobject_files)'
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
diff --git a/package/nodejs/0.10.42/0005-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.6.0/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/0.10.42/0005-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/5.6.0/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 63ae463..b0661ed 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -20,12 +20,18 @@ endif
 # nodejs build system is based on python, but only support python-2.6 or
 # python-2.7. So, we have to enforce PYTHON interpreter to be python2.
 define HOST_NODEJS_CONFIGURE_CMDS
+	# The build system directly calls python. Work around this by forcing python2
+	# into PATH. See https://github.com/nodejs/node/issues/2735
+	mkdir -p $(@D)/bin
+	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
+
 	# Build with the static, built-in OpenSSL which is supplied as part of
 	# the nodejs source distribution.  This is needed on the host because
 	# NPM is non-functional without it, and host-openssl isn't part of
 	# buildroot.
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
+		PATH=$(@D)/bin:$(BR_PATH) \
 		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=$(HOST_DIR)/usr \
@@ -39,13 +45,15 @@ endef
 define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(MAKE) -C $(@D) \
-		$(HOST_CONFIGURE_OPTS)
+		$(HOST_CONFIGURE_OPTS) \
+		PATH=$(@D)/bin:$(BR_PATH)
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(MAKE) -C $(@D) install \
-		$(HOST_CONFIGURE_OPTS)
+		$(HOST_CONFIGURE_OPTS) \
+		PATH=$(@D)/bin:$(BR_PATH)
 endef
 
 ifeq ($(BR2_i386),y)
@@ -75,8 +83,12 @@ endif
 endif
 
 define NODEJS_CONFIGURE_CMDS
+	mkdir -p $(@D)/bin
+	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
+
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
+		PATH=$(@D)/bin:$(BR_PATH) \
 		LD="$(TARGET_CXX)" \
 		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(HOST_DIR)/usr/bin/python2 ./configure \
@@ -99,6 +111,7 @@ define NODEJS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(MAKE) -C $(@D) \
 		$(TARGET_CONFIGURE_OPTS) \
+		PATH=$(@D)/bin:$(BR_PATH) \
 		LD="$(TARGET_CXX)"
 endef
 
@@ -138,6 +151,7 @@ define NODEJS_INSTALL_TARGET_CMDS
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
 		$(TARGET_CONFIGURE_OPTS) \
+		PATH=$(@D)/bin:$(BR_PATH) \
 		LD="$(TARGET_CXX)"
 	$(NODEJS_INSTALL_MODULES)
 endef
