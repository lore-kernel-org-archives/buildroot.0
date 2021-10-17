Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC0FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:25:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA7F61250
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 13:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADA7F61250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F8C960689;
	Sun, 17 Oct 2021 13:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNxyJPLwd297; Sun, 17 Oct 2021 13:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2D1E6066D;
	Sun, 17 Oct 2021 13:25:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3131BF5AE
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF6CF81BB0
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 13:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjcCnMW66EXE for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 13:25:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E49581B4D
 for <buildroot@busybox.net>; Sun, 17 Oct 2021 13:25:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id a196so6355180wme.0
 for <buildroot@busybox.net>; Sun, 17 Oct 2021 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZkOMFG9tCJqtnHP6ILJB5pfGEUUXezWHqG/FOJfi3r8=;
 b=RNbC/cTJWkr8TqgzzGYrGQJbrbF1rP2mUj7a1s8cB6BnZIDpr9AGfEGvCmO7swPhHh
 /QfNQ8Sn0V1AdzjDigdp9mqhWISAk6Nmsa0NwiQobcs4FIGZucBnQ+sVSf+bm905ID1+
 d+lBqRIjIc40GOeNVhf2gYtQRqwI4xEG8JFxKV88OOmumBxBTVf/AIOQ+WaLD2gNl71R
 NmudM1a8uXzIwC+iQBCyy0HytPrWHKJql7uGTVQt2/1ivwaUlrX5C2nhzmLdWNTY4VSD
 MA4mUkVGRnSVc9U2Yo0kINY7L8cXAWUszNY9DoInXpnXm1MmYMdup36VUsZS6AfAfN+P
 rLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZkOMFG9tCJqtnHP6ILJB5pfGEUUXezWHqG/FOJfi3r8=;
 b=HICqefy9lAo8czw3bfzFaKMAz528nrQR5X4e+yLJKLmhCphDcTnbWoqvKeXUSSXnHe
 qSVh+TZspw31b+YGjTMHMJRfbwyvhSSIb/+PReMRvMf4ATkRgbx3O5VgFjNR4WTItpR0
 i140BJhJ+wnJJuiCA8v1Aqh1Alx52C2cLaCZ1r66Sz4K2UnqpUoWSc4EH8Sk948kXcYK
 7fxorRHYVtobhMbn9Jnso9vNG4MtKxhZ0hL2R0jT9El6iXd8llgwtuPO4zwBRzRFpLnO
 GM8f5tKO3jIOgLPVSOQpYyCUHu7Ah8aBeI9I+zQzE5qNGzmwWCkltQUkzHZqvmP8JOGr
 4h+Q==
X-Gm-Message-State: AOAM531jYwfNKoeeJQ6pUCb09bmXBgIAlwaFiV5Srl8pLXUSqs7eYsjI
 J5JhJ2cwsAUv8cjXapECXSrOCAbJY78=
X-Google-Smtp-Source: ABdhPJzzX7eXDjgqlSEM49+T8e1zK5+GM2bTLabwELIIRfZzMLbYNjyqzQqFSFubftPKYLby9SwN4g==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr8174527wmi.192.1634477106427; 
 Sun, 17 Oct 2021 06:25:06 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id q12sm15135383wmj.6.2021.10.17.06.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 06:25:06 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 17 Oct 2021 15:24:58 +0200
Message-Id: <20211017132458.596283-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.1.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.hash | 2 +-
 package/htop/htop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 812392340..9de7926e3 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  200a4f9331d0e5048bf9bda6a8dee38248c557e471b9e57ff3784853efd613a9  htop-3.1.0.tar.gz
+sha256  b52280ad05a535ec632fbcd47e8e2c40a9376a9ddbd7caa00b38b9d6bb87ced6  htop-3.1.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index b5aab3c30..cb434f3fb 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.1.0
+HTOP_VERSION = 3.1.1
 HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
