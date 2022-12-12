Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3B2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 17:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD95160E2A;
	Mon, 12 Dec 2022 17:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD95160E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JW4gzMGJxNOV; Mon, 12 Dec 2022 17:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F3560AE3;
	Mon, 12 Dec 2022 17:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36F3560AE3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E15C1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69C2E813DB
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69C2E813DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TegOxipHGKgO for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 17:35:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D8CC81340
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D8CC81340
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:35:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so5864876wmh.0
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TDQUrMgbqy7LBdDq2lyBpxFomMTnw4kboL5lhaC/73o=;
 b=XPG3z7yUgwm9UPFtdMYk3vNcg4zwSFsnex6pypma7T75kW2JX4VxVd3tExw1Es5mWv
 zNqpeVqS6tY26S/WR5qCnzOMwszl3hy58RplNxiV/mp2FQiXqjquN626vfdodPJFgmLB
 QPtT2+jfYnmO/IM0bmPalyKkq5O9uZjAvGihtIiUNaLmkj10PFInrtpKSZFy7X/AkmNU
 Ad7rmWD8flE2QuV9e1xrA+fldY69ti4yfXAZGa+oKjP2gj9yys16Eq9RpaL8dXm6cgFf
 WWuOhdJskHqx6h+6Jv1d5f7BalYT8yw86Yrg6yjwpwwlZTqFUzJtXIUEpvEnkSHfMrTs
 YQqA==
X-Gm-Message-State: ANoB5pmoGBa6vRndHEfI1Kn9f+cGm9sSI+f+L6IKsTBqii1CYdjzvwgT
 Dv+xiAM9pOa5q0KfIlgh0LfKhOLD/Tc=
X-Google-Smtp-Source: AA0mqf6e7SD80Cy7h6QI/2pUP6rFv8zifBsARZlYiEDt/ohdLgRHFOAtlMbfijnprdNsGc4Q0WRAgw==
X-Received: by 2002:a05:600c:4e41:b0:3cf:8b72:e6fd with SMTP id
 e1-20020a05600c4e4100b003cf8b72e6fdmr13243473wmq.20.1670866544953; 
 Mon, 12 Dec 2022 09:35:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m37-20020a05600c3b2500b003cfd4cf0761sm11337050wms.1.2022.12.12.09.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 09:35:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:35:42 +0100
Message-Id: <20221212173542.8469-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TDQUrMgbqy7LBdDq2lyBpxFomMTnw4kboL5lhaC/73o=;
 b=d8O/y2hHgfkOEvjbA/pIg8RmWlKQgGMUY2hloVe58iQ5aJH5x++9sU15AFufO7dbyv
 1h+JzOeikUGiwwczCLfnyc7484E9+tdoDIK4i2krw0RPqwviPW2bjvKeMjH3JXGw9E6r
 OTe8sLanfJF1dDZFh90YZ8sjP5zJjaIayJX9A7xL0arpLdh3r3slZm5M6Wkj+9ig7FxM
 Hp3ISsupOy5tH/8k+xOZzaLkeWUIzF3oMtYfja0ZPwH/2oifrDDsc89BacSUIp5BsWpY
 SZcKM956hw5i5nwumZaLHZwurRWmU/QRO1CumijTvybYvgY+PXEIP0y3bB5d4ZNxErfR
 dufg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d8O/y2hH
Subject: [Buildroot] [PATCH 1/1] package/vuejs-router: fix license hash
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2fce36d928082685d7f77c3587e15b7827ce0b42 forgot to update LICENSE
hash (update in year:
https://github.com/vuejs/router/commit/ed238db64b2a605f785ee4e2f847a6788c06a2ea)

Fixes:
 - http://autobuild.buildroot.org/results/beac411246342a9445495bc7c8f6a7e7369b9c53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index 147e730f20..b48e59ef48 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  437558a84b99d0d89743d4897ec16a90a96a1d3a6786e697a8808a044bcb9b8f  vue-router-4.1.6.tgz
-sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
+sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
