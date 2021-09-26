Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED81C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 08:35:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ECEA60F11
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 08:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5ECEA60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F43C8195D;
	Sun, 26 Sep 2021 08:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMcsvoG-oDmg; Sun, 26 Sep 2021 08:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86FC281916;
	Sun, 26 Sep 2021 08:35:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 504911BF37E
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 08:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F97781916
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 08:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gIGSu1r2LOJG for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 08:35:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F11E68190B
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 08:35:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s21so1577012wra.7
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 01:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJdLXmVD6ZQ0l5J3b1/WcYkDfxi4OGdvvm+zrauWSeU=;
 b=dXZVOffbKvBKSrFynahbZqSLxiKB3VR77fVxYOfWSTrMSEUGtfH17GQdKihfZcc8tp
 yqsQRNCWOUu4dzKU2c4BVAmuIdHm80RyoJbon8HgVtZwysGGtxqog0PJko0RXJXb058g
 oHk1qbWykRwQaoKTbOJhditN2PIVIuNcx2l5Db1dZZVM+1RS47/2w9xazgSkXTGR724O
 x0KTuK96BduhBHmJtLKl3M3tMFzexbAnj2OQBGHWwNCSQJjmgYUn5/1OXihvoKxbkyzx
 CBnB89AtzDjPlFUM0tQoxdi4zwLIaXLPQL9FcmafOxfuPmLL839qrem7lTiYe9cUPIXI
 j1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJdLXmVD6ZQ0l5J3b1/WcYkDfxi4OGdvvm+zrauWSeU=;
 b=rPUsVRAi6pd0cAqbNWPAJXcYTsIw1KfOAj9u/VQAkhFSVac86dqsz7BQv/uA5L8Y8J
 TWTtxOC2f8wd055eEPps0b3y9KS669pplx4j7Y9ILY71N5KyEno2yJs6OZkHXrvSGHw2
 qvpkKyPR+FREZ5SgUKZh3SZVSN+qOn5hhzEBPjeHaN4IwBPJsiGzBNxFWJiFeR260G2A
 XtG8xL9F8aG5+1COau/gdTqS6FrfWU2X3HdDn1wg62H8fecAq31op4e/I0pOE53LWqGe
 WN5zoYt6l6MOSzb/Y4VdS8CzVNJnaN85r/aFsNu4ceNHZ+Ca27sd4j4Bv8fJ4tB/tivQ
 s0fA==
X-Gm-Message-State: AOAM5323LXlO8gb3zT1u6ManCcv0qld4jOVra38we+gZ9kJal2Ng2EGY
 /BMEwfhuEwDSpXkwvpo0Aw0S6RV6E6U=
X-Google-Smtp-Source: ABdhPJyvbnw6keMpwenK2lTdTWPRSJGZKUX73cyxXcWijx6QQV48tsBWiRtx+kDdNJwZLFmpv2nHeQ==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr10483883wmq.128.1632645332871; 
 Sun, 26 Sep 2021 01:35:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id u13sm13233271wrt.41.2021.09.26.01.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 01:35:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 10:35:01 +0200
Message-Id: <20210926083501.3514060-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/google-breakpad: fix build with
 glibc >= 2.33
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
Cc: Pascal Huerst <pascal.huerst@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with glibc >= 2.33:

src/client/linux/handler/exception_handler.cc: In function 'void google_breakpad::{anonymous}::InstallAlternateStackLocked()':
src/client/linux/handler/exception_handler.cc:147:49: error: no matching function for call to 'max(int, long int)'
  147 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/61a89fa954db16a7b5b9fcee55c545e489f8d489

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0004-Fix-for-non-constant-SIGSTKSZ.patch  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch

diff --git a/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch b/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
new file mode 100644
index 0000000000..4291216c61
--- /dev/null
+++ b/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
@@ -0,0 +1,34 @@
+From 4a332d01186b09a9d46390b845024d914d9149cb Mon Sep 17 00:00:00 2001
+From: Michel Alexandre Salim <michel@michel-slm.name>
+Date: Sun, 21 Mar 2021 13:17:00 -0700
+Subject: [PATCH] Fix for non-constant SIGSTKSZ
+
+On glibc > 2.33, `SIGSTKSZ` might not be constant (in which case
+it expands to a call to `sysconf` which returns a `long int`); see
+http://sourceware-org.1504.n7.nabble.com/PATCH-sysconf-Add-SC-MINSIGSTKSZ-SC-SIGSTKSZ-BZ-20305-td650948.html
+
+Cast the two arguments to `max` to `unsigned`, which is the type of the variable
+we're storing the result in anyway, so that it works both with the old-style constant
+`SIGSTKSZ` and the new configurable one.
+
+Signed-off-by: Michel Alexandre Salim <michel@michel-slm.name>
+Change-Id: I3d87048561a87c6b9fcdbb14b3d53dd45b0a00f0
+
+[Retrieved from:
+https://chromium-review.googlesource.com/c/breakpad/breakpad/+/2776379]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+
+diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
+index ca353c4..3788829 100644
+--- a/src/client/linux/handler/exception_handler.cc
++++ b/src/client/linux/handler/exception_handler.cc
+@@ -138,7 +138,7 @@
+   // SIGSTKSZ may be too small to prevent the signal handlers from overrunning
+   // the alternative stack. Ensure that the size of the alternative stack is
+   // large enough.
+-  static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
++  static const unsigned kSigStackSize = std::max((unsigned) 16384, (unsigned) SIGSTKSZ);
+ 
+   // Only set an alternative stack if there isn't already one, or if the current
+   // one is too small.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
