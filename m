Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152A0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A350E40015;
	Wed,  8 Nov 2023 23:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A350E40015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSkS85MJzpWl; Wed,  8 Nov 2023 23:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87FA040296;
	Wed,  8 Nov 2023 23:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87FA040296
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9CE1BF29D
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 449C560E27
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449C560E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5utikjO0QsSK for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:47:36 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56EC060E22
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56EC060E22
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-35749078a59so1181015ab.3
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699487255; x=1700092055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ihqVxonzwxfy8EJ6CdtKPS4bvueZmRpngF4ZWPhQ1L4=;
 b=aiWyT2E3X8B094QP4DL57h+/LFec4qKzZTSI/TMHQDVKezH8U0PUr4jt+JcI5ddcmB
 fMxPnKSiweMzGfQ4ZCbo/b0KJukk7M5zZFYyC1AvCAdb1hNbHRYU4IY2ebMGzpJR4kRP
 rUxq1cd1OHHGSUc9LpTHIL0D3IZrRnwntb7npgKmU4DRgbHIMlYTPC3LQJoKHkkiFlfd
 vcWlsHW6vMVsCgTDSv3Lu3siUlNIr4wmnepdyNZ5k7DGZefMy/0DCZrYtDX9XoL3FU1B
 Ck6MZPiXufddvWEPqpZeK+S2HiplUUn5247+VvoN8Qe3o5/zGazZLtO341hO/4gdZ3jc
 IDtg==
X-Gm-Message-State: AOJu0YxYxzltQ7ZMvQQfNhS+8iw0GxvMEzbpbwFeVCb/oXf6Lexcd3el
 bmegNODapT7LkxlEnPDzczUOK8+xIAE=
X-Google-Smtp-Source: AGHT+IEWJSkppCiySGtw+usVW4zmRDqH4pRHFA0R/vSDA0Vx4X8gKAzr3t0W33QVBI8kyXFvioILIw==
X-Received: by 2002:a05:6e02:20c3:b0:357:a640:3235 with SMTP id
 3-20020a056e0220c300b00357a6403235mr4387245ilq.29.1699487254991; 
 Wed, 08 Nov 2023 15:47:34 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 t12-20020a92dc0c000000b00359d1a8ce74sm65677iln.40.2023.11.08.15.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:47:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:47:32 -0700
Message-Id: <20231108234732.3654779-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699487255; x=1700092055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ihqVxonzwxfy8EJ6CdtKPS4bvueZmRpngF4ZWPhQ1L4=;
 b=VJw5lRujNXNtHyn/+okNBQ1w81riQBhSsbf5e8/cpjS51++ZfbCfwrUOGJP2y8RChr
 JM+pW1oXQ4i5hWVSz+SpoFPauVy8LfwaGAPHYLfkVyGUNLvoEpGphfy42MD1xp9FUAcT
 ivgl2jltK9oJwcZunkq7UTSe6XCpbKR9WLGL8al2nONGR6h9yB9PWfXuAP7cjLAn6KF2
 hZB/Av6cXXmr0zQIJHVismIckmzBqnzcqIAgPy+2DP6xuvACoRXa/7B11vsyBmuQ2aT3
 pZNQNu/eFxrcEQAy7akJzzJwZ+QLo7r3qzKN7/IemvfjRYEE+6yeV5qKAZWMQ80ayE1k
 cxFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VJw5lRuj
Subject: [Buildroot] [PATCH 1/1] package/python-modbus-tk: bump to version
 1.1.3
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-modbus-tk/python-modbus-tk.hash | 5 +++--
 package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-modbus-tk/python-modbus-tk.hash b/package/python-modbus-tk/python-modbus-tk.hash
index c486e49715..c7f4ac2dd4 100644
--- a/package/python-modbus-tk/python-modbus-tk.hash
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -1,5 +1,6 @@
-# sha256 from https://pypi.org/pypi/modbus-tk/json
-sha256  893514bbd8c92118d20a19979e0239e7cb2a63f8f1795a0271e57def09d11770  modbus_tk-1.1.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/modbus-tk/json
+md5  2e66c361d3e4591a19be1259ef50fdf7  modbus_tk-1.1.3.tar.gz
+sha256  690fa7bb86ea978992465d2d61c8b5acc639ce0e8b833a0aa96d4dd172c5644a  modbus_tk-1.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
 sha256  aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
index 30056bb207..d8552e57a6 100644
--- a/package/python-modbus-tk/python-modbus-tk.mk
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MODBUS_TK_VERSION = 1.1.2
+PYTHON_MODBUS_TK_VERSION = 1.1.3
 PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
-PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/ce/e9/30d86eb912bf868b8c97698b5747f10cf72dc26c674fd030249bc3275484
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/8d/9f/5963e30dba160dbc646b76c59ca8136709c7fe9002bbaaa3cf1e1bb0404b
 PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
 PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
 PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
