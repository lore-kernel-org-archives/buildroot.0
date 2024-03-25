Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A19C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 12:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C52802B0;
	Mon, 25 Mar 2024 12:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAbNsOsRFjXp; Mon, 25 Mar 2024 12:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E05D80AA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E05D80AA0;
	Mon, 25 Mar 2024 12:23:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE4D1BF393
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 12:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC5EC40179
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 12:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CwyDU5Rhyis for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 12:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E6D540154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E6D540154
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E6D540154
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 12:23:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AA5A240007;
 Mon, 25 Mar 2024 12:23:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rojMO-008tIL-2G;
 Mon, 25 Mar 2024 13:23:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 13:23:14 +0100
Message-Id: <20240325122314.2119104-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/xvisor: use BR2_PYTHON3_HOST_DEPENDENCY
 to ensure python3 is available
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 24e996d14d28d (package/xvisor: fix build without python interpreter)
added a dependency on host-python3 for the d2c.py script, but this script
does not use any non-standard python modules so we can instead use
BR2_PYTHON3_HOST_DEPENDENCY to only build host-python3 if the build host
does not have python3.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xvisor/xvisor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index 2a51706b55..c1b61270f1 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -11,7 +11,7 @@ XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
 XVISOR_INSTALL_IMAGES = YES
 XVISOR_INSTALL_TARGET = NO
-XVISOR_DEPENDENCIES = host-bison host-dtc host-flex host-python3
+XVISOR_DEPENDENCIES = host-bison host-dtc host-flex $(BR2_PYTHON3_HOST_DEPENDENCY)
 
 XVISOR_MAKE_TARGETS = all
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
