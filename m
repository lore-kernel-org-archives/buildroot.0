Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715AFE7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 12:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F75584524;
	Mon, 16 Dec 2024 12:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0sAXWLOTq8p; Mon, 16 Dec 2024 12:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A1A184561
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A1A184561;
	Mon, 16 Dec 2024 12:01:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B63D9CE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A476984524
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5D86OWV7924Z for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 12:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6557F844E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6557F844E5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6557F844E5
 for <buildroot@busybox.net>; Mon, 16 Dec 2024 12:01:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so44147515e9.1
 for <buildroot@busybox.net>; Mon, 16 Dec 2024 04:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734350494; x=1734955294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QywPG+A437CrOxIquTmtSjBRjfPCl6ys5ZcG77McN+4=;
 b=kCkRaeSFE23gsi2SsVjKIVd45Cw6CFy/9LNdUx9bbUbJquPQoVmiPyT7PLErG709e7
 yL0kSg378DDELwPBmA26SYKPyxAoCVVYS07aIWwQtgRy31l4PZOFKFRv2MpbSRyQz2Dr
 IQq+YhWcBV9FlHG0q571basizyIhoEdbTqkWvK5a46ORMv5gWRYFSWbxQTT/VYQB7lKX
 CPb8TJRCTmrqrxjRkdGSMjzelr1mkbR99f5v67oMTAxyW/ZvgzFDTg6F7Q4LlSTy0sfN
 6KYCmdUFMiAZSwg9I1gA7+7tZf7VbB8fZUE+I7lu0tji5CIarvv595fJuM/xpvMSEcS2
 5smQ==
X-Gm-Message-State: AOJu0YwSyFdSEaJKy1e3HN2HhdGAfviLZ0eY0qzdE/Ja4qwJuJs5mDI+
 RIrY1BuTp8bMKx7lYFBreltue84nByCII7NGhK9JTyLFVO5lvvcfJ/3ikCDyiVOr04XQ7iZfrs4
 wXQ==
X-Gm-Gg: ASbGncvYoAbcMbLtL2claJFcAQJgKAO4qnSR+9M4a+euXZI3j7jA9P8BLYQgE0uqHwc
 trlJmU2ggAwuqj3Iky9Nyo83JicxpUnUlvIuowmZBy9adtsm2uCLjCXW5aGvHHM/jYBafBZC6Lw
 lq/3YHUyjM19rMm2Uwx9QLg3f9Qoag7MKV9z4Cgr+HxnE+DVjPjFD3dZQWHSH5Qa/lYm4v2saGK
 X80mhenwvvCXsxRLgY0jvNgauJycZ3UadSVdO8bLdgYz15+gGNcsmK3ENI6FwZnOJBjZ2YZr9TX
 ztXR+O+5+LvuLnE=
X-Google-Smtp-Source: AGHT+IEg/3mRUW5sLDkgrfAzrINk485cimH22jWzx5LPqce0C2ald7QkRtvrChuL8/NMP9hc0PRvWw==
X-Received: by 2002:a05:600c:510f:b0:434:f9e1:5cf8 with SMTP id
 5b1f17b1804b1-4362aa9fe20mr115392245e9.31.1734350493671; 
 Mon, 16 Dec 2024 04:01:33 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362557c696sm136908255e9.17.2024.12.16.04.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 04:01:33 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 16 Dec 2024 13:01:28 +0100
Message-ID: <20241216120128.1187670-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1734350494; x=1734955294; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QywPG+A437CrOxIquTmtSjBRjfPCl6ys5ZcG77McN+4=;
 b=bCUxiqvfXVjfM9tpVMvI6kuI4YmbLl9fgrjxfxa+29M8Jb8eF/96GUO/u6CTuvOVXv
 m4Eft4x3gwGfavBhnMSwlBU55xwusK84hxqcCXoogfxE4j1TJH+R4HWM/qD794ylf6kw
 TF4HCoT4moTLE2JeJQbHsol2TRSyvJaTl1njUcipwBmvowbW+J+fhuJbG/DZlUkNUGOm
 iSHHKPIBeos86lQFu9ClP92xXPpELx273bzYotq1+1IWiC42qDVByoL2EiuJG4VdYdFK
 6x3EGOHFTxi2yMTScE2N17OdAI0rZ2+UE1RNF4Uiqy/lBvIumQg+FgKgZkJcv2GfyP/4
 flHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=bCUxiqvf
Subject: [Buildroot] [PATCH] package/gnupg2: bump to version 2.4.7
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index e16a3f491..6a34f2a1c 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  2d8aa2662c398d60f1f8e0bf46fd163eae703189  gnupg-2.4.6.tar.bz2
-sha256  95acfafda7004924a6f5c901677f15ac1bda2754511d973bb4523e8dd840e17a  gnupg-2.4.6.tar.bz2
+sha1  2d510a1a7294f2f9ef3f2e280c93c3ad9b0cdb68  gnupg-2.4.7.tar.bz2
+sha256  7b24706e4da7e0e3b06ca068231027401f238102c41c909631349dcc3b85eb46  gnupg-2.4.7.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index f1a8e9917..d98829ca8 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.6
+GNUPG2_VERSION = 2.4.7
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
