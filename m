Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1C9C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 16:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C583560651;
	Sat,  2 Mar 2024 16:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNcInpMlRnke; Sat,  2 Mar 2024 16:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A58DB606D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A58DB606D4;
	Sat,  2 Mar 2024 16:31:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 737151BF2F1
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 16:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60A59822E7
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 16:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lhxj24h_Pea5 for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 16:31:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26551822D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26551822D5
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26551822D5
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 16:31:47 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so43743841fa.1
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 08:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709397104; x=1710001904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E6JJOZ4q3/T71H2rQJxi0WklaOmjbkFwT9JaFPk64GU=;
 b=Uai4w1Q1kszemTInLvmqu59jzHs1EgyVmdzk3P2v5pT90KhV290EU5MlvL+kY7sT2i
 96LW0nI54h5Hl1cTcdcU77sG+A5K40gVzCfDcShMzs2FzD4zxgVgnXHa7RxLzj+wa3ky
 ikAiEq2LL2NXbYV4PVwZwlCtJlSMmZcRBrz1WlrDvunx56HidM9Ksb4HTUB1/vrkj8C8
 kMUnGIJG1b/VVwT4G6amGmACV8OO1RSWS9jYVBvsvmW9RLe5k7YmFZXDa5OWwAjrr9hF
 lf/Rnkzb0B3KKbIuSbNMOaNruT8D7uB9d4YzSPwQp69JmxGc7+CQQ8MiA5IaGPX1ak6X
 NDxw==
X-Gm-Message-State: AOJu0Yy/24ZsUn0UAB30wm+HE9psvj26ms3v0fS16XY7PoT3Byyb5n/l
 dzXlNuOUxmDk5j1kUy0Lw/D+6+lt6e6ogZ8s0n4pIQ1i0K/XcZencchRD3Ze
X-Google-Smtp-Source: AGHT+IE0BkO7A5JAe0APv8oSz21ZjdRQgpMffPHlZjMgyTBjBKUZpo0IYfZOMAufF5myqx1tt10OFw==
X-Received: by 2002:a05:651c:1043:b0:2d2:a440:d704 with SMTP id
 x3-20020a05651c104300b002d2a440d704mr3422439ljm.24.1709397103873; 
 Sat, 02 Mar 2024 08:31:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c1d8a00b00412da96613fsm1429978wms.47.2024.03.02.08.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 08:31:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 17:31:37 +0100
Message-ID: <20240302163138.152368-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709397104; x=1710001904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E6JJOZ4q3/T71H2rQJxi0WklaOmjbkFwT9JaFPk64GU=;
 b=KZCsPze7emtoFPEspMJ62XqObdJwUN91qnaliKAc+KCxIzM6jnWxk+gIsLghyf1MeO
 i/KMQboU5TPpmYU6UP9Ct0asPlNenW6Gl4oXER4/CcL69QVYD0Bw0NOwQ+a/7y1cFdoN
 Wz7i7AQf45YAna1hABDjgmxnLI+wOZY//x/0LCtQ+gfiz0dVBj3dRIOF5ZZ/kFO0U60i
 prEPMInGJvjSY6a8+mn5a4HixeBDkynVp5KTD7uxa1qIUIJ71H/pzc/g+OJ/YSCNOkTg
 JVKoEXvXqT6NSLnxyv2mJq9OD/XY7Y1PjEB9ORWfneUZOciHdzjDgyZUEhJLge0YkEcZ
 BHTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KZCsPze7
Subject: [Buildroot] [PATCH 1/2] package/python-cheroot: drop
 host-python-setuptools-scm-git-archive
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop host-python-setuptools-scm-git-archive dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ptools-scm-v7-for-building-the-dists.patch | 101 ++++++++++++++++++
 package/python-cheroot/python-cheroot.mk      |   2 +-
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch

