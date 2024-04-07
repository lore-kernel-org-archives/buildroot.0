Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11256CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8AB740851;
	Sun,  7 Apr 2024 15:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRRMP9onbfwD; Sun,  7 Apr 2024 15:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78A544087B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78A544087B;
	Sun,  7 Apr 2024 15:50:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B46241BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF1DD40523
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOxKajbZtwHa for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBFDB4011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBFDB4011C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBFDB4011C
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:50:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77725A4C23BE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 17:49:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55544)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtUmM-000000000Qf-1IQP
 for buildroot@buildroot.org; Sun, 07 Apr 2024 15:49:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 17:49:58 +0200
Message-Id: <20240407154958.4107385-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712504998;
 bh=IAKY5Q/2fC3U3WQls0lzYskYK6+Zgge1Rr9pdjCrRMU=;
 h=From:To:Subject:Date:From;
 b=CiBYO/lqnjjCfqsfS6O7sbx8DpWKTdJ5U14NhcPevcKNctnE9pXnLfntV1x22LvIF
 tkhZR3LJOn2J0O+dx99kME/JZOnoeklpMPQQFQyUMooKvM9JmBdwzsAz939EyqxTv/
 cSqsafzaNFMv3CzSwMiOCHr1uJ8Gz9xoaBfaqdXwnWvpP3+YWoBCGcuNAzZbaMPu7w
 g7GCoaIEKsiBtqO0qwHKI5Qkx+gb+Y1G4ZQ3XZ1S5HM5oESCOMDmKKOhXZCMBYHThZ
 +mnLqVHUaTcTdBSRpvzma6VEpQvkrL5njIFyjeG/yTS0ebtsPkegMH/V3R2SCzQiGd
 MuIsV7AdnpuMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=CiBYO/lq
Subject: [Buildroot] [PATCH 1/1] Revert "package/apache: add libxcrypt
 optional dependency"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 02905fe54cb2136c15cc71d2840d60537f1513a8.

The build error
http://autobuild.buildroot.org/results/f0f55d9d66b07cb3408086d2632f8cd1bebb670e/

resulted from the apr package and was fixed with commit
https://git.buildroot.net/buildroot/commit/?id=2402e0f1d31327806422692db6523120227bc5b0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/Config.in | 1 -
 package/apache/apache.mk | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index bc3133ea00..270296bce4 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_APACHE
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_PCRE2
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The Apache HTTP Server Project is an effort to develop and
 	  maintain an open-source HTTP server for modern operating
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 619d13726e..1b095c5eb1 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -52,10 +52,6 @@ else
 APACHE_CONF_OPTS += --disable-brotli
 endif
 
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-APACHE_DEPENDENCIES += libxcrypt
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 APACHE_DEPENDENCIES += libxml2
 # Apache wants the path to the header file, where it can find
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
