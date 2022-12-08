Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBB6C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39526401B7;
	Thu,  8 Dec 2022 21:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39526401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iCaywU3cDUi; Thu,  8 Dec 2022 21:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EE69400FE;
	Thu,  8 Dec 2022 21:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EE69400FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D41F41BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB76360B3A
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB76360B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5Vq4Sg2P5Km for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:27:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0899960AD6
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0899960AD6
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:27:51 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so2878817pjm.2
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rai1ePRqUEWXH4v4DJIixgyfSwKr7sZeARGSMkgAAX8=;
 b=t3I3UwjvjcxqxK83l/c93vFI05649axOKTcSINbm2E6ND5MXbZnGPXfDYrgEIAKMbr
 PcsmCn17RDjK2+PGSJMvxZ1AUGvPFwui8ND/pUDlPofxzPd5q0u9Eti3nHlXSyOnOc0r
 vYeb7dDqy+V4kLW/9MM7XkWlll5LP7VlG8DBMJ4uU6K9FoZlm25HqCvRx9wJSRTaR4Ni
 F1M0PArOEcaa8am+tpHOI/g9su3ZxJ48c3HrC8ajCFUqs5/qCSQ1iLRWRksCcLthU3Kn
 0LjwYkNsWxlZoBIlZkAwG7irYu6c2Tv08aj+XuorDBAM5jmcUBwVDWWpTUAhcTsB6gHY
 fjNw==
X-Gm-Message-State: ANoB5pll/mzWSK1ZYavh63yixkNvukfEZdVvSvFYH8j9ANLgu3j64++Q
 /iFsmEBGFdpS1jJb10+U1SOmJCx/ljI=
X-Google-Smtp-Source: AA0mqf7uyJ5oJceyodm2VJ4KDFzmng0jqZXgcIx+DTdizDFvT3R2SOiGt3BKqB3YJa2OvxOU3eHZYg==
X-Received: by 2002:a17:902:ebc1:b0:189:65e7:e16b with SMTP id
 p1-20020a170902ebc100b0018965e7e16bmr3306014plg.66.1670534871057; 
 Thu, 08 Dec 2022 13:27:51 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b0016c9e5f291bsm17127927plh.111.2022.12.08.13.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:27:50 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 13:27:48 -0800
Message-Id: <20221208212748.4132861-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/crun: bump to version 1.7.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfixes:

https://github.com/containers/crun/releases/tag/1.7.2

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/crun/crun.hash | 2 +-
 package/crun/crun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index de61310e08..2b21800f02 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  acd24012daa951cf1674b20b2d5f87975d5d6c8e8c80bfe12e4cffa3495cae67  crun-1.5.tar.gz
+sha256  f669ecd3d1895dcaa8425eabb707c06eb3bdb5ae5201a50a423c3cace36c4a05  crun-1.7.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 65f166e657..8c9993993c 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.5
+CRUN_VERSION = 1.7.2
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
