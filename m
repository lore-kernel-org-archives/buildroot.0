Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA36CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 14:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A1D406FB;
	Sun, 26 Oct 2025 14:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgzbfrXm_MD1; Sun, 26 Oct 2025 14:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 900AF406FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 900AF406FC;
	Sun, 26 Oct 2025 14:39:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B32625B
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 14:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 713CB811E1
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 14:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbAF4NbHJ4Ky for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 14:39:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58F6A81128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58F6A81128
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58F6A81128
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 14:39:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D61BDA4C4029;
 Sun, 26 Oct 2025 15:39:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54808)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vD1ts-000000006Nl-3Rlg;
 Sun, 26 Oct 2025 14:39:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 26 Oct 2025 15:39:16 +0100
Message-ID: <20251026143916.3901096-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761489556;
 bh=OmGifn74oaVIwSCl299pjcR13ut8DBDMoWpAXySG5xc=;
 h=From:To:Cc:Subject:Date:From;
 b=IOLD5VsD6hAAFhXHujF7pRBLQ181b2L2rL5IGuTE20Rwg+DkZ6Krqcwcy/JAbG84x
 Ok3kZbiE9WgHxDApLNvM5N0Wizzk6DLAEkbkz0/PHIDGTyei68JptsPNPGGxciy6+7
 O7A5B9Ci6UQTdL/hpNEJ7ZlFHrq44stIMqnM3MeOCK2aJHdsKvybTjrt8syObZbkdr
 Gdm5Ncb+n0RUn087GopxQzai45ejOpSG/u4ixtN0N1Ttv6ffLzf3YBnkaKm8cOk/BK
 fysZL2YlQ5fo2lyIX8gcq8N0d7KFTvvvVuxF+7a1x7ZTAcZOiIcwm6DwVW/1HU2cZq
 VleF+Rm3F3o3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=IOLD5VsD
Subject: [Buildroot] [PATCH 1/1] package/libdill: fix build with gcc-15.x
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

Updated project URL: https://github.com/sustrik/libdill/pull/228

Adding -std=gnu17 was recommended in upstream PR:
https://github.com/sustrik/libdill/issues/229#issuecomment-2865524080

Fixes:
https://autobuild.buildroot.net/results/1a5/1a5e9d7df6c83a921cae39b4dc4b601be4d18e36/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdill/Config.in  | 2 +-
 package/libdill/libdill.mk | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libdill/Config.in b/package/libdill/Config.in
index 2376fc9698..ec649c6600 100644
--- a/package/libdill/Config.in
+++ b/package/libdill/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBDILL
 	  Libdill is a C library that makes writing structured
 	  concurrent programs easy.
 
-	  http://libdill.org
+	  https://sustrik.github.io/libdill/
diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index 9dda81d085..e68ee819ec 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -12,6 +12,13 @@ LIBDILL_INSTALL_STAGING = YES
 # Fetched from Github, with no configure script
 LIBDILL_AUTORECONF = YES
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+LIBDILL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBDILL_CONF_OPTS += --enable-threads
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
