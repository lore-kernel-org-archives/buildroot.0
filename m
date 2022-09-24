Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B70CC32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 20:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29B2E60A74;
	Sat, 24 Sep 2022 20:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29B2E60A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6mvd92O-reg; Sat, 24 Sep 2022 20:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35481607BC;
	Sat, 24 Sep 2022 20:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35481607BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97DD91BF28D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7363E40136
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7363E40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvlgKdJJCJKL for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 20:56:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2228F40123
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2228F40123
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 20:56:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so6618204wmb.0
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 13:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=keOiQLcoNX3rKECLs/QspKY+lwQO7ZyFch8qTMfqHMw=;
 b=x/BebatAxmjHVDLoTCt5JZwwQWJsGBpDdKzoY/aWBSmEFJkziqIVgPSbTmcvL6qt83
 PyCVT1IpDrFCNjHvKM144iUG1GWgSDwJ1ejQ7ADs4CN82SYSiDI7GVuS13bZSl1hNwZx
 4Q6LAW8PSL65rk4JV/o7wSzt0DnoLbxhDdiTJ+6r7SlSFtKDJc2XWdSh9xCrE2qWYgow
 9EMuMaACYoR+N4PG5Az95xnu1QFwya8OBdpDW3bg5DFcSgaVp0gIa7VdXDHtZyoi/SJH
 eOE6f78BLJYf0aRUaILHkd2lhwM+n4rTjOloI1aunmVTmQxIKXFEB+rR3msonK/8zxiM
 pzkQ==
X-Gm-Message-State: ACrzQf2RJf8lR95W7xFIgiPf2ARI/dGgJT2q08kShV4bdP7eZ+ZSWdC/
 6J5ylk5KtcU21iJoSmH3PYkHSUygTUM=
X-Google-Smtp-Source: AMsMyM7XpzgDN8IAZV9UnTxuVU/vIR+tOx6XrhXN4k6nLorCiCstDP9MRP0xUqmnsJ6sS0cyFavTTQ==
X-Received: by 2002:a05:600c:3d86:b0:3b4:b65f:a393 with SMTP id
 bi6-20020a05600c3d8600b003b4b65fa393mr10277887wmb.0.1664052985901; 
 Sat, 24 Sep 2022 13:56:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j16-20020adfea50000000b00228dbf15072sm10586151wrn.62.2022.09.24.13.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 13:56:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 22:56:22 +0200
Message-Id: <20220924205622.22049-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=keOiQLcoNX3rKECLs/QspKY+lwQO7ZyFch8qTMfqHMw=;
 b=LxwQwaBEv+u9FTWeUYh+jlhQIVc/I5uKYmMxwQhDb2ac6wPfYS7dxK7CDXFiCU5DRH
 Vn9d59kObjtQ3Qlja/VRQb6Tp1wAi58JE62fh6cocWhT0v5J5orCOPFeEwlxLHYXCCLs
 oZM5U4XoKFR3Lig7dyQ8BBZUUB98gqHyHfqdSifX+AWK/DW6RzK04f9bZEAbfYBlSwU7
 EPc+vUabiy4Z29w/P7/DZyV43hveW05g+gfHm6gqJnE2OIswXFFs1Sh6fV+Q/XFZIdeA
 WiIJxWAz8zzs6kAmBThzcOO8TYusAMG6tKbQchByvG0qxrI3YbJXCKGD7qm9MoJk20dh
 1vuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LxwQwaBE
Subject: [Buildroot] [PATCH 1/1] package/crun: add CRUN_CPE_ID_VENDOR
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

cpe:2.3:a:crun_project:crun is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acrun_project%3Acrun

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crun/crun.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index c92e6e5605..4a0c150594 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -10,6 +10,7 @@ CRUN_DEPENDENCIES = host-pkgconf yajl
 
 CRUN_LICENSE = GPL-2.0+ (crun binary), LGPL-2.1+ (libcrun)
 CRUN_LICENSE_FILES = COPYING COPYING.libcrun
+CRUN_CPE_ID_VENDOR = crun_project
 
 CRUN_AUTORECONF = YES
 CRUN_CONF_OPTS = --disable-embedded-yajl
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
