Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF4CCFB440
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 20:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA86606E7;
	Sat,  5 Oct 2024 20:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntFdA55LCBwi; Sat,  5 Oct 2024 20:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D67AC60725
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D67AC60725;
	Sat,  5 Oct 2024 20:56:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE2FA1BF5A5
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 20:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD7524055D
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 20:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zi4pCjsIIFfT for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 20:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 89753403E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89753403E6
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89753403E6
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 20:56:34 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-4a2ecdad7bcso972973137.1
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 13:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728161793; x=1728766593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QvG+YSrw+zBZQPHKnfICdHyVB+oLIHpLeGsPB5vrdRU=;
 b=XET2xtrQUIeSPoYmCDvp/m8u62nJgwr6wm9KX8mYjz7paQYHJBvCNV3Tq/32eT8jpN
 0h47+Pw4xlkPHPNWKv+c08OvsalDNlExeD/bZM2qfL4p7ZHjDSgJDtXlcCT0eB9q28xF
 +EbC7EK1PwI+PxedHfbLT3GswRZrtxtgnrYyfg9ZdrXzY+TDf4d7wH3+5gbN5DUEkgh+
 b9KZzq3x91gKcMwM2raOK0HZLR3Q7qMzsRIsLvFMH/mdIbTExV5gHZ430dAT2yH29/h9
 iFSEwxO76m0NAaZxYGrbGfHqkkm2rO8u4Qa8SvRkXo3M2qpbqtQzx55xbOrTaX5gao/b
 NXyA==
X-Gm-Message-State: AOJu0YxZUgpxU3MTARNFgFNEhmtgmwJUQF5VUQDGIbRMWtz+wSz2ioRI
 eNkrkAb3FgZsYAVTuyG58I0YBcuKGPOSBRbVCvcZRzBi4l3HJz68LLc8VUUO
X-Google-Smtp-Source: AGHT+IEyc9PE+quxOq5yNHy1b3PqyJXsxVTxvHzxDy9y55S9wqLOyepUZ6rqJ8MJtJrkVUL2t3ZJJg==
X-Received: by 2002:a05:6102:292b:b0:4a3:c218:5f89 with SMTP id
 ada2fe7eead31-4a405911824mr4870848137.24.1728161793005; 
 Sat, 05 Oct 2024 13:56:33 -0700 (PDT)
Received: from gilles-Precision-3571.lan
 ([2605:59c0:14b7:4a10:cd3b:1b9b:5d1e:f72d])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4a412eafcd5sm483500137.33.2024.10.05.13.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 13:56:31 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Oct 2024 16:56:07 -0400
Message-ID: <20241005205607.222164-3-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005205607.222164-1-gilles.talis@gmail.com>
References: <20241005205607.222164-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728161793; x=1728766593; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QvG+YSrw+zBZQPHKnfICdHyVB+oLIHpLeGsPB5vrdRU=;
 b=iZ1AkynD62PEmS7T4D69C54lqQQ8v4pgBLst/SIY1u51dfcKGqkZ0KyaC/1hgwhSVr
 d7lCyNRmFEd++Jk682RFiFukjzvlzRwXyevIwKOtNcvbNRtOxgUGtgrQWscef/0rwmCA
 va9rinPTiRaHXaPeEA4EnZ9bVpyOH2BZmK4YxvZCQ5rizbz3RiApFRsZ6Fzsy7CUQfYm
 sgUv0LnD4ACDJyJzhyfBVK4xruTrzqdjYB9pmks1l1IGIqqSMlai4Pj9wZmxpbCzwcFa
 D/XbwTMH9xfauXoo2c6JtymedDzjdAYHJcxy8kdcGt03Zak3maviWx2OqlHfXP/IcOg+
 YUJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iZ1AkynD
Subject: [Buildroot] [PATCH] package/xapian: bump to version 1.4.26
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log for version 1.4.26:
https://trac.xapian.org/wiki/ReleaseOverview/1.4.26

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 16889b4559..01d6c19ad6 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2023-November/010009.html
-sha256  eda5ae6dcf6b0553a8676af64b1fd304e998cd20f779031ccaaf7ab9a373531a  xapian-core-1.4.24.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2024-July/010052.html
+sha256  9e6a7903806966d16ce220b49377c9c8fad667c8f0ffcb23a3442946269363a7  xapian-core-1.4.26.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 33c36a5a26..7677571288 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.24
+XAPIAN_VERSION = 1.4.26
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
