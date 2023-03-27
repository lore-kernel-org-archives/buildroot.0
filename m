Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00AFC77B61
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 14:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654F84177B;
	Mon, 27 Mar 2023 14:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654F84177B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2GgkG4MfsAu; Mon, 27 Mar 2023 14:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0C641780;
	Mon, 27 Mar 2023 14:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0C641780
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 588041BF31A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24FB8400C6
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24FB8400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgJip1L3RZf3 for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 14:11:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2306B40327
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2306B40327
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 14:11:32 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 1A1B5E0003;
 Mon, 27 Mar 2023 14:11:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 16:11:21 +0200
Message-Id: <20230327141122.103829-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679926291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pl56zTxLcXavpRdYEJXI5PXt/CDIld+XnAAgNgWfLBo=;
 b=cAfyProWnRb0OHKQNeLlHPvlEQrv/dXwULgNftMOEgvVbU/n1nyTBKd249lRk5a5wD4ae0
 jFGZwuzsNg/BD+brWCWRAlTvhvUR/+vBr/1j4j9lm2plepKQSs1lVSf3UC8rKXEWa2sv8g
 pcFcJErjZmwnpLOysSKCIeDgtxyEvQzhZYJtWKIlG+rWPANUPy/ijte/At31f9XFXEFEL9
 d0Gari5nYGEt9aY6l/6Y4PbV94McJACxww2YWe4IQBXuiFOhkzOWs/RRiXt/y4/xWTCuto
 bg2kbnJvJl8/RdJ/33iom/08AJVna08H1FNPBIWkcDwLoY/IGUhSGJAKWwtdfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cAfyProW
Subject: [Buildroot] [PATCH 1/2] package/linux-tools: perf: ditch redundant
 -f 'rm' flag
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The value of the RM variable in make is 'rm -f', thus the additional -f is
redundant.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index dda63cccecb4..5431c78152c5 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -166,8 +166,8 @@ endef
 # target unless BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS is enabled
 ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS),)
 define PERF_INSTALL_REMOVE_SCRIPTS
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/scripts/
+	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/tests/
 endef
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
