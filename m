Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A086C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 21:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB6A64026C;
	Thu, 11 Jul 2024 21:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzU9zBGyGMRW; Thu, 11 Jul 2024 21:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5255440129
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5255440129;
	Thu, 11 Jul 2024 21:34:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50FCC1BF5F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E0DD40129
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hg5HJdFkTkps for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 21:34:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CF85400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CF85400E0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CF85400E0
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 21:34:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A1ABC20002;
 Thu, 11 Jul 2024 21:34:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 23:34:34 +0200
Message-ID: <20240711213435.1172955-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720733679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5uO6QAg8adsHsZCBFw2fNt6atZhek04GsFsFNdhxxgo=;
 b=J3WOp3a1jtVUMlOiByBZZZpVjsdL2Fj3ywn2hZcilivnGq6F7rxcwibZ0hY6+xKfNMxICw
 sUxJJtdlYec3I0ggpqDI/Zwk/u250qY5DA1m2v2rlOZKnGFKEuOB8WfhgYHjO/7OLPcpSr
 uiMLI2wm1g7WiWAw8z7GT/iUSbMsSlrvd4UNsL2I8zgXvqyMPf9uplUu5udB918eFZ8Vpm
 VydaReUKCzG2d6nBQDMugx9ApbChV/yhyOjQzm50D0kDeWxGtxReFkFBZEOXOF/U+d7IRL
 tIs7z/JRq57Ch7p/nqWM4zJB6guf8eCxcjKevnh4VP+S+A47j5Dt0VNDYXYNaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J3WOp3a1
Subject: [Buildroot] [PATCH] package/gcc: bump 12.x series to 12.4
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gcc.gnu.org/gcc-12/changes.html describes the changes of gcc
12.4 as follows:

  This is the list of problem reports (PRs) from GCC's bug tracking
  system that are known to be fixed in the 12.4 release. This list
  might not be complete (that is, it is possible that some PRs that
  have been fixed are not listed here).

With a link to
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.4

There are 654 relevant commits (ignoring the "daily bumps") between
gcc 12.3.0 and 12.4.0, which is too much to list exhaustively here.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                           | 2 +-
 .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
 ...02-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 0
 .../0003-xtensa-add-.note.GNU-stack-section-on-linux.patch    | 0
 .../0004-Remove-crypt-and-crypt_r-interceptors.patch          | 0
 package/gcc/Config.in.host                                    | 2 +-
 package/gcc/gcc.hash                                          | 4 ++--
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename package/gcc/{12.3.0 => 12.4.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
 rename package/gcc/{12.3.0 => 12.4.0}/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch (100%)
 rename package/gcc/{12.3.0 => 12.4.0}/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch (100%)
 rename package/gcc/{12.3.0 => 12.4.0}/0004-Remove-crypt-and-crypt_r-interceptors.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9a46840422..e4c40fbf1e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -591,7 +591,7 @@ package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gamin/0001-no-abstract-sockets.patch lib_patch.Upstream
 package/gamin/0002-no-const-return.patch lib_patch.Sob lib_patch.Upstream
 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch lib_patch.Upstream
-package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
diff --git a/package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/12.3.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
similarity index 100%
rename from package/gcc/12.3.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
rename to package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
diff --git a/package/gcc/12.3.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch b/package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
similarity index 100%
rename from package/gcc/12.3.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
rename to package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
diff --git a/package/gcc/12.3.0/0004-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
similarity index 100%
rename from package/gcc/12.3.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
rename to package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 969702b707..c88518a415 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -73,7 +73,7 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
-	default "12.3.0"    if BR2_GCC_VERSION_12_X
+	default "12.4.0"    if BR2_GCC_VERSION_12_X
 	default "13.3.0"    if BR2_GCC_VERSION_13_X
 	default "14.1.0"    if BR2_GCC_VERSION_14_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 0b48a1acdd..4534655790 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -2,8 +2,8 @@
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-10.4.0/sha512.sum
 sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
-sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.4.0/sha512.sum
+sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
 sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.1.0/sha512.sum
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
