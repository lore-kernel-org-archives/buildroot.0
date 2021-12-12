Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0B2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 19:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 857A042987;
	Sun, 12 Dec 2021 19:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AngzjnLTBnMh; Sun, 12 Dec 2021 19:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC7642981;
	Sun, 12 Dec 2021 19:11:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5E71BF300
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 19:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3862D4032E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 19:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULRCP92wjKmh for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 19:11:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13A124013C
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 19:11:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v11so23659961wrw.10
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 11:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GXtGDJ/gG+N4E6fMBmDH5k+JUIbKLzFb5bHCHZFM9rM=;
 b=C5Vw+ASLy/dusaQ4PHd1JvEbNyIxsqkMTaVgBxjCMbzz5xhrHu1b6qL+nq0TBOZVyW
 mOA6EOsS01ICd037T8rRik68AI9+vJBqdpukb9/AWNeJ8tfzkJ4f+fbTP/heZUGb+iL5
 1eAyuDuZbEYNbu3mWSoWLfMVMPScNoZ+EM4HC9ITobdadVQZIdlj5sLHXgmRmqDYanN4
 brJHeMbUATHm2iHU/60hDmsveywpe8kUwCdDDf6O1LpjK8B1JW4JCYcp8LILp+yS8nSy
 THwymaKRx9wy4S/ryjvkJvjWwgCDCShoTJogXYWKvbrTDSEh9/joXpD/9U1IqDOXiKNX
 22fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GXtGDJ/gG+N4E6fMBmDH5k+JUIbKLzFb5bHCHZFM9rM=;
 b=HVJvPVHFcJ6PLm5eUKNGFvL1ocNqxJOtOVEftBSGfoCBq+curelOCNgzI0AZ2bpAwc
 ojdqBFQxlAgzid4qgGYgpoCbBKWqdjWP8QQ5rilLHw1ylRflng38qKIzRwp2NfTvwmyh
 54vyfBP0En4Xb11I1g/d2CxrDectyx7DPsQ0SriawjrTAtm79qJIDlFMjLDJ4UFF67iZ
 n+jv/WOTq2duPrw2/L6eUUMU/1SWgbdS8cHmToKDgXejhh9Wj3XE85m6WXqIlxdzNTWK
 JsnQ7Q+F3EQydAfn5eNj2bD4wFFZQIe6Fc4YIjPtLOhx0gGK1BPnGwUE7dPZ8k5f+BaF
 WWZQ==
X-Gm-Message-State: AOAM530CWSPegeX++FHM+WgFOWJql7Nyt5zCQ6kSKixIEoDUNs+3IGgO
 iyIhxm+ix/roGWQxYoqwElzM3phqzg+7Ew==
X-Google-Smtp-Source: ABdhPJyme6vY3t3OJqZLZdttxx5rOtMuP7aRexYSM/6Oq3kjkAWHsxk69fiKrwXp8lRNxOCLKOMl+w==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr26804198wrv.13.1639336275052; 
 Sun, 12 Dec 2021 11:11:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m21sm8333202wrb.2.2021.12.12.11.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 11:11:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 20:10:57 +0100
Message-Id: <20211212191057.701460-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iperf: fix build
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

Fix the following build failure raised since bump to version 2.1.5 in
commit ca39eb212e32ca209cb3d6011847f9c94641fa73:

gettcpinfo.c: In function 'gettcpinfo':
gettcpinfo.c:101:42: error: expected declaration or statement at end of input
  101 | inline void gettcpinfo (int sock, struct ReportStruct *sample) {
      |                                          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/073e070478f0cda34784af96bb3a802c3aac8f72

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-compat-gettcpinfo.c-fix-build.patch  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/iperf/0002-compat-gettcpinfo.c-fix-build.patch

diff --git a/package/iperf/0002-compat-gettcpinfo.c-fix-build.patch b/package/iperf/0002-compat-gettcpinfo.c-fix-build.patch
new file mode 100644
index 0000000000..786c7d1873
--- /dev/null
+++ b/package/iperf/0002-compat-gettcpinfo.c-fix-build.patch
@@ -0,0 +1,34 @@
+From a3339604bafa99f66e12687efc2c50d2e2df1276 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Dec 2021 20:03:04 +0100
+Subject: [PATCH] compat/gettcpinfo.c: fix build
+
+Fix the following build failure raised since commit
+c8f861a0a07b0606a581f2658c71959ad9417923:
+
+gettcpinfo.c: In function 'gettcpinfo':
+gettcpinfo.c:101:42: error: expected declaration or statement at end of input
+  101 | inline void gettcpinfo (int sock, struct ReportStruct *sample) {
+      |                                          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/073e070478f0cda34784af96bb3a802c3aac8f72
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ compat/gettcpinfo.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/compat/gettcpinfo.c b/compat/gettcpinfo.c
+index 4e11e2a..1d3791a 100644
+--- a/compat/gettcpinfo.c
++++ b/compat/gettcpinfo.c
+@@ -99,4 +99,5 @@ inline void gettcpinfo (SOCKET sock, struct ReportStruct *sample) {
+ };
+ #else
+ inline void gettcpinfo (int sock, struct ReportStruct *sample) {
++};
+ #endif
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
