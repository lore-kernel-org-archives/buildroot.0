Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D267CC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 03:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A5B606F3;
	Sun, 15 Sep 2024 03:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjtZQlXfQEIm; Sun, 15 Sep 2024 03:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 359AD607E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 359AD607E4;
	Sun, 15 Sep 2024 03:54:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 456861BF8A8
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 03:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41C8984115
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 03:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRFla-E9m1B2 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 03:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E448A84111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E448A84111
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E448A84111
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 03:54:35 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a09c977dfbso1085475ab.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726372474; x=1726977274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1PKgj+VAo6tpKSLmmqmNWVGGnC2nigvjl/WFPPw6ldQ=;
 b=JvYKnlU/qZuWaC2sSp/fjWY2qfRNxARLkVk37ABWjQYK90fVoXf/yORP4X+wIEyCuc
 8BWB2yJSemTpoWP5QpVeeGAQrakMBlQxjEzhJVLsXf251OrI9cB6N0bZvTeI7/UJ+/Ah
 YRY1zg+89ySEybQYFgpUkZ3H1E4kvHTu+BmJ3aLPm8egLQThSa/ox/+mAlkSTwO3q/HZ
 +OLTTr0CU1IsuVGWZe4pRePwAPXI8UdGAoeGLGavgNPqy7Ss7E6uFNqjEjzbnF86/8Lz
 IcNB7SolU5YZzR6PBY2gblHbSQ8RMyPbt7ANArO9o8h/Q2sYpZY7kgccuSY/1l215W51
 OgsQ==
X-Gm-Message-State: AOJu0YwyClArJKNZcDeIUPBpKrjb2tUg1zvl5Dj8Yada73ATeluwUoG+
 OuqeTbihSifj76eyy8+/hLvu8hRWWK3US7NELl1f/gE7EIjKn3wV1cD7Gw==
X-Google-Smtp-Source: AGHT+IF1CnkHWBI7+nL2Dy8d7AB0fLwOHFbOJcQvPG90mhBzN6J4X9rd11BFZV/o5hizNpeykmA8Hg==
X-Received: by 2002:a05:6e02:b4c:b0:3a0:4c4e:2e53 with SMTP id
 e9e14a558f8ab-3a08b6f86c2mr78502885ab.5.1726372474086; 
 Sat, 14 Sep 2024 20:54:34 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e13fa3sm8102725ab.24.2024.09.14.20.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 20:54:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 21:54:31 -0600
Message-Id: <20240915035431.1377645-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726372474; x=1726977274; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1PKgj+VAo6tpKSLmmqmNWVGGnC2nigvjl/WFPPw6ldQ=;
 b=GcSsmtgeahW5TIOF4uALawr5DzWJ3KFz2LzmfEjiuwUApU+mDEPmGVG27vSOOQ1upp
 kTIEDaDXYsVmx2fblokHVSkfhTHWHgCHJMwSC2l4uyqIrktJ36zFlbEWJRlCFXHOaPqv
 MQLbM7KFyA7hIt9WetLWznlQGgbI6WiQoec5MjOZ/rSxaF+4u85ZeWzkpu1NSeJ5uBgw
 cpfRGX2addMPApLcCDJoHXCi72nlUyKDvJWqFvYaonKr1X9QXHQArfklivYf/YwG6PNJ
 rSk97tuuu3XHu3gTXSw6DWVECqkCgE+vfuk3+oF0YGKZHQeruDXgyY6JoATxorbSD4ea
 cE6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GcSsmtge
Subject: [Buildroot] [PATCH 1/1] package/python-cheroot: bump to version
 10.0.1
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

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ptools-scm-v7-for-building-the-dists.patch | 101 ------------------
 package/python-cheroot/python-cheroot.hash    |   4 +-
 package/python-cheroot/python-cheroot.mk      |   4 +-
 3 files changed, 4 insertions(+), 105 deletions(-)
 delete mode 100644 package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch

