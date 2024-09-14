Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22513C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C17CD402E1;
	Sat, 14 Sep 2024 21:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMDhpQ9-ODrs; Sat, 14 Sep 2024 21:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 401F64021E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 401F64021E;
	Sat, 14 Sep 2024 21:57:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE7E1BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15DF04021E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_ZOnXmLOExr for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:57:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD6A9401F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD6A9401F4
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD6A9401F4
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:57:30 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82a626d73efso119774439f.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726351049; x=1726955849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJnD8bwiXa6jyMTD7Ka4u0zZSGvbkBPRKJCGrbKofF4=;
 b=dbU/QO5uNm//kRtU4jxckFcWvrM87315cqs6Ga7gWkciesQkYHTYuwkIZ2gYQuW69A
 HsEKFuVmedEgQ7YFygNiwmqrM4brVCP1wZ/TtLtoXsbVqXOwSv06zuBeyd0GnzuCTFea
 3wQBywlDD9XqPTjdHmEmq1X2whAQqE3Z5VDru6xNy9XJvNDPQazp00o6c+pFxQ+0LAuk
 kn36qwtbJ1PbzHpc/v1OrXCwbX6XNlS1Ia+A4Ki/n9E11RpGdOmTFjl6O1NYgdrmTNVO
 N20YDRa8cDIeGS/Ax1TPHj1tJGjiMMJo5Kuw4UPRhgtak4B+Rhh4FQ7y+zLupmVVT0yP
 LkzA==
X-Gm-Message-State: AOJu0YzWKIRT47+/xX1vCQMPiFtEKjlkulQBHKwi4Laq/21weOWGtsAS
 BZCNwau25/LwyPSS2WaBVjEOiOSQRqqpOqMCfuTa/vcgZhVRYzh+XtlMRQ==
X-Google-Smtp-Source: AGHT+IFeWV34a2pg137fCdXiwECa7cVue6znyHwOrNo0H8M34ZCFZiuPsJ8MCzgjskgz3V0PegVC0A==
X-Received: by 2002:a05:6602:1495:b0:806:31ee:132 with SMTP id
 ca18e2360f4ac-82d1f8e3c96mr984539839f.4.1726351049339; 
 Sat, 14 Sep 2024 14:57:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492694a5sm59231339f.11.2024.09.14.14.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:57:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:57:27 -0600
Message-Id: <20240914215727.1332306-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726351049; x=1726955849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fJnD8bwiXa6jyMTD7Ka4u0zZSGvbkBPRKJCGrbKofF4=;
 b=FP301ctHRf5UCaawsS4Z3Poqbu8a3O6tSwyYWhaAZ1OAgMSNQWImGZzS/ydSVubInQ
 9q9i4MwHgyYDZdfo4qecVQmKOh8DetuUwVw99S5uAYZlYhzSQOlPxjH7Y5Gr+tMrvksu
 1llj5x6qiSmGyM3ii/4JHapZ4pn/rz5h+rihp0D1ru6+l5N007IgGot0BB1SgdfEN3f6
 IGzIj9+aSNVZjzcOxocXExSMPJHx5zrLMWTavsiK5/UaOn5vS8K4XOvaEv7DQGh++MJr
 3Eeew+62rE8jIl7tRmemiHcGp8EBNW53plDs22x8MVLXVloK5fTHIAZmFiTHLwax/8xI
 v3CQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FP301ctH
Subject: [Buildroot] [PATCH 1/1] package/python-babel: bump to version 2.16.0
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
 Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-pytz dependency.

License hash changed due to date update:
https://github.com/python-babel/babel/commit/40b194f4777366e95cc2dfb680fd696b86ef1c04

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-babel/Config.in         | 1 -
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 7 +++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/python-babel/Config.in b/package/python-babel/Config.in
index 1a22b83f2c..4f66404a5f 100644
--- a/package/python-babel/Config.in
+++ b/package/python-babel/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_BABEL
 	bool "python-babel"
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  A collection of tools for internationalizing Python
 	  applications.
diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index ab4e022564..cb41750386 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  3bec3f4c842144c15d839bdde41a44d4  Babel-2.14.0.tar.gz
-sha256  6919867db036398ba21eb5c7a0f6b28ab8cbc3ae7a73a44ebe34ae74a4e7d363  Babel-2.14.0.tar.gz
+md5  1dbf17974d7ccc9950757ed3c9618db0  babel-2.16.0.tar.gz
+sha256  d1f3554ca26605fe173f3de0c65f750f5a42f924499bf134de6423582298e316  babel-2.16.0.tar.gz
 # Locally computed sha256 checksums
-sha256  908e0ad72053ae27c1d17e3340bd14cff9bf935992ed56526d17c983ab6e7af7  LICENSE
+sha256  3f9142a40859dfcb33f45c16ad872b500d683cc4a20b17091478b404e900520f  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index eb39b9aef7..dd10abbfa3 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.14.0
-PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/e2/80/cfbe44a9085d112e983282ee7ca4c00429bc4d1ce86ee5f4e60259ddff7f
+PYTHON_BABEL_VERSION = 2.16.0
+PYTHON_BABEL_SOURCE = babel-$(PYTHON_BABEL_VERSION).tar.gz
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/2a/74/f1bc80f23eeba13393b7222b11d95ca3af2c1e28edca18af487137eefed9
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-HOST_PYTHON_BABEL_DEPENDENCIES = host-python-pytz
 
 # purge locale data (if enabled), keep special en_US_POSIX data which
 # is used by default by the python-babel code
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