diff --git a/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch b/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch
new file mode 100644
index 0000000000..837f2804d2
--- /dev/null
+++ b/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch
@@ -0,0 +1,101 @@
+From f0c51af263e20f332c6f675aa90ec6705ae4f5d1 Mon Sep 17 00:00:00 2001
+From: Serhii Abarovskyi <aserhii@protonmail.com>
+Date: Tue, 9 May 2023 18:33:54 +0300
+Subject: [PATCH] Use setuptools-scm v7+ for building the dists
+
+Since version 7, setuptools-scm has native support for git archive,
+so the setuptools-scm-git-archive project is obsolete
+and this patch removes it from the build dependencies.
+Close #515
+
+Upstream: https://github.com/cherrypy/cheroot/commit/f0c51af263e20f332c6f675aa90ec6705ae4f5d1
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .git_archival.txt                       |  3 +++
+ pyproject.toml                          |  3 +--
+ requirements/dist-build-constraints.in  |  3 +--
+ requirements/dist-build-constraints.txt | 16 +++++++---------
+ setup.cfg                               |  3 +--
+ 5 files changed, 13 insertions(+), 15 deletions(-)
+
+diff --git a/.git_archival.txt b/.git_archival.txt
+index 95cb3eea4e..3994ec0a83 100644
+--- a/.git_archival.txt
++++ b/.git_archival.txt
+@@ -1 +1,4 @@
++node: $Format:%H$
++node-date: $Format:%cI$
++describe-name: $Format:%(describe:tags=true)$
+ ref-names: $Format:%D$
+diff --git a/pyproject.toml b/pyproject.toml
+index b1e5f60a80..88df57dcc1 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -6,8 +6,7 @@ requires = [
+     "setuptools>=34.4",
+ 
+     # Plugins
+-    "setuptools_scm[toml]>=3.5",
+-    "setuptools_scm_git_archive>=1.1",
++    "setuptools-scm >= 7.0.0",
+ ]
+ build-backend = "setuptools.build_meta"
+ 
+diff --git a/requirements/dist-build-constraints.in b/requirements/dist-build-constraints.in
+index 26b57228a9..a37baef1a9 100644
+--- a/requirements/dist-build-constraints.in
++++ b/requirements/dist-build-constraints.in
+@@ -5,8 +5,7 @@
+ setuptools >= 34.4
+ 
+ # Plugins
+-setuptools_scm[toml] >= 3.5
+-setuptools_scm_git_archive >= 1.1
++setuptools-scm[toml] >= 7.0.0
+ 
+ # Dynamic (coming from setuptools' PEP 517 build backend)
+ wheel
+diff --git a/requirements/dist-build-constraints.txt b/requirements/dist-build-constraints.txt
+index 525f2be30f..8bd4343ff6 100644
+--- a/requirements/dist-build-constraints.txt
++++ b/requirements/dist-build-constraints.txt
+@@ -1,18 +1,16 @@
+ #
+-# This file is autogenerated by pip-compile with python 3.10
+-# To update, run:
++# This file is autogenerated by pip-compile with Python 3.10
++# by the following command:
+ #
+ #    pip-compile --allow-unsafe --output-file=requirements/dist-build-constraints.txt --strip-extras requirements/dist-build-constraints.in
+ #
+-packaging==21.3
++packaging==23.1
+     # via setuptools-scm
+-pyparsing==3.0.6
+-    # via packaging
+-setuptools-scm==6.3.2
++setuptools-scm==7.1.0
+     # via -r requirements/dist-build-constraints.in
+-setuptools-scm-git-archive==1.1
+-    # via -r requirements/dist-build-constraints.in
+-tomli==2.0.0
++tomli==2.0.1
++    # via setuptools-scm
++typing-extensions==4.6.3
+     # via setuptools-scm
+ wheel==0.37.1
+     # via -r requirements/dist-build-constraints.in
+diff --git a/setup.cfg b/setup.cfg
+index 1f2b08f4c3..900c7b4feb 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -64,8 +64,7 @@ include_package_data = True
+ packages = find:
+ include_package_data = True
+ setup_requires = 
+-	setuptools_scm>=1.15.0
+-	setuptools_scm_git_archive>=1.0
++	setuptools_scm >= 7.0.0
+ install_requires = 
+ 	importlib_metadata; python_version < '3.8'
+ 	more_itertools >= 2.6
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index 86e16f7db2..19aa7ae193 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -10,6 +10,6 @@ PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/08/7c/95c154177b16
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm host-python-setuptools-scm-git-archive
+PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
