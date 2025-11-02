Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EC0CCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A9485010;
	Sun,  2 Nov 2025 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MweZAFDPHbR3; Sun,  2 Nov 2025 20:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99A0084921
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A0084921;
	Sun,  2 Nov 2025 20:55:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 259D8436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 20:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22E84848D0
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 20:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEzir2-wAoi0 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 20:55:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1340A848C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1340A848C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1340A848C3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 20:54:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b11b.dip0.t-ipconnect.de [84.161.177.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5BC05A4C5F87;
 Sun,  2 Nov 2025 21:54:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40214)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFf6F-0000000037M-0ptZ;
 Sun, 02 Nov 2025 20:54:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun,  2 Nov 2025 21:54:54 +0100
Message-ID: <20251102205454.3428417-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762116895;
 bh=KpVcosjRCQg0eRz7R5d5eWWtRqZgRuQZWXrygbc+OjM=;
 h=From:To:Cc:Subject:Date:From;
 b=Wv72ExEppvQgWFbfngEf2M9zipL1LxVJrsxHQZu5gm6H0pNy/x1zrTYrpON2bK4hc
 soECiK0bNIdAcSP1DB6N0ewGEuS6hj82ToUUG8OYM3B8+kSROCH1wAhhqZdhnVfDtL
 c1oclR/2U6F0KGL9qEHb6WNIMY4eN5P7l02GS+hakeuS8AeBLdqjfl3Axvs2tcKPi3
 AmopUflZDRLX6gw+EZw1o+S33ZrmOROhlyzl4ZfHZ26S5oIqB6Hx4ubZdXrPWuEkFi
 uAbRO1f/Y14bYOOQw/IyZndbYD6nzz6w44QjiCayduXLIR6cD7Sqfa7/GsgAPBImGJ
 PR/WWxvMHH9Rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Wv72ExEp
Subject: [Buildroot] [PATCH v2 1/1] package/llvm-project: bump to version
 21.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://discourse.llvm.org/t/llvm-21-1-4-released/88651
https://discourse.llvm.org/t/llvm-21-1-3-released/88525
https://discourse.llvm.org/t/llvm-21-1-2-released/88398
https://discourse.llvm.org/t/llvm-21-1-1-released/88244
https://discourse.llvm.org/t/llvm-21-1-0-released/88066

Update spirv-llvm-translator to align with 21.1.4
Release notes:
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.1

