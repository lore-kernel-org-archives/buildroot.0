Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EC8C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51FD640A60;
	Fri,  4 Sep 2026 16:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PV42GNWtYZeb; Fri,  4 Sep 2026 16:22:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 53D9240A88
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538945;
	b=I5yS8B+QshE+bvGKHGP8gWncZHBgiV13rkjPUiu/1gMvRL338wkY6OcJokpJnWmP8MKt
	 LKY7G8CxRVClZAiF1cRzueh/O2wg39RIch10LN9vLJvK7EuD21C405x5aEJ/Kbh71VyT3
	 7ONIJY0VOjUFI35HSX76iG9MFbZuplWvyhQlG4nmghSFVScp2NLpI/aabK5q8lvUf2G1y
	 f/d1su8j/KlmSh/QDsDaZjiQkSBwILTwqwo3LuMV0EijUYYMzcAKqT8Ah2h8iBAq+utM3
	 DcZBkyo2IeUfK+SxCKReCh8rN3wUS41b7NjJfTajnTmWeoeufnfHh0dx1Hf8X5xxv3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538945;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mZBnTuQ8YhSwkUGV1O1ajVeCLRJphbGhhn6dhLD7aNA=;
	b=GaRyKqRteZ2oXGWcteMFthprY4RS1A1gaflUnnn+6oJodV2QQog+ZhTTRdcmewVVjXRu
	 ML5siItSB8hWElyXCAL7Gr50zYf29LcH98xyOxoU3i76ER83eqS4D1oVorbo0Cgmxf4dg
	 aElGrfYG969vHnXZ60O3edUMYEomJnLikkgREO25GX1k3peFEvGe6a0EBVP/hBrNLbfXJ
	 B7Lw4xkzKMfCjQPzKEwfy5b6gy5PVeAV61r5g+BhVsCglfvHwtjNjjNm0BK1OTdXYK5Ig
	 mOXKj/S8mIkoMgSuzNsGOV2p1ckjOrakxr9FC6dqZH4kTBJEff3VXVgbZeYMnV2+WDQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538945;
	bh=mZBnTuQ8YhSwkUGV1O1ajVeCLRJphbGhhn6dhLD7aNA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QSKXhbUPwoj97a72NBP+iVtkcEZChRszUV3aBjpkfgJo9wAwLhfDfdeoGmKb9FsAa
	 CdZnf6Qv1tAV3l0ZxIg54MTe0cqWLNLdB2JM5kYRXeAzXR0hTrzqe+FrfMuS5E+A+6
	 0EQEnva+LejqxAIxaGFoVSPllxZibWNOSdiHwsELidwdD8xm3zuvXW8iu5ER3XwNWY
	 +o3KvYzgWstxRAWxPTJ6uCyWGAXBGu0m0yVMJCxBIsuo44xIfRKb5WFOlksNHcLAuC
	 j4iECB116/YNmJUvnWKVvfDiTR4nTedw4TcTrkaIgr8p4MUnu1UVc8jmRhNUJ8+b9b
	 jBw9hF9ImkeAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53D9240A88;
	Fri,  4 Sep 2026 16:22:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F8AA3891
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3204D40B03
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_L3Ja0o8d7s for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3BC3740A88
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=tfB5hVNMpO9eOJvjJs/D2TpbuCNcTA2npvJuoL7yLF4DiVF0DV8+RfSq/EloHu1jp8Ps
 c5xLxKjkDleFDdREUs4ic2ImtMW2jveYQarlSIItyCGMeM8Lq7vCkTNLvmMQrCGycj8Px
 al0lQZFZchwbS0q6z4gBkwQndq9NMrTfjIYSpGYowICqA/Cym664O9Jf5QzQUExPV3mIX
 2cAQ/e4bn/F0a+bEbs7WEYUEarMDgFCHrh+kX/X1l2kJ7Uded7ntaZcAiZFmNfe2lgQ4t
 Gw0pAURw2lC1sZnxmJRpisM3S0oL9uAYI7EDZ85f67LSd7d5F6RQ6wQQwteW5XEjMpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OFnwgdDv3v/+Z2R8PXfTo7yjgPX3wZzdBHaCjqLxD5Y=;
 b=GzEJqtU2C/tbqzfEdSkdmczoevPfPk7pN3q+dTgBECQUUzeTqFh1PfLssigWGYZkghJn
 qvZMGlBUjXTXdUbc3IOzi9/SF7860vMu+k5G4S6F0Jx1odlsCRA5/sDsuye2P1TLd//5u
 6BoHl77Lrrtg+g1Naa2swwTL4QxRhkRISwoc/z7F/TOSfQnZ5O0lvV7nyUfIrsjPxtcg8
 kWEit0EviCuabvkLCDErUW83Ut51c5oKtMbPvcR0rI2emzcvB60tWBiC4BhIePA9QNpCw
 Z+Pmd2yyLvotwTA5WOR5aEiSa60APjQzeQDbWpJexAT7PsszHkywhiSrCCWe6K29B8Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BC3740A88
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC82494D45; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 23:17:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4221e786e0be6efefc4fffbf1ec4ee2c4374e608
X-Git-Newrev: 323f7e8492c87e1b761dbbc7d98fe0c535bd71da
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.AC82494D45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.127
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/323f7e8492c87e1b761dbbc7d98fe0c535bd71da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Rework local patch

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/8c4f491f6746da84126df5c422811e914f12367d/doc/src/releases/nss_3_127.md

