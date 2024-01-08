Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36722C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 06:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D329260EC3;
	Mon,  8 Jan 2024 06:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D329260EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AnKsTh9yVf0; Mon,  8 Jan 2024 06:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3628960E86;
	Mon,  8 Jan 2024 06:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3628960E86
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 418311BF387
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1632941609
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1632941609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZIKxBmuzE4q for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 06:55:25 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2858941601
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 06:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2858941601
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3608bd50cbeso2798785ab.3
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 22:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704696923; x=1705301723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IdRbyII9gJV5/lKnrSWaZPlgGxXqfH4ToC1QFIp9Oew=;
 b=p41sgeC1j6XHrAldg72kaqSpXF6Mko3wWZcRtfeFE3qeRZ+UKuioCtWjW7XWfmQgue
 LnkGL+Bbc+otLO4LauLC0w4oDiFvAU0AnblbJRWR+u19+iuEY7XTmR9R2uutdD/WhByp
 x57TwLmvOdlbB6lYl++s63zhYCkSrITqh5+GN9ME3Jh3lL4DjODhIxIv1YZXp91GFRl/
 lW9Lc/QInsp4p4dJFyZZQtEmTKX7wuKNJEtv20Eb12aHuzTTUmMd5lmhJcV4jVH2iSLi
 7v7TDW6UrgLB5RSDwslNoqJkVAE9xGjSBIkVueo/TaFLSQdduOzRvAEKb9cQeFA1HsUj
 R/Lw==
X-Gm-Message-State: AOJu0YyMgN4hNBf6wQsFlksyHGavJoNhp7bsUxZb3EkbQwI4wAL/fepC
 RMEELy6fUhPmVDRvEbfKNoIcufxk2mUnyA==
X-Google-Smtp-Source: AGHT+IHIUooIT77wNJKMsl8fPgvdXziyqgLvXNsxJ4XL/+gGquwL/RROdr42sXk4r2/4KBJ1YaFs8g==
X-Received: by 2002:a05:6e02:2163:b0:360:6aeb:1074 with SMTP id
 s3-20020a056e02216300b003606aeb1074mr4336645ilv.14.1704696923639; 
 Sun, 07 Jan 2024 22:55:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 y35-20020a029526000000b00455d85d6656sm2049838jah.173.2024.01.07.22.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 22:55:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 23:55:21 -0700
Message-Id: <20240108065521.3455564-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704696923; x=1705301723; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IdRbyII9gJV5/lKnrSWaZPlgGxXqfH4ToC1QFIp9Oew=;
 b=aug1vA61liwJQORr/tdMoG6yoV2mVyvfNrTVTKstfWQxnTaz5bqOSvefUlZY1MiM0F
 rA+nxzWXc5hLCEUcwAxKHA4baTOvFf56QOVv+9NYoUvcoOwb8OzX1p5HJZLPOTRmgV3/
 JhUgjOjyJl0RwYVIl/X/J+wWuZtHWyJhTjvJBWaq05bP0eibhnOCq3J1qF4fEbknrLKJ
 fwsGMU5h/+1iqRKDppitU2xOdBDVD+VqGwA+Z0TYRd23dcCq6kVGhKBOPgvEh0FznBrT
 N9Bf5m453WpFTKafWREd1GqINJuGsGJGWifQMBg4DK1Vubx6C997plLQaMQ6u69kHf1N
 SYwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aug1vA61
Subject: [Buildroot] [PATCH 1/1] package/python-argh: bump to version 0.31.0
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
 package/python-argh/python-argh.hash | 8 ++++----
 package/python-argh/python-argh.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index 8bfb45d1c3..bac9df42d6 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,6 +1,6 @@
-# md5 from https://pypi.python.org/pypi/argh/json
-md5  7001dd9ff619cf1422ddf8bf813bd08a  argh-0.30.4.tar.gz
-sha256  9fca8e69c4dad4f8d2a7bdfbdd80b0754462b53510a03e1b5cf2b43a87e6e960  argh-0.30.4.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/argh/json
+md5  2659a6353589156e6aa65a99797f8913  argh-0.31.0.tar.gz
+sha256  b93093544309ddbfe6c73dc9bfd60dbc4acecef39f3f464774b3084a1ec5d7b0  argh-0.31.0.tar.gz
+# Locally computed sha256 checksums
 sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index ccb9f61d48..0da3281d49 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGH_VERSION = 0.30.4
+PYTHON_ARGH_VERSION = 0.31.0
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/37/3a/175f4a2c47e8c20e59cf25fe69546f76cf1196251a377b182e8f4542b4c4
+PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/7c/3c/1b7f3fab380c96d61119178040c0183161fe0f182c4da3933bcb3284538f
 PYTHON_ARGH_SETUP_TYPE = flit
 PYTHON_ARGH_LICENSE = LGPL-3.0+
 PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
