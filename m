Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF7DCF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 00:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93BF88149E;
	Sun, 22 Sep 2024 00:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdO9z69F42p7; Sun, 22 Sep 2024 00:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89206814A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89206814A9;
	Sun, 22 Sep 2024 00:34:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB611BF86D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97047814A9
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5BW6oaP3wSF for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 00:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95F9A8149E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F9A8149E
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95F9A8149E
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:34:25 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-39f49600297so12379695ab.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726965264; x=1727570064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpU5s6TQEeoiFx9VKBWxfEJAuL64JcmRTKFccshA83M=;
 b=iRMwmvsO7su/4TQ48CvLATj1YhlVSC1zY4JqJHyANQ/CPguuXffTOQT5hV1owtX6/A
 owPYMbWAYgYmXkBEwuiyQlP7kavqhWZOxuC4W8iLbkkPQnyaTxsGd1H9F/DbNdA919ZI
 QZuMLcgwBkCRCmPhH2YSwXvbkiF83GBV9rjnyJzx7yKBq23Kbr28OdHNLuoR6h3H5bQD
 ppneKB91Rp24eATHQzgKIHuYV7FziBF8qNv6jSeOmwT9ZWhy/3Gf6huRHKOKh6cBE5wY
 xpFrdXZPzzMG6LBg/UtP0zyttp7LOHrN5E03ptA2ffty4FkgR8NCrnDSusAHRamGvseJ
 ZG7Q==
X-Gm-Message-State: AOJu0Yy5N5Xx9C71lEl1YRDGG01qg7SHohobT8QZ5S/HeWKKdrTgiUId
 pxs3FGl8o+6dcmaZ03qxyUmZ+FnAb9L45hO2hRrBVio8f4fAtG2VVhtolw==
X-Google-Smtp-Source: AGHT+IEU42027hfstGcis2Db475KKW5pKZ2ZcJ7k05/8HNfaFgAeTCTUOpdqHkafBsnKdwIi9F+aLA==
X-Received: by 2002:a05:6e02:1ca3:b0:3a0:aa15:3497 with SMTP id
 e9e14a558f8ab-3a0c8c5d10emr60284535ab.1.1726965264082; 
 Sat, 21 Sep 2024 17:34:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec1c327sm4368433173.45.2024.09.21.17.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 17:34:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:34:21 -0600
Message-Id: <20240922003421.721612-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726965264; x=1727570064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wpU5s6TQEeoiFx9VKBWxfEJAuL64JcmRTKFccshA83M=;
 b=ePLLsnuAXKQZic9hUFXy5geakdRb7X/wkzbymZoGj/KLx+Wae2DEv7EvTUYHHdVas0
 wDQq+o578rh18T6jsH308PAKR+7Vj+kAFTcQq6IdC/KKzdg6EPHQEEXHxrcFfEx328Xd
 UOj4AgsFY6r+pAs0L7ZNG2BVi90+sx1Qu90dTHjJiJp+HXSJF0m0FBVgFfRwsKxTit44
 jboj8G1qL4wzCQE7kbqwxP7X3i2StRZWvuNYd7YhnTml0vEiIS3k9FLr7CANHEbUwUXw
 PFp+kD8aMFaRuAhV15I+fBa0V0pULtqc6yLudSfAEFJKuid9vSYaEl/JExOGgaTipbpu
 b7Zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ePLLsnuA
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 75.1.0
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

Rebase add executable patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-setuptools/0001-add-executable.patch  | 16 ++++++++--------
 package/python-setuptools/python-setuptools.hash |  4 ++--
 package/python-setuptools/python-setuptools.mk   |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
index da1bc68b39..cd3cb66a5b 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/0001-add-executable.patch
@@ -1,4 +1,4 @@
-From a35dffe950d7bb0f7988d78ec4a963c5ce67e3c8 Mon Sep 17 00:00:00 2001
+From aa232855cf717835a5d16954f1fd8ead315a5fa6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 7 Dec 2015 01:14:33 +0100
 Subject: [PATCH] add executable
@@ -22,18 +22,18 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 11 insertions(+)
 
 diff --git a/setuptools/command/install.py b/setuptools/command/install.py
-index c49fcda93..851950522 100644
+index e2ec1abdd..e78ace3d4 100644
 --- a/setuptools/command/install.py
 +++ b/setuptools/command/install.py
-@@ -18,6 +18,7 @@ class install(orig.install):
-     """Use easy_install to install the package, w/dependencies"""
+@@ -26,6 +26,7 @@ class install(orig.install):
+     distribution: Distribution  # override distutils.dist.Distribution with setuptools.dist.Distribution
  
      user_options = orig.install.user_options + [
 +        ('executable=', 'e', "specify final destination interpreter path"),
          ('old-and-unmanageable', None, "Try not to use this!"),
          (
              'single-version-externally-managed',
-@@ -50,6 +51,7 @@ class install(orig.install):
+@@ -60,6 +61,7 @@ class install(orig.install):
          )
  
          super().initialize_options()
@@ -42,10 +42,10 @@ index c49fcda93..851950522 100644
          self.single_version_externally_managed = None
  
 diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
-index f44281b49..9e91cad87 100644
+index 7b90611d1..216cadf80 100644
 --- a/setuptools/command/install_scripts.py
 +++ b/setuptools/command/install_scripts.py
-@@ -14,6 +14,13 @@ class install_scripts(orig.install_scripts):
+@@ -18,6 +18,13 @@ class install_scripts(orig.install_scripts):
      def initialize_options(self):
          orig.install_scripts.initialize_options(self)
          self.no_ep = False
@@ -59,7 +59,7 @@ index f44281b49..9e91cad87 100644
  
      def run(self) -> None:
          self.run_command("egg_info")
-@@ -40,6 +47,8 @@ class install_scripts(orig.install_scripts):
+@@ -45,6 +52,8 @@ class install_scripts(orig.install_scripts):
          )
          bs_cmd = self.get_finalized_command('build_scripts')
          exec_param = getattr(bs_cmd, 'executable', None)
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 29237427a0..6ca17b8c73 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  f404be507829989fcff7a8b63d92f357  setuptools-71.0.3.tar.gz
-sha256  3d8531791a27056f4a38cd3e54084d8b1c4228ff9cf3f2d7dd075ec99f9fd70d  setuptools-71.0.3.tar.gz
+md5  8e8aed1625afae37b59272ff981d6e1c  setuptools-75.1.0.tar.gz
+sha256  d59a21b17a275fb872a9c3dae73963160ae079f1049ed956880cd7c09b120538  setuptools-75.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index cf7016ecff..72d1c96543 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 71.0.3
+PYTHON_SETUPTOOLS_VERSION = 75.1.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/d1/8e/1d0b941ce1151009c6d98a0a590a608f346d4d272ce95ca09ee2bbb592cd
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/27/b8/f21073fde99492b33ca357876430822e4800cdf522011f18041351dfa74b
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
