Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74628C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 08:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE130404D3;
	Sun,  5 Nov 2023 08:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE130404D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1jdksToOYTI; Sun,  5 Nov 2023 08:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6055C404F1;
	Sun,  5 Nov 2023 08:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6055C404F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1E81BF588
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0114760FBC
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 08:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0114760FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NrELEAuc--2T for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 08:05:38 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C88AE60FBA
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 08:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C88AE60FBA
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7a694254684so134543339f.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699171537; x=1699776337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7fg5S/kaUPQAUwjWPfJ+TiDcgyJB5NL7kgtenTpZuo0=;
 b=ty3rPVEEJNXuFxxbDm5KVI+cS+QiFHPxJkkgzPR+nMaR/F7pXFN6p43dMAm08/M6Fx
 jyY+w8Sa/MCWVCTOQ0SaSjKfKsdnZkdrNYiVIG+e40g9TEc6uhAebk3eMfcQ/3roB+io
 2vfk4layyWGGKh3H8ZgqJjOCetcv1qX9AOXvwrPO7DyyjEq7VgU69q/U44h0ey8TmLmK
 Xg/wNEUXRrBOcIe3h0gl4iiIO5Og4pomEh/B3TPrjzOzBkBWCZrvxILBNn7A6axLfBrP
 GPsKnLyGKz45lTT4thI6ZXICfTE6+Qwba+HhETS+B5U29aoJ+czonWT749cQbgLqTUmp
 2OMw==
X-Gm-Message-State: AOJu0YyBkX2CfzuupaPBC5NL4paFQf1blWO2iLULwEngPo/LMWkkfVvt
 mdkit+zS4v8fNWmFbtOcSr/Jv4bGIbE=
X-Google-Smtp-Source: AGHT+IHFtG5HZH/o8zxX9OZH+ZxtknFUvsGLrvD25obFKNezK0Y1d1lnaPerUuoKB5bf6rmI/RrWTQ==
X-Received: by 2002:a05:6602:2e07:b0:7a5:a391:73ae with SMTP id
 o7-20020a0566022e0700b007a5a39173aemr32178423iow.17.1699171537416; 
 Sun, 05 Nov 2023 01:05:37 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 k2-20020a02c762000000b0042acf389acesm1427087jao.71.2023.11.05.01.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:05:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:05:34 -0700
Message-Id: <20231105080534.2895735-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699171537; x=1699776337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7fg5S/kaUPQAUwjWPfJ+TiDcgyJB5NL7kgtenTpZuo0=;
 b=lU4T7txKxcYcbPYkzvV48Ft7PGeoG0bW7FZnn7HMxJwmF6sABOT9LYvAW1BuaGI7d8
 NrZRoeUNW0sT1LTBn+tzGgEJ1FoA3fmVqQJuoWuERJ5DwgINlTL1ZyL6MVcFtKvLHDrj
 jh9trPJvF8WQOJhcEXSS8I/cLdZHlkMpyBsY6AQLUQOS6kjDV6VTFXjDkvoTAhQAD+EA
 Oqdi5uI/xNlL0+zn28d8h8/8hCxQ0BifbmZ+i+rIOW5qfSUSmstPajCSq2afT6uGV7OV
 qTwmW5GU3s/P1EcR3FxBW/TfvEi2bVIDsDQHl2mPU0nbX1TAE0qQj7jpIU0nSSZHBjJp
 sC8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lU4T7txK
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-classes: bump to
 version 3.3.0
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

Drop no longer required python-six runtime dependency.

Add new python-more-itertools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-classes/Config.in                  | 2 +-
 package/python-jaraco-classes/python-jaraco-classes.hash | 6 +++---
 package/python-jaraco-classes/python-jaraco-classes.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-classes/Config.in b/package/python-jaraco-classes/Config.in
index 05c11237ab..6d79062a18 100644
--- a/package/python-jaraco-classes/Config.in
+++ b/package/python-jaraco-classes/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_JARACO_CLASSES
 	bool "python-jaraco-classes"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	help
 	  Utility functions for Python class constructs.
 
diff --git a/package/python-jaraco-classes/python-jaraco-classes.hash b/package/python-jaraco-classes/python-jaraco-classes.hash
index 0e170d58d1..701aa07b83 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.hash
+++ b/package/python-jaraco-classes/python-jaraco-classes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.classes/json
-md5  a661acdae43995c08500324a8df62f03  jaraco.classes-3.2.3.tar.gz
-sha256  89559fa5c1d3c34eff6f631ad80bb21f378dbcbb35dd161fd2c6b93f5be2f98a  jaraco.classes-3.2.3.tar.gz
+md5  26ae65ab8cda78455ddab0b05fe0a553  jaraco.classes-3.3.0.tar.gz
+sha256  c063dd08e89217cee02c8d5e5ec560f2c8ce6cdc2fcdc2e68f7b2e5547ed3621  jaraco.classes-3.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-classes/python-jaraco-classes.mk b/package/python-jaraco-classes/python-jaraco-classes.mk
index 4790516330..45950556b0 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.mk
+++ b/package/python-jaraco-classes/python-jaraco-classes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CLASSES_VERSION = 3.2.3
+PYTHON_JARACO_CLASSES_VERSION = 3.3.0
 PYTHON_JARACO_CLASSES_SOURCE = jaraco.classes-$(PYTHON_JARACO_CLASSES_VERSION).tar.gz
-PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/bf/02/a956c9bfd2dfe60b30c065ed8e28df7fcf72b292b861dca97e951c145ef6
+PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/8b/de/d0a466824ce8b53c474bb29344e6d6113023eb2c3793d1c58c0908588bfa
 PYTHON_JARACO_CLASSES_LICENSE = MIT
 PYTHON_JARACO_CLASSES_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CLASSES_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
