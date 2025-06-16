Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4ADC71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 121BF80880;
	Mon, 16 Jun 2025 19:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XF4Q87UlviVq; Mon, 16 Jun 2025 19:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41A3480839
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41A3480839;
	Mon, 16 Jun 2025 19:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE39716B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0089403F6
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoGKxSwRz5Zn for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90CD340194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90CD340194
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90CD340194
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:13:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7BCBA4C059A
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:12:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRFGN-000000004fh-1B5L
 for buildroot@buildroot.org; Mon, 16 Jun 2025 19:12:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 21:12:59 +0200
Message-Id: <20250616191259.3479288-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750101179;
 bh=OHicbW9soi69xqd8aaqtNqYDHxzZ7FKZ0+0wlbvokHY=;
 h=From:To:Subject:Date:From;
 b=v8YWxYPgWViiS7T1ojFhLWM0glSuQQNRvjZNtNiCqLZ1Yi6XHrqb63wAqYIzfBpgy
 wLDOnTx6Ynb2jOGSYeFbDqa3XRa+ihhQNLH/Emsi9VsGkqfX3EPAdnv6jyrm3SoizI
 SkA6kAWSusbl9zmr8weWXhqndrCul2UlL40RrChYqhT4/nAWeFiEj+dgk1Gwoki2Pq
 IOhimZqb+cDgLS9FmafA4bdOIltmDkd/TSypC6f6rQZd+zX+Oc2qqNLZ7wTW/d1wbP
 BFEgCmFxw7S7dqnoH7VBH2doFPRtnaOc/BrZ4bHizLUqEi1eJlsfTc9wB8rvf1oZW4
 tODn4rUfHcbUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=v8YWxYPg
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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

Updated license hash due to upstream commit:
https://github.com/tvheadend/tvheadend/commit/0eea8a59f0834e2a3babdd8028c02509428a097c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 4 ++--
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 7b47e9ae71..a480302988 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9c2e13a70f97cf4c9b37cd93bfd03a7a1e0b7f3b18080c40ef99b8917642dbd7  tvheadend-653bd0400b4413db96b80c807f0f7524f9248adb.tar.gz
-sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
+sha256  24d45f9d5f0b92a706e827e553850cc4e0ed5d7f5f4555d16d4c56eaa2f606bb  tvheadend-730718c2888a121a00b96f3460b2e8f5ca8396d1.tar.gz
+sha256  0420f5d2e0df002e31320d9f58fc5454cbb8f53fa0ab1fc85afb8821c6b103e3  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index a9bd98ebea..a37d4dac57 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 653bd0400b4413db96b80c807f0f7524f9248adb
+TVHEADEND_VERSION = 730718c2888a121a00b96f3460b2e8f5ca8396d1
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
