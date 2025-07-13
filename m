Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EB8C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 12:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBCBC60AB9;
	Sun, 13 Jul 2025 12:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_EMNFJv3IhH; Sun, 13 Jul 2025 12:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C537660742
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C537660742;
	Sun, 13 Jul 2025 12:43:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01410DF
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 12:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E72C840083
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 12:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLVoRIicjzzx for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 12:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A2B240018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A2B240018
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A2B240018
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 12:43:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cef.dip0.t-ipconnect.de [91.58.12.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A51DA4C3431;
 Sun, 13 Jul 2025 14:43:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39530)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uaw2r-000000006AK-3vnC;
 Sun, 13 Jul 2025 12:43:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun, 13 Jul 2025 14:43:05 +0200
Message-Id: <20250713124305.2659964-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1752410586;
 bh=S0aa9u3BgtJE+rxdEQvHAbiv2I+4RhrkCqP8aSJ8+oc=;
 h=From:To:Cc:Subject:Date:From;
 b=krZoZR4aqeoa/EbSN1gEfkMbZ7bb0Uf3eg9ddCQv6/J3+2IrEhq4AHO3Yq/VuVctC
 G3Ek+oUjhwff3MDccODnYpWTCr+f/U3uXVvTOrecirZ1K/8lgLad/M7A/u93Cj/CBd
 QHwf40KnjGHxeUNI0hHvuensJpzwfef5xmSvtshyFnVDs2n9vM8HLbk2a0pF8RBa3G
 DLE6PRUGSM0Tojwg+tDbmU3+ZzGynR4jaumN5uKTmT9z9tqpZuAWQDgmJhvxRKZAwG
 f+0THpk8PVhtxdgKq+aUmc5WVZVt4ciCNRJxY8JYD4f0Pb5cJ6RaA77ULs056hxnIo
 88lnHAKLmrBqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=krZoZR4a
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version 20.1.8
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
https://discourse.llvm.org/t/llvm-20-1-8-released/87259

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
index 630bef078e..171bfe1d6a 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  cb74965a2481008ae405419357a55fda2df6fa3aee262a0a9293a558532a29ae  clang-20.1.7.src.tar.xz
+sha256  b7a1b7b0af7b9c7596af6bd46e36d11321926eaa66a7a7dc957ab0a1375ee4b0  clang-20.1.8.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index 152b61fd87..5224eff6de 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  326d6deb8eaf60bc4a66a1cbab20409f328bdddcafe77207c6bcd88d768076e3  compiler-rt-20.1.7.src.tar.xz
+sha256  15277402f6fd63397c0917a5c7171cda82d16d226094b828c1ed0f58f73b9c69  compiler-rt-20.1.8.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index d905be1fe6..aa6b6e19ae 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  22b29c1a9f18d8744e5a24f36ce6d4f198d523c126cd7182569c73806e1e1854  libclc-20.1.7.src.tar.xz
+sha256  ecd83a52859742f71f4c332538f8bee54a6743374a233b5a85017de22d75c227  libclc-20.1.8.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index 3b14549450..a2d79fb0a9 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  9cb94dac7db0e1f2b664469e1574c0b350bec3eacd0cbc524481a6f65fc0f185  lld-20.1.7.src.tar.xz
+sha256  8281462d62cae67dfe5fdbb4da0d82bc62e0a86d4d4f758b0b601d44f09fd987  lld-20.1.8.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 92aedbd7a1..03e77764f1 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  afdab526c9b337a4eacbb401685beb98a18fb576037ecfaa93171d4c644fe791  cmake-20.1.7.src.tar.xz
+sha256  3319203cfd1172bbac50f06fa68e318af84dcb5d65353310c0586354069d6634  cmake-20.1.8.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index 7375523bc5..bcc36e60a6 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  46081293b2f857caca68a266cf11fad8366315c470a9a6766868ed6c369bac0c  libunwind-20.1.7.src.tar.xz
+sha256  0bced9d701e300f8fe6599523367e214c1f928ac559afceece58f47018e9c4a7  libunwind-20.1.8.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 106dadcd2f..aec5e0d31d 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 20
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.7
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index 4915afc040..61bf6f35b4 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  9357bba8ec103cfb48a271420251a057636aae346b9bad880801e11d19dcbfc6  runtimes-20.1.7.src.tar.xz
+sha256  86b375ab217619d018f6875b7c71106ffab5ab21c425f414a11468c2a8262819  runtimes-20.1.8.src.tar.xz
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index de64b089d8..3c594e6a3d 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  10b62d003f16afbd1a5ee0aa6397704c13d9a12a2562103998a8c1eff4a0f1ea  llvm-20.1.7.src.tar.xz
+sha256  e1363888216b455184dbb8a74a347bf5612f56a3f982369e1cba6c7e0726cde1  llvm-20.1.8.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
