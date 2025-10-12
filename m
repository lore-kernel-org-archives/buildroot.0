Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7522DCCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 09:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2943181E0D;
	Sun, 12 Oct 2025 09:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jX9ltA4CTGaF; Sun, 12 Oct 2025 09:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0747B81E0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0747B81E0E;
	Sun, 12 Oct 2025 09:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D1C912B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 09:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EC5A40BA8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 09:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHTueVn1IDdw for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 09:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42FF64009D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42FF64009D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42FF64009D
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 09:00:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 869E7A4C6684;
 Sun, 12 Oct 2025 11:00:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59162)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7rwI-0000000013Z-3GYJ;
 Sun, 12 Oct 2025 09:00:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun, 12 Oct 2025 11:00:27 +0200
Message-ID: <20251012090027.3442805-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760259627;
 bh=9mPH8fh38gOTdMSt+UO4X1kaUpiTggIf1OX4+A7AA/4=;
 h=From:To:Cc:Subject:Date:From;
 b=mGFzl632R4v754o25IAXOO8eWP5/+6/IVb7HBPAYCI7pdZVEThb3sNV9KRSYH5n5z
 AXTNhILq8FHuUL4dIRwL4lsh/4l9n/u1f9P+H3cpWUzDFrJCvOXK9gHL+gRx0YTODg
 rKAqYPg3+tCxT4DVsf0bWUE55gtoa96eh2rBAHBhVTPzyodLpFvkoFYzukDXkjeC+p
 AeWOK2vwLse4z9hgVA+1Zyc90eqRFf2LXXn1CkE9+QdPgLplWSWmp9p3fG0AxpnHLz
 ZRz1fuhpJ46AbXt+cBJRLPWxlQVyxatfD0/RqLiuM8a5wqPYxf5xu9+zDsC7f/aOYc
 X+jnYVrCEDeAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=mGFzl632
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version 21.1.3
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
https://discourse.llvm.org/t/llvm-21-1-3-released/88525
https://discourse.llvm.org/t/llvm-21-1-2-released/88398
https://discourse.llvm.org/t/llvm-21-1-1-released/88244
https://discourse.llvm.org/t/llvm-21-1-0-released/88066

Update spirv-llvm-translator to align with 21.1.3
Release notes:
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.1

Added upstream tarball for third-party code due to upstream commit:
https://github.com/llvm/llvm-project/commit/7f3afab9181d83f92771293ad3b6c00ac62800fd

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/clang/clang.hash               |  2 +-
 package/llvm-project/compiler-rt/compiler-rt.hash   |  2 +-
 package/llvm-project/libclc/libclc.hash             |  2 +-
 package/llvm-project/lld/lld.hash                   |  2 +-
 package/llvm-project/llvm-cmake/llvm-cmake.hash     |  2 +-
 .../llvm-project/llvm-libunwind/llvm-libunwind.hash |  2 +-
 package/llvm-project/llvm-project.mk                |  4 ++--
 .../llvm-project/llvm-runtimes/llvm-runtimes.hash   |  2 +-
 package/llvm-project/llvm/llvm.hash                 |  3 ++-
 package/llvm-project/llvm/llvm.mk                   | 13 +++++++++++++
 .../spirv-llvm-translator.hash                      |  2 +-
 .../spirv-llvm-translator/spirv-llvm-translator.mk  |  4 ++--
 12 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 171bfe1d6a..bdb685a767 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  b7a1b7b0af7b9c7596af6bd46e36d11321926eaa66a7a7dc957ab0a1375ee4b0  clang-20.1.8.src.tar.xz
