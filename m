Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE8EECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 21:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 995454170E;
	Mon, 19 Sep 2022 21:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 995454170E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UHHEY9Z5HoEe; Mon, 19 Sep 2022 21:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A16E41553;
	Mon, 19 Sep 2022 21:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A16E41553
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B11F01BF39F
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 21:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9710E41553
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 21:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9710E41553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jhi7k798FXKE for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 21:32:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2F4941550
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2F4941550
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 21:32:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b35so1179583edf.0
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 14:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ptzGeYPy0mVjBjTFBZ/f+CLrV0rWQ+YCq2Ykalo3ojo=;
 b=kz+GF/71ZvUPLdunk0e1x0SNPcvaqEdrzbG0BDMRH8chSP4+iTXw8G0jmP1JOZDOmV
 KpUXPLbhcBZYhj62IcBU3TmtmP681/xw7bJbDmIlNrgSYxnh8jgxx18JRKuO0QyD9XV3
 bZBt29FF8ykrxU5/+fm3yo/Otrl9wdQ5H1+TD2uD79/ZawSS9xILO2RpcF317CZwxxRz
 y226KfF1Pb6cA7KQMzwVk/LJR8ay6LTikN+kchKEJyySCONAqePqcn19eqGMCwaN+WQf
 qz868s6EdDddQgOjejDbOGwkzb1BWw47jjvBBaV/wL/m6Rq40i2Eqs0PdUKz7XTppmwY
 PcFQ==
X-Gm-Message-State: ACrzQf33kJqgWzi3Xl2HxJ9LPy53eKMFTOuPUw0mg73E3zdsTFN2Wo3C
 jYpIK/e+bkftbOcGsSxL3NGhciUgqkw=
X-Google-Smtp-Source: AMsMyM66zRaSJIBhV6DnKUTm5Fq11cXUhEho+4R+Hnwc7Mh+cHiPW6w7SbcnTEEIyn7MijgFwb9qmQ==
X-Received: by 2002:a05:6402:402a:b0:449:2ae0:aa9a with SMTP id
 d42-20020a056402402a00b004492ae0aa9amr17716804eda.420.1663623135282; 
 Mon, 19 Sep 2022 14:32:15 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net
 (192.234-180-91.adsl-dyn.isp.belgacom.be. [91.180.234.192])
 by smtp.gmail.com with ESMTPSA id
 kx24-20020a170907775800b0073d5948855asm16101771ejc.1.2022.09.19.14.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 14:32:14 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
X-Google-Original-From: Jesse Van Gavere <jesse.vangavere@scioteq.com>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 23:32:10 +0200
Message-Id: <20220919213210.56377-1-jesse.vangavere@scioteq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ptzGeYPy0mVjBjTFBZ/f+CLrV0rWQ+YCq2Ykalo3ojo=;
 b=B7kSk91ymh5FWLQZ2Y4F6gKZd4gMTpVgb/pwLSfBbeULGN+Oo0r4AZQ23OOtRuBk0a
 C3xPQr2+Ln/3ccSjQFovGDurqnabCOIdmfHOITAmw8VirIfikZHjie1BQ/loEo+FbUX+
 N0mNajEM52uYZBUNAhgH6DF7xmVatw7yhhnuLL3CX9fpKCx4rPiM/1PapOezRLRV8wmX
 NlBlArra+vTA599YlfRfiUQFjLd/Ssf2dbiGQE7ode3J3ARTy9ynNwkyKJLLldZCwnTL
 VAE6Ogs41PijMNI6pCLiU6wrMnJulvj3cIxNned3RRtGp2vQxax+xpX2y7eIoTxNAofg
 7BVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B7kSk91y
Subject: [Buildroot] [PATCH 1/1] package/qt6: bump to version 6.3.2
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
Cc: Jesse Van Gavere <jesse.vangavere@scioteq.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesse.vangavere@scioteq.com>
---
 package/qt6/qt6.mk                           | 2 +-
 package/qt6/qt6base/qt6base.hash             | 7 ++++---
 package/qt6/qt6serialport/qt6serialport.hash | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 03e87d0574..b609baf4c6 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.3
-QT6_VERSION = $(QT6_VERSION_MAJOR).1
+QT6_VERSION = $(QT6_VERSION_MAJOR).2
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index bd5fa9e445..e43a6ff52d 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,6 +1,7 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
-sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
-# Hashes for license files:
+# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.2/submodules/qtbase-everywhere-src-6.3.2.tar.xz.sha256
+sha256  7929ba4df870b6b30870bc0aed2525cfc606ed7091107b23cf7ed7e434caa9a6  qtbase-everywhere-src-6.3.2.tar.xz
+
+# Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
 sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 9780eb86fe..50202a1e26 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
 # Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtserialport-everywhere-src-6.3.1.tar.xz.sha256
-sha256  4eb6d80e65799dd2e0318df4dfba14173c1929e861718cda9bedca24253b616e  qtserialport-everywhere-src-6.3.1.tar.xz
+sha256  c7d207322367c63647edbd06ded9c76ba9071961daac1d1021b622b762c35e6f  qtserialport-everywhere-src-6.3.2.tar.xz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
