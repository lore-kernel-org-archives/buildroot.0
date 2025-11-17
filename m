Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396C3CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 07:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E968880F40;
	Mon, 17 Nov 2025 07:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSg_f70MELIn; Mon, 17 Nov 2025 07:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9BE80EA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F9BE80EA6;
	Mon, 17 Nov 2025 07:44:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C97411A9
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 07:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAACD60618
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 07:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4NVws6klU4x for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 07:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DD2C605B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD2C605B0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DD2C605B0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 07:44:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1085796734; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Nov 2025 07:44:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vKtuv-00000001O9W-21dW;
 Mon, 17 Nov 2025 08:44:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 08:44:51 +0100
Message-ID: <20251117074452.331157-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bV0eWUpaq7xhq8y0xFE6A+7a7KtEieBHXl5WZAdkO++LVX60bwCRcJ8JXoB7jO4IXyMPbGuHaH8DUDnC58aUNiljFEFJpFl92oaYjN3bp1JN1X5mNlbYo3u/J3AI+CI6kz+stBo6y8w1irUceV3oOqXC+M4NaHIoWe6SEQDCD99Nm4zzAXH3pYjAbQ2PpurLQlWs6LphKpiftMUcqeYT4l3ueV9Rr9yhSpudfuDumHqgp8HyyH+nLb+YnhbXANZ560Fz1AA1jPTNExekYn1P1zLxMULu8yzFQ6pzfI6WEOESI0+8A1MRWLXEqYQ3UrIHiB0SSubQAI08yaK1W9bw2A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=/Aay8glfbraoFIkFFVI2s/pVcteA5bqDr/1PIdwlagM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=bV0eWUpa
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/luksmeta: security bump to version 10
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

Fixes the following security issue:

CVE-2025-11568: A  data corruption vulnerability has been identified in the
luksmeta utility when used with the LUKS1 disk encryption format.

https://github.com/advisories/GHSA-pvmm-7c2r-wmp4
https://github.com/latchset/luksmeta/releases/tag/v10

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luksmeta/luksmeta.hash | 2 +-
 package/luksmeta/luksmeta.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luksmeta/luksmeta.hash b/package/luksmeta/luksmeta.hash
index b367f29a5c..5936fb56f3 100644
--- a/package/luksmeta/luksmeta.hash
+++ b/package/luksmeta/luksmeta.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2ca0c35b551b331ba1444fc9d36e8c48ff8cae53dd4e6155b028e8904edc202a  luksmeta-9.tar.bz2
+sha256  a842538ba39680c8319c41dac0bcc082fe40fb43342561761925c0daa1a48f28  luksmeta-10.tar.bz2
 sha256  4b72eb6b5a336cd3ec837cc2d6347c23bf7574168db6b4802267700b93021abf  COPYING
diff --git a/package/luksmeta/luksmeta.mk b/package/luksmeta/luksmeta.mk
index 129713aec8..bfbda9fb36 100644
--- a/package/luksmeta/luksmeta.mk
+++ b/package/luksmeta/luksmeta.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUKSMETA_VERSION = 9
+LUKSMETA_VERSION = 10
 LUKSMETA_SOURCE = luksmeta-$(LUKSMETA_VERSION).tar.bz2
 LUKSMETA_SITE = https://github.com/latchset/luksmeta/releases/download/v$(LUKSMETA_VERSION)
 LUKSMETA_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
