Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD93BC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 20:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F7458213F;
	Fri,  3 Nov 2023 20:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F7458213F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JyqvJ1HQT1ia; Fri,  3 Nov 2023 20:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C83DD822EF;
	Fri,  3 Nov 2023 20:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C83DD822EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFC0D1BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 980354047C
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980354047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFXQdgAErKzB for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 20:15:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1C8240441
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 20:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1C8240441
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9CC2865DC; Fri,  3 Nov 2023 20:15:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 20:59:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da88933564cddd6a515f4566b5ba4263560157a2
X-Git-Newrev: c1d5eada4d4db9eeaa1c44dd1dea95a67c8a70ca
X-Patchwork-Hint: ignore
Message-Id: <20231103201549.D9CC2865DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: bump version to 20.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c1d5eada4d4db9eeaa1c44dd1dea95a67c8a70ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Refactor 0001-add-qemu-wrapper-support.patch for 20.9.0

- NodeJS now requires GCC 10.1 header. However, as there is no
  BR2_TOOLCHAIN_GCC_AT_LEAST_10_1, we round up to BR2_TOOLCHAIN_GCC_AT_LEAST_11.

- Drop the --without-dtrace and --without-etw config options as they no longer
  exist.

- Update support/testing/tests/package/test_nodejs.py to use
  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN, otherwise the test fails as the
  gcc version selected will be 7.

- Update the hash file for LICENSE.txt due to numerous changes, such
  as the addition of new libraries and updated dates. No new license
  types are added.

Tested with: ./support/testing/run-tests tests.package.test_nodejs

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/Config.in                           |  8 ++--
 .../nodejs-src/0001-add-qemu-wrapper-support.patch | 51 ++++++++++++++--------
 ...l-modules-cjs-loader.js-adjust-default-pa.patch |  2 +-
 package/nodejs/nodejs-src/nodejs-src.mk            |  4 --
 package/nodejs/nodejs.hash                         | 15 +++----
 package/nodejs/nodejs.mk                           |  2 +-
 support/testing/tests/package/test_nodejs.py       |  3 ++
 7 files changed, 50 insertions(+), 35 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index c684f8eb86..72770095d0 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -7,19 +7,19 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 11, wchar, host gcc >= 11"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_11 || !BR2_TOOLCHAIN_GCC_AT_LEAST_11 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
diff --git a/package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch b/package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch
index 184f3d19b7..18f320ec5d 100644
--- a/package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch
+++ b/package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch
@@ -15,26 +15,18 @@ qemu-wrapper, so add @MAYBE_WRAPPER@ to the needed files and sed the path to
 the qemu-wrapper on target builds, and remove @MAYBE_WRAPPER@ entirely on
 host-builds.
 
+[Adam: Update for 20.9.0]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- node.gyp                 |  4 ++--
+ node.gyp                 |  6 ++++--
  tools/v8_gypfiles/v8.gyp | 10 +++++-----
- 2 files changed, 7 insertions(+), 7 deletions(-)
+ 2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/node.gyp b/node.gyp
 index 97cdbb531d..db5cf51ce6 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -319,7 +319,7 @@
