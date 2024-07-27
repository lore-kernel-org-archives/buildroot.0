Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C861C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 18:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2EE540571;
	Sat, 27 Jul 2024 18:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlpN9tL_M3cQ; Sat, 27 Jul 2024 18:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9145C40625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9145C40625;
	Sat, 27 Jul 2024 18:01:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7A171BF82F
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 18:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9515E606B3
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 18:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llexfPcgRV4y for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 18:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82C02605DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82C02605DE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82C02605DE
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 18:01:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce6c.dip0.t-ipconnect.de [79.214.206.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DA3FA4C32E9
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 20:01:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40542)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXlj3-000000006iT-2FsV
 for buildroot@buildroot.org; Sat, 27 Jul 2024 18:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 20:01:01 +0200
Message-Id: <20240727180101.1742370-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722103261;
 bh=F+nIRekF5Cu1Y5NqgGZf9DkmlSXdkoDxaCXgw0cD86M=;
 h=From:To:Subject:Date:From;
 b=ZofxtVSZHywFL5c0rQ0fG7dEHJ01X07h3Q7UXHlONkGSa2hpbt960KIU7xPMhR+kn
 47Geehx4W9y6go++q14CEryZNLnoTaEHCcSw5JaG6Q924HBPAFlFsrsdIQM9pCZtKb
 e2x3B3JrGRB2RUtib60JzeVm7gz1q/kuB7V5Ta2ZMQoi3/TxsUHgrvVBArsVj5NZZU
 1/I9QmOfzZxoejMVF7AR5jwpJHuhzFqkwFu26MFJRoaoHFQrjbT1K04QmOix262Igo
 HU5krzq/6GRv2MfeYI1etqX2P0iHnkaf7bf3vaTOfURMm3od7jL2P27viRmw2YkCFx
 O/upTYj5qTahg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=ZofxtVSZ
Subject: [Buildroot] [PATCH 1/1] package/ytree: bump version to 2.09
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

Changelog: https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index f3fbba8673..78357d4f28 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8cf8b151e4913b5b7f7a91dffd5c7306106a42477ec44e71d62c75f66ab61a57  ytree-2.05.tar.gz
+sha256  6927bf7475d777c40ecc1a8e5125316605683d91a5829a9251b44f12b09e435b  ytree-2.09.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index 1bd2df46b6..ec59dd8dee 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.05
+YTREE_VERSION = 2.09
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
