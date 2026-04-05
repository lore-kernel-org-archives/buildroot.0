Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552C1E6401A
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 12:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25D05810B6;
	Sun,  5 Apr 2026 12:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mDqWeQA6Cd7; Sun,  5 Apr 2026 12:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3752E81164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775391341;
	bh=pZ+RU6V3GsqgL6xB3kmwZgRY/9JFoCy5QqBgpBq4RtE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=phhx18lV/OdI56fWFUt9Uk+MiD8a/RC7s4jbn2ysB7q/euO15kqf+JZvCBpW6Ai6Z
	 wEIu1vdfB2ucrJGoi/161RF7pw0w7Wx9QnNCkiP5RCzno5UtA2mI3xpXVKxpr4pWkw
	 +Ucw054w1RydgR1cgwUdZzQNGRFvgU6QOZ47ZZN33PwufK2ZqO3F68I2o8BPT96JeN
	 yAofuAu4pAWnLMb/hwUPiPs3O7X/vl2MHG3vujU/BB6dfANzxjuYY1J+6+WUSzs/NU
	 BvkvBhRCVNeAMYbnV9KnE9N2VUzPrnjP3WuKd3W5yFWMAdwsDfY6UQj6vustOkh0qj
	 uQvJxhcAJRotw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3752E81164;
	Sun,  5 Apr 2026 12:15:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F31322EF
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 12:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4E4A4005B
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 12:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUfuJKFdt8jP for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 12:15:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1E5F40059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1E5F40059
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1E5F40059
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 12:15:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 53B46A4C026C;
 Sun,  5 Apr 2026 14:15:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57052)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9MNw-000000007lm-48V2;
 Sun, 05 Apr 2026 12:15:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun,  5 Apr 2026 14:15:23 +0200
Message-ID: <20260405121524.2590079-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775391325;
 bh=GQ1f2jnvB3JTDDGcXrHLttqrelz4+CW6mA+e5ShBJso=;
 h=From:To:Cc:Subject:Date:From;
 b=OBJwO+5/Y2LdF6Zq15o7mylnst4JF6N7WL9ilL65FpEGU4TkVEFVivdoSFOgJZCpZ
 7pgWIPQRKCCYNoDKeN+Rcrws0ow7yK+wg+zaNNLZCpJxMXEGsRsYaL1ncJlvJXlTc4
 iSySYaqMJAh4/Y4VYiWTb0XFwLFJcwyg2ffLppcwy44REFp3uf9hhdsgwZrUTbjcY1
 010nTfflY/Z7FFwz6JOKE5gSsKHOQj7ia2xGo0iFlwwzfCBq3DIfrpaXgoHIa6LyzM
 2frAzpzgSZv4VfImA2hin6Gk0N5nfbKyKVW2+Xn/mcydXzwT6asoiANUNPmFsYJALY
 vYkhUuvbtcjvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=OBJwO+5/
Subject: [Buildroot] [PATCH 1/2] package/proj: bump version to 9.8.0
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

https://proj.org/en/stable/news.html

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 4ac7b444f4..38b4d81337 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from https://download.osgeo.org/proj/proj-9.5.1.tar.gz.md5
-md5  07c44ca4a65a0664ce823c8448707c78  proj-9.5.1.tar.gz
+# Fetched from https://download.osgeo.org/proj/proj-9.8.0.tar.gz.md5
+md5  f04335154621e9ce9a5800ea08c8d96a  proj-9.8.0.tar.gz
 # Locally calculated
-sha256  65705ecd987b50bf63e15820ce6bd17c042feaabda981249831bd230f6689709  proj-9.7.0.tar.gz
+sha256  a8b493b00cf4d08b712b9e063ed5e53e2be90fcde46770e9dbd773341f378f43  proj-9.8.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 4840824f69..5e74f377c4 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.7.0
-PROJ_SITE = http://download.osgeo.org/proj
+PROJ_VERSION = 9.8.0
+PROJ_SITE = https://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
 PROJ_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
