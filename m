Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA106C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 17:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B9EC4071F;
	Thu, 15 Aug 2024 17:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RO0-PQzyCnoy; Thu, 15 Aug 2024 17:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C22A408E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C22A408E4;
	Thu, 15 Aug 2024 17:22:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96D6B1BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 849DA408E4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUEy26IdBOFq for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 17:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51B3D4071F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51B3D4071F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51B3D4071F
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 17:22:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b460.dip0.t-ipconnect.de [84.161.180.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 219ABA4C0AC3
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 19:22:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45764)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1seeBS-000000004QG-3IwZ
 for buildroot@buildroot.org; Thu, 15 Aug 2024 17:22:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 19:22:45 +0200
Message-Id: <20240815172246.3519347-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1723742567;
 bh=quAanTgQ5n2eJIsY4MUzXqMQlceHqmul25vP+BI2ugs=;
 h=From:To:Subject:Date:From;
 b=NLVV1Gd8ZpitpQgxivXxjEHCVXFFk+ZQq0ZJHsGTdGWGS5RvC27nRiCkC4SPhHv8Z
 bqc1zJ5tp8CblMJwIiCyMl3Q0U9uizzzzbBosUJdfgtmoxUgiClOyYjEHIOUHvbOre
 jArlkTiUYqac4kw4wA12HddNLb7k30lMHY2uc4CKoNSoV3jrgkNEc66KpVz1wv1fI6
 4MjAiFDAQpg+0ZrFukhtfP4FX2hy1TyznY1B/skNFB3iA/aNbVoS7buOLNbM8KJih/
 D7Lktid4HRcNLuRl1GzBSt/7DOW/il3/YE4OfLxNWhzFMSSXspMTz3nFDU/9mHJg3j
 uAk+eMRDU1TXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=NLVV1Gd8
Subject: [Buildroot] [PATCH 1/2] package/dovecot: security bump version to
 2.3.21.1
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

Fixes CVE-2024-23184 & CVE-2024-23185:
https://dovecot.org/mailman3/hyperkitty/list/dovecot-news@dovecot.org/thread/2CSVL56LFPAXVLWMGXEIWZL736PSYHP5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index e42bb577a8..fde96f32a5 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256  05b11093a71c237c2ef309ad587510721cc93bbee6828251549fc1586c36502d  dovecot-2.3.21.tar.gz
+sha256  2d90a178c4297611088bf7daae5492a3bc3d5ab6328c3a032eb425d2c249097e  dovecot-2.3.21.1.tar.gz
 sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index b8652900d0..e116bd3b78 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).21
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).21.1
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
