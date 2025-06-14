Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033B1C71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B75664070E;
	Sat, 14 Jun 2025 13:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRNEoUe75k3U; Sat, 14 Jun 2025 13:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6579405B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6579405B9;
	Sat, 14 Jun 2025 13:49:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6553B151
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BCAD405B9
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gj-52y7_LL0q for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:49:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46BE640599
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46BE640599
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46BE640599
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:49:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ea.dip0.t-ipconnect.de [91.58.8.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75E10A4C0D71;
 Sat, 14 Jun 2025 15:49:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51032)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQRGB-000000001aE-2YGu;
 Sat, 14 Jun 2025 13:49:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Sat, 14 Jun 2025 15:49:27 +0200
Message-Id: <20250614134927.688175-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749908968;
 bh=maArNVqTf3hKXTJlazVwkYn/GmNIFBXp4MJFj/7ueKo=;
 h=From:To:Cc:Subject:Date:From;
 b=OiU/Z4XwQ/enTwskaCI04L/d+/ubjpYaGB5sXY19KyEchyeL2ToQlzOG/8JY2ot97
 fbH3bofnDI/eJKxVm9IZwNYgDX1BfmIFdZOu4e/bCOyK/YhACZEhATYHw1DnCYKOg7
 YeA6LAGwIzdhXUC+hJCNrlNbpTS4Z2mDZmXGa2nPMxVzBAvtf8F8sBq34KVjhMnsLv
 QeIR+J7dH/kIthNbn5TO5dMdJuwwuVAS6vFpTOWZfM/RI0OBFI1B47w6HSPk2TgCAu
 nWNZ8RrVEIpIWUJboyubBONCDhi5iW5fJNvFPhQ6zFtXULJcziBjUsH+eWYyHnXjbs
 Sgnhti27hx7ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=OiU/Z4Xw
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version 20.1.7
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/clang/clang.hash                   | 2 +-
 package/llvm-project/compiler-rt/compiler-rt.hash       | 2 +-
 package/llvm-project/libclc/libclc.hash                 | 2 +-
 package/llvm-project/lld/lld.hash                       | 2 +-
 package/llvm-project/llvm-cmake/llvm-cmake.hash         | 2 +-
 package/llvm-project/llvm-libunwind/llvm-libunwind.hash | 2 +-
 package/llvm-project/llvm-project.mk                    | 2 +-
 package/llvm-project/llvm-runtimes/llvm-runtimes.hash   | 2 +-
 package/llvm-project/llvm/llvm.hash                     | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index d44ea9a3b3..630bef078e 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  97025772b25c6694db049d3c4be5a72d926299aa1a9b861f490d66750e31c9dd  clang-20.1.5.src.tar.xz
+sha256  cb74965a2481008ae405419357a55fda2df6fa3aee262a0a9293a558532a29ae  clang-20.1.7.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index 5816e91702..152b61fd87 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  bdcebca627f377ffcff5405cd5694efbddb14c89ad7d0ea481b1646a42bfeca3  compiler-rt-20.1.5.src.tar.xz
+sha256  326d6deb8eaf60bc4a66a1cbab20409f328bdddcafe77207c6bcd88d768076e3  compiler-rt-20.1.7.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index cfce638f6e..d905be1fe6 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  7aabcc31eff12bc54778c38752192939df8d983002c961cb1ac97f57e50ccff1  libclc-20.1.5.src.tar.xz
+sha256  22b29c1a9f18d8744e5a24f36ce6d4f198d523c126cd7182569c73806e1e1854  libclc-20.1.7.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index 971eec6372..3b14549450 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  4e084130cc51a8b900737cec40578eab867f7e8017121409940d96550784ff12  lld-20.1.5.src.tar.xz
+sha256  9cb94dac7db0e1f2b664469e1574c0b350bec3eacd0cbc524481a6f65fc0f185  lld-20.1.7.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 962633f665..92aedbd7a1 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  1b5abaa2686c6c0e1f394113d0b2e026ff3cb9e11b6a2294c4f3883f1b02c89c  cmake-20.1.5.src.tar.xz
+sha256  afdab526c9b337a4eacbb401685beb98a18fb576037ecfaa93171d4c644fe791  cmake-20.1.7.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index d95fa17622..7375523bc5 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  f0555603222189d8d2ff2d02747c63a3bbeb291fa72ce042c1a6d26399150baf  libunwind-20.1.5.src.tar.xz
+sha256  46081293b2f857caca68a266cf11fad8366315c470a9a6766868ed6c369bac0c  libunwind-20.1.7.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index fdbfcbadc9..106dadcd2f 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 20
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.7
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index 93077efaba..4915afc040 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  8b3255668594ca3450ac5c041ac52c3c33300873d033cda49529e7fe1d4257e6  runtimes-20.1.5.src.tar.xz
+sha256  9357bba8ec103cfb48a271420251a057636aae346b9bad880801e11d19dcbfc6  runtimes-20.1.7.src.tar.xz
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index bc46117ec6..de64b089d8 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  9a9a80ca4c0d902531f2b43e9e4d6c36b57cdd5702430e0b54567bf273bd32c1  llvm-20.1.5.src.tar.xz
+sha256  10b62d003f16afbd1a5ee0aa6397704c13d9a12a2562103998a8c1eff4a0f1ea  llvm-20.1.7.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
