Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32325CDE03E
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 22:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAE9D40AF1;
	Thu, 26 Sep 2024 22:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjDf4WEMHaTE; Thu, 26 Sep 2024 22:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB404413FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB404413FE;
	Thu, 26 Sep 2024 22:19:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 656D11BF345
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 22:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61870606B0
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 22:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFsJ-7CvEKHd for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 22:19:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4813560011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4813560011
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4813560011
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 22:19:17 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-82d24e18dfcso63978439f.3
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 15:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727389155; x=1727993955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XWxzbBIvErwEOD2My/cTfe/7SJB5O4lQMCntnhAI+jo=;
 b=vvdLNm/FTtBUCQ3QbbzAUWgfP4z+/5yDkxq0UwxS3xu/Ay85V9sVZjJVUPgN8ENBGY
 MZjwArbQb/1M2mlhnXdcRwyp6TwlBRZD5aoKDc89hUT+cFBIgbGxX9SwisAn5J+XucJa
 JpgbG38YqOKr0qfws7Pejp6q5Xcd+rEW9so1zQblR/y/Z/wmyzXAE248MbJSDK7mq7VU
 cHTojeOT/SwpskDkKeVSU7lhnbGkgEm5J4sSkYciDlxFrKWxSr+96CzqBDSB206jGg4d
 2+ZLJanL8Fv+3lX4wUQVJsm8o+Z5A/Tik/MyWuBY/Sjg+NQjmBF6RQMdlg4n0FjqjZOr
 uimA==
X-Gm-Message-State: AOJu0YwcONHTXl2yIQImiZqkLXb4SwqasGQktShedK1qBlCHi+o9AOR0
 RzzkjchBMSdqUesrvJKpm1cOuqqhnDB8E4iHK14mCEBULlAlCsXWh7R+Vw==
X-Google-Smtp-Source: AGHT+IF4WCSfX/9QDNxwyirNK+C8EHdekh0Ifk8CY0aiHDuuNhAfikWFIM8FYTC3yl990rcTqoPekQ==
X-Received: by 2002:a05:6602:13d2:b0:82c:d67d:aa91 with SMTP id
 ca18e2360f4ac-8349318bc02mr163839039f.1.1727389155581; 
 Thu, 26 Sep 2024 15:19:15 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d888849dd9sm165447173.42.2024.09.26.15.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 15:19:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 16:19:12 -0600
Message-Id: <20240926221912.212859-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727389155; x=1727993955; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XWxzbBIvErwEOD2My/cTfe/7SJB5O4lQMCntnhAI+jo=;
 b=PW5QAivuotee1irPG2oizuTsYBBVLJULgJo3bra0rZ0QyIoK4Lq2Mp1wbpU3/HQS5v
 oy/9M8w+qOqV6oypcpSv5COENFEGeNqJVLXNrnSgSLpoAOY0o41Z3u8b1hN+5iV3obIr
 6GkMMNbmHyxHcCusCgjWs3WBlBx0b55eP/CPgzZMNi21h1VRS/47gYKUso2v1Tfw+m+y
 B/7/Q1TH2fruDyL/ARSfBTcI8jMgyFjkmMKswlA91W5v7vxYT+EqflDhvOgb/br5KXa9
 gz4SHJr4NuLiMRD4UPb66wciuYUd5Zya10/mnBC+NCF5G4rS7xu6Vsg0JAlxR5bfxCiy
 HpQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PW5QAivu
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version 5.10.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to TCL license added and reformatting:
https://github.com/ultrajson/ultrajson/commit/54497bd58386c1630dc0333f65b40157e285c329

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ujson/python-ujson.hash | 6 +++---
 package/python-ujson/python-ujson.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 759cafc250..153a49ca66 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  f93bd7aa33e3e6ed41c9e3782abe7b48  ujson-5.7.0.tar.gz
-sha256  e788e5d5dcae8f6118ac9b45d0b891a0d55f7ac480eddcb7f07263f2bcf37b23  ujson-5.7.0.tar.gz
+md5  7e61ead11ccf121cf4b1c121ec444e49  ujson-5.10.0.tar.gz
+sha256  b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1  ujson-5.10.0.tar.gz
 # Locally computed sha256 checksums
-sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
+sha256  36866344f0a486541bd9800f1a407a056c0c214a82c658f059694daf3dc394d2  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 3afd33cb5a..c6de382305 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.7.0
+PYTHON_UJSON_VERSION = 5.10.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/43/1a/b0a027144aa5c8f4ea654f4afdd634578b450807bb70b9f8bad00d6f6d3c
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/f0/00/3110fd566786bfa542adb7932d62035e0c0ef662a8ff6544b6643b3d6fd7
 PYTHON_UJSON_SETUP_TYPE = setuptools
-PYTHON_UJSON_LICENSE = BSD-3-Clause
+PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_UJSON_DEPENDENCIES = host-python-setuptools-scm double-conversion
 PYTHON_UJSON_ENV = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
