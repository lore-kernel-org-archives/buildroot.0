Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E123BEE498E
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E78A860A70;
	Tue, 30 Dec 2025 17:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dZx3ZOiJ08j; Tue, 30 Dec 2025 17:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36DB1600C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767114213;
	bh=F6VqQZaljRF6eLPHK6FfsjS+XaccaQKMhR32HlaC3tM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nWouTLDZNoJl6kuHkWjUVLjy3xYk8wqCebRJ5WEPRCUvi9O5WsrDNJyPoKU6e7N1k
	 X6ohyn9bpgpV8ykUleRfhWPGQr3atPhgucS3O0V4+/Sr4EKCEyQcB7hw184XbcUu3R
	 62+n8kY2PkhwDV7xAVNEXgoWsjwhQKhoXBT+xvxlRPpgwtv2Mrvzgmcd1fxNz8nndv
	 pX4+OJHiXPVyPNXo3HX6MDRWpT0UhLX0GLuro2TSPNmv5+AY73ivsON8kSrCN6pDsO
	 oZg80RUIBWmigvRtHovgmyyxVBSUiB/3YnYYvL/QtsBTnFnoo1K449HbrV1PC5JXsB
	 fHyT+qgXv2f2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36DB1600C6;
	Tue, 30 Dec 2025 17:03:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7CFB277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDCBC4080F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F51Wg5TPA7J2 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:03:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0204407FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0204407FA
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0204407FA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:03:28 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ad82vU3q0P2aDad82vOWd6; Tue, 30 Dec 2025 18:03:26 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 30 Dec 2025 18:03:25 +0100
Message-ID: <20251230170325.2417410-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH6a5Kr7/CkAe4BT3MoivYjjVPGX+pzxZOB9UGTfyPZJ7k/BbjizwL35EzLQWjyMoNE+F0RRJ73m1KPSMH6kBPVtVL2F7J6xweRNM9HKmtK4x5YEtL7J
 MT4JzHPdDKZ5bkwCtxr/EPECP1+YAiaMuWCFg6ZqqT9Cxt9ylCcTA0V+pI4xB7QlPOq7inmlN88C/sNSTnWASoUJMHAthKk/NnIW49xpai/OFSAz4XwMSXan
 BUg8/si6Of1UyVOo/HnEKY9HeLH0Ogt/qRp3AQY/ahykLvcBKTcPVme9VSkL48s6VGeVJ/K/2YVv2OFyAcs8d1MwKO8XYOGDfAdYpb5woAI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767114206; bh=FoTO0qA0Kkf2IbkV3ByMgbewCATB7wQPxcX5q6DpTlc=;
 h=From:To:Subject:Date:MIME-Version;
 b=fcG2PeXevC8trOIKjwzN1m1azPBXMMuhuZ16t/5MzebrlkP/FM82oTpsPWRHQoHKo
 Z1EIz/7oglOx6tNbS3cItGjH55E3ccGvNQa18aqupvO0Ku2CSiv8SH3d+k7U6sjeCw
 2Q67y+w7IfNrkmU63z+WaXnlijRSQNYQnpp1xUsKgXthCXuHcZ9CRauJonPDfDkdLz
 MUYlLFJpVNuYlLek5E+7/ZzB3Ou9c0IVD3jMpjTBWVExleB0faW63Yb8sflgoxXv5O
 4lsKmxcLpKe+KRISJnkp5SQV8N1+GeMBysEKNscYqJBDK+GUhzTPW4nOU7RKkVoVe2
 PjpxQdQMmkLgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fcG2PeXe
Subject: [Buildroot] [PATCH] package/libtraceevent: bump to version 1.8.7
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
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/tag/?h=libtraceevent-1.8.7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtraceevent/libtraceevent.hash | 2 +-
 package/libtraceevent/libtraceevent.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
index a974f326e0..890e1294e6 100644
--- a/package/libtraceevent/libtraceevent.hash
+++ b/package/libtraceevent/libtraceevent.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  812547d2f7b248485c183be2799b7041038ee44183000705609754b128c84c6f  libtraceevent-1.8.6.tar.gz
+sha256  cec7167e885d2f022bc5a2b0f2c0c58110fa0575e5dba49d7b694f0a6fd7fa0c  libtraceevent-1.8.7.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
index cc0190f84a..d0de336de0 100644
--- a/package/libtraceevent/libtraceevent.mk
+++ b/package/libtraceevent/libtraceevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEEVENT_VERSION = 1.8.6
+LIBTRACEEVENT_VERSION = 1.8.7
 LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
 LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
 LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
