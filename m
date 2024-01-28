Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FFAC47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 21:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A585860B38;
	Sun, 28 Jan 2024 21:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A585860B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xRZz9SaxV3rT; Sun, 28 Jan 2024 21:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 008DC60AF2;
	Sun, 28 Jan 2024 21:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 008DC60AF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 306A31BF3CB
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 21:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0119840391
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 21:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0119840391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id caSjZ6ygho41 for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 21:52:12 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE6F44016D
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 21:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE6F44016D
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40ef6bbb61fso2913245e9.1
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706478729; x=1707083529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swbJqCVIvnC3RofWSMF5dNqRuf1lpYygy8OdtxeFqmY=;
 b=vDP3F4AzfyVLwkOcFm66ZqgbmfjH3Zjcl7z9GWHrkFsudu+ZDGBECnMApX8ylSR6w0
 jpgontlnHxFeEaZkWV/l6r5oikIEsNhP6G24+Bu299dykUS2ZVTc1y2aYl2PsSYWc4O4
 eRIL3U50H6RY0zizJw2qN0W7o43OklI78m5+O+F0oHt7s6OEcE/CH574XuDsAA4zxTuE
 XwFbDICQjYOtN4TrqYACiQiB0rvi17Fe9m6/riGdZubc3Hr6n14THXfbmgQk5eRLxtIN
 BBZuUrb9KsocNLjcG+tVLvafccy6P86sL4YPtdDcj+e/JtJCj0Lhc7lG5K7GUfNqKIGO
 rx8g==
X-Gm-Message-State: AOJu0Ywpxuda7qDzDlnSsXfjCSnFGaoQ7drnHgjs0brwQXwQsRDxi5+i
 YAfCtdgHa4Y4+gQBTUkqrlaA8UvhqkgwvMlQXuVVl/ylAG5x43VI8Ts31WwcwNs=
X-Google-Smtp-Source: AGHT+IE0lS5EVP85zbQOu9Zd/8WPrT1e3xdabxvHpR4GpZltvn8ikbAWq7mtZIBjZ3b4ioraJ1wksQ==
X-Received: by 2002:adf:f786:0:b0:337:c6a4:5e5a with SMTP id
 q6-20020adff786000000b00337c6a45e5amr3161464wrp.57.1706478728727; 
 Sun, 28 Jan 2024 13:52:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 by14-20020a056000098e00b00337d5aa55cdsm2349485wrb.53.2024.01.28.13.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 13:52:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 22:52:05 +0100
Message-ID: <20240128215205.3690716-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706478729; x=1707083529; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swbJqCVIvnC3RofWSMF5dNqRuf1lpYygy8OdtxeFqmY=;
 b=bTq3ko0CFTkqydkNxHOXrp1jCh7oa3b1OQtvT3nxlJG2ZqROT+gIp8LGW9nABzIMaj
 NKO3sNwaxr4my2h3OFJ+XakQKP8QgGzK6sqvfsylaL5Gtnh066QtDfuuzNCUSi1FNRfV
 aO/wYQ8FjzVAvLPnn3LgS5V+2UowtYAshuxavgKpN7C2IK0mkKOmqlzMJDDdICdwOwrk
 NuuBLUedC0ARWx+xexEvwuAOC5Ko1jEJ+3X1WWBBlGerfN/8J/6oiEi8ZxAycEo6TCAJ
 guAxXJFEUTNYs1RtwRSmPthK6DGJPT9rDFyR7YJ/MQDzZLnCWR+cq+IKXSAp/eKbXP0z
 ZjGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bTq3ko0C
Subject: [Buildroot] [PATCH 1/1] package/frr: drop libnl dependency
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libnl is not needed to build frr since the addition of the package in
commit 26d82d006ba15777d19892b327bde343d82a9ff5

No mention of libnl found in https://github.com/FRRouting/frr or
https://docs.frrouting.org/projects/dev-guide/en/latest/building.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/Config.in | 1 -
 package/frr/frr.mk    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index c2e9577a27..f6c058e6df 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_FRR
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_LIBYANG
-	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_JSON_C
 	help
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index abae784c40..1e1a6b2e69 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -12,7 +12,7 @@ FRR_CPE_ID_VENDOR = linuxfoundation
 FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
-FRR_DEPENDENCIES = host-frr readline json-c libyang libnl \
+FRR_DEPENDENCIES = host-frr readline json-c libyang \
 	$(if $(BR2_PACKAGE_C_ARES),c-ares)
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
