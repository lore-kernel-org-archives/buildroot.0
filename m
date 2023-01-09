Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438A9C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 07:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD551410D4;
	Mon,  9 Jan 2023 07:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD551410D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmvA4H2kYKcZ; Mon,  9 Jan 2023 07:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9B95410D2;
	Mon,  9 Jan 2023 07:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B95410D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 393DB1BF487
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21F9560A65
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F9560A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVop3P-_bich for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 07:25:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62A1D60B20
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62A1D60B20
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 07:25:08 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id g2so4504947ila.4
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 23:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1p9qcD2Iw6U2U4ZfyLwxtznDexi12qJ1/sfIjSauGo=;
 b=TkvTy82PPG1OvYV9G4HKQq6CndyQQBSdzlAOwk1MpDrZSRrGvn+9v0wB11qgPb1dbR
 e+LanGHxFPwwE4t/4V+3MRuck+fn6IANX4mhfwN1RxUGMyKsiXn3ZGT5IQpmh5LYmPeQ
 R8u72pWKiECsx56jTIDq4NQSAlLrWN/+6a2t9NdAmWXSSdWyY0tgEF14PDZpTjwPkLR9
 ffewPDeIM6l20wLatf19i0Y0+4yWtSe7xS1meZJEpt+V8gcCYDBXb5vcdbZaA6UqV94Z
 ux9Y334l0ycIXM3K7JVtJ8Zom2yivvBUgmNd3Y/urlMbLVSTfy+MRZEKQNOdbyK5rlg3
 /COg==
X-Gm-Message-State: AFqh2ko3l9RHYfUmi9iZRtfLcU9zjRvxZl3cM+B0efeIPcRqz3YqB7/O
 AWwUbGLyp3pWf3LxlMCWHCnkw0/qjTpRRhiA
X-Google-Smtp-Source: AMrXdXv5nHYvIsWUySgqMXMtGlIRCFCeuRBnjsM12b16vQRhNR/mxMOJbrDmrIu4gzfescTcuumdRg==
X-Received: by 2002:a05:6e02:1ba9:b0:30b:fdb5:bd07 with SMTP id
 n9-20020a056e021ba900b0030bfdb5bd07mr44321003ili.1.1673249107363; 
 Sun, 08 Jan 2023 23:25:07 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 j2-20020a026302000000b0038a48cfededsm2564459jac.15.2023.01.08.23.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 23:25:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 00:25:05 -0700
Message-Id: <20230109072505.3196220-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q1p9qcD2Iw6U2U4ZfyLwxtznDexi12qJ1/sfIjSauGo=;
 b=ZMFjlX0EYhFl1dAK0kh8WTbGv0BYJ9/jndttQVfTDy+TiIklXuUFNyyge7lv5SkM8N
 HeKjZVzd6A/W7bGv9qLShpHwsWY1FMP/tvDqrk7IeH6VybU2W/vWqxcYAt6/c8lk02kI
 TNDg3g+5cCD5P0i5BrcgK1io8DBKDjeMcIINBONiryn0B2v5o+p/SFq4dzCnjA4UPqyv
 DLCnImoorSRS+p27B6Vtt2rqvhCqdyPj2eA79vwR67POWh+psMzPxo+sMVPVs8lumthG
 yyurafMBwwL/HzldkcyqueohNjLbbLB2Rip59ufHPU+GGYL4lcqQWaG8hBa/DtdKFzid
 Hv2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZMFjlX0E
Subject: [Buildroot] [PATCH 1/1] package/python-web2py: bump to version
 2.23.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index dbf85437f2..a853497768 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  d4a15fc15254d3fa9e9e9b5a726ae51a0989b7d740d53fd7c3d5b81ac6b8274e  python-web2py-2.22.5.tar.gz
+sha256  356f88b671e2bcdd9c89df526ee063ee9d6f4f57b60182ec2684adddcc426e99  python-web2py-2.23.0.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index b9a4e95609..4425b09d12 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.22.5
+PYTHON_WEB2PY_VERSION = 2.23.0
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
