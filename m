Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBA6CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 21:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CE0412F8;
	Thu, 28 Aug 2025 21:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zi9FdDmeBcW5; Thu, 28 Aug 2025 21:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FA74412FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA74412FA;
	Thu, 28 Aug 2025 21:59:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61ED96C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 21:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 971BD61233
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 21:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNuLIsPLai7a for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 21:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A97C61237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A97C61237
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A97C61237
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 21:59:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1976516174; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 21:59:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1urkeW-009ZcO-0x;
 Thu, 28 Aug 2025 23:59:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 23:59:27 +0200
Message-Id: <20250828215927.2281857-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=r0bF9qSEMA8sSs5YJZxqVz41S8+ocrKNxqvhh2MOJuNlLBbBB8F+drwnLJpooWPpQiRhzQlTrm14p0PiLSr8ZfctTfgQjtkjeuNITrpXNDAyOKkzEWXWOwwKSby6u2NB61YhrAUgnZHj3XX1VkwYBBYJW/xlJOkekw9RrEA5iRrR+7mXJQWyn9AZkgDpyUNUzLuqgTm1/Q44+aeAW2pVy1UfzFZAtqDQCsN0jnhyCGX7f59dVTFXte5Ffa3kGJfx0cbwaDElJwBRi/nrCjduM1Pl0H8np7ZCcwTM7tUQh1ZHg7EtBc5VRevjXJFXwmIB10fipUGQfdZH2lmhQoQm/g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Y0Prc5IVsJaBI7OJdDcezda4P7VOI7NyRrfZJOuPgog=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=r0bF9qSE
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/ipmitool: move to codeberg
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The github repo was deleted and moved to codeberg, so use that instead:

https://lwn.net/Articles/926101/

It is unclear if the auto generated tarballs from codeberg are reproducible,
so instead fetch through git.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmitool/Config.in     | 2 +-
 package/ipmitool/ipmitool.hash | 2 +-
 package/ipmitool/ipmitool.mk   | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index dd2b0e6b6d..f759caa08f 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_IPMITOOL
 	  it can be provided by the iana-assignment package or by a
 	  rootfs overlay.
 
-	  https://github.com/ipmitool/ipmitool/
+	  https://codeberg.org/IPMITool/ipmitool/
 
 if BR2_PACKAGE_IPMITOOL
 
diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index c3b298e3ba..c65fdb0342 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
+sha256  78bc6fdbb0487652a3d0220072b9428d4ab6dfc198de2f28e8493932e6b893af  ipmitool-IPMITOOL_1_8_19-git4.tar.gz
 sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 159bb7c8b6..04c77bcae3 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-IPMITOOL_VERSION = 1_8_19
-IPMITOOL_SITE = $(call github,ipmitool,ipmitool,IPMITOOL_$(IPMITOOL_VERSION))
+IPMITOOL_VERSION = IPMITOOL_1_8_19
+IPMITOOL_SITE = https://codeberg.org/IPMITool/ipmitool.git
+IPMITOOL_SITE_METHOD = git
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
 IPMITOOL_CPE_ID_VALID = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