diff --git a/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch b/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch
deleted file mode 100644
index 837f2804d2..0000000000
--- a/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From f0c51af263e20f332c6f675aa90ec6705ae4f5d1 Mon Sep 17 00:00:00 2001
-From: Serhii Abarovskyi <aserhii@protonmail.com>
-Date: Tue, 9 May 2023 18:33:54 +0300
-Subject: [PATCH] Use setuptools-scm v7+ for building the dists
-
-Since version 7, setuptools-scm has native support for git archive,
-so the setuptools-scm-git-archive project is obsolete
-and this patch removes it from the build dependencies.
-Close #515
-
-Upstream: https://github.com/cherrypy/cheroot/commit/f0c51af263e20f332c6f675aa90ec6705ae4f5d1
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .git_archival.txt                       |  3 +++
- pyproject.toml                          |  3 +--
- requirements/dist-build-constraints.in  |  3 +--
- requirements/dist-build-constraints.txt | 16 +++++++---------
- setup.cfg                               |  3 +--
- 5 files changed, 13 insertions(+), 15 deletions(-)
-
-diff --git a/.git_archival.txt b/.git_archival.txt
-index 95cb3eea4e..3994ec0a83 100644
---- a/.git_archival.txt
-+++ b/.git_archival.txt
-@@ -1 +1,4 @@
-+node: $Format:%H$
-+node-date: $Format:%cI$
-+describe-name: $Format:%(describe:tags=true)$
- ref-names: $Format:%D$
-diff --git a/pyproject.toml b/pyproject.toml
-index b1e5f60a80..88df57dcc1 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -6,8 +6,7 @@ requires = [
-     "setuptools>=34.4",
- 
-     # Plugins
--    "setuptools_scm[toml]>=3.5",
--    "setuptools_scm_git_archive>=1.1",
-+    "setuptools-scm >= 7.0.0",
- ]
- build-backend = "setuptools.build_meta"
- 
-diff --git a/requirements/dist-build-constraints.in b/requirements/dist-build-constraints.in
-index 26b57228a9..a37baef1a9 100644
---- a/requirements/dist-build-constraints.in
-+++ b/requirements/dist-build-constraints.in
-@@ -5,8 +5,7 @@
- setuptools >= 34.4
- 
- # Plugins
--setuptools_scm[toml] >= 3.5
--setuptools_scm_git_archive >= 1.1
-+setuptools-scm[toml] >= 7.0.0
- 
- # Dynamic (coming from setuptools' PEP 517 build backend)
- wheel
-diff --git a/requirements/dist-build-constraints.txt b/requirements/dist-build-constraints.txt
-index 525f2be30f..8bd4343ff6 100644
---- a/requirements/dist-build-constraints.txt
-+++ b/requirements/dist-build-constraints.txt
-@@ -1,18 +1,16 @@
- #
--# This file is autogenerated by pip-compile with python 3.10
--# To update, run:
-+# This file is autogenerated by pip-compile with Python 3.10
-+# by the following command:
- #
- #    pip-compile --allow-unsafe --output-file=requirements/dist-build-constraints.txt --strip-extras requirements/dist-build-constraints.in
- #
--packaging==21.3
-+packaging==23.1
-     # via setuptools-scm
--pyparsing==3.0.6
--    # via packaging
--setuptools-scm==6.3.2
-+setuptools-scm==7.1.0
-     # via -r requirements/dist-build-constraints.in
--setuptools-scm-git-archive==1.1
--    # via -r requirements/dist-build-constraints.in
--tomli==2.0.0
-+tomli==2.0.1
-+    # via setuptools-scm
-+typing-extensions==4.6.3
-     # via setuptools-scm
- wheel==0.37.1
-     # via -r requirements/dist-build-constraints.in
-diff --git a/setup.cfg b/setup.cfg
-index 1f2b08f4c3..900c7b4feb 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -64,8 +64,7 @@ include_package_data = True
- packages = find:
- include_package_data = True
- setup_requires = 
--	setuptools_scm>=1.15.0
--	setuptools_scm_git_archive>=1.0
-+	setuptools_scm >= 7.0.0
- install_requires = 
- 	importlib_metadata; python_version < '3.8'
- 	more_itertools >= 2.6
diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index d103eb6f96..2d63dd9651 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5  be96fa052c54892240f916fbb06cc571  cheroot-10.0.0.tar.gz
-sha256  59c4a1877fef9969b3c3c080caaaf377e2780919437853fc0d32a9df40b311f0  cheroot-10.0.0.tar.gz
+md5  0fce2608fcb31c16c81945c73e283724  cheroot-10.0.1.tar.gz
+sha256  e0b82f797658d26b8613ec8eb563c3b08e6bd6a7921e9d5089bd1175ad1b1740  cheroot-10.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e20feeb491a7e98084f15719349e9857aad41c4503c5e479f8815b063dbf7564  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index 19aa7ae193..3d39eac7a0 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 10.0.0
+PYTHON_CHEROOT_VERSION = 10.0.1
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/08/7c/95c154177b16077de0fec1b821b0d8b3df2b59c5c7b3575a9c1bf52a437e
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/63/e2/f85981a51281bd30525bf664309332faa7c81782bb49e331af603421dbd1
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