NOTE: libnss version 3.127 requires libnspr version 4.39.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix libnspr version typo in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch | 10 ++++++----
 package/libnss/libnss.hash                                     |  4 ++--
 package/libnss/libnss.mk                                       |  2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
index 1ddfc61576..f2c48c8fee 100644
--- a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
+++ b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
@@ -1,4 +1,4 @@
-From 974469740e6fa9b7ad15f6d9b3945370dc11fa1e Mon Sep 17 00:00:00 2001
+From 897ebeb9c38d4dc4844f5f414db5aaa17c261eee Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@benettiengineering.com>
 Date: Mon, 30 Mar 2026 17:06:14 +0200
 Subject: [PATCH] Bug 2027768 - Fix build failure due to missing gcm stubs if
@@ -16,6 +16,7 @@ DHAVE_PLATFORM_GHASH definition depending on LITTLE_ENDIAN VARIABLE.
 
 Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=2027768
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Giulio: rebased to version 3.127]
 ---
  nss/coreconf/Linux.mk   |  8 ++++++++
  nss/lib/freebl/Makefile | 28 ++++++++++++++++++++++------
@@ -41,7 +42,7 @@ index dcb432415f..cf1f62378d 100644
  ZLIB_LIBS = -lz
  
 diff --git a/lib/freebl/Makefile b/lib/freebl/Makefile
-index 4ee9d61f50..39ef28ec8c 100644
+index 0ab50b093a..21c3cf62d8 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -112,7 +112,10 @@ endif
@@ -68,7 +69,7 @@ index 4ee9d61f50..39ef28ec8c 100644
          EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
      else ifeq (1,$(CC_IS_GCC))
          # GCC versions older than 4.9 don't support ARM AES. The check
-@@ -146,18 +152,26 @@ ifeq ($(CPU_ARCH),aarch64)
+@@ -146,11 +152,17 @@ ifeq ($(CPU_ARCH),aarch64)
          # and then rejects any major versions prior to 5. Note that
          # there has been no GCC 4.10, as it was renamed to GCC 5.
          ifneq (,$(filter 4.9,$(word 1,$(GCC_VERSION)).$(word 2,$(GCC_VERSION))))
@@ -88,6 +89,7 @@ index 4ee9d61f50..39ef28ec8c 100644
              EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
          endif
      endif
+@@ -183,7 +195,9 @@ ifeq ($(CPU_ARCH),aarch64)
  endif
  ifeq ($(CPU_ARCH),arm)
  ifndef NSS_DISABLE_ARM32_NEON
@@ -98,7 +100,7 @@ index 4ee9d61f50..39ef28ec8c 100644
      EXTRA_SRCS += ghash-arm32-neon.c
  endif
      ifdef CC_IS_CLANG
-@@ -290,7 +304,9 @@ ifeq ($(CPU_ARCH),arm)
+@@ -316,7 +330,9 @@ ifeq ($(CPU_ARCH),arm)
      MPI_SRCS += mpi_arm.c
  endif
  ifeq ($(CPU_ARCH),ppc)
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 544681c9a4..b87c3376b4 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_125_RTM/src/SHA256SUMS
-sha256  1ad541f10da7c58dec01f540ecc44d28cbbc033f741a57473de5a0893d91606d  nss-3.125.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_127_RTM/src/SHA256SUMS
+sha256  5a899cad21ae2c9d3c5132de79726eda8df3b7fdf18eeb239fc544d43b87338b  nss-3.127.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index c01d313da5..734376f61b 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.125
+LIBNSS_VERSION = 3.127
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
