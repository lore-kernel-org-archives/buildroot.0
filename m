Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1F6D70DF2
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 20:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 611098329E;
	Thu, 18 Dec 2025 20:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQVE2bFJZ4NT; Thu, 18 Dec 2025 20:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36965832DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766088459;
	bh=s1NgjLglM1KMbs/AkbAD62+hHqTLkcwskosfe1XT4OQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X0fD5SE0HHElDN2ehPyoz9Pd1tRKPERS1A5ERFeDk6nr/HCg00SOnXMXd/TdaWZxU
	 28WrgLsWAM7FV2DidOvivCS4WV2vIYjNKT4qxocV1urNZleJV1c7IyefwRiA+UD3ah
	 VirJtf7XrU+dckKBVBmv+Ia9Dl5PctJih2x2kBlUci+UKA6z0k4FJP8b5o9oo4PCmP
	 5ulY/0ycbh3qK4f57SCtMYehb90WBWyb5+SIWCAXhpr5i3ttyNstONXiIT3hGUkhPv
	 +3gCiVPvToxvm9CMA1VlNix7tlZUi7XHKScTZISutoKUZBdYn/WUuicBfdMe5z7dAr
	 K4evUvaJXiUuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36965832DC;
	Thu, 18 Dec 2025 20:07:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A9F91A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C76A60BC8
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42zUsGwFf4f1 for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 20:07:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BC8360782
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BC8360782
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BC8360782
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:07:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17390A4C43C4;
 Thu, 18 Dec 2025 21:07:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59282)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vWKHd-000000004hy-1Xwm;
 Thu, 18 Dec 2025 20:07:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Thu, 18 Dec 2025 21:07:33 +0100
Message-ID: <20251218200733.3570275-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766088454;
 bh=GPdvz2ih2VMRit3yt6W8ABtzrN8VgUe9WD7H91Ugs2o=;
 h=From:To:Cc:Subject:Date:From;
 b=ZUNW+AvVvB2kVrReIHHRuO47i94/6W3hvjfrbNXMdlrN1FwUxFUTTNIDAqW3gLGSC
 r7JfJvCKvlTCHBUc0woake1Fu7qFNCGHcfX2aDYg3FazjJIGorKb7Q6OfXpN5OXh85
 JbOOCCbx5EuZIj+bYro5zQDqTfaeeQ5wLgd5Op4hsDmGhwRAZNaXp+KTbBXGA8FpW+
 GnloLQeNUroMq5x7A6fAf7MbL+F9TXPK52kzzgglaC8/LGOyu/a/8SpGQjE07s6d3R
 szuJ4IspuL03qQ5ZTxwGs6jCga7WPj1WWjdQLv1aP/8FahuK8K1jJ196Dxwa8uhg+m
 /EuJSQyMGD9ZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZUNW+AvV
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version 21.1.8
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
https://discourse.llvm.org/t/llvm-21-1-8-released/89144

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/clang/clang.hash                   | 2 +-
 package/llvm-project/compiler-rt/compiler-rt.hash       | 4 ++--
 package/llvm-project/libclc/libclc.hash                 | 2 +-
 package/llvm-project/lld/lld.hash                       | 2 +-
 package/llvm-project/llvm-cmake/llvm-cmake.hash         | 2 +-
 package/llvm-project/llvm-libunwind/llvm-libunwind.hash | 2 +-
 package/llvm-project/llvm-project.mk                    | 2 +-
 package/llvm-project/llvm-runtimes/llvm-runtimes.hash   | 2 +-
 package/llvm-project/llvm/llvm.hash                     | 4 ++--
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 72efe1e09d..1abe819e62 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  eeb5296f46eacc0a1fe6c47a1af9e8d4eb2a5da7254fd8dbc4fc1f1be74315a1  clang-21.1.7.src.tar.xz
+sha256  6090e3f23720d003cdd84483a47d0eec6d01adbb5e0c714ac0c8b58de546aa62  clang-21.1.8.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index 47a90af9be..0ecea6d400 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  4358e4476ab89b6ca9e4174f05f4a2c2c10e4a41c3c7febd25afe96bc27b5758  compiler-rt-21.1.7.src.tar.xz
-sha256  5fe212feb27f325fa29530eb38e746a73d18205bf6a36d9800778a94108d2ee5  third-party-21.1.7.src.tar.xz
+sha256  dd54ae21aee1780fac59445b51ebff601ad016b31ac3a7de3b21126fd3ccb229  compiler-rt-21.1.8.src.tar.xz
+sha256  7fe99424384aea529ffaeec9cc9dfb8b451fd1852c03fc109e426fe208a1f1a7  third-party-21.1.8.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index 41c440cebc..8f06a55864 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  de1c8dbffdce898a4c5e70fb7f5aa6dea1e429f63471773da8cb3cdf9e945403  libclc-21.1.7.src.tar.xz
+sha256  6c2677362a53531c35edf482bdc9171ea0471ca0a1e9138ac9b5a1782925616f  libclc-21.1.8.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index d3a2d22b68..b7483d5564 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  607395fc8a5f4d14eb27b219a279558a172d1e3a34ddd2a3509c12b560f1930a  lld-21.1.7.src.tar.xz
+sha256  d9524c5ee952500a2af92c27042a0d90ab089962af47816d4c85d0ebf76373d1  lld-21.1.8.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index ae2d1737d1..c93a606c3c 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  f25ca011e4453ac035e940aa729d482d08eb83a91b4aaf1f230dc9ea28cadfa4  cmake-21.1.7.src.tar.xz
+sha256  85735f20fd8c81ecb0a09abb0c267018475420e93b65050cc5b7634eab744de9  cmake-21.1.8.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index e34c79b728..bdd6b2481c 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ac6ac43b6d54c6f6725a286ce36acff7a94123a8f2a54c161f866b94fcaa3a9b  libunwind-21.1.7.src.tar.xz
+sha256  03e8adc6c3bdde657dcaedc94886ea70d1f7d551d622fcd8a36a8300e5c36cbc  libunwind-21.1.8.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 15b1076d82..411ef5fb3a 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 21
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.7
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index 9f2784b731..419176341a 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  7f87971685100bc2bd0fe54042c5140da100b0e37fa12fca888cf1d8d06a8e25  runtimes-21.1.7.src.tar.xz
+sha256  b6989d35cdfc1acee4af1d110fb8887f76831eb93e1df6ff7365004048742db8  runtimes-21.1.8.src.tar.xz
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index afa270b83e..2e08ef5977 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  8657ee188b673a3285b991131abe905b4129a18d52d334f9d122463164ecd000  llvm-21.1.7.src.tar.xz
-sha256  5fe212feb27f325fa29530eb38e746a73d18205bf6a36d9800778a94108d2ee5  third-party-21.1.7.src.tar.xz
+sha256  d9022ddadb40a15015f6b27e6549a7144704ded8828ba036ffe4b8165707de21  llvm-21.1.8.src.tar.xz
+sha256  7fe99424384aea529ffaeec9cc9dfb8b451fd1852c03fc109e426fe208a1f1a7  third-party-21.1.8.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
