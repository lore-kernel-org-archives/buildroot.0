Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF28C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15D6A61102
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15D6A61102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD75E6071C;
	Thu,  5 Aug 2021 11:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bI6JwksENJ6; Thu,  5 Aug 2021 11:36:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E07860711;
	Thu,  5 Aug 2021 11:36:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C4B31BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98F9C83896
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N288OZ2Dq9x1 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:36:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72980835E4
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:36:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l18so6112637wrv.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Wq7+c5Zxx+O2knvTUPN1nhl/X0w/lZCKQgclnsulGU=;
 b=HObnnAPdFdRfAzIHaLnMQQIMz5QdLcb8k/MYrNv2RjXxVYQCZC5N1xetB5Q7bmtN4B
 SbxAR2+ea0zXiwAexwncft/8K5chUn9HoD+qxRcb+1njZZ3t2vxcbeWalJ9fvKonSIR4
 CJqBFPxMW94usW4bX65FIy6hyOgFVdDp6oiaI6O4qWfh1kjmsjV6ZI8Tm+qwlypSzDBh
 CJeu/X+AQCdGf221agq+31b/74893tnO4UUBVAcgy0lBsOBeZLVvX5SCoA9/ZRH47pdU
 s978aSvygw96sa9bLOnP6dP2a87iFs1NbfRv1Rlbd8Q2HiTfBa4KVlZ1A3ufgZ/8ajJu
 6PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Wq7+c5Zxx+O2knvTUPN1nhl/X0w/lZCKQgclnsulGU=;
 b=HI4xSb9fJmVfxqb3YgT1dzypmQrc3XYIJtyxUuiGL4ZdbC+Xgeyth52F2tgw9tERv8
 8VdO/SOm4CTqwNwsOnHsEdASpGnnrnfBbiMdaH18ZWondOVE92mmnxi0L50QTNwi2Wex
 ybftYPdoBDYKfoDRSGW30TuDREV/FEVnwJsE0kXomdfc3zVfWe1K4k0d9ueFyJbVqm4w
 n5DXTIZv5/AV+Q9bBp1wk6CDILO4ic4bY+0aeFamReHa2HUb0wQakHBVEqamfsdrwrFm
 5tuYiyrkyE1xzLTjySgapmC5UybNAi8tLIh7NIrFN953Zcr4BYmWy2vYAFdt14DM+Uve
 BuqQ==
X-Gm-Message-State: AOAM530BByujyO4cxUCcmnlX6HZkNuXp/EHIPAaogWFgReIRbFoZxh1L
 tet2rDNCLReyS4cXxCbAc7/GWZ3zqgUgzw==
X-Google-Smtp-Source: ABdhPJxe6x0Nkylw4JrlVaa0WaTZ663p5ExggRagY9i3Ck1AI3Avr0hoanDI5s9hSTwFsasCgwYLNA==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr4702354wrm.214.1628163380491; 
 Thu, 05 Aug 2021 04:36:20 -0700 (PDT)
Received: from kali.home (pop.92-184-97-185.mobile.abo.orange.fr.
 [92.184.97.185])
 by smtp.gmail.com with ESMTPSA id m27sm5708435wrh.34.2021.08.05.04.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 04:36:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 13:36:09 +0200
Message-Id: <20210805113609.2151894-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ipmiutil: needs autoreconf
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build fails since bump to version 3.1.7 in commit
011f31ee244b7fe4621b3f69ca3d7e7b1cfdb5bb because ipmiutil
unconditionally uses autoheader:

make[1]: Entering directory '/tmp/instance-4/output-1/build/ipmiutil-3.1.7'
(CDPATH="${ZSH_VERSION+.}:" && cd . && autoheader)
/bin/bash: autoheader: command not found

So add back autoreconf

Fixes:
 - http://autobuild.buildroot.org/results/2005af881726473f2cda176e90c1e41e4baea67c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmiutil/ipmiutil.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index d85b9643f0..a12146062c 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -8,6 +8,8 @@ IPMIUTIL_VERSION = 3.1.7
 IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
+# needs autoheader
+IPMIUTIL_AUTORECONF = YES
 
 IPMIUTIL_MAKE = $(MAKE1)
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
