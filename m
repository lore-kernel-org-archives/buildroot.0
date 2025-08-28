Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA902C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 16:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6679A83CFD;
	Thu, 28 Aug 2025 16:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-3M58jggG6K; Thu, 28 Aug 2025 16:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D38283D22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D38283D22;
	Thu, 28 Aug 2025 16:47:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5108B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 16:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 989F483C0D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 16:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTX5XjewC_ve for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 16:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88BFC8340C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88BFC8340C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88BFC8340C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 16:47:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1007995990; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 16:47:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1urfmH-0089hJ-22;
 Thu, 28 Aug 2025 18:47:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 18:47:07 +0200
Message-Id: <20250828164708.1943876-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828164708.1943876-1-peter@korsgaard.com>
References: <20250828164708.1943876-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NNBLb+x7mJvpIvK2P9svyFyrg5u+L9CstEu6bWoWVpgntt83NwbtCaS5PWyvltewOkrT4i1g2V446kfOndQpnpvHs6AigQ66NVDp+qYC+AhUJgueryn7i6k4nG3BK5El6+5UgumeJ42DdvGZLop/NTVoJPqhbAPjH3P4QZK2N1nqyR2TuzNxqDXNMQd+bNVTa+vvcEnpB6wqio+UgI1CYDhAKJOFPW7ZWL03aIAlMy46BVJwdSq0qKTN5jLzQX9dC+hStHI99RYD12GXpuo2RAuHvVYuE9U8U9IQlPmj78qUOirYYYZNLq7sKuu5FyItF9s7fLzdJQEKLT36vKG7Zg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=RJg9op3rNT4xYUs+qPcbhlIx5cYNMHF3Vf4bFS7AJ1w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=NNBLb+x7
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH-NEXT 2/2] package/axfsutils: drop package
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

axfsutils is a host-only package, so drop it now that the axfs root
filesystem support has been dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/axfsutils/axfsutils.hash |  3 ---
 package/axfsutils/axfsutils.mk   | 24 ------------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 package/axfsutils/axfsutils.hash
 delete mode 100644 package/axfsutils/axfsutils.mk

diff --git a/package/axfsutils/axfsutils.hash b/package/axfsutils/axfsutils.hash
deleted file mode 100644
index b7a5943ddb..0000000000
--- a/package/axfsutils/axfsutils.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  7d8c0febaf6f104c2b179475ea1ee6d361688ad7fa4c98dfdf7395fcff2be685  axfsutils-384a1ea214c8cf8359faba00a12513ee7ae1a9f5.tar.gz
-sha256  1929a1e67d189aa3a24de76255841b33818f7f65944b6e73a1568ba575ab54d5  mkfs.axfs-legacy/COPYING
diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
deleted file mode 100644
index 8879221619..0000000000
--- a/package/axfsutils/axfsutils.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# axfsutils
-#
-################################################################################
-
-AXFSUTILS_VERSION = 384a1ea214c8cf8359faba00a12513ee7ae1a9f5
-AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
-AXFSUTILS_LICENSE = GPL-2.0
-AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
-HOST_AXFSUTILS_DEPENDENCIES = host-zlib
-
-# The 'new' mkfs.axfs version requires GNUstep which is not a buildroot
-# prerequisite. The 'legacy' one works just as well without that requirement.
-define HOST_AXFSUTILS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/mkfs.axfs-legacy
-endef
-
-define HOST_AXFSUTILS_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/mkfs.axfs-legacy/mkfs.axfs \
-		$(HOST_DIR)/bin/mkfs.axfs
-endef
-
-$(eval $(host-generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
