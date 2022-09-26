Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57CAC07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 10:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 825EA40B4D;
	Mon, 26 Sep 2022 10:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 825EA40B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LPHmmK4IKiTj; Mon, 26 Sep 2022 10:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82FFB408EF;
	Mon, 26 Sep 2022 10:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82FFB408EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AAC21BF3EC
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D6E60F69
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 10:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55D6E60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GyfMOctdNZgB for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 10:27:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48B8260F74
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48B8260F74
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 10:27:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so7961547wmb.0
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 03:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=H7ACIX9NN+CgBTatIPOQsd8SfZ5sDi6SFXHvmaLRMNY=;
 b=2FtWDPrU/LE6E59ZKuD+Ft07CtGdIosHNFhzSCBSRK1DbLs3tWCzsihl8BvCko6Z45
 7xnvnLZLrJMle8IHhZTs3M+xlaQ8k7hul6I9tVaoXwSMwsoNaWbq3A97jC/E9IpiC11o
 t8/sqba87gMKkhZ9YybQL9ezdU2mQWB81SKaoY0eJIliE2RGdpeIHwvMrwShTjat/XNt
 jDGfPjIRoFZe/EUN+3f94cJUwIf7UgGcANBzX0ykjDgTCiPWzcIP2/erEvH7xC+9J/E9
 R29tSimkyBe3bLyc/X6+Av/8rxljBxYn82gK03mZIiSrEhPeXe/WfLpqhxoXMgtU+8xM
 8ZcQ==
X-Gm-Message-State: ACrzQf3hrhRlKF1k536f8w0JcDe1ZwzaMYJRQtEPDYJh/ZPZ52weE5vg
 W48GrEVHERAxncGDB2nVeQ3gBL8e3JhG0w==
X-Google-Smtp-Source: AMsMyM4+VDGwq7OJceuYquWvnk5vahC57sDzFKwZcUb152/sgBxxQ9hbXvSkgSOg6NNWQrIHECn6Ng==
X-Received: by 2002:a05:600c:3591:b0:3b4:bf48:9f10 with SMTP id
 p17-20020a05600c359100b003b4bf489f10mr22494753wmq.76.1664188041388; 
 Mon, 26 Sep 2022 03:27:21 -0700 (PDT)
Received: from localhost.localdomain
 (amontsouris-559-1-16-245.w90-24.abo.wanadoo.fr. [90.24.143.245])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adffccc000000b0022afddab5dfsm14413568wrs.7.2022.09.26.03.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 03:27:21 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 12:27:07 +0200
Message-Id: <20220926102707.1993827-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=H7ACIX9NN+CgBTatIPOQsd8SfZ5sDi6SFXHvmaLRMNY=;
 b=E+TODbTqUIxPwDwi3DoT+DQu/N9HnfCVwgInlOniERgSLEDSnz7s4g+mv36u3hHOLN
 RjWeI1pWRnzHhBGA4P3P5mcMnPl2H5pGu7yfljACUQT9v2fOoRj9trNU2UvraVFt/IoT
 4T7i5Y90Fkfu6U49QMjyJlzz2kIaXP7IeJcMVENROPtV2/OVmnRj0jBJ7+TGPbotfae3
 quUc6/e27xh4HzV31hkqZgLGGyiLo4r4MrZFxbg2t+TBfCXNlVTKX49KWVYC03T3CufU
 Z+B55XSoJpuXrBO8Te4uHl937SvnJ4o751dVb6/RXyXEZp4MyJtxLMdozel0yDhMs9si
 BDsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=E+TODbTq
Subject: [Buildroot] [PATCH 1/1] package/waf: Bump to v2.0.24
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 21f47f76d8..c8d464ebfb 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  89b24f9c19328339c2c8103796755474b66f3a8d  waf-2.0.23
-sha256  28a2e4583314a162cfcbffefb8a9202c1d7869040d30b5852da479b76d9c0491  waf-2.0.23
+sha1  9cc6db88ecda57067024f368722ecbf48a3bba1a  waf-2.0.24
+sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf-2.0.24
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  28a2e4583314a162cfcbffefb8a9202c1d7869040d30b5852da479b76d9c0491  waf
+sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 2b1808ace4..d98ab489ca 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.23
+WAF_VERSION = 2.0.24
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
