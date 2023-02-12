Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB38C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 15:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B978340533;
	Sun, 12 Feb 2023 15:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B978340533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dV9bxiWjs8x0; Sun, 12 Feb 2023 15:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AB9A40528;
	Sun, 12 Feb 2023 15:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AB9A40528
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE8E91BF4DD
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 15:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A87F660E46
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 15:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A87F660E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeWb6T34AnnZ for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 15:09:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F53060E45
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F53060E45
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 15:09:51 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso1914020wmo.3
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 07:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KqWDcPlrZJXcWEDmt614IQNb0jY1WIawjT0VdG7foJk=;
 b=QVVMlz1qcNBWddHyI5WqWgCLa5kseo/quM6gfuMwke+s8vpo9Z7aCyk6OOOzYqmevD
 8Ec076xBJFLtDHQF7BVurn1nYT8jo/8FOGxE17i+e47dq7/4VjKPZPs4rJBIhHaQQk3H
 ET9CiJfOPmNAAVEPOLvw82sAA/Pwv81UaC+qaduH2dZmpumCQcgi0Nw76NUEKdgzXIjA
 w9du4gWIrqOsWGnsDdFRri2MhkevTl+TlSg6PLtcmniQkAj6V+K02r8CbDU139jx8RKt
 S1BSuIbdP/oGwEIz9NJgIJ3fM0F/Gve9K7NufQTZ3m+V9S6fl1HXzZzo3UJz9W59ln36
 MHAg==
X-Gm-Message-State: AO0yUKWCWLD88etoBFopQ98D02VjZaFp26QThc7Kc9IrRdrgXTk+JQsx
 Ix1TYl2ePoDwU5lniMkas10h4pvtheg=
X-Google-Smtp-Source: AK7set9N8EmkVbfni1WZDCgcWsS+lzyQVFdVcrFhm4Qdgypw+Oj270CkwnLZj6n534mZC+fZgXJFFA==
X-Received: by 2002:a05:600c:1d15:b0:3df:efdd:9dc7 with SMTP id
 l21-20020a05600c1d1500b003dfefdd9dc7mr3606699wms.10.1676214589234; 
 Sun, 12 Feb 2023 07:09:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c308900b003dc3f195abesm11008036wmn.39.2023.02.12.07.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 07:09:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 16:09:19 +0100
Message-Id: <20230212150920.1213398-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KqWDcPlrZJXcWEDmt614IQNb0jY1WIawjT0VdG7foJk=;
 b=Vq+Gq9nkpn4I9XIfK39nN8ij1jXkUChrVBdaGrBP0xmoYTk/ef68bpVhZeXUNM/tPP
 kuA4Cs/v4Cny8jq96FZktfEa397BN1TQjC+qM4rmpYwQJUwCfTZevVT4gjn0mcxSsgbo
 +JVIejvISdjaIky/xmNcXWdoOx/7ttBlrMos0zCPQoRz4oCoGpODDVB5/RsJ1bhgm9EJ
 y2k/t5g8+fkCkxX5nHSUBHm6w6VsCCyoL9tRdhD+YSRnHb4mTLOhw8nR1+SFC0G32MVW
 5pvf+dU3JJxtT5xflFSCu6w7YM2uL5D3aUWslhqHcFbeG6e7dNA2claUF2ORhcdNabCi
 xX2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vq+Gq9nk
Subject: [Buildroot] [PATCH 1/2] package/zxing-cpp: update homepage
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 456a7398316655ad0b669635f580e4887c24a700 decided to switch to an
active fork but forgot to update homepage in Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zxing-cpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index 6c17565d2a..2550dcf023 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_ZXING_CPP
 	  implemented in Java, with ports to other languages. This
 	  compiles the C++ port.
 
-	  https://github.com/glassechidna/zxing-cpp
+	  https://github.com/zxing-cpp/zxing-cpp
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
