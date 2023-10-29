Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A142C4167D
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 18:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D51C6706EB;
	Sun, 29 Oct 2023 18:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D51C6706EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKwi3gfMj8sS; Sun, 29 Oct 2023 18:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC7C70665;
	Sun, 29 Oct 2023 18:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DC7C70665
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 745F51BF308
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D01770665
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D01770665
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yM77ZHUk0ayk for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 18:05:17 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE2D36FBF1
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 18:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2D36FBF1
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so27666335e9.0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 11:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698602714; x=1699207514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OG/On2aDlEULP1qds1c3d62sA7IYncF3G8FGRgh2Oyc=;
 b=qiSO5rsl2Lk9ARIyMvtIdWJAdD7gR+JwZFNDNwFzYtgwxrytZjBKfogEcPkzCSXFUv
 UtiAYIDbrLYMb0bDOQk+DK9/VRG66H5fONFSihOQT7WAzKGKvwVN1u7KkmVb41iuBV5d
 GUxfGdJiOb/W2ecpmJBqlFdAOYmnlfGaZ+05f/PfjCizh/w+Hxv6jb0HoXq80wXgkez5
 vsQmyN8uIq/BXwMkxm01sZvM6i0wVTGAmAyklH/D+y34btQ8Nh138dBt0/yMI+HRYTEp
 0RScp9Z8WqrngRS0nA5qwvtY9tMaRm+rfjvmoAgEQNwscOimsKoNervMoLOd6hwF4m5W
 szkQ==
X-Gm-Message-State: AOJu0YwJYd6/Niom6siL8k4Bg7uIsDp6Ntihtuix24hGgMCalPD0dk31
 nm6Etqg4e+7LD0bms7VuUWq0NM9ihk4=
X-Google-Smtp-Source: AGHT+IGSufMXSvNXozX9yETALFTdGRHpkq9CbbfW1sFzgUpXBvijMEY/6331UDERAiVfLo9R46PeiQ==
X-Received: by 2002:a05:600c:1546:b0:3fe:4cbc:c345 with SMTP id
 f6-20020a05600c154600b003fe4cbcc345mr6744555wmg.41.1698602714104; 
 Sun, 29 Oct 2023 11:05:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m2-20020a5d56c2000000b003233b554e6esm6425610wrw.85.2023.10.29.11.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 11:05:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 19:05:09 +0100
Message-ID: <20231029180509.283133-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698602714; x=1699207514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OG/On2aDlEULP1qds1c3d62sA7IYncF3G8FGRgh2Oyc=;
 b=f4V8AST4PB3nYltdcV9VNgQIyRS4KVsHGUVRK3+3ZEHPiTtRSWZwHbmLjnsnA9HY3z
 fmZZxGnjlJGNIIaAHIqmB8e05NjbmSpXyiHGqgNvfb/pYZnRkKeARWNK04eIq76ueyd+
 nZo5gWs8gxH0ca6xI7xs0pLGmIU7OOfV0y794ezgYBjLYutm4sgih1/of7+tGMtCOnHr
 GYOnKcUMQyZPWYFWk6+kgGdeZ4GS0koCi5KkWcAmfKnCDLXjoXbrwMu34mbGFza6Dq+5
 fCWWG23x2z/QI4JHy9IP1eQwIfXOmwCxUyFxC/PLSd0n1y1Snj/5mD2GFMrrbPAGkKIF
 e4EQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f4V8AST4
Subject: [Buildroot] [PATCH 1/1] package/atop: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with musl raised since bump to version
2.9.0 in commit 8c70374c4f0f9f77875eac26a5e51ab662575c1c:

atop.h:157:1: error: unknown type name 'time_t'
  157 | time_t          normalize_epoch(time_t, long);
      | ^~~~~~
atop.h:157:1: note: 'time_t' is defined in header '<time.h>'; did you forget to '#include <time.h>'?
atop.h:157:40: error: expected ')' before 'long'
  157 | time_t          normalize_epoch(time_t, long);
      |                                        ^~~~~
      |                                        )

Fixes:
 - http://autobuild.buildroot.org/results/e7ec8d16f2299320f374a0198c8e9b18a102b037

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atop/0001-atop.h-include-time.h.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/atop/0001-atop.h-include-time.h.patch

diff --git a/package/atop/0001-atop.h-include-time.h.patch b/package/atop/0001-atop.h-include-time.h.patch
new file mode 100644
index 0000000000..2b8a390e71
--- /dev/null
+++ b/package/atop/0001-atop.h-include-time.h.patch
@@ -0,0 +1,41 @@
+From 03c5c4dd29bc7590baccb55a36d61e7f4b39c1fe Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 29 Oct 2023 18:56:35 +0100
+Subject: [PATCH] atop.h: include time.h
+
+Include time.h to avoid the following build failure with musl:
+
+atop.h:157:1: error: unknown type name 'time_t'
+  157 | time_t          normalize_epoch(time_t, long);
+      | ^~~~~~
+atop.h:157:1: note: 'time_t' is defined in header '<time.h>'; did you forget to '#include <time.h>'?
+atop.h:157:40: error: expected ')' before 'long'
+  157 | time_t          normalize_epoch(time_t, long);
+      |                                        ^~~~~
+      |                                        )
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e7ec8d16f2299320f374a0198c8e9b18a102b037
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/Atoptool/atop/pull/280
+---
+ atop.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/atop.h b/atop.h
+index 9274fc5..3d5fea4 100644
+--- a/atop.h
++++ b/atop.h
+@@ -24,6 +24,8 @@
+ #ifndef __ATOP__
+ #define __ATOP__
+ 
++#include <time.h>
++
+ #define	EQ		0
+ #define SECONDSINDAY	86400
+ #define RAWNAMESZ	256
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
