Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF8AC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 06:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED28A60EC3;
	Mon,  8 Jan 2024 06:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED28A60EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ER4HFpAf-8t3; Mon,  8 Jan 2024 06:27:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4792260AEF;
	Mon,  8 Jan 2024 06:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4792260AEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DAB41BF387
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F98960AEF
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F98960AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3HlmhTf8lPb for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 06:27:36 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2821A60A7F
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 06:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2821A60A7F
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7bb982d0f12so63781739f.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 22:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704695254; x=1705300054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aeVyotZvauIbKHCU5diR1mxYoxLKAgdk7/RTFH6a8eU=;
 b=qPSM6lCdh8caoDc6GuRo5Lf+vTPPoOukrmGQTZ8rY6T1nVcpP9PCMeRDlx0H1RmcyY
 i7jht83H2KdVDuBvMURltnCPcpULUu/etj3F3BDIk+uBB4wnuoEqy31pksFFBj5O5xkx
 Pg1qppyBWALSFmBaf/pYf7LcXy+3p8o72LHDBumZ7Ae+7Tagjv7AaxnHzES/x3B9HNQO
 S6tzQklom+cb4fqYIczEu89fjxzeKqNyTOJYOfgF3CFq4vO5hm2vmPpHhWoGkjY6wsDx
 Ns7+s/hs81A97KmO8pxd7tX5r12hq+XJmmhrSAzl0ksnGdGUmCwwq1GeMcEP1cM2fsER
 CJBA==
X-Gm-Message-State: AOJu0YxMOU1AoO68pesPb6sRfW96rvN1/OFpua7fB5MmqvGNPffRLIfH
 h8/dPl/iAFYPtam2/1cln61iQlVhc2yYyQ==
X-Google-Smtp-Source: AGHT+IGavTl1ZaXpxlNFxsI7CyFC5Apop+LCtV3CkMbIKNQd/ucH+WGDK4dL7EW9amFjoksrrPJ36w==
X-Received: by 2002:a05:6e02:1d0a:b0:360:8cad:8184 with SMTP id
 i10-20020a056e021d0a00b003608cad8184mr1301223ila.7.1704695254602; 
 Sun, 07 Jan 2024 22:27:34 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 g10-20020a056e020d0a00b0035fb79100cesm2327594ilj.59.2024.01.07.22.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 22:27:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 23:27:32 -0700
Message-Id: <20240108062732.3440582-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704695254; x=1705300054; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aeVyotZvauIbKHCU5diR1mxYoxLKAgdk7/RTFH6a8eU=;
 b=US6Zocdf3rkIpxss8E+qkN7zkrmV8ZRECAKNpLnnFfVm/sqdoyvAKvhZpn6GCadfWJ
 M+Mj1kfs2ImhBxPa/ZlJbZU0sF0rr5PeIwKlwOcrNUIlw6wYqDtfaKaV+GCHfX4iTB2M
 6bNLPxUhllwLShMHFe+UPUaadKl3VdEgnrerNR/vVDNT62z5OjIJVtzmBIx+oFDWX5e7
 edbxCa/Q9dL60LAyWTR2u9TxBGHqoqG5ASpZn7ZZ2bytyLhVpZyquB1EOs6yVfSv9QBu
 w462gmqrnbTz4jEO300EXaizkGDodD+wPO3gZX+hF4HBJfQktKq8mBSQSn3rBKgvWqAu
 Mqfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=US6Zocdf
Subject: [Buildroot] [PATCH 1/1] package/python-aiojobs: bump to version
 1.2.1
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

Drop no longer required python-async-timeout runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiojobs/Config.in           | 1 -
 package/python-aiojobs/python-aiojobs.hash | 4 ++--
 package/python-aiojobs/python-aiojobs.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-aiojobs/Config.in b/package/python-aiojobs/Config.in
index 2dc4f3f955..0cdd1c106f 100644
--- a/package/python-aiojobs/Config.in
+++ b/package/python-aiojobs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_AIOJOBS
 	bool "python-aiojobs"
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	help
 	  Jobs scheduler for managing background task (asyncio).
 
diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index 8920e3aecd..baaa61b331 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  529a4367f9bc63a482a2962ba54bfd51  aiojobs-1.2.0.tar.gz
-sha256  a4bcfb6a2d21ad08dea904e9f73040b37657d0c33cc8d77e683e47de5fcf0b12  aiojobs-1.2.0.tar.gz
+md5  d4742018c2188147f1efa41645b5758b  aiojobs-1.2.1.tar.gz
+sha256  59d6e7ad7829e9d0f73bfceeae28153b541be6b0959a08cc5ceb222717c888ff  aiojobs-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index be0acd3fbc..9e4a55e13c 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 1.2.0
+PYTHON_AIOJOBS_VERSION = 1.2.1
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/c4/e0/4685393810a267c09edef41ddafd0dd28108d95e1b91019b1843fc6e5b83
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/07/ad/e4240f9225022798e0e651ced8f6dc022e88eae4f2df6e1482a8f3c0d54d
 PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
