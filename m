Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E30CAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 21:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A383F4225B;
	Fri, 26 Sep 2025 21:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdlZbS_FPaFr; Fri, 26 Sep 2025 21:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 473AB42275
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 473AB42275;
	Fri, 26 Sep 2025 21:37:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AB4712D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 21:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C60C615DF
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 21:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFwjeNsU5nfR for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 21:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 341FB61109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 341FB61109
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 341FB61109
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 21:37:03 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 2G7gvKxGpX2UC2G7hvtRfb; Fri, 26 Sep 2025 23:37:01 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 26 Sep 2025 23:37:00 +0200
Message-ID: <20250926213700.3341341-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA5uGRtL4YsAkHjVLYXvbfUM/BBFalq9YVDu1JKeZIIXzxqTN9gHsszZ/EBcuIrtTtIWHdJritpnteOmtIYBaHCG1AMx/rqpQJZde+1h9Q1M84WmlJ3U
 lZyBw6a9dvRbHxkynNLL7SaIXGmb2gSTlz8YLLvSZwGcEHkYf/pMvVQoC7VcQMTIwwTLtcSZLJ5R1/EllHYNiiqZ65Bi5e4LrU4jvQYb1Hi1zo3D2ktfBKoE
 iShCtlq9nu/SkYPjXSMGAbLfXTpnDkB+UQAWDt6OLyo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1758922621; bh=2ifEg0bHpkVJH7iCoQUPTNCTEnmQmpX/yWVkqKIFMP8=;
 h=From:To:Subject:Date:MIME-Version;
 b=oBlN781MhQ2eMMXKU6wozv1jg7Ulzr1jVG5gjVp24HYd+3IJzGFXdJ9OYXYf99GES
 IyTk7YyAYf9zipp7PMNg8HNuRAcvPG4vFhfm9i2OTDV6Lulatr20Zug24ZfSQy78MK
 a2//DarqNJU3Lvbu3T3V16/4YP2RcCAa/QzakT4iQzoeHv6tO+56VYAGgKa9eYgi0s
 Lx+zX62OJKfhbx5ZnHqPvdS4bqSXfN1ptNSJhXlMp8CNhYXHMyzdY2nNDsC3AQGQTd
 e0BtB1LYFtMw5rEsqJiwrtAoqiAjNV2bJlfkTV92mKeGRTntrcX5SuMOIMdkdOmTqV
 DzdxgKU0f6u3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=oBlN781M
Subject: [Buildroot] [PATCH] package/libblockdev: security bump to version
 3.4.0
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
https://github.com/storaged-project/libblockdev/blob/3.4.0/NEWS.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libblockdev/libblockdev.hash | 2 +-
 package/libblockdev/libblockdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 38450c656d..ad0dce77ff 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a2e2e448a19d420480b8cce5e0752197482a65cb62a9ed55d88b237da36600d1  libblockdev-3.3.1.tar.gz
+sha256  65ef9a37babd44b85b8ff9b273f90f9f7d5f8ff7b0c76a8edb69240325fd83f4  libblockdev-3.4.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index ecee8dee24..b8f5a6cffc 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.3.1
+LIBBLOCKDEV_VERSION = 3.4.0
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
