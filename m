Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CEDE83821
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07E1E8293D;
	Mon, 16 Feb 2026 19:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLJZBOPgcQk6; Mon, 16 Feb 2026 19:13:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 250EB82948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771269222;
	bh=eCCAaGrSY2tZLHCy3/biBvgnz5JCk/x/LfSr1PKlAJw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ceqBodyCkTmKi5+tTYpkz5fvpXOdQAP3QKd7WNjme1zqKed2Wyl5MNqnU3md/OiwU
	 WYqnUYLlVx08nTNWGcQBnLK+itJ3PDOtqNTjrJuaoTJomNrkbEWUzVZqdINlxxeWlD
	 VpvyhCvnbJtsi2V/XlmrR03utg5twwQ5vz8Ywj3rieGMeCml/21o419vMPX+Qp68aH
	 XzTBRQAzvVCt0yhTIu0G7IJN3R8EPJrSeQtkzl85rfdTEAA0Fc5MLDPfo1PveX7iuM
	 9qZA0Z1SmjomPXIO5UA/sLLup1Ykfa3DeUbXhgjCf9wPUA9FHyMISHPnHm1PMSUWT6
	 ZqqxvDoOvAcvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250EB82948;
	Mon, 16 Feb 2026 19:13:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55150270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B1860881
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUXUFAEK3a14 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F4406077C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4406077C
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F4406077C
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:13:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id s42IvkD7LclBZs42IvztJL; Mon, 16 Feb 2026 20:13:35 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 16 Feb 2026 20:13:33 +0100
Message-ID: <20260216191333.2170402-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPoki/jMFmIBqJ8ttU1cfK5qIm75apbtBURPthvf5oJGxBK5ojwdXsIZQhJ0gEqWPeP8IT26pZJCUrJAii/pliItR8P54pPkta/9wzJ8ngRe5UnTHG+L
 4ym/5SO3GWSQSZEoPhb4USJFPeAaRLqytovnijP+Rf13ifgIqZwqJU/RvYYEl3XYfFwngmNR+DLtDJAo2iEXWLO/mbHH/SF8cFI8uy6aHtAbsu5kNkBZ2Dfs
 q6RzH79GI9uithhV4IjKqvG27yV/OKeczOJW2j5Xk8kxzpXdp5VC4wmL6t0oKeV5TQ6WdfuftqJImcmNRj7G9w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771269215; bh=fxWEjlN72m5LGYvbsySSfewtoYjusTOiKDZkTDV5khM=;
 h=From:To:Subject:Date:MIME-Version;
 b=UF6v3c/s41uSTBjX+B74inZpiH5mfrTWKGpOfxe2qaPV778rOYTst3pdgWmU8E18o
 8d3aBBIHIEMSwbxoBMc45idN3I6W7xj2aKOuRiPPLQgxNxVeWl4yBC5qa0jhXb+h4j
 EbaxysDSnu+faTUboG2xXRmf6LIT3J4TZxgl/dgBFft5zLozkqJ3oH9YUzZPOri4rh
 7cW1OJOIa5YRAOz39xFtfjdx36I0VPqekKhNzLrsfTxLGV6zJ6ioYQgVkLQ5MbQo9B
 n4utHjWX7jxNfYW7q17UO4heLaTtE+iyDlOS1s/7lE719PZAbjkBQWzrVHnFagWkf1
 07jkzkYhY7fuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=UF6v3c/s
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.120.1
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
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_120_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index dd0724f8c7..f3805fe6b7 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_RTM/src/SHA256SUMS
-sha256  7ce5f5b3a172a41539ffc118d8ef4834974d0a6a782743e4a05a4e208dd6d22f  nss-3.120.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_1_RTM/src/SHA256SUMS
+sha256  a98f002d20bfe719f50f81824a64c9e6f067f4da3c6a1f0455e97e6d79240512  nss-3.120.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index fc8d0edb39..c7354290b1 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.120
+LIBNSS_VERSION = 3.120.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
