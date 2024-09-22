Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64085CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0836A8145A;
	Sun, 22 Sep 2024 06:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MXeQAHyNlTl; Sun, 22 Sep 2024 06:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 152F48145D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 152F48145D;
	Sun, 22 Sep 2024 06:55:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 843501BF86C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E736606F0
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OazxcwufBARt for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C23F60643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C23F60643
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C23F60643
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:55:31 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82a626d73efso125393739f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726988130; x=1727592930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mP0Fd71qotgEUhG6ydQy7qx4XR/DTpghCDQ1kL2XDOs=;
 b=ZvaiqEs/fPgtxOei/8QOhwsQ4ecmjqLIePX5nkPifphMaxNIX1cfYlBhPiYsSW6v0p
 NuP6Tr3hG17R41PlYKundU5U8gEo6cpHXBpxp3QTyuEXKg+vzs0ULaurBLISqjTyID+f
 NkfYsd8DQv5Mgo1oPsaQjpdi1LhbHlDPrGfwS25YswykA88WoBQrz8CFHnYHTBPR7cTV
 bID1LSMkydGErT+dmpOhwt6Kd2UrMLuGQp7XBg9rxj451E8tahVC2nkb0f1aAPXI2hZk
 mIDRZkoq6DTq+7Iob6ackaoIl7/Wjgz5fqsVZr5M1nRhLLMVSFy98Is7MKbdbqsXVsap
 EVSQ==
X-Gm-Message-State: AOJu0YyLcwzEp7Gxa315MFv9XaVtEEjlvS9CyM3TjTLZehOyKFomF3Q0
 UhyXeSut2Vg67tNOBKci1WX/wrCzknIQ8U9VinKRnQab+qSKNJyz2OWqbA==
X-Google-Smtp-Source: AGHT+IHmdPZM1KLcG0WnwoyEk9OynHYD3Zya0ho+tGYtKj7CP79ipcgC3r00fKdachXJwax4qxq7KA==
X-Received: by 2002:a05:6602:140f:b0:82a:ab20:f4bf with SMTP id
 ca18e2360f4ac-8320b25e15bmr795673639f.1.1726988130237; 
 Sat, 21 Sep 2024 23:55:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d493389c8sm481422339f.44.2024.09.21.23.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:55:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:55:28 -0600
Message-Id: <20240922065528.983884-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726988130; x=1727592930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mP0Fd71qotgEUhG6ydQy7qx4XR/DTpghCDQ1kL2XDOs=;
 b=GTE5ZOb5Fxu4HgC5zLMA/9/OEhnReXYrhnXHvitjZjNtd6jNHkLEX6zWSF0jVCmjA9
 YOslivdGnZ1iMI2TW75/as+/Sx3gZaMdEuvoHlJb0seZ/B5K9dzXLdFR6Y63ydKYegTn
 0U7hVgOgfBS16z3qagmk5dQhZEPJD3yjXDie3tkrpW01oejvpuB3RTJ/0dkLguwK5uCL
 CIuay0jlmRwthQQ7WcdSPKCuZX9YYJcRtNHINXWmH3otiy+kVl1i3Hr/QrcphYLd/CVt
 oxv4MFI4ngqZqieZup/VG649kAfb4wjGffvL4TPcgjgBFtP8skT9tmWAubKgyvEdzenz
 qiiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GTE5ZOb5
Subject: [Buildroot] [PATCH 1/1] package/python-xlib: bump to version 0.33
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to formatting changes:
https://github.com/python-xlib/python-xlib/commit/b04e96a39b8ae0b82c52d0385d1edc1d8f96cb6a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-xlib/python-xlib.hash | 6 +++---
 package/python-xlib/python-xlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
index 066f450416..f516d7b4c4 100644
--- a/package/python-xlib/python-xlib.hash
+++ b/package/python-xlib/python-xlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-xlib/json
-md5  ba31623fb64a1e5a0b1ae1f6495c3bf6  python-xlib-0.32.tar.gz
-sha256  20e1382f8a98d8ed0facfa45415c46fd0c8eeb6f9996e58c22d3382a4ed6e37b  python-xlib-0.32.tar.gz
+md5  20a687ac84ee632aea9b9861206aa0eb  python-xlib-0.33.tar.gz
+sha256  55af7906a2c75ce6cb280a584776080602444f75815a7aff4d287bb2d7018b32  python-xlib-0.33.tar.gz
 # Locally computed sha256 checksums
-sha256  06eb1c441443cf15ac84f309003f4c43c62246939d37c75fc3e056c2d34cd300  LICENSE
+sha256  3bb6f6bec94b99e2927a8880bf49c401f5e8f48a20ddea96310860264cae20b0  LICENSE
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index 32f16e5d66..23c7b39974 100644
--- a/package/python-xlib/python-xlib.mk
+++ b/package/python-xlib/python-xlib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_XLIB_VERSION = 0.32
-PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/4d/cf/a29ecb43a5c84a65ffd726e3b28806f56b3bc5e796ddb533ff52af107dcf
+PYTHON_XLIB_VERSION = 0.33
+PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/86/f5/8c0653e5bb54e0cbdfe27bf32d41f27bc4e12faa8742778c17f2a71be2c0
 PYTHON_XLIB_SETUP_TYPE = setuptools
 PYTHON_XLIB_LICENSE = LGPL-2.1+
 PYTHON_XLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
