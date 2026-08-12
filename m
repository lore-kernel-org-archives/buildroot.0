Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EE8C5CFDB
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 21:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFB8E40903;
	Wed, 12 Aug 2026 21:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cN7gNE6LAdQK; Wed, 12 Aug 2026 21:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F100408E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786570384;
	bh=mfaEU8tyMQOXFIxwh9oULpUeNf+NvK2KUDQg68bOdh0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y3gONjcheHnpuFhAh5BsC6XuhKhAAx0BLmkuN/Tbrb8EOEY1I57PG1hw+4kzg6G69
	 m+O3Osv5s/cQSitKDbwwH1BdHuzIhKMsoiV7sOvcTGu8E85BnBpwU3vOlwR57IL7Uf
	 cAGofXLTQQWLFxIse4LKyOx210kwo/l0ICGLdQnDaHhubbIm8alI+l95a5wOoNq361
	 i1UHFDleVgimOv1Pt5HRyMqI+zXdSjyrnEUlb2G1AXTnLK3+M3czwXYLz5cg23VFfV
	 YIkpxl9EPO2UHFqX5wxqBKeCvC66EglLQArYcEoTR7eCfOayNdPPk55XmuOLpCb3ND
	 4c+P6CYsdtkLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F100408E4;
	Wed, 12 Aug 2026 21:33:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8626E1AF
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 21:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C9B980FBA
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 21:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1kiwxubYUzZ for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 21:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F92380F29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F92380F29
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F92380F29
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 21:33:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0529.dip0.t-ipconnect.de [91.58.5.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 485BBA4C4BFC;
 Wed, 12 Aug 2026 23:32:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wuGYr-00000000424-3FxJ;
 Wed, 12 Aug 2026 21:32:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Steve Kenton <skenton@ou.edu>
Date: Wed, 12 Aug 2026 23:32:32 +0200
Message-ID: <20260812213233.4141296-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812213233.4141296-1-bernd@kuhls.net>
References: <20260812213233.4141296-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786570354;
 bh=cBkVgLXb3hOJkYWGeMEy9mWR5xCizrfhMU/FNvox89Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RLUVFXfUtmRiI81THQ4VLSEIYfAJqyVCwOve9e79Y43uxtr5fiEsCSTvD4EHmuX5+
 fzsevDplkpwdcPgRvArJhTu0Zx1VDpH8nYpd7iiqMazaR7sexCY1pIEWB6rHt5buTF
 SOpmvJPGWI5ZJmYTsYxK/LlM+UKFt18/V8OPo4dnxAoVw7MljmWwbCKJpiTlfjAIeV
 ZZSjG9s8yZB17WS1MrQWtsijZMiRl13HFNk0ouQQmG7y+M2oSD3Uv2zqTfJ40aMoBC
 d1mGCfGTRalMNsE1ixiHryaCakgeY3kAQ4JnVeLk33ZGYqHYosr44C7kb2yKtR9Vwf
 ZDNLGKCLohIPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RLUVFXfU
Subject: [Buildroot] [PATCH 3/3] package/libdvdread: bump version to 7.1.1
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

https://code.videolan.org/videolan/libdvdread/blob/7.1.1/NEWS

Removed sha1 hash, the sha256 hash is sufficient.

Added patch to fix build error which would be introduced by this bump
that was seen with br-arm-full-static defconfig by the Gitlab pipelines.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2dc576af9407fd4c97dc0cebae5bcb7457b19969

 ...d-compilation-problems-with-PATH_MAX.patch | 40 +++++++++++++++++++
 package/libdvdread/libdvdread.hash            |  6 +--
 package/libdvdread/libdvdread.mk              |  2 +-
 3 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch

diff --git a/package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch b/package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch
new file mode 100644
index 0000000000..c161f8a8f1
--- /dev/null
+++ b/package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch
@@ -0,0 +1,40 @@
+From 37915b22749ad6f696f555d35bae23a2f6b7a6a9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 12 Aug 2026 22:40:26 +0200
+Subject: [PATCH] Fixed compilation problems with PATH_MAX
+
+../src/dvd_reader.c: In function 'dir_has_file':
+../src/dvd_reader.c:393:14: error: 'PATH_MAX' undeclared (first use in this function)
+  393 |   char path[ PATH_MAX + 1 ];
+
+The build error was introduced by
+https://code.videolan.org/videolan/libdvdread/-/commit/da7d7ed4e8fe08c0af310925995b2f4742f7eabf
+
+and was found using the buildroot Gitlab pipelines with gcc 9.3.0.
+
+Upstream: https://code.videolan.org/videolan/libdvdread/-/merge_requests/142
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/dvd_reader.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/dvd_reader.c b/src/dvd_reader.c
+index ceef4ee..2a70958 100644
+--- a/src/dvd_reader.c
++++ b/src/dvd_reader.c
+@@ -29,6 +29,11 @@
+ #include <limits.h>         /* PATH_MAX */
+ #include <ctype.h>          /* isalpha */
+ 
++#include <config.h>
++#ifdef HAVE_SYS_PARAM_H
++#   include <sys/param.h>   /* PATH_MAX */
++#endif
++
+ #if defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__NetBSD__) || defined(__bsdi__) || defined(__APPLE__)
+ # define SYS_BSD 1
+ #endif
+-- 
+2.47.3
+
diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 5fb51ff47c..4a669fbcc5 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,7 +1,5 @@
-# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha1
-sha1  aaba59e0e04fa12704fab4230344549d8ae4b2e3  libdvdread-7.0.1.tar.xz
-# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha256
-sha256  2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dde986d3943355d407  libdvdread-7.0.1.tar.xz
+# From https://download.videolan.org/pub/videolan/libdvdread/7.1.1/libdvdread-7.1.1.tar.xz.sha256
+sha256  a0d47876548bec806774bbf8dbf20bb19ba139464383156b32eb8e59915b90a9  libdvdread-7.1.1.tar.xz
 
 # Hash for license file:
 sha256  d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572  COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index cc515606b2..b6a34ad173 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 7.0.1
+LIBDVDREAD_VERSION = 7.1.1
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.xz
 LIBDVDREAD_SITE = https://download.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
