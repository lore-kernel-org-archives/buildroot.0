Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06164C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:01:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A817D613B3
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A817D613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A6E2404C6;
	Tue, 27 Jul 2021 10:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1x208pSAUqW; Tue, 27 Jul 2021 10:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A68A94023B;
	Tue, 27 Jul 2021 10:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4251BF37E
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D57E4023B
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aw737bwobXxn for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 10:01:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02F71401FE
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 10:01:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l18so6808441wrv.5
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n/mN8PewT4ZHxEdAmCCk2gsQxXFuPlgtvHT/uUNQmpg=;
 b=lNaxmW+HkYIr/FVcvrOaK7CQIaGFSvKAMF/37EO3fCt+yrk9WL75bHI8M0bDGTBMSU
 dkPbdercqXcdeH6coeNPQK8SalKvxx2srnIZxkGRVHsEDXQRpPnDmMw6Z1pa4qlUXYgq
 rWsLw+dFWEwNTKeIGK8603Z41PrBZd5AcqRsEQ7ql0wm2waF1WwhkKtBDm+DBydMyfVP
 jD6txsDxKwmvoWJs/icAAMryWzY2Tig0wNVszLB7YjAeglUrJoy9Ow/PHmEZWPo0Hpkn
 llKoVc62Ph0RLGy4GM5gUubmHCJTQNIiwyJmefKYXIaedUxJlf51NR99TwO/i9ermWxi
 LqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n/mN8PewT4ZHxEdAmCCk2gsQxXFuPlgtvHT/uUNQmpg=;
 b=o74WNQt49oHO7HpR8JWGFjTYneMUYB+ygva1YU90wzTkPv62c49zUGiZzLVtKdex7B
 yI7/MyRv2GGAd/hJLxaTygFJhWVTAcm+9stecRFLInIAjc8K6KJw+hB7GYl6HznjVXGg
 RdUEeSMM9xZ0wKMP3fE+JLwlt0m7diTNsIq+UJqxQGiuKRw1tiXVhKpvQS19N6PGMw0p
 FyXUggyeUB3248mjwWGNqfurw5rgZ16cX4/PWoL8fGRe6l0nKZZaY8w/Z1ehc0oMWOG1
 +zNERWEZcWMmKl/6o/z9MDadepkh2AOGejFwYyx/oTzFExfVDsZyrMz7POg2+OdejDtd
 ybLw==
X-Gm-Message-State: AOAM531MX+QL65av6DehLuWJPpMFyooyNTI6d1UK00ZdTz3mGuj4YKyd
 mHpj0HBDbFP6VvR6RXgqsqQdQC7067lH4g==
X-Google-Smtp-Source: ABdhPJwnnIkG9VKYQm1hCSeq6DvcGc6pjI776t/WUK8JoI9xSv90AQlT7QVN1G1BFmzZMOmnckQJ/g==
X-Received: by 2002:a5d:6891:: with SMTP id h17mr9197086wru.324.1627380091908; 
 Tue, 27 Jul 2021 03:01:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id h8sm1809929wmb.35.2021.07.27.03.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:01:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 12:01:23 +0200
Message-Id: <20210727100123.2315629-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libidn: bump to version 1.38
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

https://gitlab.com/libidn/libidn/-/blob/v1.38/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn/libidn.hash | 2 +-
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index 6269465e1c..c6cd668bbc 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3c8e970d5cd80a8cb56f59c61611535336343942e3f1c81b0190c69993a692c2  libidn-1.37.tar.gz
+sha256  de00b840f757cd3bb14dd9a20d5936473235ddcba06d4bc2da804654b8bbf0f6  libidn-1.38.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 2180607a89..4a400d195d 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.37
+LIBIDN_VERSION = 1.38
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
