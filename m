Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5215EC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E222260B04;
	Thu,  3 Nov 2022 13:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E222260B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BAVT6NbT4g8A; Thu,  3 Nov 2022 13:36:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6391560A7B;
	Thu,  3 Nov 2022 13:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6391560A7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 779791BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50E7C81F19
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50E7C81F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sl0Z5ux48JBe for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:36:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6452381F0B
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6452381F0B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:36:03 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id r81so1318682iod.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/t2FfzZctn+X+dAYyP+X+N6awVc+WpeZL246jeIj8fs=;
 b=DKRjWvuSRhayCDHACG/gjrOHhnKFVbGkwNd4LNi0TkXzQiVXdb+lfimgHih9sX+rJ0
 3Aoa4W6iBngR0igIk0iVxJCfTPTZhX2WLtYxU6NxNaYr9xv5/aUleQrXuMohAj4YXRP0
 Rx5MEMLA8Cnu2RNBbuFu61mTRmua28EIHPibulBQSpQy00QfQwVXau8gI63ZXlys3M8e
 XTUAeL7Ko7zMeCXX/qmCeKliQzINrVbU5WxFt/yeI2Rs1qGKib3lnoxeMkfE8+0Tp7n3
 mVTxiYqpFO6WV7my/uHD/8DXhuY4pCboVnDKNr/hfFQfeYNnysweGIMjh48T+2oAa4CB
 QGpw==
X-Gm-Message-State: ACrzQf3fjp4ZpUs8q5YD28uV+4RwWEbeijGOCv2uTtKTXYymThKr22T6
 aUr/JelInlaHqwmE4RaY8ALWzgGdkCYrXU5l
X-Google-Smtp-Source: AMsMyM5LWgP0oaV78wlxLC6UiiUdQmn006HEon8BB9e1DCBtcb/w0Wj4WUm8Mja1PomFUmB8km6LxQ==
X-Received: by 2002:a02:7a19:0:b0:375:41a7:4fb with SMTP id
 a25-20020a027a19000000b0037541a704fbmr17493777jac.235.1667482562067; 
 Thu, 03 Nov 2022 06:36:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p17-20020a92da51000000b002ffa449535asm315589ilq.74.2022.11.03.06.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:36:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:36:00 -0600
Message-Id: <20221103133600.2049429-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/t2FfzZctn+X+dAYyP+X+N6awVc+WpeZL246jeIj8fs=;
 b=QFtxRBaYXFuownUSDrZJtM5qE3QMUFklHgQf698mXmDZNwetDz0cMjm+EgYufHxdBp
 uCtonGnYCR6Fo+248JRMPlGYd3p++nhubQjpcg2N8mYfA5UDzA+N0OuPFHL/MNQefWJx
 QZTe4FT9z2GATScmVpZ8wDm50dhwTGCBe2yQZ0dIKGf7gQQXCLTl5AwW/W1Dj2UbHlR4
 exLU7ohCUq6P6MWSWgrH3uO8lRAD4dPfZDRjyxo25IfAnlZnJ6Dt0TSPy7hbNdiS6aPe
 ei7Tdzcr0wesxfar3KHe7g26HvnI8Vfh3BIiD9p/fRWcXbhOlNxgV0xia2CdH86IHqef
 pqEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QFtxRBaY
Subject: [Buildroot] [PATCH 1/1] package/python-pathpy: bump to version
 12.5.0
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
 package/python-pathpy/python-pathpy.hash | 4 ++--
 package/python-pathpy/python-pathpy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathpy/python-pathpy.hash b/package/python-pathpy/python-pathpy.hash
index 0b9b7b7cd6..f2f1880e4d 100644
--- a/package/python-pathpy/python-pathpy.hash
+++ b/package/python-pathpy/python-pathpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/path.py/json
-md5  307098b1827af6031687edb49ce2c39c  path.py-12.0.1.tar.gz
-sha256  9f2169633403aa0423f6ec000e8701dd1819526c62465f5043952f92527fea0f  path.py-12.0.1.tar.gz
+md5  c748063e113914dcb08e3f4eb6cd1de0  path.py-12.5.0.tar.gz
+sha256  8d885e8b2497aed005703d94e0fd97943401f035e42a136810308bff034529a8  path.py-12.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
index 3b7388bdd2..2fd6e931f8 100644
--- a/package/python-pathpy/python-pathpy.mk
+++ b/package/python-pathpy/python-pathpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHPY_VERSION = 12.0.1
+PYTHON_PATHPY_VERSION = 12.5.0
 PYTHON_PATHPY_SOURCE = path.py-$(PYTHON_PATHPY_VERSION).tar.gz
-PYTHON_PATHPY_SITE = https://files.pythonhosted.org/packages/70/63/c01c1bb2df17db4c78f78cc439a2800f55bec5445cabf1f3579a37909f41
+PYTHON_PATHPY_SITE = https://files.pythonhosted.org/packages/b6/e3/81be70016d58ade0f516191fa80152daba5453d0b07ce648d9daae86a188
 PYTHON_PATHPY_SETUP_TYPE = setuptools
 PYTHON_PATHPY_LICENSE = MIT
 PYTHON_PATHPY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
