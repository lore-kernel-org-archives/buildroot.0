Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274A0C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C299F606FD;
	Sun, 15 Sep 2024 04:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3XYhdwjAMe3; Sun, 15 Sep 2024 04:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF5D8607E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF5D8607E4;
	Sun, 15 Sep 2024 04:05:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDEB01BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8F5840688
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38lTbLStww5H for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 854C9405E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 854C9405E1
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 854C9405E1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:05:46 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a08dbc6019so9467855ab.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726373145; x=1726977945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ha4uxym310wqHdZv3bt1pF5WABWR5qwq1UMp5mX3hA=;
 b=BY6I1PA4s3vobg9OK9HDzG1fQ5Tt8sQK7/ogdRznESth9reW9elTyS1Tjjj9Jyb5/Q
 pJL1F4kFTXQCzziHtNtPnvK4jiOqIiJt5dP/lMHfS77YaVZkNppKdBpaGo5jwkwPcuV1
 H2iCpoboLJ51SMSsgdEcUNTZMGfDjX71bNAqQZPcbsHefW+C9RTmMQqC1GysGACx3Iue
 GPk2roLsuWenqfjMUx4ZMf9u5olQrmBxuY/V0u629gsVyFu5wf62H/WKWwtQoHLOkdKh
 3KqnkkvO2RN+Afpz7aER9GPmF3lRp7ZsquGBUaV8gOnzP/mrvTcXJYHrAxbO9SjystD1
 xjKg==
X-Gm-Message-State: AOJu0YyaLJv7UePYCduHYyPeBYZyi5pa8vJK45R0zr1swGPz0wQ9o0oa
 kTJVxRhtjnWrW1x4p6kMVGWaitk1b9ss4A8NNcyeRJy7H8TZp4P8gbsu8A==
X-Google-Smtp-Source: AGHT+IHmgMZqj9rdApN5E+RkrOC4BH4oDyZZ93bp23xhTK+ghoi/Nqu4oA4foIthCoAw9Ic3jNRZdw==
X-Received: by 2002:a92:c24c:0:b0:3a0:4b2d:78d7 with SMTP id
 e9e14a558f8ab-3a084911895mr123093665ab.13.1726373145539; 
 Sat, 14 Sep 2024 21:05:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec17d54sm739631173.40.2024.09.14.21.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:05:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:05:43 -0600
Message-Id: <20240915040543.1382214-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726373145; x=1726977945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+ha4uxym310wqHdZv3bt1pF5WABWR5qwq1UMp5mX3hA=;
 b=QnoQXtv1wT+OVC1uctaIhfp8HbAFddHH3dnIWYzRYeId/6ZTVYpcSzOtvWdnLV4s60
 KbWxIpRR715j3BakvUBuITWsByCZtJU584Ii3TyOYQfGTto0oqK35QjoYsEJ3gtzDj7F
 hTi8ZBobRqtTIgqOQXTQE6OV+R5datcqczwppFm6OpvYNvpZ7KCQXGUnA5HLrgA1AkGU
 lbLwHi1nzswtoPuSc+OSWT/SX80pO/VS4vjkUeUkCOogvk8+k2OdAVKZ0/McXbZTtXGb
 lPJHnwf9P43bXXAWPKLalz/FX/4Z3HCp9ri2UMXdKlp7RjN0jLaeaBlB5PfEXrAvlgwd
 H3qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QnoQXtv1
Subject: [Buildroot] [PATCH 1/1] package/python-colorlog: bump to version
 6.8.2
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
Cc: Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index 9df94b19ba..8750149f75 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  805e982037ba071d3d42c3d53cf73fd8  colorlog-6.8.0.tar.gz
-sha256  fbb6fdf9d5685f2517f388fb29bb27d54e8654dd31f58bc2a3b217e967a95ca6  colorlog-6.8.0.tar.gz
+md5  0e1097df510644310e09593929e89096  colorlog-6.8.2.tar.gz
+sha256  3e3e079a41feb5a1b64f978b5ea4f46040a94f11f0e8bbb8261e3dbbeca64d44  colorlog-6.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index f96318ce5a..5289c08cda 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 6.8.0
+PYTHON_COLORLOG_VERSION = 6.8.2
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/1f/b0/e4e3850d43f5429f9e53404056d705117fbb8a4d9e755425e762a9f68317
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/db/38/2992ff192eaa7dd5a793f8b6570d6bbe887c4fbbf7e72702eb0a693a01c8
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