Added upstream tarball for third-party code to llvm and compiler-rt due
to upstream commit:
https://github.com/llvm/llvm-project/commit/7f3afab9181d83f92771293ad3b6c00ac62800fd
and added a fix for compiler-rt to make use of the extracted third-party
code.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed compiler-rt build error (Julien)

 package/llvm-project/clang/clang.hash         |  2 +-
 ...LLVM_THIRD_PARTY_DIR-for-siphash-inc.patch | 32 +++++++++++++++++++
 .../llvm-project/compiler-rt/compiler-rt.hash |  3 +-
 .../llvm-project/compiler-rt/compiler-rt.mk   | 10 ++++++
 package/llvm-project/libclc/libclc.hash       |  2 +-
 package/llvm-project/lld/lld.hash             |  2 +-
 .../llvm-project/llvm-cmake/llvm-cmake.hash   |  2 +-
 .../llvm-libunwind/llvm-libunwind.hash        |  2 +-
 package/llvm-project/llvm-project.mk          |  4 +--
 .../llvm-runtimes/llvm-runtimes.hash          |  2 +-
 package/llvm-project/llvm/llvm.hash           |  3 +-
 package/llvm-project/llvm/llvm.mk             | 13 ++++++++
 .../spirv-llvm-translator.hash                |  2 +-
 .../spirv-llvm-translator.mk                  |  4 +--
 14 files changed, 70 insertions(+), 13 deletions(-)
 create mode 100644 package/llvm-project/compiler-rt/0002-compiler-rt-Use-LLVM_THIRD_PARTY_DIR-for-siphash-inc.patch

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 171bfe1d6a..3abedbab85 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  b7a1b7b0af7b9c7596af6bd46e36d11321926eaa66a7a7dc957ab0a1375ee4b0  clang-20.1.8.src.tar.xz
+sha256  3e8e25a7478bfb0ef510fff35d1a43bdfb62c7727bf98bb43ad33deef2f9f1a2  clang-21.1.4.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/0002-compiler-rt-Use-LLVM_THIRD_PARTY_DIR-for-siphash-inc.patch b/package/llvm-project/compiler-rt/0002-compiler-rt-Use-LLVM_THIRD_PARTY_DIR-for-siphash-inc.patch
new file mode 100644
index 0000000000..2aa2d2c583
--- /dev/null
+++ b/package/llvm-project/compiler-rt/0002-compiler-rt-Use-LLVM_THIRD_PARTY_DIR-for-siphash-inc.patch
@@ -0,0 +1,32 @@
+From 8fb17d03f8f7cec84dc8d6baebd479c4c34ba74b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 2 Nov 2025 21:18:24 +0100
+Subject: [PATCH] compiler-rt: Use LLVM_THIRD_PARTY_DIR for siphash include
+
+Introduced by https://github.com/llvm/llvm-project/commit/7f3afab9181d83f92771293ad3b6c00ac62800fd
+but currently unused in compiler-rt leading to build errors with
+COMPILER_RT_STANDALONE_BUILD=ON
+
+Upstream: https://github.com/llvm/llvm-project/pull/166097
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/builtins/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/builtins/CMakeLists.txt b/lib/builtins/CMakeLists.txt
+index 6c226aa7d2d4..7eb5ef487d31 100644
+--- a/lib/builtins/CMakeLists.txt
++++ b/lib/builtins/CMakeLists.txt
+@@ -64,7 +64,7 @@ include(CMakePushCheckState)
+ option(COMPILER_RT_BUILTINS_HIDE_SYMBOLS
+   "Do not export any symbols from the static library." ON)
+ 
+-include_directories(../../../third-party/siphash/include)
++include_directories(${LLVM_THIRD_PARTY_DIR}/siphash/include)
+ 
+ # TODO: Need to add a mechanism for logging errors when builtin source files are
+ # added to a sub-directory and not this CMakeLists file.
+-- 
+2.47.3
+
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index 5224eff6de..9e10f6cd92 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  15277402f6fd63397c0917a5c7171cda82d16d226094b828c1ed0f58f73b9c69  compiler-rt-20.1.8.src.tar.xz
+sha256  84fed7aa95bfac348642a753d332afd303a0847b1fe1e76acf13fe98f8760d5f  compiler-rt-21.1.4.src.tar.xz
+sha256  ae8658390504e08e464f65ecea838a0584df4734c27cecedfe7eb32780e81564  third-party-21.1.4.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index ff3205f216..2571114253 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -16,11 +16,21 @@ COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
 COMPILER_RT_INSTALL_STAGING = YES
 COMPILER_RT_INSTALL_TARGET = NO
 
+COMPILER_RT_EXTRA_DOWNLOADS = third-party-$(COMPILER_RT_VERSION).src.tar.xz
+
+define COMPILER_RT_THIRD_PARTY_EXTRACT
+	$(call suitable-extractor,$(notdir $(COMPILER_RT_EXTRA_DOWNLOADS))) \
+		$(COMPILER_RT_DL_DIR)/$(notdir $(COMPILER_RT_EXTRA_DOWNLOADS)) | \
+		$(TAR) -C $(@D) $(TAR_OPTIONS) -
+endef
+COMPILER_RT_POST_EXTRACT_HOOKS += COMPILER_RT_THIRD_PARTY_EXTRACT
+
 COMPILER_RT_CONF_OPTS = \
 	-DCOMPILER_RT_STANDALONE_BUILD=ON \
 	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
 	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config \
 	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm \
