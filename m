Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDFBC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 16:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DF0A40132;
	Sun,  6 Nov 2022 16:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DF0A40132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFhYbXTPq3Qh; Sun,  6 Nov 2022 16:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA19D400E7;
	Sun,  6 Nov 2022 15:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA19D400E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9B31BF21A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78F06400E7
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78F06400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhMguG5CfUId for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:59:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61243400B8
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61243400B8
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:59:56 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id m15so4804888ilq.2
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 07:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dyebKwBYWNf7XWqTzcYlKnvImpRcq38YSoe8ggMqjAs=;
 b=Ok88CJXAwMP2YRDWNIj+svqVfGnfgcI4D80G70X0/2kCfoA7KfJVNPyuOCmNU1pe9r
 LHy0HMy+xqnV9bCRkxMGyM9l2x/BelSkfBLnN7C1K2C2s5/wOxDmPKngU43QnPBpd8R+
 NsrAudoWhjd68V3wDPvNClIIS38AGQKnCfeD+skyIAIZGlUFXkv8p+tXs5RrvPs0iJkj
 nhhpJ6IkrbzthS7k3jocTPsk/xpUXqQLQM1XUWXKSN48AkyJRFhqtE35haPkZXsLrSFd
 EKc3+8ZBMSTmSsoQEfoYMKDrOk6rO5P3GQYUUiAnbsB0ppM+o1/T7DYljULOI6ZF+iyI
 6CxA==
X-Gm-Message-State: ACrzQf2jGUvdXZQ0s7YCPGkg3Rs1Z8I7T8kPoSTc+2JZkS4xEKHj+Huu
 gVNL9T27J/35ma8GxhaiLAnQH/7DahhYRw==
X-Google-Smtp-Source: AMsMyM7yc149v/BKgaQvo17I+0fTBBMJnfYpDS1q/YNsZBnQlJJBaGPCk8w7aVAtXH6AEbyRwy4eoQ==
X-Received: by 2002:a92:6912:0:b0:300:c48d:19cd with SMTP id
 e18-20020a926912000000b00300c48d19cdmr17007081ilc.216.1667750395073; 
 Sun, 06 Nov 2022 07:59:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y9-20020a029509000000b003758390c97esm1785235jah.83.2022.11.06.07.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:59:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 08:59:53 -0700
Message-Id: <20221106155953.313573-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dyebKwBYWNf7XWqTzcYlKnvImpRcq38YSoe8ggMqjAs=;
 b=pvc7BJqHqq6e/CT1x4rnT5kxKSZ+xh+nNRHLFOKG9SqweLWkovW2hw18PDWvhoMr3m
 +povTuUk3OGa/RqYHBe0lIXtLJxUIfWWoohsSzct8yjR+iT2s2TvON7RyW2I8F+TiaoN
 bHz7Q9IPdcM1o9ys/mn/FgBjvitJd8sTtGp2dsKq9+szkY9nIZSnK82JH34ZorJ4T/X6
 9dIVmT26op3cyYo2EKIamPa/+rvhgJaAHi6f3vfaeaaTlunKxQtsBvfpHAybv2qjIA6t
 MQkMtgbAG1G1GoUbuaEc++XiyGBEm39Q+KcRnrixBo2nMIf+/jN7Rkk/djWpYnx2R9+g
 8ELw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pvc7BJqH
Subject: [Buildroot] [PATCH 1/1] package/python-spidev: bump to version 3.6
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License moved out of readme, verified as still MIT.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-spidev/python-spidev.hash | 10 +++++-----
 package/python-spidev/python-spidev.mk   |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index c74d7c470c..cd8a24eb72 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,5 +1,5 @@
-# sha256 from https://pypi.org/project/spidev
-sha256  8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d  spidev-3.5.tar.gz
-
-# locally computed
-sha256  153a6f02f41aebe292cf3307f973a80b4fb0c988d8d3e7d126c7a66c20b1cc27  README.md
+# md5, sha256 from https://pypi.org/pypi/spidev/json
+md5  83a73279d6e823a9030c4315577bfae3  spidev-3.6.tar.gz
+sha256  14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b  spidev-3.6.tar.gz
+# Locally computed sha256 checksums
+sha256  510129bc8174c0fa81fa6d653691d1bd5d3555f7f38979ec45b5fc5bbff5377b  LICENSE
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index e1065610a7..f48b5b0832 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.5
+PYTHON_SPIDEV_VERSION = 3.6
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/62/56/de649e7d95f9fcfaf965a6eb937b4a46bc77ef21487c99cde1a7a0546040
+PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/c7/d9/401c0a7be089e02826cf2c201f489876b601f15be100fe391ef9c2faed83
 PYTHON_SPIDEV_SETUP_TYPE = setuptools
 PYTHON_SPIDEV_LICENSE = MIT
-PYTHON_SPIDEV_LICENSE_FILES = README.md
+PYTHON_SPIDEV_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
