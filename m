Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8654C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 15:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 562EB40242;
	Sat, 10 Dec 2022 15:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 562EB40242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rDwG3_PXpir; Sat, 10 Dec 2022 15:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 448B040245;
	Sat, 10 Dec 2022 15:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 448B040245
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1A81BF5A4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 15:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 122B4817A6
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 15:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 122B4817A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4M5imzzmhF6 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 15:40:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D14481776
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D14481776
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 15:40:28 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id d123so3598351iof.6
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 07:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=78hqJUGX849vkXRwZwrrvc1hYUYLNaAFtjdA3yK3z/4=;
 b=57qWfP+tL8GE8PfgTc0esX7l+0nwfuB3UOxJITp3a0dAh2bLduP1Sox0m8S8YOltOR
 JVmwbWgdew3h6e6MxfoAUIeYB5DqJRpX4WJ6TxVTTtEveraFqDN6dWDT4p8s6VVqad81
 HCRffDC3NMOAwCP99t4MW6ElOxv9JDHGiaCvQwe1CGcOrTo+vk24TFQB/tg9DIo7BIm0
 TGeOU4dkpJpIRMkHt0bGcufARHK+VBee/Wq47uTBjeKo4VTKW5Whf9lJgwSEz1l3NwIS
 KFx5iDCOCVIaIrbcrc4I2pRcyNB3mf7jOI3Bux54Qznft3sytZ6ToLp1BCd7UHWzKw42
 +BVw==
X-Gm-Message-State: ANoB5plHxM/lW1Cw0KjaHwJ/HdgcFDgyfkA0AQWwhKOO5xhFeFcwnhaB
 t5nNAABM/fH6jDUWR/X2s846OXxx+t5urw==
X-Google-Smtp-Source: AA0mqf4Egm0Y1Qxdm75kkAs9I+4zwFBGc1kTBEjrMjuagy2Dk3VHYSPk6z65+4WtlX7TsrmX1Lgagw==
X-Received: by 2002:a05:6602:2289:b0:6e2:dc1e:527b with SMTP id
 d9-20020a056602228900b006e2dc1e527bmr4264867iod.19.1670686820068; 
 Sat, 10 Dec 2022 07:40:20 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 s70-20020a025149000000b0038a44dbbd8fsm1503850jaa.123.2022.12.10.07.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 07:40:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 08:40:18 -0700
Message-Id: <20221210154018.2364208-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=78hqJUGX849vkXRwZwrrvc1hYUYLNaAFtjdA3yK3z/4=;
 b=d1e92TM8HhOe+U6YZqWXg1lCjZng238YeCu/QnSyUXI2GuEW/ZB7te3mDuwso5dzzR
 kfEYlAMR8DvLNFpdPVR2cBVm/gsJbbcGeQ21Wwnwf1aJh1178Zl4VeZxe2w4bix8C38U
 ToCQz3E91AIEmsbwWEWuQf62uDZA0Ta9mvs4AI0dxMI6/IFEYOjXYGM1MM8beV+2Hl6e
 X80BHT1V1CCulRpAeQWM88pP5d9vXBzX1xkAPuMbIq0+1FRZ9n8GcLk0gt1pwt+fRAR7
 2wFrvoflCKy6ZVYNmAE+1P+yRbzFbp7jaMGOHMzUe1JlsOD/5sja2qm+vElyZccFYhkG
 f2Xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d1e92TM8
Subject: [Buildroot] [PATCH 1/1] package/python-installer: bump to version
 0.6.0
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
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index 543bd0fa62..97d455b87c 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  bf17db5e6b58c4cfa33642f5348d3814  installer-0.5.1.tar.gz
-sha256  f970995ec2bb815e2fdaf7977b26b2091e1e386f0f42eafd5ac811953dc5d445  installer-0.5.1.tar.gz
+md5  ac5fee994b04f228c151306f5ad96b04  installer-0.6.0.tar.gz
+sha256  f3bd36cd261b440a88a1190b1becca0578fee90b4b62decc796932fdd5ae8839  installer-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 08f17499dd..3430e46b51 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 0.5.1
+PYTHON_INSTALLER_VERSION = 0.6.0
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/c9/ab/a9141dc175ec7b620fffe7e0295251a7b6a0ffb4325d64aeb128dff8c698
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
