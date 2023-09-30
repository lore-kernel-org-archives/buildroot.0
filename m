Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4401DE77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 12:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6B3A40004;
	Sat, 30 Sep 2023 12:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6B3A40004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LyjrRWYMMY1Z; Sat, 30 Sep 2023 12:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB4E840108;
	Sat, 30 Sep 2023 12:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB4E840108
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4023E1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27131416C2
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27131416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oI4OuP1hKy-Y for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 12:55:38 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF62641602
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF62641602
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7a269637b98so74731739f.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 05:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696078537; x=1696683337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FQQbs4DaQE0pjrAQ11kqAuP7G6E2QyD6uGcg+GH+ob8=;
 b=tlcK1L8J0o6gq6LfYnkoC36Mzsyzp7rYpiS1azxyjQOo6hlNBsTetqfuBKtVw9t8TU
 WrMqYLANuWpyFm8d8rTdFXN7VhHLI34V6UJs8PKnNAotVqg1tyadye4JP5dX5krNyYLS
 YYALVVj75L5VELJ1JG4MHD+m9btLbhaFrW8FC63SGOfUUcuqvnfCYPwl+eI2UuAY8rky
 MkhAIJ7LNWIWIOgoBq+otwlfoiiSWAu1RvDLQAmlcvFpSr0+xB+ozBRmkq1ST3EZT31v
 z0KMRmC0h3/qD9TziWk3gfoYgklcuxErhdbDiyQre3wW8P637zSYozUyBSLwQWNifFk1
 4IUw==
X-Gm-Message-State: AOJu0YxabxM6qP8BaqzLxad35k2pO49D5DYHnPmwZDPutLvwRVW9yGBY
 EH+dpg+rPeZP+43KCwP52WOZayTWl8Ne8g==
X-Google-Smtp-Source: AGHT+IGTzdIFmwwfy3+iLStc8/oEvl3g1wUuyGQhBKqbsVGnwWRk3CQ5kxxaHznS0KdWpXEn7d4yVw==
X-Received: by 2002:a6b:7f42:0:b0:795:16b8:8601 with SMTP id
 m2-20020a6b7f42000000b0079516b88601mr7097692ioq.0.1696078537269; 
 Sat, 30 Sep 2023 05:55:37 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5e8a42000000b0079ab2787139sm169775iom.7.2023.09.30.05.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 05:55:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 06:55:33 -0600
Message-Id: <20230930125533.906284-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696078537; x=1696683337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FQQbs4DaQE0pjrAQ11kqAuP7G6E2QyD6uGcg+GH+ob8=;
 b=ddmwTRr5NRKeZ6a3E/h0z/yvfIt/TdFLNKudJctb4s7F83v+Kple2IKuc/p+s6Hv72
 auBxsn/M94f825YzsMveTkDwdq13qKBgJ4X/Eg1Gj6fruADmgCxhh8HW1iTBT+4ohOoG
 U1k15DYzBhaG4aqFwI2ts9np/iRLDGnqgRf2iPyqfnouOfsrY+5BxdHY2y3XDnVsUD6c
 b08JQBtywv2PvMD2OnA8Dw1UDc6r52ROEseTeyasGjsCF0UYc0GxNfJTBckt8F/cKeTj
 RykVFl/iwGwOAIFBmzk+9ML8LNrlWnP6YCJyKTV4u8NoJ+giA1P2M9tHIDbAHGlWot+A
 D/Gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ddmwTRr5
Subject: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to version
 1.0.3
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
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index 9da56f9f68..6941f2c012 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  742e7cd0a67455c1df90061b42088bd2  build-0.10.0.tar.gz
-sha256  d5b71264afdb5951d6704482aac78de887c80691c52b88a9ad195983ca2c9269  build-0.10.0.tar.gz
+md5  45f216f02135c6acb486ba325e8f8da3  build-1.0.3.tar.gz
+sha256  538aab1b64f9828977f84bc63ae570b060a8ed1be419e7870b8b4fc5e6ea553b  build-1.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index d7c03323b7..266720a555 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 0.10.0
+PYTHON_PYPA_BUILD_VERSION = 1.0.3
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/de/1c/fb62f81952f0e74c3fbf411261d1adbdd2d615c89a24b42d0fe44eb4bcf3
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/98/e3/83a89a9d338317f05a68c86a2bbc9af61235bc55a0c6a749d37598fb2af1
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
