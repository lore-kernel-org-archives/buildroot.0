Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4252AD11194
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 22:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E83914032F;
	Sun,  3 Nov 2024 22:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgkD8h0bj9L8; Sun,  3 Nov 2024 22:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C491A40329
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C491A40329;
	Sun,  3 Nov 2024 22:13:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F2D9723
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 22:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B6F5400AB
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 22:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7NVhF4-tD6v for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 22:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D147F40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D147F40025
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D147F40025
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 22:13:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d47b38336so2702707f8f.3
 for <buildroot@buildroot.org>; Sun, 03 Nov 2024 14:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730672024; x=1731276824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WbIceP+9+SW7arMG9z9EhqPMuaTMx5UFvfNrVtuBWyQ=;
 b=hSBP61eOi4+Cj9AaPKOlvfSgJ0hPfZJX7oqFkE72my5eXI2nwEZOvsQMDUcfcVfeTq
 Fon6mKhyfYjLHGhxlk2Mh3JZH3xj3HnWd0mDylvWv3xvqh7z0JRGp0Si8upCHOOv/JcE
 KwYZw9pHbV+UrcPWiC6kHJyjh+zIMDu4lDr+VAKKfpyRqp3fTpHhJRc+bqrzVR8+N0N5
 /m0BFKmvuP516ieoXCYil7drcankZUvxLxu/RLiGurMEk6PGIvdcU6JPJd86FsAG/43+
 XnO2fMVhiDR8X9cG/sDzJN2lT8lV8vVleeC8ktht4YTL7wGXBJHZO+55qAl3d+ECOTie
 r7yw==
X-Gm-Message-State: AOJu0YxUDYVhEQHZsMlGAL2AZeRSRPgwPrtoScvUJhQ69Er0ebAdiOX4
 mrrYndi03pwwVkyFcBF2w76YPcliyBi59QTUMWbLEcELeerokWVcVSqThsRrHvNehRGEcCjpjVC
 t
X-Google-Smtp-Source: AGHT+IE0s0Zhw5sVXaeN3YJZBFmmzhDDBWUquhYUlzqbqOdV8iKUTi09RKkwrhLbquGFLO7bq/Z+lg==
X-Received: by 2002:adf:e992:0:b0:37d:5338:8733 with SMTP id
 ffacd0b85a97d-38061200bc5mr21361673f8f.37.1730672023835; 
 Sun, 03 Nov 2024 14:13:43 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e8549sm167647645e9.10.2024.11.03.14.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 14:13:43 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  3 Nov 2024 23:13:40 +0100
Message-ID: <20241103221340.1770246-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241103221340.1770246-1-romain.naour@smile.fr>
References: <20241103221340.1770246-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730672024; x=1731276824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbIceP+9+SW7arMG9z9EhqPMuaTMx5UFvfNrVtuBWyQ=;
 b=cYa9AIKD4sfhuxHZq21i9yFcBMBr6Hrf3I0gySHHlauhhDPo71xqbenvh5kSL5MlAf
 pm679WsEdZm1Pjr0fDIwCPX6mi4s2klSkta2evb4TZ3lCn9V3PFMMn1/H4FT77BjhvdC
 frPS8kBXkzeR7NjCiFmHUvoeNIa4nWVAj6bjw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=cYa9AIKD
Subject: [Buildroot] [PATCH 2/2] package/opkg-utils: bump to version 0.7.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/opkg-utils/opkg-utils.hash | 2 +-
 package/opkg-utils/opkg-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 982dbb5caf..37834a3a15 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cbce8a9ad60ee34f27b9195146ff7ecfc37a3f97d2ce6bfc6610f46210f490f8  opkg-utils-0.6.2-git4.tar.gz
+sha256  b3299961be768c17185c0516e9757ede4481e94cf81ffc6d9cb0d51206aa58da  opkg-utils-0.7.0-git4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index b077e0dcce..320d05135d 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPKG_UTILS_VERSION = 0.6.2
+OPKG_UTILS_VERSION = 0.7.0
 OPKG_UTILS_SITE = https://git.yoctoproject.org/git/opkg-utils
 OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
