Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E98C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44B5760E71;
	Sun,  1 Jan 2023 23:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44B5760E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNDg_b2m9und; Sun,  1 Jan 2023 23:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B26F60C2C;
	Sun,  1 Jan 2023 23:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B26F60C2C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4861BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F23402F5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57F23402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYY54_pxzVwN for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEDE14018F
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEDE14018F
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:42 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v70so23832005oie.3
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A75BXG82kPo/CRTYIb3n10bb15AUkZaHLphah75Gto=;
 b=YSzUySdKpAnkeOlm4DoIIwQtJn2GDSGKMVdM79u6ZUgW/v9IkOLjzkku2QqYRcp3iv
 gdkk8Dyw30VzIc42fPS41+9sCerkrRVAkc1RaWuLZjvV+GY+D3kBHEkwr0pbTd+DEg6n
 95YkuFH9VtX+kuGofOi5Uyr3L9shYZVdJ4k8TWNChyS0M4XQFRFxh+HqRePuNjGSrHNR
 zeNfKMp9BCXqcDMR2uFp1g/4u6B0QAC5BnEYLXNOYW3arRpv05HEEnR8HIFxnq/rs+in
 2pL0BCfLuTGHCxXJlFtEiNGXQmcaHRYam+2/VXQSWDyy4lyyM/dZfib2v5ZGvPHAqlDZ
 YQVg==
X-Gm-Message-State: AFqh2krcLfgH9PPb2SdvjypWx1vr17hoyKsH3XxANPnbWVw/Qc6qA1m+
 HhgA0RVLwoxT2ZMxI7KmDHruJGq3z70=
X-Google-Smtp-Source: AMrXdXu30gbq5bQQtqmBIguKkGIAt4zTsX7Qh7IyyfHMUvzh14t9c5kCwkWTEuZpmY+Hn2gpSFQdDA==
X-Received: by 2002:a05:6808:3a98:b0:35c:1aba:43f7 with SMTP id
 fb24-20020a0568083a9800b0035c1aba43f7mr15355468oib.1.1672616381790; 
 Sun, 01 Jan 2023 15:39:41 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:40 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:39 -0300
Message-Id: <20230101233653.487175-16-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1A75BXG82kPo/CRTYIb3n10bb15AUkZaHLphah75Gto=;
 b=a00+R+uDmvzdii6B4eFEefO/ab/xxcqayYtJ1qloXL4OYPYmujpG5A1xOU46ro0dVc
 lxx2tUE5NxIxDMGt7+XQFBh7fDvZeKrgyQAUH2z6VliqhQw81eRCf0KoQh72m+OtaDvw
 aec61LX6W8QpLum+3T+1C4OvznOeCfArOrUW0amUlBNvxcBkB7KBMxh8N/Ivy3Eb3ySp
 CmmsM/z7YCWsx+77XJuirLNiJRbw4nhbnNKOHwmZBeKu6J+F9625eUwpYCWQltFcNouT
 5qHGNkOnGKazyRwyRGhNF2qA6wcOF/bH/S92Syp5eX+6NC6qNCNwqu9lz3aVHS+LO0Rs
 q6uA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=a00+R+uD
Subject: [Buildroot] [PATCH 15/29] package/falcosecurity-libs: drop bogus
 FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD
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
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "a15e35c4eb falcosecurity-libs: add new package" uses the infras
kernel-module and generic-package. Neither of them support
<pkg>_SUPPORTS_IN_SOURCE_BUILD, only the CMake infra does.

So drop the bogus symbol.

Cc: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/falcosecurity-libs/falcosecurity-libs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
index f2c389948f..92d5c61832 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.mk
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -9,7 +9,6 @@ FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_
 FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
 FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
 FALCOSECURITY_LIBS_CPE_ID_VENDOR = falco
-FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD = NO
 
 FALCOSECURITY_LIBS_DEPENDENCIES = \
 	c-ares \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
