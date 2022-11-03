Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989DDC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4633760FC7;
	Thu,  3 Nov 2022 14:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4633760FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3soAOMtdIXu; Thu,  3 Nov 2022 14:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6650660B09;
	Thu,  3 Nov 2022 14:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6650660B09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48EEE1BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23EFA80AD5
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23EFA80AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ax5dnwrFoOY7 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:10:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3185680AB9
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3185680AB9
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:10:22 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id z9so1076791ilu.10
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxuNGKb0yusWvb3gaFp71YtB6ds9NCOYtdJeCj8EdmY=;
 b=1z4ergXy+8V2gyoi6TJsgFlY4vPvnq4IxRyb3fU9XTCuzl50Ny8G0KQFMmwnQRj8Qh
 bhZk+Z+E+5fPtZMYThI0Lr0MwiWqWJbrNEj9kr6yVgF2pTD7g2KuF2ykOPP+TTmCQsvU
 DRDHns1Dh7dsEbw6S+MM9OWEHD4NDLu1LFXA9sKQKIdMixWGVuYnbDEApWrsL66l7Byx
 wZellTA1e7OU1u+B8zmRcdzH/sK26u1S6pc0r9QWXMVkhfsSbmAuhv+fTN1X7MML4WjJ
 FqiTofIGTr8NH/uP0WUvJAgytJ8CQ8gtyD1GLnD7bhTNqkd69duI9U3BS0P1LFO9b0T9
 k6kw==
X-Gm-Message-State: ACrzQf3dZGchJQHGuZ7RryVBxxpMIwJ0N3/d/4E9ruahjddL0fycJAH0
 HViCHgR7w0H5+ATBv/XEA49R+4GnRvn2T3XZ
X-Google-Smtp-Source: AMsMyM4mWhYT8JXd3AZlSyDnHuHj3k5yek2WtcOWYcJ0B3MTustfkX3x3SPGYhYKzyLPKb7RRn41kg==
X-Received: by 2002:a05:6e02:606:b0:300:c570:74d6 with SMTP id
 t6-20020a056e02060600b00300c57074d6mr8072070ils.152.1667484620933; 
 Thu, 03 Nov 2022 07:10:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v10-20020a02b08a000000b003754033c6aesm230027jah.155.2022.11.03.07.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:10:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:10:19 -0600
Message-Id: <20221103141019.136682-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AxuNGKb0yusWvb3gaFp71YtB6ds9NCOYtdJeCj8EdmY=;
 b=qV+/xm3yLvxnYkHZJ2n+sVxeQscPJbWw/N2SV+wsxy4gzk9+fMv/dL+941cReOSw8c
 M55+7CWmFf0eBg9bbTFb3Xyiu/CN+R9W8WqAvzbl6Orqx5mDM7uoJNiKSmsUhILZt/t6
 DI4CmL+cdMsRcWMzMoCmrqgTBhCGsxVIHN2RmOzZ/5YZ/BVpeL3GNfMxIJpN+IfxsAI1
 4M34utCCbjLEGcBMRD78HQYM/EStD14vJ3dJTG3EZYTKEP8OBi/sfnnfVPyDVhUjZhIJ
 j/tjuZHE2txJ5CuddGTUhS9OeCUQbqIpNbAsmY+Z15vd/dJqbfJo8hN6HPawGrXBJP6n
 A0OA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qV+/xm3y
Subject: [Buildroot] [PATCH 1/1] package/python-pyelftools: bump to version
 0.29
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Olivier Matz <olivier.matz@6wind.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyelftools/python-pyelftools.hash | 4 ++--
 package/python-pyelftools/python-pyelftools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyelftools/python-pyelftools.hash b/package/python-pyelftools/python-pyelftools.hash
index a309b90e15..7cffe2d646 100644
--- a/package/python-pyelftools/python-pyelftools.hash
+++ b/package/python-pyelftools/python-pyelftools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyelftools/json
-md5  061d67c669a9b1f8d07f28c47fb6a65f  pyelftools-0.27.tar.gz
-sha256  cde854e662774c5457d688ca41615f6594187ba7067af101232df889a6b7a66b  pyelftools-0.27.tar.gz
+md5  2afc97cd239c0dea0cca97d00d3dcb42  pyelftools-0.29.tar.gz
+sha256  ec761596aafa16e282a31de188737e5485552469ac63b60cfcccf22263fd24ff  pyelftools-0.29.tar.gz
 # Locally computed sha256 checksums
 sha256  ae18bf4cb82f92af7547259177bc28bc48e4fc732518bcedfe690226288d3445  LICENSE
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 5bfdcd33ae..7566f24895 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYELFTOOLS_VERSION = 0.27
+PYTHON_PYELFTOOLS_VERSION = 0.29
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
-PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/6b/b5/f7022f2d950327ba970ec85fb8f85c79244031092c129b6f34ab17514ae0
+PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/0e/35/e76da824595452a5ad07f289ea1737ca0971fc6cc7b6ee9464279be06b5e
 PYTHON_PYELFTOOLS_LICENSE = Public domain
 PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
