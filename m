Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE63DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 07:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 788944037A;
	Mon, 26 Dec 2022 07:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 788944037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmQfTESehtMr; Mon, 26 Dec 2022 07:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73C1440360;
	Mon, 26 Dec 2022 07:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73C1440360
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB0061BF228
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1000812D8
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1000812D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsk8yFtSHaxd for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 07:49:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 961AA812B7
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 961AA812B7
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 07:49:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l26so5594157wme.5
 for <buildroot@busybox.net>; Sun, 25 Dec 2022 23:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=roXUc6/jtbQbwd+cldgXYwnuGmHQ6gDvclDxrYHZdoM=;
 b=p6u0UhUMt/n6eiJP+O+h7CjTbVB5bZL0HKdUl+SZ+XMrVlPtxeEHobajLpN4JChXEh
 DtNcap3UQ7ST94/aRsrCCQ1qiSmTKDlvX7+6NIxGW1TL2NzFdzNh1g6y1l5NOcsbiTS6
 ouZtTe6mIdz76BARNZr1IKMW593Xe89e6rQdU1+DfLN5vkSHhJFq8M2zkPOwsH0tSelZ
 SYOdbRet36q3UaEfumbNJzl2xMuc9T7ySS8HiyGr3WdLUuVdAhlqe8czK62QuAvabk1C
 7hiT7GpI1geASr4rIQVNOfGAdfNcf9VRa9s9X+xDfVWLJqByNOQN3FOuUHlrld1S+C3q
 6IMQ==
X-Gm-Message-State: AFqh2kqKEOlpZ+VKRhCb8V/gGYiJzHtb8aEWH8kNBaPD236sidnu47a2
 qCYeYs9axRfypZCF3Zt5Tak9znz26KM=
X-Google-Smtp-Source: AMrXdXuH9J/FqJovHZuDn4uS6d6V4DFLaqK1V6nMfpHayFjmWQFwaClOnwEqKJz843ZZnRQPLVMWgA==
X-Received: by 2002:a05:600c:5014:b0:3d3:446a:b46a with SMTP id
 n20-20020a05600c501400b003d3446ab46amr13020180wmr.38.1672040946834; 
 Sun, 25 Dec 2022 23:49:06 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c080500b003d208eb17ecsm12440401wmp.26.2022.12.25.23.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 23:49:06 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 26 Dec 2022 08:49:01 +0100
Message-Id: <20221226074901.143710-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=roXUc6/jtbQbwd+cldgXYwnuGmHQ6gDvclDxrYHZdoM=;
 b=c7YiQwQMKlFXtZz6qr1PGJrmQLQwG94dH2UzOfslyh+ytT4meQRWAa+E5iXEpLbayN
 wd0my2RjwH8QoZR1V6p0ipwJYUhRJ7mnlvihE7E+Q5aca6787XKFwwbblqbrRSvkp+ih
 8PMYH+Nfq3pIziWAUK4VQWrfZUIai2oTUFPfjX1g2udBSVXWAY1MDhwfRelX83VmaFTs
 nYyjTsFwJDYaFEbmExDrT2wkGLbZ+O8sggZF9bt8rza4iPMzI45eTa8kYiM3aJsnmCAL
 h74NWMVn5dBo+HY98cL/xLoW86sOL2o8MREmXDZkz6gqbPoxBq2zjpGA/8y4zzp8Ewpb
 3r0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c7YiQwQM
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.4
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
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 22c13851b..09002436e 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  283545991c3eb36b18c75a64638c7c2ad8f193654c2403b76aee848abf454e14  open62541-v1.3.3-br1.tar.gz
+sha256  9a7955ba01e12dbd327e534c25288f4918d275031394c804943a7e45ba903621  open62541-v1.3.4-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index edc95dcf1..2c0e3b17f 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.3
+OPEN62541_VERSION = v1.3.4
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
