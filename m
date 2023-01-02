Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0FDC46467
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F7140935;
	Mon,  2 Jan 2023 12:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F7140935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CR9jaRBY6uff; Mon,  2 Jan 2023 12:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47C741554;
	Mon,  2 Jan 2023 12:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B47C741554
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14A051BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E46D481349
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E46D481349
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hX1ppXVRBeln for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:21:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD2D0813D7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD2D0813D7
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:21:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so20446213wms.4
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jXgRxJQkN5AMBEt/6FuC5w5yGVSmZjL3cE6TbtM6Pc4=;
 b=5Dwrv08HRn5yY/+YYB/gA7wLgcs+DQL+0X2fkbwzmonXE3BiGAhct92gbeFeLD2YiX
 mfEcC20GOL/q4tjvkVVu6psrlnpuA4jL2IGsm6VrSeq0eHccBviMParbepDb4e8IRXWf
 iA2VeXVlRYizcdROnWe5hq7HJeWo862K3gKC0EQo4UAc/36X+Sk1QvL6e7YS8GipzRdt
 f8qi7sf1LvxzTc5t6ZIdPLP+le17xcqAuonIY7SVPLAfecOml2KfuxHoGtXc48OtGMMp
 quIzpgbnrQkccVAuSSt/47BQQ0X8YhY791IscwFLHq1ldtAGLIfrrZYr7NEcOO9q0tCV
 Dw8g==
X-Gm-Message-State: AFqh2kpxiFHuhFKOpClYsfnD/iFRtQTTab0+0WxDKJ7vjby2Fsz1p5jw
 VZwaTJoD88JU2ouhayHWJCD/WdbPosI=
X-Google-Smtp-Source: AMrXdXuO/5NtTRTyseY16M6KF+5s87p7hA3LLubFFveTlK3qb8IDAzLVGQFKVFXwvM6X1Q5ZWyFWnA==
X-Received: by 2002:a05:600c:3b82:b0:3cf:900c:de6b with SMTP id
 n2-20020a05600c3b8200b003cf900cde6bmr28811041wms.15.1672662108186; 
 Mon, 02 Jan 2023 04:21:48 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a1c4b16000000b003d01b84e9b2sm38352684wma.27.2023.01.02.04.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:21:47 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:21:44 +0100
Message-Id: <20230102122144.1912299-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jXgRxJQkN5AMBEt/6FuC5w5yGVSmZjL3cE6TbtM6Pc4=;
 b=Na2h+8A66gn3F+cuq4uMEFwmkqGHu0CvGtscE6/YGn1qt0zlE7fxWbq2EVii4gHacA
 jw9RXXqd44nTRkV9QdUjqkbQ+sRVTWZXJWW5sk6MdiEPY3peXo1oc549VqeMqlUJIytC
 eiicHwCAZGUqu+06FrmXlZHTI5LOglsJbTvfOYxNNbZgeeg/iH1HdnIQPWpovRRGlHlW
 cknPmsW3PtAO40bdo4Jy6ne1Uhi1DdCuFdATetNe7ftiSkizvJeMVBZS9fESbhtJFezw
 gzwQWCfqFwyz3klm9Ta8ACDDmH6SLC67ViFEXAZdyBGXD/OLgnQldfgTHVmgDhzqYl/s
 v24A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Na2h+8A6
Subject: [Buildroot] [PATCH] package/nano: bump to version 7.1
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
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 86f414aca..f49b71209 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v7/nano-7.0.tar.xz.asc
+# https://www.nano-editor.org/dist/v7/nano-7.1.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  8dd6eac38b2b8786d82681f0e1afd84f6b75210d17391b6443c437e451552149  nano-7.0.tar.xz
+sha256  57ba751e9b7519f0f6ddee505202e387c75dde440c1f7aa1b9310cc381406836  nano-7.1.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index f9338550d..203c417f0 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 7
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).1
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
