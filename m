Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3CCC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:13:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BEB161078
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BEB161078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D23CE400D7;
	Thu,  5 Aug 2021 19:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMF1rBiR8Bwq; Thu,  5 Aug 2021 19:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D36064018D;
	Thu,  5 Aug 2021 19:12:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA0AE1BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C90E383B04
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yau2Gp1R5_X2 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:12:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3E8B83AF8
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:12:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso7074129wms.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emuhuQhdpyXTDEOwtn/fUcKf0Fw8zmMJL37ben7xg3Y=;
 b=Y36RvfMcf/0quInGk6QO6GBUw0sRoqqNk22azboDrNPeVLuDScsvSeJK1TNI8f70+d
 oQCbPQ3og4NgMY0lZveOb/UihUW5lEydLCOLlBl6zmbdvMvTdes50L04znGTpSceQf1x
 ZsWBiOESaE14poQ4cUUQuDmc+pxkKCZq4QS2cDdpzy5Z+BuwKNv63m3Iud1elcikFSho
 p3bhaROZPzRtVEEJSBPltJlfzoDr+5wMKRA2FHqT8Rjq0Am8fHrBWpsEmyTpkQr11I8+
 9P5cNfq/DOYQsSopQfI8qARVbxcA4/3teDeNLP3n19/SVHsZ2R/GXMGDNIWjlw/EnRKs
 8PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emuhuQhdpyXTDEOwtn/fUcKf0Fw8zmMJL37ben7xg3Y=;
 b=NZQLZXjw0i3Bke/wKY/cMuK4BFDee1KMgqiDxnNXuvSqhZwqRgah5duikxIv8CKCwe
 xsxazJbCZOvixwxmYX+6GOYMCljQ6VVtOOeFR/TLeP5UmQ0Qwtyc36R2EIpeV9EMIV05
 mjHLEouoYZjqcKfAR4DVs547TK+LzrGMsnPDymqgZVQ33tz/XNN0sFLv2SR96sYzj1fn
 1VAPwG8jvVCYk+9YO/DTkTXFUv1tMRFo7qz3kliuzdcqEKWRokO5rlIghqhzqtjdqG9Z
 5JTdPMV+/new3siuzWnQt3wvz1zUYmq/W51UNCXpvpl7eI7FYhyq9qNey34aZCSmP3+3
 PaKQ==
X-Gm-Message-State: AOAM532f5BOq8jaYoIwL2E8+di85xklwYjoTJlJvdWcYejY4flnb0GKy
 pNw/LeFZl8dnxf4Cfo0Ws5NkfIspnI0IBw==
X-Google-Smtp-Source: ABdhPJx4sa6WeuxTLIrNStZ1kihSAkF6XnzLfA6tZMS/3H7w8s0+Ew+1qY6s00ESJzaAtXSh7paPfw==
X-Received: by 2002:a05:600c:154b:: with SMTP id
 f11mr16725078wmg.116.1628190772722; 
 Thu, 05 Aug 2021 12:12:52 -0700 (PDT)
Received: from kali.home (pop.92-184-97-192.mobile.abo.orange.fr.
 [92.184.97.192])
 by smtp.gmail.com with ESMTPSA id i14sm3324649wmq.40.2021.08.05.12.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 12:12:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 21:12:47 +0200
Message-Id: <20210805191247.2664867-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 1/1] package/pistache: fix build with gcc 11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/async.h:10,
                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/client.h:9,
                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/client/client.cc:7:
/tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/typeid.h:26:12: error: expected type-specifier before 'size_t'
   26 |   operator size_t() const { return reinterpret_cast<size_t>(id_); }
      |            ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2443559df8c2357476e4cbdbebb08280cbb80a3b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Update patch after upstream review

 ...de-pistache-typeid.h-include-cstddef.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch

diff --git a/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch b/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
new file mode 100644
index 0000000000..be06ca760a
--- /dev/null
+++ b/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
@@ -0,0 +1,38 @@
+From 37291201ed948e9d65993a717c59bb14f4187e13 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 5 Aug 2021 19:02:56 +0200
+Subject: [PATCH] include/pistache/typeid.h: include cstddef
+
+Include cstddef to avoid the following build failure with gcc 11:
+
+In file included from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/async.h:10,
+                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/client.h:9,
+                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/client/client.cc:7:
+/tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/typeid.h:26:12: error: expected type-specifier before 'size_t'
+   26 |   operator size_t() const { return reinterpret_cast<size_t>(id_); }
+      |            ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2443559df8c2357476e4cbdbebb08280cbb80a3b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/pistacheio/pistache/pull/965]
+---
+ include/pistache/typeid.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/pistache/typeid.h b/include/pistache/typeid.h
+index 10353ca..893e7c1 100644
+--- a/include/pistache/typeid.h
++++ b/include/pistache/typeid.h
+@@ -7,6 +7,7 @@
+ 
+ #pragma once
+ 
++#include <cstddef>
+ #include <functional>
+ 
+ namespace Pistache
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
