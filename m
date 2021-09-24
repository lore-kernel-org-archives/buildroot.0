Return-Path: <SRS0=IJqM=OO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7B7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 21:43:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52B2611C8
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 21:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B52B2611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 791D8605E8;
	Fri, 24 Sep 2021 21:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H65YOG61yVgH; Fri, 24 Sep 2021 21:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFA3260B2A;
	Fri, 24 Sep 2021 21:43:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F53D1BF3B5
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 21:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DE7183F6D
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 21:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNIJSeCywH7i for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 21:43:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 343EB83EB0
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 21:43:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t8so31533292wri.1
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 14:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8Q7NHf7H1Ahjaql+2GVbY8ZLE9/t31sNFWi+EgjtrM=;
 b=fLn8YBWbgKE0P/aBPHgSjgwdD23cY3kXvsrWnKwUTa5WCYri5k36ozWF898WVu4qkJ
 NcZduXDDbh9jjQSov6uhjZTtb+o3i+2gLWQSpxX2l95sOYiGTv7296lP05ZWFoqoFxFx
 8bkbo6x6WP66TPXeIGn72wqKC1pUD+n7itbg+GbES63N5h/EcmQz3VX1fO/iNBRuhsW+
 Pc8lhFrZw9SmLl1NdP30lRBg+BdDH0gIfQ0XzYKmo2/NEFJ/D3XpXffaOw+D+MikTLP6
 gXl7suv2tZbQ16/+Zy69nGT8ZCEdBd1U6C5Rro7/Mlz/pyIpo7uH5MU+ZCDFGQkOqz4f
 gspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8Q7NHf7H1Ahjaql+2GVbY8ZLE9/t31sNFWi+EgjtrM=;
 b=jqK4w4LrV83t3iUDuSNLHCzGzOGnjaIAtsYa2FlgYphv/omvNX4oeQqXDNyFt1hRM4
 JM9TVwifN/MrT5scQ2lHyZ/tLAAxB7Vwd+ivSZYNKzPIvXSRfE3EZDrGliLaVl9K8rPM
 qU0d+/LTFSvK8uvcoTS1kIgy7+mvPrz8d1I6QvnckyJYdZafzFEI5FYsTwP5JvHyorEf
 SC4eD9MpvKsyElevqUAskQogkoN09SA71C9lazzzjGGKFffkmke3AmZAWirmOnt9pww/
 1UdlhjWrOsWD1xPI+YCuE0mgeqqiuq4C7G6kxQ6JJVs08iL+lGfvyoxcukCFgFkkSAq5
 Y7xQ==
X-Gm-Message-State: AOAM5323A7wKMJqgHqzNd+24mXfqI5AUDS+sT7tZhn4ZFaMtSUejiAwo
 XqNtOrZ5MlVvZ6Y/cEVGk9RSp6btmMc=
X-Google-Smtp-Source: ABdhPJxcrv7S/vLxQvuVA46YAozSKE53SnauNTom1svnXKbudmoe70gQbHwU+w7FbIdGOoMZ0LfM3g==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr14159150wrb.237.1632519822191; 
 Fri, 24 Sep 2021 14:43:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id s2sm1088031wru.3.2021.09.24.14.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 14:43:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 23:43:21 +0200
Message-Id: <20210924214321.2920421-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcamera: bump to version
 40f5fddca7f774944a53f58eeaebc4db79c373d8
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will fix the following build failure raised since commit
c09f126f570355b8ec134724b453300a4811339c thanks to
https://git.linuxtv.org/libcamera.git/commit/?id=c52e8429cce91dadf98378d87015d8f476a44f70:

/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/libcamera/base/libcamera-base.so.p/message.cpp.o: in function `libcamera::Message::registerMessageType()':
message.cpp:(.text+0x290): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/6e3471df8e9312a1789ca05ae70cc2283bfeec23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 52c584bc16..a7ca27a96b 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  a5ed581416719b914140eda76ca8a4e0e9c944b859f8fb018fc17497278c5ae1  libcamera-e355ca0087cd93ef80f74c61018e9e9228a93313-br1.tar.gz
+sha256  305e6f458d2bf3d4b697ffe33e104b696db6b1492bb5422e2cce1937e58516f1  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 677da8ac4c..8ab95fb42a 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = e355ca0087cd93ef80f74c61018e9e9228a93313
+LIBCAMERA_VERSION = 40f5fddca7f774944a53f58eeaebc4db79c373d8
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