+sha256  a70518c2d4c90b8b170732e1342a9854ec2babc310b41d5556a83f4b55a63d1d  clang-21.1.3.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index 5224eff6de..939e002d85 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  15277402f6fd63397c0917a5c7171cda82d16d226094b828c1ed0f58f73b9c69  compiler-rt-20.1.8.src.tar.xz
+sha256  143b6ac5278788a9010f2464e77627945c1633706bb571b664e14a5350670d93  compiler-rt-21.1.3.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index aa6b6e19ae..822e3e3b08 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  ecd83a52859742f71f4c332538f8bee54a6743374a233b5a85017de22d75c227  libclc-20.1.8.src.tar.xz
+sha256  7ec2e1207739d617580a3585549c55cd73e44a6565e39e074344df41e5253868  libclc-21.1.3.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index a2d79fb0a9..6222d9d8e1 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8281462d62cae67dfe5fdbb4da0d82bc62e0a86d4d4f758b0b601d44f09fd987  lld-20.1.8.src.tar.xz
+sha256  8904e54475ca8426bc79b9278af1c3cccb40bf9958bd3f7d15f692f1b237d56f  lld-21.1.3.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 03e77764f1..6631a8e731 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  3319203cfd1172bbac50f06fa68e318af84dcb5d65353310c0586354069d6634  cmake-20.1.8.src.tar.xz
+sha256  4db6f028b6fe360f0aeae6e921b2bd2613400364985450a6d3e6749b74bf733a  cmake-21.1.3.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index bcc36e60a6..2ea980a50e 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  0bced9d701e300f8fe6599523367e214c1f928ac559afceece58f47018e9c4a7  libunwind-20.1.8.src.tar.xz
+sha256  ce4c70d9086bff55525cb4cc653306be46b668b7719b1d1a4da4d309902c9d38  libunwind-21.1.3.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index aec5e0d31d..267b91c568 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION_MAJOR = 20
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
+LLVM_PROJECT_VERSION_MAJOR = 21
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.3
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index 61bf6f35b4..ec797f569d 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  86b375ab217619d018f6875b7c71106ffab5ab21c425f414a11468c2a8262819  runtimes-20.1.8.src.tar.xz
+sha256  448fb0fd28260f896ce27328fefb4a9cc6cb7547bd0e9085462bfbc319a252f4  runtimes-21.1.3.src.tar.xz
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index 3c594e6a3d..f7bcef779c 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,4 @@
 # locally calculated
-sha256  e1363888216b455184dbb8a74a347bf5612f56a3f982369e1cba6c7e0726cde1  llvm-20.1.8.src.tar.xz
+sha256  a80f2dbfa24a0c4d81089e6245936dcd0c662c90f643d1706bb44e7bc8338ff1  llvm-21.1.3.src.tar.xz
+sha256  2bae76a7c7db4096b921589ae94c030727ee0dcb600bfe40353878937af61aa0  third-party-21.1.3.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index b06b3bd5fa..c1209dc0a9 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -13,6 +13,19 @@ LLVM_CPE_ID_VENDOR = llvm
 LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
 LLVM_INSTALL_STAGING = YES
 
+HOST_LLVM_EXTRA_DOWNLOADS = third-party-21.1.3.src.tar.xz
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
index 6cd47762f7..d2f120d442 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  ca89c35cbc55cfe69ab9fa1a2f3ee585d30cb285e01e2cae309fe0e1f1dfd79e  spirv-llvm-translator-v20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b.tar.gz
+sha256  a1dbb1cff0c0f558428800b1ccdf06cb72f0291c6cbb2b1acd6d8754ff885d31  spirv-llvm-translator-v21.1.1-1-g085f2d9b94759b01c79da57616b35a77a7b8e90f.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 6ba58c392f..72b758a8cf 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Generate version string using:
-#   git describe --tags --match 'v20*' --abbrev=40 origin/llvm_release_200
-SPIRV_LLVM_TRANSLATOR_VERSION = v20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b
+#   git describe --tags --match 'v21*' --abbrev=40 origin/llvm_release_210
+SPIRV_LLVM_TRANSLATOR_VERSION = v21.1.1-1-g085f2d9b94759b01c79da57616b35a77a7b8e90f
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
