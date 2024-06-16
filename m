Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4237BC27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 12:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A35B24005A;
	Sun, 16 Jun 2024 12:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTN8mWI6LgLk; Sun, 16 Jun 2024 12:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D75740136
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D75740136;
	Sun, 16 Jun 2024 12:43:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 827C31BF2C5
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 12:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E60582031
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 12:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6QQL5TIEqrE for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 12:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B718681E9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B718681E9A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B718681E9A
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 12:43:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29ABC1C0003;
 Sun, 16 Jun 2024 12:43:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sIpEC-002u6i-0B;
 Sun, 16 Jun 2024 14:43:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 14:43:21 +0200
Message-Id: <20240616124322.692320-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/2] package/glibc: drop ignores for 2.38
 specific CVEs
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b5680f53d60 (package/glibc: bump to 2.39) forgot to drop the ignores
for the 2.38 specific CVEs.  Do that now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 96a850516f..8bc4cd4666 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -24,34 +24,6 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by b25508dd774b617f99419bdc3cf2ace4560cd2d6, which is between
-# 2.38 and the version we're really using
-GLIBC_IGNORE_CVES += CVE-2023-4527
-
-# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
-# 2.38 and the version we're really using
-GLIBC_IGNORE_CVES += CVE-2023-4806
-
-# Fixed by 750a45a783906a19591fb8ff6b7841470f1f5710, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-4911
-
-# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-5156
-
-# Fixed by 23514c72b780f3da097ecf33a793b7ba9c2070d2, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-6246
-
-# Fixed by d0338312aace5bbfef85e03055e1212dd0e49578, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-6779
-
-# Fixed by d37c2b20a4787463d192b32041c3406c2bd91de0, which is between
-# 2.38 and the version we're really using.
-GLIBC_IGNORE_CVES += CVE-2023-6780
-
 # All these CVEs are considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
