Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F12C4167B
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 17:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29440817B0;
	Fri, 30 Dec 2022 17:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29440817B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5T8zz2bQbflq; Fri, 30 Dec 2022 17:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 690BD81990;
	Fri, 30 Dec 2022 17:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 690BD81990
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8531BF3BC
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 17:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB1D3405C4
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 17:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB1D3405C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C8TupRH1mqVz for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 17:46:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8517405C0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8517405C0
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 17:46:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso15608571wmp.3
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 09:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xh9VXO7VFpYurUVKsdO0nia3eUJ5CzXQFA9TYJfVYCw=;
 b=Rz8p3fmKvDhHjh2r2Gui+JKAFqLv1Jv0Qc4iM8y1hxsduEGu/e/JQaaydkPtECJjlL
 fni49rAOC8Gn33pl7v4W1mK2a8r6CEJQ6aufF4NcLSy6MbC3N3JubD2OzEJMiCbUynHN
 p9cj7jE+6+5UgblYMkpGUY3+12zAebFO2kiIKEPL5QKpKyCNIjdrq0bBNEZuzBzEDMlZ
 174i8wRoUAS0+N80oZSkdoRwWmoImP8MHFzkxnn/g6Vyiig0nbA9iubtJ0ztQgl6endw
 UfF0FCLK/I2AjUVPcBnjLJFTJklP84u1075T4RY/LfzPmZqOGXOWcyyoSOWCccm+pIYI
 od5Q==
X-Gm-Message-State: AFqh2koj0onmvaLnrnM10kFks5r3WFk++iZTW81mpKjaKHGR31r5MFkw
 V1uGJ1l/hbXdZgSJ2KNoV5fbmk1rU8w=
X-Google-Smtp-Source: AMrXdXtkHVdXNp+ufyN0qU7ls8UOlGzk1VCKHF8aiM+dH815C//u5JUqf+UiW0ixnlT3CxLaiLQSBw==
X-Received: by 2002:a05:600c:4f48:b0:3d6:8570:1239 with SMTP id
 m8-20020a05600c4f4800b003d685701239mr29319700wmq.16.1672422411551; 
 Fri, 30 Dec 2022 09:46:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m16-20020adffe50000000b00241bd7a7165sm23727044wrs.82.2022.12.30.09.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 09:46:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 18:46:46 +0100
Message-Id: <20221230174646.409970-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xh9VXO7VFpYurUVKsdO0nia3eUJ5CzXQFA9TYJfVYCw=;
 b=o3hdpxdJyL+AJYbZXping50FkR9uNT1qUAFEmfsEW93Ak4YreHPZMCGXMuZ6Otgdx5
 TzdPU/VeQykJls0GcRC79DPl5lLItKFl31PocQwZ+JU4UfjRvggf5SLp+6OOzJ79V0dd
 egRWiJq0ifup4rcjMIfHBoUzUGTjRzR6jkp+H6A36we99fw1a4OiJbhJwoSuXGO5cuCa
 xdzJ+mbLf2yaVuICWRJb8GjIXXGW3YqnenSAC8sh0uQIqOzNygrxI+Jo2PAe/gz1SFAu
 K4omWZQj2uWbaFoUhspaC2CgLfNBgj/4XtfZqv8TNaPgtaNlCd4bUwcqF8xKeq6b7FhG
 x/Ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o3hdpxdJ
Subject: [Buildroot] [PATCH 1/1] package/crun: fix static build
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

Fix the following static build failure raised since bump to version
1.7.2 in commit 6987b92da510a8c8b9534a22506850c163d0f035 and
https://github.com/containers/crun/commit/5837234e9840cd067edd9f6cd2ed9cae9a0e6570:

src/crun.c:26:10: fatal error: dlfcn.h: No such file or directory
   26 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a5f52a7ee757c92c9571261c0ed884d05caeaf2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...src-crun.c-fix-build-without-dlfcn.h.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch

diff --git a/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch b/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
new file mode 100644
index 0000000000..3e8d3f4c4b
--- /dev/null
+++ b/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
@@ -0,0 +1,39 @@
+From 278b9b447bec3fb81bf252eb2fe2c856892ec802 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 30 Dec 2022 18:40:15 +0100
+Subject: [PATCH] src/crun.c: fix build without dlfcn.h
+
+Fix the following build failure without dlfcn.h raised since version 1.7
+and
+https://github.com/containers/crun/commit/5837234e9840cd067edd9f6cd2ed9cae9a0e6570:
+
+src/crun.c:26:10: fatal error: dlfcn.h: No such file or directory
+   26 | #include <dlfcn.h>
+      |          ^~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a5f52a7ee757c92c9571261c0ed884d05caeaf2f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/containers/crun/pull/1110]
+---
+ src/crun.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/crun.c b/src/crun.c
+index cbfe900..af0cc97 100644
+--- a/src/crun.c
++++ b/src/crun.c
+@@ -23,7 +23,9 @@
+ #include <string.h>
+ #include <libgen.h>
+ 
++#ifdef HAVE_DLOPEN
+ #include <dlfcn.h>
++#endif
+ 
+ #include "crun.h"
+ #include "libcrun/utils.h"
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
