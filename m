Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC22F46122
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 14:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 404D560786;
	Mon, 23 Mar 2026 14:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99LLxIz3ZnWv; Mon, 23 Mar 2026 14:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF74E60781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774275367;
	bh=NMNcqjvmNrPfaMcuTfjuahtocQOq7+TSiXxBo1YNAy8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pn73ppDKC9da8IkiTyETfuI16Rhn6AysVWYmwAcCYohrwOHc5NyaB+AzRBf1h3PdC
	 iuNtyyb7KX9fPJplpFd9XojuIXsyUy45eyJGi/fOsOI6CZR6Lqs/ISHyKKFmumEkmT
	 OqjjWNrtc46TS4JiEm9YOre/6bYrGX+f2hrC2RA/tZx8l4D1j/lQsQYHV4QkT6MCva
	 Xro+SqfGem3vGnwnTAUIkVxcaa/MgzFhgS0NDBmUgWMw9OMH11z+0kN2U+bGip0nFN
	 00mPvrBs2EE7/n3Q1TEnymApebStsgb4oPYuL1X2OiCtcazthxzGxVPuOTl8BiKJYX
	 vTEKyn9iq4M2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF74E60781;
	Mon, 23 Mar 2026 14:16:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28EEF1D3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 14:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 170E1401A1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 14:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEFrXRQbRDdN for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 14:16:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9BBD400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9BBD400F1
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9BBD400F1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 14:16:00 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 4g4TwRFYotpTf4g4TwvKvj; Mon, 23 Mar 2026 15:15:57 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 23 Mar 2026 15:15:56 +0100
Message-ID: <20260323141556.492811-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPKciolaMAsSNxd9cK97Fr5F3SlSTxSLIk9zaHGBIm+k19pFaz1IXeZB2KkFvdOn3TfXfa0GjKci0bi3fBb8d2JO/zqHRQYCC5Zj3UikUBme4/b5CyNR
 8fOnSccp3QFZanGm5RuJTaThq0+r0olw3IOnub0EG9bst+KAMH4VNwvK8r+Q/31uS2m9lsSiVelgmusnLg5Zc3Y622m6rAhJGsqheeyW1WawyLdAZilO7jdP
 ZyVIIPH26aHDG0zCuYjoPPwnPkfXYxBV6pdDsMDlrjRVban4xvVTmHhzA5FLy9WtjDBxoBJ4/tv7PrrojTQHLw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774275357; bh=h93P2ZlJTi4eFJzExEDNVsktx1T+mehjzjXeQNb8Ekk=;
 h=From:To:Subject:Date:MIME-Version;
 b=AgxT4EU3lx46dZb27WpxFYn7JvL4tw6epk3S5nbml4u4icwmylCsnYLL+3qzAMQ/w
 fQdRukVx5bo/QoLnzhy2iGGpqFIYx3/IDmTJY8+maGYvgeoDL16zImBq7C5aX/8tri
 deEeirgAw5pSZPAS43ocEIfmZ1gCgt37sv/ruYm+2owvj/vwYsRnW5W2dT9JPyFfnM
 LCuwd1YwO5NDMokhnjF3SFm4/tvx7WSW9tNVl94CZwgbo2j0xtEDwU7E2H6kBYDr0t
 AkGwqjJoKo1ATkz51ZYKy94kEAic+48Ux4R2+C8HyzXgc4NCDHgEhJAmrTmgDkrZ5u
 uoj5ngDtocSBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=AgxT4EU3
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.121
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

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_121.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index f3805fe6b7..1a15325f1d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_1_RTM/src/SHA256SUMS
-sha256  a98f002d20bfe719f50f81824a64c9e6f067f4da3c6a1f0455e97e6d79240512  nss-3.120.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_121_RTM/src/SHA256SUMS
+sha256  cb3a8f8781bea78b7b8edd3afb7a2cb58e4881bb0160d189a39b98216ba7632e  nss-3.121.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index c7354290b1..dfded6999e 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.120.1
+LIBNSS_VERSION = 3.121
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
