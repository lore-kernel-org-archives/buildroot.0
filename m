Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1798C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 20:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEFC81462;
	Tue,  9 Aug 2022 20:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EEFC81462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKWu53R1Yts3; Tue,  9 Aug 2022 20:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBF4C8143C;
	Tue,  9 Aug 2022 20:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBF4C8143C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE9C1BF5DE
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 20:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6246560D52
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 20:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6246560D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gg2Jud2D8ED for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 20:35:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 527F56006A
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 527F56006A
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 20:35:29 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id s11so2747212qtx.6
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 13:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=jV8Wn7ndioB3S+dZarssR9ISfOgnnnNCShZirnXJlLc=;
 b=Oj1ijvn2u6AP496buDu4Dcku9BzVo+v8ygSZJMONJjFUMc6OEjRDPvKFrt8Fv5r3yO
 VkwyQlrfMmtJSJmK71wkedyXJqE5DwhY+6LR2YpSAESdAKDbMXYidN8z+D0ACpxj63VR
 zFVhbjlGu3ZGSrGOknBIOpZTRZqVxKUbDSokHdnAOsgZD29iSV6DfmM9AiY3RmOdvzTy
 MYGpfObdYbSYQ2cabWg53txYrIzbyeBe10JVuicNYgr0Z7yrO5Pk+0FguBIjtEPZuAFe
 PfMRg7T+plvBsfWzikZ6IMCSUClb+FAH8yGNLWVvelVX/xPGydHyPScnN+YbtG3YoVBR
 0zZg==
X-Gm-Message-State: ACgBeo1RpfHkt0vptBAGukWBs1BT9RE1ALI5XDk6L10SnYvalfnYWVhn
 /zyrHjPo2W9VviG5/5K7ev0s27dOtJvnMkal
X-Google-Smtp-Source: AA6agR6oTBxaeah91StVo3kB4dAJ3cjU5njNoO6fHyQEoaIe6CgM7/d+4tMGAMHbzuSkKTSMNB952w==
X-Received: by 2002:ac8:5f90:0:b0:31e:ec02:66c8 with SMTP id
 j16-20020ac85f90000000b0031eec0266c8mr21589996qta.535.1660077327975; 
 Tue, 09 Aug 2022 13:35:27 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05620a445300b006b9264191b5sm9656599qkp.32.2022.08.09.13.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 13:35:27 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 107AE4790243; Tue,  9 Aug 2022 13:35:26 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Tue,  9 Aug 2022 13:35:05 -0700
Message-Id: <20220809203505.3620840-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=jV8Wn7ndioB3S+dZarssR9ISfOgnnnNCShZirnXJlLc=;
 b=UY2IN0GThrFQ0rShpkeOOWnWg8pxCWbBFPngwpZKaTBmUsnf+T/bLjp1KLU/FCit0f
 vn45d11PKeRJVcljc9UFj00B0dEQLsnOqlKN4ah2MkbnDy1lZTL2pZnd6MMeFNyP7Otf
 euOB4ThFqaedb4UUc7CFu3VV/DCL4GW+grYY4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=UY2IN0GT
Subject: [Buildroot] [PATCH] package/linux-tools/linux-tool-perf.mk.in: Fix
 disabling of documentation
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are trying to not build the perf documentation. However, the hook
being used to do so was named incorrectly. As a result, the build steps
to disable the documentation were never executed.

Rename the hook from
    LINUX_POST_PATCH_HOOKS
to
    LINUX_TOOLS_POST_PATCH_HOOKS
to fix the issue.

Fixes: 20b144666909 ("linux/tools: make it a real, separate package")
Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index d82d45973cd7..3ec4dc6fee38 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -126,7 +126,7 @@ define PERF_DISABLE_DOCUMENTATION
 		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
 	fi
 endef
-LINUX_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
+LINUX_TOOLS_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
 
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
