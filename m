Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88412C83F27
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 22:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AC4983BC0;
	Tue, 15 Jul 2025 22:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oDbSaPeg-KU; Tue, 15 Jul 2025 22:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5436383BC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5436383BC7;
	Tue, 15 Jul 2025 22:37:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB3ACDCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCE596107D
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNkyEzcsHLVK for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 22:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8A0560A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8A0560A47
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8A0560A47
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:37:26 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-874a68f6516so531913439f.2
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 15:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752619045; x=1753223845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cwXLDjJG9q360eMT4ZSRgcbISR6w7zZb5CZOAY0oRuU=;
 b=Y7d5jNK+4WE0B6j3UusksyyVVHHtQi80kwFc7hymqWe49zPnYCKgJri2XRZrH/7s+N
 sIYTKh42nhGNAz33l+94z+J5NrYcZIox1WZ7IsV39Hn0JmzQlzwWq12DjOLjIK8asn+V
 DlAo8co//OhB8xJEOvcuz5+S2qa/e0UWeZJ/nGgksYqn9gQslGmQuEVBI5e8uEbfQuZC
 cQlvNXAIfdiuaDM3u5NLaU+I7FnvciGY8UcXXsni3Wce8nO93UyJTHxRklMAPK/uDp9/
 RtEyi7Aobq2eWxYZ767HnPM3yeq55C9n4ESpI7U5D/2OLdvMtiYL9zFuuRJSJFDLNach
 I8iw==
X-Gm-Message-State: AOJu0YzQazHTt0sXn6PfYyINYEzdi4SUpRmt6+AmcxmS8fxdLydk5Vy9
 0Q4KMPh/xit5eyzEBFdiN/zuWdgnDd9huvVP6fYRssiruC5OGSmBhyt2C/QzHtbtWP4=
X-Gm-Gg: ASbGnctT7JAvS4ob18W1Zp2F0C97wVLGv7D22B64YFohvRuRotznBFnXh1qMRbvZXSd
 mGz8sKZYSTv5rl6b6WYS6B1HswKcjwfa+LgbecIaufI26Flnu9v6VUPRwWAShyYpYenxyhdFUld
 SjRKJXvuvMbFns+qCBrl8lg/zQUxRBWpAWikAZHTtrKpKR3DfTuxeA747dnN4eYaF/iYzr/AhVM
 DUHo5Vmb0CWHbUYQ3t6o3fBlzRHNMLqDuMN4FJ7NotGoLdYetS9a/OmxteNSrGCSzDbdaBPIs53
 RRKEwRQc16BxS476REhbUs4X1FffYIzLOJVq5JJeOaxsweHgGwob1CZwXkfnKl6o4T61fil9dgc
 ONW3BJG9q6lEYqMbDGd9LG4GL00kBpFZco5wKxbfWNVfmtYF4FoWMYspSBt9cPw704Kaa4dEbUc
 EVN3IvD6I=
X-Google-Smtp-Source: AGHT+IGkommEPxBHDNFvQLWlZF1Jy4PwPL1mw92L0Dd6fQ7tkRxHJsAnC5AEvglnxraeTGhDWMVVSg==
X-Received: by 2002:a05:6602:c8b:b0:873:1cc0:4e10 with SMTP id
 ca18e2360f4ac-879c089241dmr140823539f.3.1752619045340; 
 Tue, 15 Jul 2025 15:37:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-505569730a8sm2679972173.69.2025.07.15.15.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:37:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 16:37:23 -0600
Message-Id: <20250715223723.745122-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752619045; x=1753223845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cwXLDjJG9q360eMT4ZSRgcbISR6w7zZb5CZOAY0oRuU=;
 b=jPWw4Zg1RrR4iBrHb/8dw9j1bJkHGkTHtxwVuRyOzWm+KYbc/z8kMcVzEqOzclqsFw
 RgiYTQHappKlXmOSiCRkIQykl1LKil9C3RJGDzwCTdDEBIkYpvWb/m+78h12ZgqFSdFO
 UFME1pSKPfQSpJx+1+HpIn7JHboF/LtWVKHpDgfQY0SFcLq0cevw9OOobJHtyvC41jRk
 nY/UCiSCKlCq+pXoSpJJaIug3jN57YMZ8FlhvrSUlZLQp/9oBreW8dNZBuhlUplMcvp9
 Gsk5V2qzKqsImAN77mmk/IdkSsM2IXzpFOQfk4d+sgXg8dijlFZ9bD2PoRsROtNAjy5W
 FWhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jPWw4Zg1
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 80.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
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
index 9e12c4b628..aaef27ed75 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/0001-add-executable.patch
@@ -1,4 +1,4 @@
-From 995cf87c0dfc420908847a06661cbae21d16a8f6 Mon Sep 17 00:00:00 2001
+From 6fe6747c7d7509cc1af9667e1dae610657e5ccdf Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 7 Dec 2015 01:14:33 +0100
 Subject: [PATCH] add executable
@@ -22,10 +22,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 11 insertions(+)
 
 diff --git a/setuptools/command/install.py b/setuptools/command/install.py
-index 741b140c7..5a281237a 100644
+index 19ca60145..c4bb536b9 100644
 --- a/setuptools/command/install.py
 +++ b/setuptools/command/install.py
-@@ -39,6 +39,7 @@ class install(orig.install):
+@@ -35,6 +35,7 @@ class install(orig.install):
      distribution: Distribution  # override distutils.dist.Distribution with setuptools.dist.Distribution
  
      user_options = orig.install.user_options + [
@@ -33,7 +33,7 @@ index 741b140c7..5a281237a 100644
          ('old-and-unmanageable', None, "Try not to use this!"),
          (
              'single-version-externally-managed',
-@@ -73,6 +74,7 @@ class install(orig.install):
+@@ -67,6 +68,7 @@ class install(orig.install):
          )
  
          super().initialize_options()
@@ -42,7 +42,7 @@ index 741b140c7..5a281237a 100644
          self.single_version_externally_managed = None
  
 diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
-index 4401cf693..38f5d5092 100644
+index 537181e32..6893e6a8c 100644
 --- a/setuptools/command/install_scripts.py
 +++ b/setuptools/command/install_scripts.py
 @@ -18,6 +18,13 @@ class install_scripts(orig.install_scripts):
@@ -59,13 +59,13 @@ index 4401cf693..38f5d5092 100644
  
      def run(self) -> None:
          self.run_command("egg_info")
-@@ -45,6 +52,8 @@ class install_scripts(orig.install_scripts):
-         )
+@@ -39,6 +46,8 @@ class install_scripts(orig.install_scripts):
+         dist = metadata.Distribution.at(path=ei_cmd.egg_info)
          bs_cmd = self.get_finalized_command('build_scripts')
          exec_param = getattr(bs_cmd, 'executable', None)
 +        if self.executable is not None:
 +            exec_param = self.executable
-         writer = ei.ScriptWriter
+         writer = _scripts.ScriptWriter
          if exec_param == sys.executable:
              # In case the path to the Python executable contains a space, wrap
 -- 
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index b5bac10fe2..d0ed270e9c 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  652d999eca1412525c01e4c5b6e2275b  setuptools-79.0.1.tar.gz
-sha256  128ce7b8f33c3079fd1b067ecbb4051a66e8526e7b65f6cec075dfc650ddfa88  setuptools-79.0.1.tar.gz
+md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
+sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 1ee5448100..e013000c57 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 79.0.1
+PYTHON_SETUPTOOLS_VERSION = 80.9.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/bb/71/b6365e6325b3290e14957b2c3a804a529968c77a049b2ed40c095f749707
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
