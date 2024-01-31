Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF4CC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 08:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F281408B2;
	Wed, 31 Jan 2024 08:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F281408B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WxPvudxODyrB; Wed, 31 Jan 2024 08:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3CF64085F;
	Wed, 31 Jan 2024 08:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3CF64085F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 828361BF846
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 08:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AA614085F
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 08:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AA614085F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xR1SSjiUYg9F for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 08:13:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C5F04085A
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 08:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C5F04085A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37C5740004;
 Wed, 31 Jan 2024 08:12:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rV5iK-000jb4-1N;
 Wed, 31 Jan 2024 09:12:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 09:12:53 +0100
Message-Id: <20240131081254.175261-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH 1/2] package/glibc: add CVE ignore for
 CVE-2023-4806
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

Commit 8519de517e22 (package/{glibc, localedef}: security bump to version
glibc-2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701) correctly mentioned
CVE-2023-4806 in the commit message, but forgot to add an ignore for it.

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 596697bb8f..d49da6457c 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -28,6 +28,10 @@ GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 # 2.38 and the version we're really using
 GLIBC_IGNORE_CVES += CVE-2023-4527
 
+# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
+# 2.38 and the version we're really using
+GLIBC_IGNORE_CVES += CVE-2023-4806
+
 # Fixed by 750a45a783906a19591fb8ff6b7841470f1f5710, which is between
 # 2.38 and the version we're really using.
 GLIBC_IGNORE_CVES += CVE-2023-4911
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
