Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E168E63F08
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 23:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 078438238C;
	Sun, 15 Feb 2026 23:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTMNM6auLUbW; Sun, 15 Feb 2026 23:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D76E823E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771197058;
	bh=eMZWWYQ5/8p68GNcBveBkzzAUT7r8tR3msnWidr+VJ4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p5MuYihDi3JC/ZEFI7xweVo7m6EXFTCZqjaYlaeryVHySO8ClAPnZ9IKvit+14+QN
	 u5gHMRZ06NsSPt+ywiaCRmIIZ7NwaAFQ/+HxRZlds/ikDRzkcsFLRr5De27XgXNJpy
	 m1YhXEn9dDduWiL68uBVbayluNc/XBy0Hr4SmJcwPGkk3wyyxNeP2xN4AKnsCMMKRD
	 sddr3qIXSmbDN0/9QoIouDww7DqoW/MdojOBf9gUsabwDQTfP7EEjCSeoJRwh4P0q7
	 tkxFHP4vKutbuZCUMUy/4CL0frkn/FLjrzNkLFPkBOXNyF+qJbFncqyPfYU+oK6U65
	 hA/qBg0QT5EkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D76E823E0;
	Sun, 15 Feb 2026 23:10:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EC8735B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 23:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AB2C40A1D
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 23:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjevGyP5PIFm for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 23:10:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66CC140A1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66CC140A1E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66CC140A1E
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 23:10:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so25660105e9.2
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 15:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771197050; x=1771801850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UbbQ+87LIZUzXlWjALlABSq8d2ZUfuORlqhuze6bdcw=;
 b=YiOSXIqhi4fy4nscoPK8pAL1MMeL8sFgkHw9HWBwKqN19unUPNTjAh/L1cNM64+x6a
 /PFKL/nLRKjzS0rjIWs7CRBgMUXM1YTbA51aNIEOo4H5uOY1fEnX911Z2YBGeg61qUoy
 xZ5BCLcG241kC6PvYlS3rUqwfQyekyF58kMQib2CKsTTmbs3eSUA1TIK4qGNKZYiO2vW
 WvGkopPnZtmzzLgO3nE2eWKyq0vIMSD0cYo28kJu1KFPnMvzs/HFU+hpi26ik4c1YD2S
 OwEwYLoYeyxG1t5y7GnSwUL2BA2VUViV1x44SsBzg8C+IQSiA81llUGznYm3L+uDXP4w
 3u3g==
X-Gm-Message-State: AOJu0Yzv6ZvvHpMShbXwqSG5CJuQt1GxEFVjiHFH88o1kTGVKihxIdh0
 YAnshAsum8SSBfu2rH0wlIsJMnjYXFb9PsBrP6JWdNZOfuwMvXEorE1ZoSygkg==
X-Gm-Gg: AZuq6aJmOlG/slmT+AF0wHL35WNFGMVMX2AWlTYWUP5gJkLzg8sE+R6mTQPO4n7/3W/
 qqMCWUxD30/9Uaf7ruxA4oEagY36h0xlhv7aEWX+YquuS+F6NzuASPRM3Pe53zPLsO41hhV+fHD
 9zDgGDfnQnUb3O4/wEyH+8yIDnPR/agAhcdHLpvNHh1gA9TwvlJIDcPPt1CUWYUOzzXK3bBv6B0
 0IaAbl6KG59L95B4DL/kUNiQP0Qx3rKBBfWFwPOJ3KUvWxvLDA7LdxAVPd0gm0v3HN9b5z9Wu5O
 iquO6Bs2BJDE1zg3YisdEon0Bv+SNJRU//5a0L9NgHU2CB6jKzGCmzCvBarRXyJQMOfKj2tlr8l
 zQzrlNlz0Rhz9uboofnSoZKnR0Euaa3LhIcVP7aIIGUw7rPbReSrlQAydpfQSSEwHL0a+CQwNA4
 hCKvusZH6LEPl8J3Yw1lN0HL2jmEo=
X-Received: by 2002:a05:600c:5296:b0:482:eec4:74c with SMTP id
 5b1f17b1804b1-48373a5d771mr138665655e9.22.1771197050187; 
 Sun, 15 Feb 2026 15:10:50 -0800 (PST)
Received: from localhost ([78.208.235.85]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfb28dsm354300305e9.11.2026.02.15.15.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:10:49 -0800 (PST)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 00:10:38 +0100
Message-ID: <20260215231040.1010538-4-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215231040.1010538-1-mattianarducci1@gmail.com>
References: <20260215231040.1010538-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771197050; x=1771801850; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UbbQ+87LIZUzXlWjALlABSq8d2ZUfuORlqhuze6bdcw=;
 b=dCufnjRoxAy4STm6zR7ncp67+7J+x6judSWVTpiVctt3V77QR5j4t+jTGeEKSHyT0m
 03gefuqlSRkpvZh3ztZYEni3WNP7AIBhl7kpiYmNbYAH1H2pey9XD9CImTKGSjfxqkyH
 boDGdK/KP7RrgvHihAcyGbLm/WIDj0QAKsMYb3SjDSrNX+rgosaWi7ljysD8PZzAj2yd
 K847lj6Dfk+R9MMW7nXm3xo7YNaXViZNJxCr+Czbmt6U/PlNBOeA8bHdDjTQLnzXFe4c
 po2l79QMqPqmMTLVhhzATYmuu7fF4ykG/boanwCQvl+t69l74byR5pITFRlRNFgRrctq
 LRcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dCufnjRo
Subject: [Buildroot] [PATCH 4/4] package/ser2net: bump version to 4.6.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://sourceforge.net/p/ser2net/news

Static builds are no longer supported after bumping gensio to 3.0.2.

Updated licenses hashes due to upstream commit:
https://github.com/cminyard/ser2net/commit/2bc83f09548dec25b0bec48e11a3ee1942fb3c3e

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/ser2net/Config.in    | 1 +
 package/ser2net/ser2net.hash | 8 ++++----
 package/ser2net/ser2net.mk   | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 1859d42c8f..a14d0b8a49 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # gensio
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # gensio
 	select BR2_PACKAGE_GENSIO
 	select BR2_PACKAGE_LIBYAML
diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 50a2efdee8..9e6f5ab4b6 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  73b4ccc7e9d89034f1a1a20a780b9da9  ser2net-4.3.8.tar.gz
-sha1  d1597d88d154489cb08bac69bb1772712d30cbcd  ser2net-4.3.8.tar.gz
+md5  730828cc7758b3ba374b304516c31459  ser2net-4.6.7.tar.gz
+sha1  faa625f6f548f7b9316caaca9acf270d44365cdb  ser2net-4.6.7.tar.gz
 # Locally computed:
-sha256  e5620975523059a38709bb53c0567600adbbcb8011066a2d2fe1b4db9efe0ba3  ser2net-4.3.8.tar.gz
-sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
+sha256  6b921bc7efb1b9a8a78268d63332701902cc1c8dbac51842d46ede6ffb5fa2a4  ser2net-4.6.7.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 679aaec29a..4f9264a427 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.8
+SER2NET_VERSION = 4.6.7
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
