Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE975E7AD44
	for <buildroot@archiver.kernel.org>; Thu, 25 Dec 2025 14:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C095940A66;
	Thu, 25 Dec 2025 14:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IX9KXGvFSPrz; Thu, 25 Dec 2025 14:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7F71409D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766673742;
	bh=mAXVpwyAuMPUeUQkqWa3P7lntDwwByxIbokZ/qzGnBo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N3fMViarKfIv7IH7qCcjVzC1UAx6AVqCQEuqtb8sHgIl2b5Hfh/pAabhdkNXeWwDv
	 uL3Xg/O9VunAWLMzNrBEku6a3gSXWiP7eIZ5B9EYxcU3ddOjAtukJls/hf689qEuMJ
	 rEmqLXSBShvSbNokjjXZSDKfg4NUR9MgT7RWEQc73mrFF3/C+5f41lpg3UdzZn1vC1
	 e8vgN+Kk1NLY8+xe1plpAuT5J6zA3qVLLtay2aHbJ5FvIkFEr7ONGitwJmq5zvMtJq
	 u0vobNChEIPVxNcYSPvD1AKJz6ZCUVUtWvB9JOUSqRYGlMbPOL4Zjv8J0DX1KqlVRl
	 ZCuiexlQlCijQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F71409D4;
	Thu, 25 Dec 2025 14:42:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79437119
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 14:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AA9F606E2
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 14:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCaMmnJMWtrp for <buildroot@buildroot.org>;
 Thu, 25 Dec 2025 14:42:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39723606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39723606A9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39723606A9
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 14:42:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1992027831; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 25 Dec 2025 14:42:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vYmXf-00000000hC0-2KK8;
 Thu, 25 Dec 2025 15:42:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Dec 2025 15:42:12 +0100
Message-ID: <20251225144213.166018-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XEUtJGIUEtxyZFgqyZlV+s/3QX91/aEnsZgqRRtk1rpkl0CdWq11KoZcxtJhDECd2HfPjaoLre32wFs8bqROJ/8W71NYGFbZ6pSofrkse1gwT9OErMKHA9soY2AtJlxr6YW104CZg6rUdTXzwNpkH9XpJtTn/hqFHaWROvIsyDEHxIMGXZOUnZ9WgtdgCtCrlSVK1DeXYckAgMdxOAZKgtwN4GFaQxYpRoaERO0g59xkJnEnyzBv0gTvlpvidyvW4sWScfnHWuCN0DmuLAVenf471EqcIOhLpVztmUYJD6Pjd6iPyrvGQkQk975UQbe+QuotJILHExcMXLMRLXCW1Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=p1V/4CIkhrmPVI16DA2ArYItqKSpjn4VTyg0tty4wL4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=XEUtJGIU
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/fscryptctl: bump version to 1.3.0
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

Adds support for hw-wrapped keys:
https://github.com/google/fscryptctl/commit/e9ef4406303c25ec5246ed74adb55349e126a2b0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fscryptctl/fscryptctl.hash | 2 +-
 package/fscryptctl/fscryptctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl.hash
index fb6cc27326..361119ea3f 100644
--- a/package/fscryptctl/fscryptctl.hash
+++ b/package/fscryptctl/fscryptctl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  192e25733006b05592fd87038a3a51a014db22f462ce0b24d47c30e66d03ea2c  fscryptctl-1.2.0.tar.gz
+sha256  d9e2497866da4d0d8eb2dc126a9c18261b6de5aeb73dbccd18d51a6a6fd89b7b  fscryptctl-1.3.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
index d235bf4540..7fcf057267 100644
--- a/package/fscryptctl/fscryptctl.mk
+++ b/package/fscryptctl/fscryptctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FSCRYPTCTL_VERSION = 1.2.0
+FSCRYPTCTL_VERSION = 1.3.0
 FSCRYPTCTL_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_VERSION))
 FSCRYPTCTL_LICENSE = Apache-2.0
 FSCRYPTCTL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
