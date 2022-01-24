Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D479C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD34360E6A;
	Mon, 24 Jan 2022 10:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gF6ZzlAArBiE; Mon, 24 Jan 2022 10:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D59E61019;
	Mon, 24 Jan 2022 10:36:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1386C1BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 095B184B66
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0dYngIC7wGJ for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:36:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20BEC84B67
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:36:36 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id a12so18883511iod.9
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vubi4a1zWdxZJjF7OmvnwL09BGuYxblK3O3cUOamXTg=;
 b=FrGZg7vvBKh6q7oiXg2p7VQLgOjM5Zu4WjwLSIaEs2Lz+TixBCELKU7fi3kxrQPvKV
 BOSHeOprX+tfUI54gF/sYpXrgzlAE5MCWD6giES2qdvx0jztZJp5Kna/pMHnJnm9uLey
 5bTiDVW/zN1P5dH5jNnAFOMN1yD/P/LBLj9oxaUz3/7BQmNWAndUPDCZG5GEZZnlMMP3
 GWFOmMtYIA+s304kEBAIVTAPuO3UCRF0/5Rgmum1kgCOAvdZ/SqRT/BpbOS2f1w0JgWj
 w0TRr+KWdUtv8Oznx5c/l/bAXjIzpoZaiOw+RzIgRDAh3hn0I+9Rn3qLVNQtFFKxmh5+
 J7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vubi4a1zWdxZJjF7OmvnwL09BGuYxblK3O3cUOamXTg=;
 b=t6+NJsepY+FuzZ/4KC0HWXdAtdORIaDqBrYDS0n7Cv1TG9T+IRGDZFebSR/2G6iipl
 PrW6x868vhuD2V6tFdCUnLwVv08jzn5x9iFJNmm4S/+uxBMmqUnnd8HvfMAyiUe4TVwm
 BWzdlHoZmgtS1SfcYi7m3Bdku9G8xkPpdpQVaNKK4/pQMWCSsMDgSk39fxjV6KaJaKZw
 QfzTyHLxHR1jc5CtXgxnM8bibqO2sf66BaNf3B27ZaiI+08n1Rc9NjjaIpm3fi5KxXNY
 qKEqysNKDdpF5f8WjYsKF8nhGDPx4+NtmPXvt8bX3gowOavWcVLYarGa6gOXZ89qPHYP
 SmZA==
X-Gm-Message-State: AOAM530zRQSNCsgbAuVNwBXKmlpUxEBSsaMJ+Z9bfL/QQjgOQZxw9e6p
 7/lwN9TicHuvNEk/jhwchbDvpuXpYTA=
X-Google-Smtp-Source: ABdhPJzI+S1DK1X/rE667sufZmnWd7CP5/BFxytJ0QDqAMw3iN4tEu6hhnLqUA1cBddI8Ud3xyal7A==
X-Received: by 2002:a5e:9b0e:: with SMTP id j14mr7688679iok.127.1643020595904; 
 Mon, 24 Jan 2022 02:36:35 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id r15sm7091380ilo.25.2022.01.24.02.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:36:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 03:36:34 -0700
Message-Id: <20220124103634.527471-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.28.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 2e79861e2c..1f9b546c23 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  fcf1425460855b5892c990027b5396c8  fonttools-4.28.2.zip
-sha256  dca694331af74c8ad47acc5171e57f6b78fac5692bf050f2ab572964577ac0dd  fonttools-4.28.2.zip
+md5  4a894b3cd108432f7636849b4026b771  fonttools-4.28.5.zip
+sha256  545c05d0f7903a863c2020e07b8f0a57517f2c40d940bded77076397872d14ca  fonttools-4.28.5.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 9ec369d550..c5c605161b 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.28.2
+PYTHON_FONTTOOLS_VERSION = 4.28.5
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/3c/d5/f722e0d1aed0d547383913c6bc3c4ff35772952057b8e2b8fe3be8df4216
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/ce/1b/d4cd86f4e6cbd54a3c4f807015b116299bcd6d6587ea0645d88ba9d932bb
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
