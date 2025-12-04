Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEA5D216B2
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 16:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07F461556;
	Thu,  4 Dec 2025 16:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47wcDABBsqAM; Thu,  4 Dec 2025 16:34:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC6D761BE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764866053;
	bh=9coAfoImsb+6IZTZMQgu4lDnlzBZ/p7+rIoWiZCEY5A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BljBQ3n+J2RpFhSY3TPy3l+F3ZlRIBFyVdbsc81q1ooju15wQFEQUlbntmodQkxFN
	 y5uwXOzAp3oOJB+Nr8yH617ZLaA/JHHVgczfXhbNqFLcSbMZTr/fKAVK1ToQHwNWX7
	 eIdp6evNvxV7Jml4ji7stF3HuitNbihyJI2m6joG4USZ1+plcVYly9bucMqR1Z1vtG
	 t7N6yp0YT2W9DIul+t6TuS5QC1brW8uRrbdTot7KCp5dDiaT1pWYwGasGk21BCWfiA
	 7tbHV4bEsuGS//qM0ikTWjY7UKGyviRIreBAQztj1LhUieu68BezRcfD0ib36En6JX
	 j9F9ns2+vsVyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC6D761BE0;
	Thu,  4 Dec 2025 16:34:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA497D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC4AC61BDB
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3acWNG7kkpAD for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 16:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8455D61BD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8455D61BD0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8455D61BD0
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:34:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ACD3EA4C1175;
 Thu,  4 Dec 2025 17:34:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36632)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRCHQ-0000000008a-3kKA;
 Thu, 04 Dec 2025 16:34:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Thu,  4 Dec 2025 17:34:09 +0100
Message-ID: <20251204163409.1315954-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764866049;
 bh=hh3rd2Pq+6c21SHqvEnpIwyaxcwRNXX0z4wD6fnfE74=;
 h=From:To:Cc:Subject:Date:From;
 b=lSXiktl4dHPtWaisljyYrBWwM4vhqRGA/l07tRx39UJMtjburmVD5asLQXmIpgahv
 tl83Ps/PyTvO3CEDaVZnufM4PUE6vAvlNA8fAK3Niip/7poXdFdqjrxo6ppeJFdUb6
 U/SbxzjdYG3o0a2V4bjjjH11l/xtwlkP48Op9HcGnulKDnbTXqK+yPshgyPjXkXReb
 +fnLWq0VBybM3V3CXkWJDkYWCDYPkMLuVhoXRfQPT2ffM4q3fyT19GClxBb7wXtowR
 g0AVtfm78JWObr4oO+FUE/kn23azPATomTiTdusGitaL/ZkanoeosrhPM8rzW/ZAUM
 IStTctQsndO0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lSXiktl4
Subject: [Buildroot] [PATCH/next 1/1] package/llvm-project: bump to version
 21.1.7
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
https://discourse.llvm.org/t/llvm-21-1-7-released/89029

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
index 5ac73a252c..72efe1e09d 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  348ace5d715c4caa6fb89b4c6fe07c21650e10b2fac37d8b0db75c0b11be9011  clang-21.1.6.src.tar.xz
+sha256  eeb5296f46eacc0a1fe6c47a1af9e8d4eb2a5da7254fd8dbc4fc1f1be74315a1  clang-21.1.7.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index b9ec906595..47a90af9be 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  bdd904f3aac9f4c4424f3440aff498cc04d66f243e37156b6d167ffb7b599f89  compiler-rt-21.1.6.src.tar.xz
-sha256  8d09dc219cdb3da7dafd2161836aacdd6e02c1a113498ab5f37688599406dc8a  third-party-21.1.6.src.tar.xz
+sha256  4358e4476ab89b6ca9e4174f05f4a2c2c10e4a41c3c7febd25afe96bc27b5758  compiler-rt-21.1.7.src.tar.xz
+sha256  5fe212feb27f325fa29530eb38e746a73d18205bf6a36d9800778a94108d2ee5  third-party-21.1.7.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index 92b51fc1fa..41c440cebc 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  a1a09ccfa17f2d5fbe5e54271a4a9fbe396950f29f80f52b67a7083fee73120c  libclc-21.1.6.src.tar.xz
+sha256  de1c8dbffdce898a4c5e70fb7f5aa6dea1e429f63471773da8cb3cdf9e945403  libclc-21.1.7.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index b05f1e30f9..d3a2d22b68 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  5b297faecdddc9581c260a1570b4c0ec8810d1213e23d7aa84732c0e2feea85f  lld-21.1.6.src.tar.xz
+sha256  607395fc8a5f4d14eb27b219a279558a172d1e3a34ddd2a3509c12b560f1930a  lld-21.1.7.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 402a5f4ef7..ae2d1737d1 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  e364f135fa14c343d70cac96f577f44e8e20bf026682f647f8c3c5687a0bebd1  cmake-21.1.6.src.tar.xz
+sha256  f25ca011e4453ac035e940aa729d482d08eb83a91b4aaf1f230dc9ea28cadfa4  cmake-21.1.7.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index 7326a0d863..e34c79b728 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  25d8bf5bd0d95641c738ea690b18564f5fc9fb7e7bbab17329b391988e71ae8c  libunwind-21.1.6.src.tar.xz
+sha256  ac6ac43b6d54c6f6725a286ce36acff7a94123a8f2a54c161f866b94fcaa3a9b  libunwind-21.1.7.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 268367d6bd..15b1076d82 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 21
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.6
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.7
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index c68f1c13ff..9f2784b731 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  3b2dcaec1163caf067988228c1d21a75334c47d22610956dd9699ea0631bce45  runtimes-21.1.6.src.tar.xz
+sha256  7f87971685100bc2bd0fe54042c5140da100b0e37fa12fca888cf1d8d06a8e25  runtimes-21.1.7.src.tar.xz
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index 1738c94d29..afa270b83e 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  908bce97be0275943414b45af2e2b20e8f6d5d9266fdc120bd59f096ebc547ad  llvm-21.1.6.src.tar.xz
-sha256  8d09dc219cdb3da7dafd2161836aacdd6e02c1a113498ab5f37688599406dc8a  third-party-21.1.6.src.tar.xz
+sha256  8657ee188b673a3285b991131abe905b4129a18d52d334f9d122463164ecd000  llvm-21.1.7.src.tar.xz
+sha256  5fe212feb27f325fa29530eb38e746a73d18205bf6a36d9800778a94108d2ee5  third-party-21.1.7.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