+	-DLLVM_THIRD_PARTY_DIR=$(@D)/third-party-$(COMPILER_RT_VERSION).src \
 	-DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 
 # The installation of the target runtime libraries defaults to DESTDIR, however
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index aa6b6e19ae..8e9663ff8d 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  ecd83a52859742f71f4c332538f8bee54a6743374a233b5a85017de22d75c227  libclc-20.1.8.src.tar.xz
+sha256  2311128b86ae95b4319341671a8ec93950928d0bc4fa13d0e6a97d7a65507aaa  libclc-21.1.4.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index a2d79fb0a9..707e2ba56f 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8281462d62cae67dfe5fdbb4da0d82bc62e0a86d4d4f758b0b601d44f09fd987  lld-20.1.8.src.tar.xz
+sha256  5d62eb36eb76ac9cc9179f31a355d28fc3a1c4096880da2a12090cfe1ccd3dcf  lld-21.1.4.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 03e77764f1..7b4df505c4 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  3319203cfd1172bbac50f06fa68e318af84dcb5d65353310c0586354069d6634  cmake-20.1.8.src.tar.xz
+sha256  f4316d84a862ba3023ca1d26bd9c6a995516b4fa028b6fb329d22e24cc6d235e  cmake-21.1.4.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index bcc36e60a6..36ef3167d4 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  0bced9d701e300f8fe6599523367e214c1f928ac559afceece58f47018e9c4a7  libunwind-20.1.8.src.tar.xz
+sha256  fc3ca27e1094b5fd4b7c1879e83705d89e9a2632b9a43426eb96c0536ace5345  libunwind-21.1.4.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index aec5e0d31d..6d324ede51 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION_MAJOR = 20
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
+LLVM_PROJECT_VERSION_MAJOR = 21
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index 61bf6f35b4..3564e2341a 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  86b375ab217619d018f6875b7c71106ffab5ab21c425f414a11468c2a8262819  runtimes-20.1.8.src.tar.xz
+sha256  d84e6d3a28f0c877e4ab6884e8bedb3a1d2094352bba2f0d74073abb817b996a  runtimes-21.1.4.src.tar.xz
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index 3c594e6a3d..78f830ec48 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,4 @@
 # locally calculated
-sha256  e1363888216b455184dbb8a74a347bf5612f56a3f982369e1cba6c7e0726cde1  llvm-20.1.8.src.tar.xz
+sha256  f311681255deb37f74bbf950a653e9434e7d8383a7b46a603a323c46cd4bf50e  llvm-21.1.4.src.tar.xz
+sha256  ae8658390504e08e464f65ecea838a0584df4734c27cecedfe7eb32780e81564  third-party-21.1.4.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index b06b3bd5fa..554e16169f 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -13,6 +13,19 @@ LLVM_CPE_ID_VENDOR = llvm
 LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
 LLVM_INSTALL_STAGING = YES
 
+HOST_LLVM_EXTRA_DOWNLOADS = third-party-$(LLVM_VERSION).src.tar.xz
+
+define HOST_LLVM_THIRD_PARTY_EXTRACT
+	$(call suitable-extractor,$(notdir $(HOST_LLVM_EXTRA_DOWNLOADS))) \
+		$(HOST_LLVM_DL_DIR)/$(notdir $(HOST_LLVM_EXTRA_DOWNLOADS)) | \
+		$(TAR) -C $(@D) $(TAR_OPTIONS) -
+endef
+HOST_LLVM_POST_EXTRACT_HOOKS += HOST_LLVM_THIRD_PARTY_EXTRACT
+LLVM_POST_EXTRACT_HOOKS += HOST_LLVM_THIRD_PARTY_EXTRACT
+
+HOST_LLVM_CONF_OPTS += -DLLVM_THIRD_PARTY_DIR=$(@D)/third-party-$(LLVM_PROJECT_VERSION).src
+LLVM_CONF_OPTS += -DLLVM_THIRD_PARTY_DIR=$(@D)/third-party-$(LLVM_PROJECT_VERSION).src
+
 HOST_LLVM_DEPENDENCIES = host-python3 host-llvm-cmake
 LLVM_DEPENDENCIES = host-llvm
 
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 6cd47762f7..f0b8214976 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  ca89c35cbc55cfe69ab9fa1a2f3ee585d30cb285e01e2cae309fe0e1f1dfd79e  spirv-llvm-translator-v20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b.tar.gz
+sha256  954ef00a48fc440f3624f78cc80ffa98c961510bf558489ea0a940e397c7a871  spirv-llvm-translator-v21.1.1-2-ga37544fc0bb90b4e8b8d755580119c018891dfa4.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 6ba58c392f..62a24f1ff1 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Generate version string using:
-#   git describe --tags --match 'v20*' --abbrev=40 origin/llvm_release_200
-SPIRV_LLVM_TRANSLATOR_VERSION = v20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b
+#   git describe --tags --match 'v21*' --abbrev=40 origin/llvm_release_210
+SPIRV_LLVM_TRANSLATOR_VERSION = v21.1.1-2-ga37544fc0bb90b4e8b8d755580119c018891dfa4
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
