Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB1AC47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 17:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C43C60DF9;
	Fri, 26 Jan 2024 17:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C43C60DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LCboIm0nmQBz; Fri, 26 Jan 2024 17:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC6E60BF1;
	Fri, 26 Jan 2024 17:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC6E60BF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A48A01BF38C
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 17:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BDD38437E
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 17:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BDD38437E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l02rkOSRBCgM for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 17:31:05 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 090A68404F
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 17:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 090A68404F
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40ee894c5easo4957465e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 09:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706290262; x=1706895062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8SxFVcQSQBGR126vCSVNQJ6Vy2yVQFin4s1gxj+wMKA=;
 b=jz4Fm6qG8MRua550p2EX76RFMOzY9A7eTE6WAxmgLi74Kfqu/DtgYksTjYwCZKtvSb
 kAYxzKY54CTNpbDGplPMFtCDrHPW/iuC98TxE7pHDZlgergE3BS3SqBTveAubz72ZWpg
 GWkG9OqBlIfR/to79Ir/Xh8RoQDDehsyft6IZxjh0xMPNqPcB5u/YU5fdvoGNY0Ishbo
 giAIv2/WOINwQZaw5Ocyt6jd0PQ6hjLch+XdyZlwVlH/H++yvu59yeZZv8VUm0RenNhH
 dWwGhrctBgNl84FC9+vfYMJF7FQ24Jxm1zCvJxNDajVgZL2YuLcOiRkach6GL19Xh77q
 PPGA==
X-Gm-Message-State: AOJu0YyUc6E/Y1TiB3Kvf38GZtuGv2fi2goREtFGjG1/fSEtl6P1BIjp
 GzFSab5ZHeFs5UvkAmdeSbDhMEJGftVyRV4qnaom67L4dUNYcMF16KoyN1d5k/I=
X-Google-Smtp-Source: AGHT+IGG24qdpKophxQHe90R+iFA1Ewb1fNZuNuswmu5j0yp0lOGPuDyxxvfc8HnDmaqNDq+xS88tg==
X-Received: by 2002:a05:600c:4511:b0:40e:cec6:9e77 with SMTP id
 t17-20020a05600c451100b0040ecec69e77mr95980wmo.125.1706290261801; 
 Fri, 26 Jan 2024 09:31:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b0040ebf5956absm2473875wmo.29.2024.01.26.09.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 09:31:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 18:30:58 +0100
Message-ID: <20240126173059.1629666-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706290262; x=1706895062; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8SxFVcQSQBGR126vCSVNQJ6Vy2yVQFin4s1gxj+wMKA=;
 b=E605Riv4mxEXZu5wbfZonx3oLZgmwUqroyEButIYcE5h1bACdaHuFpMPmN0DUySx2L
 mRJ4o8VjfBFpH//miEPcgi/q1s83cPAVTgXXB0HxtK98ym41g+4qcjKpVZQXuvrKfSfc
 p2FLPN+bwnXHXsVIWoIftQUCTH2LofEpJL4ZDTCjppugqT+XfSc3JRm94VYJQE8bSI5/
 RyrLPDFqdJ0vGDWCf/5Qk9mPHjNGuBCUMA7BzlzahxIbd4sA/v14FnVG1tbFyHU3oHxA
 qm2upf+wrhd3UecsHhIL/ATano6rKGBSyXPh6YqAe2aEHuGEMWzdJcx/x+jvPKPjZ4KJ
 e+OQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E605Riv4
Subject: [Buildroot] [PATCH 1/1] package/falcosecurity-libs: drop
 FALCOSECURITY_LIBS_CPE_ID_VENDOR
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FALCOSECURITY_LIBS_CPE_ID_VENDOR is plain wrong since the addition of
the package in commit a15e35c4ebc52f29f65372c8e86cefa874aa4aaf, indeed
falco:falcosecurity-libs is not a valid CPE ID:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:falco:falcosecurity-libs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/falcosecurity-libs/falcosecurity-libs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
index 92d5c61832..4245f9581a 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.mk
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -8,7 +8,6 @@ FALCOSECURITY_LIBS_VERSION = e5c53d648f3c4694385bbe488e7d47eaa36c229a
 FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
 FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
 FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
-FALCOSECURITY_LIBS_CPE_ID_VENDOR = falco
 
 FALCOSECURITY_LIBS_DEPENDENCIES = \
 	c-ares \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
