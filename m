Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66866C433EF
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 11:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E51A782B2F;
	Sat, 27 Nov 2021 11:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQSKavbbfdMX; Sat, 27 Nov 2021 11:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B4BD82B1E;
	Sat, 27 Nov 2021 11:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A49CA1BF30D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94A4C40415
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMQ_M8LdchVF for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 11:37:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5C994039E
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 11:37:46 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id w22so14713825ioa.1
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Z3z6LMH8X6+1SIqSGaRvl9DyxFDCWdHgASK3gWPq9M=;
 b=Zv/SXtrQjHSXRSOYlyt81LOUvDvUYhAYbM8voAgx4j0epkkdW2IPaM0Xm/YKnjmnZJ
 mRBNO8fubIf7d/8fOVmTrCGY+TdRI3zZCwdyMs8JbYilHxz7uGiHqpnXf/BdkvqcFb8M
 NxiSZzApy9J/Z+7z+Y+CwSeq928GYRsDpWZGpXqjmmtagFdSAbe7NnTzvyeTzw0z2Adq
 hNvbrMggXgGBWZHclwyiteRg02ES7JFlOfp4L31pPw6xOdxz391oBJ6lWqnIvN5RodpF
 JbiR0Rm3wtMkhDj2UHKRAylFmxBHzADlfLxy21cb2RrqiDonaYiotWbg8t8GfEdUPiDB
 1SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Z3z6LMH8X6+1SIqSGaRvl9DyxFDCWdHgASK3gWPq9M=;
 b=rSrGKeEzUc+Y0dZjSnBdg9n6or4AJz/PrLMD1UcrIDILUlK19rcLf56GFKWTd9Vx9E
 AocEoWNhe8L4wIGAUkZsU4aAsA+smriJnMeVcg25MgHOgtxRfTberiay3t6vMf8Mac4d
 bEcMS5RTvHNX0/pvLUkuYNdRPMeq4SYSpmiemE6n/I8BdzCct0rxgu79n+/u720Qk+jc
 D6K1kgm+s3O9LKx6G4zYfaTnMVa71iq1Vv51V9ReBKd33JEFgJ+qhfzaSBXhXGOAg3Fj
 yxXRVOY68A47OrY4KK2d6kRlgyzGDJLYmt7FC/+ismyu6jyx5M6n4wAa4xPcoX49HiwB
 ljFg==
X-Gm-Message-State: AOAM5335+OqbkY01zimZTigwP2Ruh6PoVplRWtzEeZ8t0I6Q9vqWXt8F
 BLWZHxrmynp7Qy6mz5Kqtmvw6OqDFYc=
X-Google-Smtp-Source: ABdhPJxo1ZZQPU1PKmnPYHmac706jdUMPK+EvJHm9/7tSmAKYRyyjRzkiS3S/iwLkJduIcSxr2oVzQ==
X-Received: by 2002:a05:6638:dd5:: with SMTP id
 m21mr50582074jaj.44.1638013065470; 
 Sat, 27 Nov 2021 03:37:45 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id g4sm6389435ila.78.2021.11.27.03.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 03:37:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 04:37:32 -0700
Message-Id: <20211127113735.2178776-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211127113735.2178776-1-james.hilliard1@gmail.com>
References: <20211127113735.2178776-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/7] package/python-fonttools: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                             |  1 +
 package/python-fonttools/Config.in            |  7 ++++++
 .../python-fonttools/python-fonttools.hash    |  5 +++++
 package/python-fonttools/python-fonttools.mk  | 22 +++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/python-fonttools/Config.in
 create mode 100644 package/python-fonttools/python-fonttools.hash
 create mode 100644 package/python-fonttools/python-fonttools.mk

diff --git a/package/Config.in b/package/Config.in
index 2bb4a0b4f4..b4520f43c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1013,6 +1013,7 @@ menu "External python modules"
 	source "package/python-flask-wtf/Config.in"
 	source "package/python-flatbuffers/Config.in"
 	source "package/python-flup/Config.in"
+	source "package/python-fonttools/Config.in"
 	source "package/python-frozenlist/Config.in"
 	source "package/python-functools32/Config.in"
 	source "package/python-future/Config.in"
diff --git a/package/python-fonttools/Config.in b/package/python-fonttools/Config.in
new file mode 100644
index 0000000000..714f547430
--- /dev/null
+++ b/package/python-fonttools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_FONTTOOLS
+	bool "python-fonttools"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Tools to manipulate font files.
+
+	  https://github.com/fonttools/fonttools
diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
new file mode 100644
index 0000000000..2e79861e2c
--- /dev/null
+++ b/package/python-fonttools/python-fonttools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fonttools/json
+md5  fcf1425460855b5892c990027b5396c8  fonttools-4.28.2.zip
+sha256  dca694331af74c8ad47acc5171e57f6b78fac5692bf050f2ab572964577ac0dd  fonttools-4.28.2.zip
+# Locally computed sha256 checksums
+sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
new file mode 100644
index 0000000000..9ec369d550
--- /dev/null
+++ b/package/python-fonttools/python-fonttools.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-fonttools
+#
+################################################################################
+
+PYTHON_FONTTOOLS_VERSION = 4.28.2
+PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/3c/d5/f722e0d1aed0d547383913c6bc3c4ff35772952057b8e2b8fe3be8df4216
+PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
+PYTHON_FONTTOOLS_LICENSE = MIT
+PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
+PYTHON_FONTTOOLS_DEPENDENCIES = host-python3-cython
+PYTHON_FONTTOOLS_ENV = FONTTOOLS_WITH_CYTHON=1
+
+define PYTHON_FONTTOOLS_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(PYTHON_FONTTOOLS_DL_DIR)/$(PYTHON_FONTTOOLS_SOURCE)
+	mv $(@D)/fonttools-$(PYTHON_FONTTOOLS_VERSION)/* $(@D)
+	$(RM) -r $(@D)/fonttools-$(PYTHON_FONTTOOLS_VERSION)
+endef
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
