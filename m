Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5463DC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 20:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 252A684BD6;
	Fri,  7 Jun 2024 20:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-WABPdKs7hy; Fri,  7 Jun 2024 20:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C8A84C03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C8A84C03;
	Fri,  7 Jun 2024 20:32:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 591551BF473
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47094608BE
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzSUAyAum7MB for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 20:32:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.117;
 helo=smtpdh17-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5579660899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5579660899
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5579660899
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 20:32:03 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FgFlsAR1ZJLbHFgFlsDrUP; Fri, 07 Jun 2024 22:32:01 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 22:29:11 +0200
Message-Id: <20240607202911.2644280-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMgW+Zz7syFXv0V4b28Sg1Wbx7iFC4ioNPq43CLa9IsSn/a5wIOyI0nb6wE+NpUtr72jBb1lD/mu/HSTi/+gsh2p0rdTHquLSnbYzLATb4BbK7NlwxgF
 xr1KjdeORZBwi82RcBBGr10cDWsX3apL3aLnwN+m2lPc6GnUTMhLJo/fl21Ymbot6C1OFjm+3mdwArWsBjDByWX7tioB/aNXDPQYUHwHrA18OHrce/XbZEaC
 1hD5IfpYYsvw0z/c3s0lQgRVC75+tooXzgL7D8KD/hGGjMufRmLfPkcLi5S+SmcKIvSDRJR3Sm7+67JNmBj9aA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1717792321; bh=PZtvtBe7p3BaAFJrKO9U+utVOR1XNATm6/fl33pdHzE=;
 h=From:To:Subject:Date:MIME-Version;
 b=URYDk6es27yvZUwCtgTL++P0z5cFfYNohQ4fkXPPDeHqh+cHKwwCcSmDaL/0gFVM5
 x8WZEST5HAcL4ecWeFO3VsjHdINN3AViDuD2RCXaAoNBzD1QvcWuTt8Uf4Iv1SdjLm
 ucAS/cCSIHt/Mdn+0fuT3YX899E2Nv031B7Yvwn4tAsnqmWx3wh1513egnWn/YCjNx
 MqsNP91oBHgEiayy3IhCpEl9mTQWbAsRzTost0SLJUvz38dVOfsz6a1fz61QXj7JhQ
 pyczA9rgR+LGlGCgIvz/UiFNbV+PMj9OY4yn2isYEwaAJsl5YqQVqtFCQSfFiH9TIy
 sQiHkj1oEOfaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=URYDk6es
Subject: [Buildroot] [PATCH/for-next] package/libnss: bump version to 3.101
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1a69398f0d..0e4fbd21e3 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_100_RTM/src/SHA256SUMS
-sha256  1e35373ce9cb5b776f678bb341b0625c437520d09ebd91d1abd622e072e38d88  nss-3.100.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_101_RTM/src/SHA256SUMS
+sha256  859748f0b4b7bb51e7e600ae5a88ef4d71f93e6964b1beed2727784dd9ed85e7  nss-3.101.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 5cdc494b16..c6e2af7b5c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.100
+LIBNSS_VERSION = 3.101
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