-               'action_name': 'run_mkcodecache',
-               'process_outputs_as_sources': 1,
-               'inputs': [
--                '<(mkcodecache_exec)',
-+                @MAYBE_WRAPPER@ '<(mkcodecache_exec)',
-               ],
-               'outputs': [
-                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
-@@ -346,7 +346,7 @@
+@@ -662,7 +662,7 @@
                    'action_name': 'node_mksnapshot',
                    'process_outputs_as_sources': 1,
                    'inputs': [
@@ -43,11 +35,36 @@ index 97cdbb531d..db5cf51ce6 100644
                      '<(node_snapshot_main)',
                    ],
                    'outputs': [
+@@ -682,7 +682,7 @@
+                   'action_name': 'node_mksnapshot',
+                   'process_outputs_as_sources': 1,
+                   'inputs': [
+-                    '<(node_mksnapshot_exec)',
++                    @MAYBE_WRAPPER@ '<(node_mksnapshot_exec)',
+                   ],
+                   'outputs': [
+                     '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
+@@ -966,6 +966,7 @@
+           'action_name': 'node_js2c',
+           'process_outputs_as_sources': 1,
+           'inputs': [
++            @MAYBE_WRAPPER@
+             '<(node_js2c_exec)',
+             '<@(library_files)',
+             '<@(deps_files)',
+@@ -975,6 +976,7 @@
+             '<(SHARED_INTERMEDIATE_DIR)/node_javascript.cc',
+           ],
+           'action': [
++            @MAYBE_WRAPPER@
+             '<(node_js2c_exec)',
+             '<@(_outputs)',
+             'lib',
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
 index 73099a03e4..88ca91efb4 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -68,7 +68,7 @@
+@@ -81,7 +81,7 @@
          {
            'action_name': 'run_torque_action',
            'inputs': [  # Order matters.
@@ -56,7 +73,7 @@ index 73099a03e4..88ca91efb4 100644
              '<@(torque_files)',
            ],
            'outputs': [
-@@ -99,7 +99,7 @@
+@@ -112,7 +112,7 @@
              '<@(torque_outputs_inc)',
            ],
            'action': [
@@ -65,7 +82,7 @@ index 73099a03e4..88ca91efb4 100644
              '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
              '-v8-root', '<(V8_ROOT)',
              '<@(torque_files_without_v8_root)',
-@@ -211,7 +211,7 @@
+@@ -224,7 +224,7 @@
          {
            'action_name': 'generate_bytecode_builtins_list_action',
            'inputs': [
@@ -74,7 +91,7 @@ index 73099a03e4..88ca91efb4 100644
            ],
            'outputs': [
              '<(generate_bytecode_builtins_list_output)',
-@@ -395,7 +395,7 @@
+@@ -401,7 +401,7 @@
              ],
            },
            'inputs': [
@@ -83,7 +100,7 @@ index 73099a03e4..88ca91efb4 100644
            ],
            'outputs': [
              '<(INTERMEDIATE_DIR)/snapshot.cc',
-@@ -1505,7 +1505,7 @@
+@@ -1660,7 +1660,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
diff --git a/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch b/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
index 5b93998e5e..25c26b43bd 100644
--- a/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
+++ b/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
@@ -21,7 +21,7 @@ diff --git a/lib/internal/modules/cjs/loader.js b/lib/internal/modules/cjs/loade
 index f1971c40a4..5fe3884156 100644
 --- a/lib/internal/modules/cjs/loader.js
 +++ b/lib/internal/modules/cjs/loader.js
-@@ -1261,7 +1261,8 @@ Module._initPaths = function() {
+@@ -1378,7 +1378,8 @@ Module._initPaths = function() {
      path.resolve(process.execPath, '..') :
      path.resolve(process.execPath, '..', '..');
  
diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
index 3452c93728..6fb550f158 100644
--- a/package/nodejs/nodejs-src/nodejs-src.mk
+++ b/package/nodejs/nodejs-src/nodejs-src.mk
@@ -40,8 +40,6 @@ NODEJS_SRC_CONF_OPTS = \
 	--shared-cares \
 	--shared-libuv \
 	--shared-nghttp2 \
-	--without-dtrace \
-	--without-etw \
 	--cross-compiling \
 	--dest-os=linux \
 	--ninja
@@ -97,8 +95,6 @@ define HOST_NODEJS_SRC_CONFIGURE_CMDS
 		PYTHON=$(HOST_DIR)/bin/python3 \
 		$(HOST_DIR)/bin/python3 configure.py \
 		--prefix=$(HOST_DIR) \
-		--without-dtrace \
-		--without-etw \
 		--shared-openssl \
 		--shared-openssl-includes=$(HOST_DIR)/include \
 		--shared-openssl-libpath=$(HOST_DIR)/lib \
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index eaf41f6437..da027cc17a 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,9 +1,8 @@
-# From https://nodejs.org/dist/v16.20.0/SHASUMS256.txt.asc
-sha256  aca4794ca60f2e17689a700eeaa95d7adcd5fd01cdd2e4f9d596ac41b600b796  node-v16.20.0-linux-arm64.tar.xz
-sha256  5b79addab37bbdc31b442f8e648efad0b5d3aa5f3e0d682f23f4db483408eb2a  node-v16.20.0-linux-armv7l.tar.xz
-sha256  b439a8f874e8c2fad287ba75a3229407551f5ff9eb41e45e43e9bf67f184f618  node-v16.20.0-linux-ppc64le.tar.xz
-sha256  dff21020b555cc165a1ac36da7d4f6c810b35409c94e00afc51d5d370aae47ae  node-v16.20.0-linux-x64.tar.xz
-sha256  e0990f992234e40a51fe11f92c3816c93a77e1b081145d3dd762cd1026345349  node-v16.20.0.tar.xz
-
+# From https://nodejs.org/dist/v20.9.0/SHASUMS256.txt.asc
+sha256  ced3ecece4b7c3a664bca3d9e34a0e3b9a31078525283a6fdb7ea2de8ca5683b  node-v20.9.0-linux-arm64.tar.xz
+sha256  64099d7e62bdbb8efd52c216a6759b3cdd77c38aa993096fdee9f875d95b2d8e  node-v20.9.0-linux-armv7l.tar.xz
+sha256  3c6cea5d614cfbb95d92de43fbc2f8ecd66e431502fe5efc4f3c02637897bd45  node-v20.9.0-linux-ppc64le.tar.xz
+sha256  9033989810bf86220ae46b1381bdcdc6c83a0294869ba2ad39e1061f1e69217a  node-v20.9.0-linux-x64.tar.xz
+sha256  a23d96810abf0455426b349d47ce5310f33095b7bc0571b9cc510f481c3a4519  node-v20.9.0.tar.xz
 # Locally calculated
-sha256  ba325815d3df8819bebaf37cad67d6e1f82271e1e4a1189b53abd28e261977d6  LICENSE
+sha256  a6871483905199033882d66453649675f0e88ffaa07f9f8acb257ce7504bc758  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 2a8c570932..7c8345cbcf 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 16.20.0
+NODEJS_COMMON_VERSION = 20.9.0
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
index b63d44c97e..2884529c6e 100644
--- a/support/testing/tests/package/test_nodejs.py
+++ b/support/testing/tests/package/test_nodejs.py
@@ -10,6 +10,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_NODEJS=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -34,6 +35,7 @@ class TestNodeJSModuleHostBin(infra.basetest.BRTest):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_NODEJS=y
         BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="lodash"
         BR2_PACKAGE_HOST_NODEJS_BIN=y
@@ -60,6 +62,7 @@ class TestNodeJSModuleHostSrc(infra.basetest.BRTest):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_NODEJS=y
         BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="lodash"
         BR2_PACKAGE_HOST_NODEJS_SRC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
