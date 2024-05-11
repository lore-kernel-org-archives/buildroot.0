Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478E1C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA657400E5;
	Sat, 11 May 2024 20:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54yufysM8Yho; Sat, 11 May 2024 20:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB9B7403F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB9B7403F9;
	Sat, 11 May 2024 20:48:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA771BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 066E9403F9
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4lnmKDNh5vU for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1AF8400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1AF8400E5
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1AF8400E5
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:48:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5te5sOUGHmFXq5te5sc8ze; Sat, 11 May 2024 22:48:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 22:48:40 +0200
Message-Id: <20240511204840.203789-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBcAXGT/9uh/6vBo3ToSstbuC5ORem6kn2DUGU0Ssdjew6wNVfDUA+5FBzvneKHVRqvwXNWQv19uC/D2ylKHEVo1Aa4t38y8oi8pix/6QE+Pv2h0OCtd
 rhHOfU7xbDeY23O2lfJ2ST/SZHkD5VU6lLLR3jsfLvggt+hwlhTBCBCK+bknyvbaVVyd6I2aWR12NC0H53kRRAa3L/qYFJiEnfhIaETkpU76A+1T4z/iQ/N9
 yMeg+xxYu6hB2xBjPAnGtS9vNjS2cQjhNMpN7Dgp8eBdDyBBOqPXJ+EaMR29BOf24LLGCkaXlKllLCsU8HjvdA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1715460522; bh=gLaV1SKr1VbVLMy3kwQKPTiyYd0fUVHnI3gvx+hCZ/E=;
 h=From:To:Subject:Date:MIME-Version;
 b=Xv7udKI4gJpIcJ/odrAuiL48AMcR2/cPd14C+wKaMLy9gRSVgUSV+Ht7f5NOXbjFZ
 elunP8Uk9DUAfZiZ6oLYQSfzYoxr790FoWAl6gUQKwbZt/x3coDCc1WFld1ZNnUpj6
 vvSjUMKLPbckEXlYVaz2H3erZiYKMLb3pnlDw5BqPm081hMErGbK3R+LTP2m8hcTc1
 J6g+SRUJlenqKaDhO8XUZtBhajRPf34wgB83R3eHSKcaavGLiUwaXaDqVCDKYbDSew
 RHWgPQ3/PelSBJlgJcyHirbHf6KtukRX2hqaidw2CDoB7/R52JiSCxSOyf0Jqq6s5Z
 cTVuNFfJuvU+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Xv7udKI4
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.100
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
index 8c7c807f79..1a69398f0d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_99_RTM/src/SHA256SUMS
-sha256  5cd5c2c8406a376686e6fa4b9c2de38aa280bea07bf927c0d521ba07c88b09bd  nss-3.99.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_100_RTM/src/SHA256SUMS
+sha256  1e35373ce9cb5b776f678bb341b0625c437520d09ebd91d1abd622e072e38d88  nss-3.100.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0d8b4dc592..5cdc494b16 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.99
+LIBNSS_VERSION = 3.100
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
