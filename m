Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202C4C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E6381764;
	Mon,  9 Jan 2023 04:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E6381764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E00omMUuB73o; Mon,  9 Jan 2023 04:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA37A81762;
	Mon,  9 Jan 2023 04:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA37A81762
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1341BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4610081762
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4610081762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTKwtYfCOTSA for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:06:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 516F681760
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 516F681760
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:06:06 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y4so4084814iof.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tLMy2c558eYUDKX73us5zd8A/qKhlTTyxfiHFjy19l0=;
 b=M9XVk/DRM7tz6Bz0qp7Lk0nJeKee7nkP9MuWjA95eqvV7Rn2h/buoW7uC65tibDtn3
 Rroaj+luWHt3Q0AdF656poOYLeEf6H84PiS0l4ViHEc9mq68Ks+V0cLx8o9MK4WQoDAH
 ME/gKaRcPhUcbbe7bVxgzlT6NLFBS0wrnYQDNtSkRM2qF/FZG3ixC2X3R/6DKDtPBFKT
 0GPkn0ZZIqDeshZloHuxvXzi7XzgkI+AavF6hFD9T8vhuF3YfRVMFauCnXDxL6oOvZgm
 FxL/jgaH3DBO7dkkhmdrNBChC9OSRRQSwPz2s4GT7VyUOpH0K+Xx3rjqZVFOIc1XcAjd
 g+Rg==
X-Gm-Message-State: AFqh2kqn1/eoJxKpEBdfzjRYKU2OPZSV+OPV6R0F4bXzNUhcMfQ0DJNv
 ug+ogZS9f9NAHdXDTMp9TNqYnQmRJ89qxw==
X-Google-Smtp-Source: AMrXdXsAxMUy/0gYGRO9Qlz0CPe/BmxyXTbBqSd7ERRwaDRNXZsfwSWJ2J2DPY82PHafpeIjpoFcqw==
X-Received: by 2002:a5d:9614:0:b0:6ea:b650:64d9 with SMTP id
 w20-20020a5d9614000000b006eab65064d9mr37664341iol.17.1673237165131; 
 Sun, 08 Jan 2023 20:06:05 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 w189-20020a025dc6000000b0038aa3699c9fsm2449897jaa.95.2023.01.08.20.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:06:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:06:02 -0700
Message-Id: <20230109040602.2259587-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tLMy2c558eYUDKX73us5zd8A/qKhlTTyxfiHFjy19l0=;
 b=WMsY6yAxB8vtqQi0X/hyIQIBAaayA8ZcSdS12wLj+ymkChnEdN+lVjVFEFkcbTicia
 vf/jAfc/siWtrDvYfc+sdWBIZ5IGX/vgg9ByY0KzdlS5y6PlNqQBxIGOEnzZelSVNjGB
 ChC6u7cvWc9xg1LEl6KDVC/W9NpfeCGEGfsZZzm3JZLztY1nEAZ714zl2OnDEV7H6CKH
 eo2Q4LXeet/nM+swAbdC7S73NuM2ahwzf/Suroh7gvtmQR+Nds2DbYqrWvLaZeR6DK26
 itpk3H5rfSjRrU2ZPQ5GYKgVq3NverHyUGSY9fVfeoCyEf7lGmJxERhbvRWSz16HuZxm
 /nhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WMsY6yAx
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 3.9.0
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
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to hatchling pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index f9e6bc03e8..4ef7afed00 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  d66099b8823ebbdd980cde0dae8f7341  filelock-3.8.2.tar.gz
-sha256  7565f628ea56bfcd8e54e42bdc55da899c85c1abfe1b5bcfd147e9188cebb3b2  filelock-3.8.2.tar.gz
+md5  40eeb4a2963e1b07b8eab12b5db08418  filelock-3.9.0.tar.gz
+sha256  7b319f24340b51f55a2bf7a12ac0755a9b03e718311dac567a0f4f7fabd2f5de  filelock-3.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 86f1220b54..02759935ad 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.8.2
+PYTHON_FILELOCK_VERSION = 3.9.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d8/73/292d9ea2370840a163e6dd2d2816a571244e9335e2f6ad957bf0527c492f
-PYTHON_FILELOCK_SETUP_TYPE = setuptools
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/0b/dc/eac02350f06c6ed78a655ceb04047df01b02c6b7ea3fc02d4df24ca87d24
+PYTHON_FILELOCK_SETUP_TYPE = pep517
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
+PYTHON_FILELOCK_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
