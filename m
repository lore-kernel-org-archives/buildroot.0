Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB51C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2BF1404F8;
	Mon,  2 Jan 2023 12:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2BF1404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hg6asW8sswuE; Mon,  2 Jan 2023 12:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCE5A40499;
	Mon,  2 Jan 2023 12:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCE5A40499
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5000D1BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3875981349
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3875981349
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUQifzYh8VKn for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:21:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA8EA8109A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA8EA8109A
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:21:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so15071738wmk.4
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vCFunRmC/kP1mwkaUM08RwtvEFpzmJK1eJL3YvycUEw=;
 b=iSDkew/G4Fya7IAnJZ1lj7L0rPdXsYYyFCsgzAQ0zsrirlZbgraiMOdVVk3ZW7wnn+
 /Wr3mbhCpf6MSxCxMbR7zM+Bd4aceUzrkuXYgXmD4+5WMYpYo05d3oUl7fuaNIDURpmJ
 plWHfR5HHbYGYWQZ6IaaxR65Vmn8++VtAumRltDJejufKlMkeeTjynWeHRQB8P4Xue/j
 2ghsPWkZiazPkvl1SQiQ6fijg891bIzHoKwz08pghszwTt/MMGv+PKl/DTRbmR7UopIx
 B0SgfIrvPlFJZtU7WMhiPuPPaoqBEm2i90/0Xe7jot+3tTIgddgqCPoM0FuXSfk321d9
 L8eQ==
X-Gm-Message-State: AFqh2kp320JOf50iD29n0Xyyrd3Zq1jj8/EAw+86zRUWGhbX+Ve/tqj0
 llEJohcBngl1XFjQJpEF7mWkoik54xg=
X-Google-Smtp-Source: AMrXdXsuQ06/NiFi76rzIYMeKlQLlIs+kTrsUTQIPyNCTqwpH00g1nfvYk4QLUIXd8EhUooyzznqIA==
X-Received: by 2002:a05:600c:4d94:b0:3d5:3ab1:d630 with SMTP id
 v20-20020a05600c4d9400b003d53ab1d630mr28605292wmp.8.1672662068580; 
 Mon, 02 Jan 2023 04:21:08 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a05600c46d000b003d1f3e9df3csm47847011wmo.7.2023.01.02.04.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:21:08 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:21:00 +0100
Message-Id: <20230102122101.1912214-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vCFunRmC/kP1mwkaUM08RwtvEFpzmJK1eJL3YvycUEw=;
 b=D2nx46SfmJJ/HpdTzb4hgmE4w9OdaXjohO6MyATiHVgD2H+s7Pv2mXjXqsevufptP1
 38MSQTmwwpl3Nrxw0nVdE/dNUfnpHzd1T0ms5kPgS5EK1e05zav4xqMF17pCmS8u8G8s
 cTsETlstbX7LjoG1DT+pvqZ5n2/JhCryOah409RYKFNkkWjJw51km7Ny3xgq4rHhgE/7
 gRwDIam7ihic0pisnlZ+/bbaRc3e94K5EuEluuznWFUHxVk5ttXKISlS08DQ2AvUx+l6
 L8c7UuW3jHC06trYrU+Ik10qjliGvZ6zG399e610PEB5hRjl+K4XVoQ50/wROIJS0p3a
 CfMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D2nx46Sf
Subject: [Buildroot] [PATCH] package/ethtool: bump to version 6.1
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
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 8a649876d..609085aa5 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  3b752a3329827907ac3812f2831dfecf51c8c41c55d2d69cfb9c53ca06449fc6  ethtool-5.19.tar.xz
+sha256  c41fc881ffa5a40432d2dd829eb44c64a49dee482e716baacf9262c64daa8f90  ethtool-6.1.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 32bd5e7db..3381344e0 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.19
+ETHTOOL_VERSION = 6.1
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
