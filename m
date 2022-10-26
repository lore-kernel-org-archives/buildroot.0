Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D38EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 20:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72233405F8;
	Wed, 26 Oct 2022 20:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72233405F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojJ32RAj0EZe; Wed, 26 Oct 2022 20:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BB2640524;
	Wed, 26 Oct 2022 20:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BB2640524
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCF8D1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8D3060DA5
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D3060DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HC0KFHVbFfrH for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 20:39:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D77260D9D
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D77260D9D
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 20:39:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a14so25656190wru.5
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTaEN3WJeXxIKE6Ug93uCikFC51g2Zt8ih4zxMgquMU=;
 b=IqJUNomcfdYEajjLeMpEZVZAOz4neiWrzV5FqNf1AdhdhpKybi+/1DSVzoCEAGSKWK
 I4/K+2xIF2+UjV+p+u5rXCMKNjCIlSEbcskkQA0picGPH/n1hJPL320TF2pHQEzKXN7V
 WKiPQupv89RXqnl9G9mQGMfsmlRw4qZubCgZdq2z8y0SpCoGh0GFx1+PWOs1pB0KpxKJ
 8tx6NxDDDSZuGn6Lhyo3Yy3ihlzWS5N77KR7XC2gUhGYAaauK8oXSwh3tKLIHzUGATdc
 pYw6uRY1wjvd7D1rK/APt6APaa5Nae+J+4sqTwhYyLnFj2nbWpCHceGFZ3Xn8q7Lrci3
 FBrA==
X-Gm-Message-State: ACrzQf0o6qfzNA6vSS8HrgUk0V+/LB9fKItRp3sl3eWGjeHQrOdHHYDm
 JvMZpdR5rtF777FVup2bjV/uh4SkgBM=
X-Google-Smtp-Source: AMsMyM6TDJg8VB0Hsmn+LykF6K/Hzue9Ork66TrkUpSKJqQcCZZ5znWgAU4aaauvafg0jnMg03awNw==
X-Received: by 2002:adf:ff89:0:b0:236:67c3:2d72 with SMTP id
 j9-20020adfff89000000b0023667c32d72mr14907967wrr.0.1666816784387; 
 Wed, 26 Oct 2022 13:39:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 24-20020a05600c021800b003c6c2ff7f25sm2648011wmi.15.2022.10.26.13.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:39:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 22:39:41 +0200
Message-Id: <20221026203941.555393-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nTaEN3WJeXxIKE6Ug93uCikFC51g2Zt8ih4zxMgquMU=;
 b=eLNsybLMvnpFzT9nNro1p+ePiIncdO7HwvdBKjrKFOx/g+3QL6MwW9X6+S38zkqXjx
 HzvOZDwrHBIMVDW3GmkcjJkKH/0Qp4uSKV6jIORBGD0v4C2CWH2P284hQYWJzWpuN0D8
 Z0LtqtVEIgsMs2tyGwcyWibE/lh2mg5ag3Lm00TZRRAaAO0bqS/WWsOdByZTCaJkk4hB
 ORQal9Z3lJ4A/JvBHijQPDF/G4tzcHlKQXTfwc9CiS+5SZXYdQpfAW5zl2Eq0qQ9JFKb
 Q0eiKqBk3D54N/Ty2D+Chg3O/D4XGQd60bxAc3wByORG90uUG2D+I3XmmY/nlTkOg2ag
 S5qQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eLNsybLM
Subject: [Buildroot] [PATCH 1/1] package/iperf: fix build without threads
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since bump to
version 2.1.8 in commit ede944f53509f825aa983de19d34fc30259b812c:

Settings.cpp: In function 'void Settings_Interpret(char, const char*, thread_Settings*)':
Settings.cpp:1281:9: error: break statement not within loop or switch
 1281 |         break;
      |         ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2bcddf8439f6913fdf19b1fc2d33999a787ab3b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...fix-single-threaded-compile-breakage.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/iperf/0001-fix-single-threaded-compile-breakage.patch

diff --git a/package/iperf/0001-fix-single-threaded-compile-breakage.patch b/package/iperf/0001-fix-single-threaded-compile-breakage.patch
new file mode 100644
index 0000000000..85baf76ea4
--- /dev/null
+++ b/package/iperf/0001-fix-single-threaded-compile-breakage.patch
@@ -0,0 +1,32 @@
+From 6405b7a005bb2364466b56f480d50af0be423d76 Mon Sep 17 00:00:00 2001
+From: Robert McMahon <rjmcmahon@rjmcmahon.com>
+Date: Tue, 27 Sep 2022 20:31:04 -0700
+Subject: [PATCH] fix single threaded compile breakage
+
+[Retrieved (and backported) from:
+https://sourceforge.net/p/iperf2/code/ci/6405b7a005bb2364466b56f480d50af0be423d76]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/version.h | 2 +-
+ src/Settings.cpp  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Settings.cpp b/src/Settings.cpp
+index aac1b5f..fc5a181 100644
+--- a/src/Settings.cpp
++++ b/src/Settings.cpp
+@@ -1160,10 +1160,10 @@ void Settings_Interpret (char option, const char *optarg, struct thread_Settings
+ 			delete [] tmp;
+ 		    }
+ 		}
++	    }
+ #else
+ 		fprintf(stderr, "bounceback-congest option requires a platform that supports threads\n");
+ #endif
+-	    }
+ 	}
+ 	if (bouncebackdelaystart) {
+ 	    bouncebackdelaystart = 0;
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
