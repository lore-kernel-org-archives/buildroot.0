Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8E5C5DF7D
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 21:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F308B608B6;
	Mon, 17 Aug 2026 21:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibICnARX9NZO; Mon, 17 Aug 2026 21:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F0A8608BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787002981;
	bh=dS+0xi30+kYJeBPMu2/Za6LHiAZwvOS9HECHhsCUGOw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mmfl82bX+wqujzse+6rolRd5aP5HUNbOzVbqOZYDgghUyQjkwwFbrzFknLRoCCnth
	 WB/9upK9GqEl9zj6wXrEjq1HSlNEoN5rqOft4cTYZPvzmFFXSlZ5MEhCT3QZGela85
	 Xbnxlus8EE7zkJOZ9ZbpmpFJFnlCnWeEtvbD3FEZOb5W3pr2WNJq3OINQR1YK6tAeg
	 8+TAzu9k10KVm4mnmlbK+yi8FatRSdsgCJENSxPFHtBi7UQIJT1ksmpnJqIQ3B1wBn
	 C4ngsvjYfBo8H9DSVN/pLIw7/cGmbN8ICN4w8QYYiaaRTqAOiCMmLW9ciExrYuBlec
	 vdBpLIPmuYDUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F0A8608BB;
	Mon, 17 Aug 2026 21:43:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D11334
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 21:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BB81810EC
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 21:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbOsXahDPvdu for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 21:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.68;
 helo=smtpcmd0768.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30D1080F60
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D1080F60
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=L7XzLUsx
Received: from smtpcmd0768.aruba.it (smtpcmd0768.aruba.it [62.149.156.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30D1080F60
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 21:42:55 +0000 (UTC)
Received: from localhost.localdomain ([93.138.58.189])
 by Aruba SMTP with ESMTPSA
 id w56awCITQtpTfw56bwLok2; Mon, 17 Aug 2026 23:42:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1787002973; bh=dUc7Ci6SOFj5gJIwJPOeMboyp4b3oFSGm4XSRB9Qi84=;
 h=From:To:Subject:Date:MIME-Version;
 b=L7XzLUsxJk4CJJPujo+Qe6eDeueVVQTbZje8HK2YTFsgHH31Ihg81Am9+dboflSIl
 pdgA05QVovoSX0Tjn4Sp817YXNPiF9GviuUWy+XYI6cLOqJZAuzOO72Zrtjj634Fcp
 hRrIQm8xpLjhbS3ZJRg7nTGY9C/rx6AmZjwUpY2Va1LIJmUpShp9edLUlAhMdo1wcv
 lFSTWIMcm39CTyMpFPcXvJTTE7NgE/LpXtSee0JUrSSctLC8fmJ780ehMXebhBI/qM
 EHnYo5UcyIAYndR07yR5UNvUfpJ29Fo6zWFgs3x1muZ+jkiTQ57xR181TRldUO9+BV
 MFtIS0Di4FLyA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 17 Aug 2026 23:42:51 +0200
Message-ID: <20260817214251.209317-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260817214251.209317-1-giulio.benetti@benettiengineering.com>
References: <20260817214251.209317-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPmtVqQvzkpjKqAUhVQYbYJuRCJVuxeMA0qZSkCtm3S9rIoLOG/HWMj4u45Q1HBENGNRr/k2Cs7EGXXXudR4f2Xgjrj1T4HiK9o4NB0krtoIiXAhQrJh
 Bxjhl+C/2f9BcWOokWkdJbceV2bXJap8BOU/5Wp66oEDw/PGyeqxJ6cBnMjg630t8uwBVRVGlCuq60H/gxcRHCz0MJnJvXuBRq6lCTi5l2p2pSrRdR68xoM2
 YAPnU33vliTEAfRnzzKI7rsoGLRuMA0oAAgbhUwC56SIhqmb0XIhgDD0jzhiwX+ou+FjL1iieDOWxthsBSomfg==
Subject: [Buildroot] [PATCH 2/2] package/libnss: bump version to 3.127
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

Rework local patch

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/8c4f491f6746da84126df5c422811e914f12367d/doc/src/releases/nss_3_127.md

NOTE: version 3.127 requires libnspr version 3.39 that comes in previous
patch of this patchset.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...7768-Fix-build-failure-due-to-missing-gcm-stu.patch | 10 ++++++----
 package/libnss/libnss.hash                             |  4 ++--
 package/libnss/libnss.mk                               |  2 +-
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
