Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75CEC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 08:35:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2067D61179
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 08:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2067D61179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4619834E3;
	Thu,  9 Sep 2021 08:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5Xo12Wy3Txl; Thu,  9 Sep 2021 08:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C9682D45;
	Thu,  9 Sep 2021 08:35:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 797351BF873
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 08:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 697EF82BA1
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 08:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hxh9BU5lInIq for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 08:35:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 695D782D45
 for <buildroot@busybox.net>; Thu,  9 Sep 2021 08:35:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t18so1381154wrb.0
 for <buildroot@busybox.net>; Thu, 09 Sep 2021 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WFaPKii2Gms3x8YfQRnCIWuSdNBbclE1xJvxTLMsHuc=;
 b=f5We5UyhJ3oOWaBFsUBM9vm8kjfpUiP2DqE66VVCIbwtB3cA3smN3dAS7CsqTMGeS4
 w9dAizTSMajdgE4qr1FeZQteNyx2JXL22FiLxwPx41izM/HR6CDrnpW2P34b3A5Frp1R
 aBBVh0YOLivAUsezNMC6hiemT03rtmRPgZzHKSm5UN9C6aHMAlx+xuRMUoCjcyYnKsUP
 SpC6wfgqwNzvD6I4ePf/CNm57pqJah7iKu+gFhwkw0ug45ak7oUO3kiR/PsDwEbr2ffz
 /xfKASj2QO0BOq56sz0K4wdrUt3bv6CSJgSlsKJbVnZ1NECdZz0/8acr2wdEZUCPnfx9
 4gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WFaPKii2Gms3x8YfQRnCIWuSdNBbclE1xJvxTLMsHuc=;
 b=cnIcAh3fWILpITzDrtiLclMjEqGmtm4SdFZhY3Y9ZpJNluB22iQzZC3HHXdShFK7//
 Q/xklDjXNX9uNyPpsExSlbq6xL3P5/ewL0uTG4zAFnnn/cY55mw8JlxARtNc3l24WDtN
 2cBZAvQPYwwHLp0auR7BO7bfdhXIeZgiOB5frYqhm9k4oBfDiR3P2llGS3zAkfIOeNqk
 PyUOEZ4g3Gz8cxWUW819/6SeUudgf2/AA019am3J/r28NCaceQ5IlyclI+aqlpfifBmP
 UsUwG+ROv0EsL/kZ65e8AP5Vpxt+C9jo2tDxYwRjDcZLCcxQ7oLB7PqRTTs1CYzJ93IN
 aLxQ==
X-Gm-Message-State: AOAM530YufjS3lH05C9rvoq4TsqXnNftDx/gCYB+uVgb518wIbMgYtx+
 Q/vFBU2LI9qKx2+jGWU3QxgB6LM0ogg=
X-Google-Smtp-Source: ABdhPJzNVcrssLs/BMmeySaCwh8URK5n4yiNv/API1Not/LCWztiJ3uAhhqUD8Vp8dkL0AVmvkpPfw==
X-Received: by 2002:adf:f747:: with SMTP id z7mr2119183wrp.194.1631176520570; 
 Thu, 09 Sep 2021 01:35:20 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d5sm1122688wra.38.2021.09.09.01.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 01:35:20 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu,  9 Sep 2021 10:35:14 +0200
Message-Id: <20210909083514.2066928-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gnutls: bump to version 3.7.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gnutls/Config.in   | 2 +-
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index cd853d1e7..cd83b375a 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_GNUTLS
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
 
-	  http://www.gnutls.org
+	  https://www.gnutls.org/
 
 if BR2_PACKAGE_GNUTLS
 
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 0788a7a6f..5d4fd1a0d 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.1.tar.xz.sig
-sha256  3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e5cac6f  gnutls-3.7.1.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.2.tar.xz.sig
+sha256  646e6c5a9a185faa4cea796d378a1ba8e1148dbb197ca6605f95986a25af2752  gnutls-3.7.2.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 6fc9ffad0..11c2d81e7 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).1
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).2
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
