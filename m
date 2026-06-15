Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A142CD98C5
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 16:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D887741400;
	Mon, 15 Jun 2026 16:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3jids5Guceo; Mon, 15 Jun 2026 16:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0710413A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781540237;
	bh=60dcsZQbUdiNr8hyCcjH4X62An8E0LmdNdS4wVE7TrE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z+MrhtczSi/rozB0fr4BN0cbSBUI5ux4FQ/1+bxClTizdsmIa2xDkMZhUzBdLfO9o
	 NC1qN74pW6EZpySLG1gTrHMTBtUxhMlVK4TmceYYDzICMyovUYxcdUy773MeukXu7R
	 Kg5GaeDPyzFJiJGRZvOVYkslbJxdYhDfUx5Z+MkUy8CL1WyGvk3jPHwsuLLFNBZpIW
	 ZB8Q7uo86Ua2rt27fnsz+9m3B+eUf3CYqzQOjaomLZwYhwxMILHNsHdDVMps2orV3Z
	 53owx+5cMpd31pMtTirltXIdplBErl9kvMEOQZOwirmPz3eQVqrttxWtG6Nx0Nj+F7
	 I6ycB5KP8wI4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0710413A8;
	Mon, 15 Jun 2026 16:17:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AB3FDE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 16:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27E6B6145A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 16:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQ-rp-hmnN84 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 16:17:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.161;
 helo=smtpcmd14161.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0280761458
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0280761458
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0280761458
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 16:17:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Z9zowlAno4OeoZ9zowjGaz; Mon, 15 Jun 2026 18:17:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 15 Jun 2026 18:17:07 +0200
Message-ID: <20260615161707.1944489-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJrOo8YBmD4vqxxC3u84EOcYnyhomdJYWv1PcWXwSGDPxKbqzZbFg56KR3cQEfEr4TXvfbelVDWLD3CYwsp2CuUaxZ6FORjdkBx2LUOM4fPD3SGWBsZl
 WLFTdjYBddbGH6ztIKh17GAotfC8Ug0JBZAZ2+wj2ShTxbkZ4TM0xoBVTy0jvs2YyR9jQPXg2zhIbYhxKMzLSBnDuZGLxHS/td2c1AJv8yQ711Mdj3qZnmys
 05iidiais7Orz+kVUIazZ6la67wRdNlo6Cb4Cvk6XkFkg6TFRmdIJ9PdrR6LzADpy3l1NXUfXyup/yzdxds0xA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1781540228; bh=7qHLpfNBj7+qp/kudVOPdWuGMDffDnhyNH6XAYmmBI4=;
 h=From:To:Subject:Date:MIME-Version;
 b=em42LkM8mJipEZOQVZCnPeOcrrz3VdJfoWasYlmQ3SFB7swAnHcurmM6mNfsBV86N
 yPoqDO/dP5l0lp7gcctP9gKiY1W0gU4dDv0iDwltbFPFtaZz0XTqTt8ZZI51fdG3E2
 p/qJjbY5I1r6SLDWjC/9Cm43Zg1CLZuB6t3pFT5Ynm+eFSG+Qkt9l3dJuzQx1buhmR
 xYvpXzW9MgrwHAiB6iJgiC3D2afpGiF3BpAIZqMZSrMiVHrRjSZWkmsdTJDErcIHQj
 MEk66E9LlDPFE+kNu6ROj8l4G52krdssdvUq7GwuQrnWJK/UD1r69GtA/+ijl6dmNK
 RIfC+a8/8ew2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=em42LkM8
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.125
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
https://hg-edge.mozilla.org/projects/nss/file/836970ddd36ab1076ae0958e76bd948d9d67f2da/doc/rst/releases/nss_3_125.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 4d08187fcb..544681c9a4 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_124_RTM/src/SHA256SUMS
-sha256  80da9f1cbcb267293b2248818d288bc02f874d6a34f1989a2828401d74a0bc9b  nss-3.124.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_125_RTM/src/SHA256SUMS
+sha256  1ad541f10da7c58dec01f540ecc44d28cbbc033f741a57473de5a0893d91606d  nss-3.125.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 86d2fcd41c..c01d313da5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.124
+LIBNSS_VERSION = 3.125
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
