Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA1DC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 05:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 597D181EDD;
	Fri, 19 Jul 2024 05:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSJc_fctEYev; Fri, 19 Jul 2024 05:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 245C08101F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 245C08101F;
	Fri, 19 Jul 2024 05:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40E7C1BF329
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 05:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A79D403C4
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 05:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QH5ZJJw-42Uo for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 05:27:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B17A6402E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B17A6402E5
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B17A6402E5
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 05:27:06 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-8036ce66164so53985639f.3
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 22:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721366825; x=1721971625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WQOj9JnenRaMW1GYAp1O1+bnBhTI6FNRVY7LFDgz1Dg=;
 b=G6J0GiG0cNZiADLWp8d5NBrxtKbVte/ggmY//KLy3rA76z7Y2mvgLCMfT63E34XEGG
 98Mbq6U4Qq5hzQCz6MXiuUqPjFe8rjAR000uNmCxKO6knmqXJ4aMBBPfLy4RY0SLbjxe
 rotWhbOw8odd4snGq/E/b268Zz0dLQup/P5jRtEnddc0m9I8QPcYKnerdnzDhgZfARBv
 5Wr04PfpTTLTwMx+0yfn5ZQjfcfX0p73M8UBiy6chBY59Bcjgyl+5/uOMZrgnmwU0EZC
 DNFEy5ln1x4xfGTKwaLc+rAVIgDxXScCeLJxwOc7uXgQfBxMhLx25nc7fo6Odd75Qsg/
 7W9A==
X-Gm-Message-State: AOJu0Yw+9R5YhaYDrTSUtTrcKSoOgu2KG2wKjnja1v8ffItrfrXnTtM7
 MTSslOe2ac0atkIjSA9Lhqsa9loesaPcS3aKNi52e1T4roH/7mwn2E8aGg==
X-Google-Smtp-Source: AGHT+IEDTchKHrWuCxAcZtPpz7+tj4SEyZvZbUL/avBerc4ZyupGdd+OyFVUPt+72nOqWr/ikff7YQ==
X-Received: by 2002:a05:6602:610a:b0:7f6:565d:9046 with SMTP id
 ca18e2360f4ac-817123e97a3mr854508939f.19.1721366824715; 
 Thu, 18 Jul 2024 22:27:04 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-819aba121f9sm26707539f.6.2024.07.18.22.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 22:27:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 23:27:00 -0600
Message-Id: <20240719052700.3427830-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721366825; x=1721971625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WQOj9JnenRaMW1GYAp1O1+bnBhTI6FNRVY7LFDgz1Dg=;
 b=PlkmIZs+FFySCp6NFRdZZYJPKYViFh3aSElTaaj5KIAOGNjEhQGN8PIbjGWjJd67Nc
 v+jcOam/gDJj/cMFvr+x2+qWZIHRTwGsYhLuS4t0QOaIEPNCpEHgd5DHAviHBalkPy6b
 j2KgIvT6rNT94DBbaYbnm7Pqmkc/2MvD/C9cC6FSjTqM69xI1XKEpMC/tg4/uUlZOJLh
 X5vky7tFcmTsz8wSvkscG7d5p5x3EqO9cx8DyCxO7DdjQY3fYM6xqCNLUSOFETev4hFO
 38F1K+K7PJF23SLyOzvyg9fL6QgKiCMfWmManS59G6belcdhkrLR12kENj2bMJg0icRl
 GPIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PlkmIZs+
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 71.0.3
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
 .../0001-add-executable.patch                  | 18 +++++++++---------
 .../python-setuptools/python-setuptools.hash   |  4 ++--
 package/python-setuptools/python-setuptools.mk |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
index d93298e118..da1bc68b39 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/0001-add-executable.patch
@@ -1,4 +1,4 @@
-From 975379e84ae3229fac94cd0499fd4ba7baa574ba Mon Sep 17 00:00:00 2001
+From a35dffe950d7bb0f7988d78ec4a963c5ce67e3c8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 7 Dec 2015 01:14:33 +0100
 Subject: [PATCH] add executable
@@ -22,10 +22,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 11 insertions(+)
 
 diff --git a/setuptools/command/install.py b/setuptools/command/install.py
-index 606cce9d8..f158e1b51 100644
+index c49fcda93..851950522 100644
 --- a/setuptools/command/install.py
 +++ b/setuptools/command/install.py
-@@ -16,6 +16,7 @@ class install(orig.install):
+@@ -18,6 +18,7 @@ class install(orig.install):
      """Use easy_install to install the package, w/dependencies"""
  
      user_options = orig.install.user_options + [
@@ -33,19 +33,19 @@ index 606cce9d8..f158e1b51 100644
          ('old-and-unmanageable', None, "Try not to use this!"),
          (
              'single-version-externally-managed',
-@@ -48,6 +49,7 @@ class install(orig.install):
+@@ -50,6 +51,7 @@ class install(orig.install):
          )
  
-         orig.install.initialize_options(self)
+         super().initialize_options()
 +        self.executable = None
          self.old_and_unmanageable = None
          self.single_version_externally_managed = None
  
 diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
-index 72b2e45cb..146a0bb58 100644
+index f44281b49..9e91cad87 100644
 --- a/setuptools/command/install_scripts.py
 +++ b/setuptools/command/install_scripts.py
-@@ -12,6 +12,13 @@ class install_scripts(orig.install_scripts):
+@@ -14,6 +14,13 @@ class install_scripts(orig.install_scripts):
      def initialize_options(self):
          orig.install_scripts.initialize_options(self)
          self.no_ep = False
@@ -57,9 +57,9 @@ index 72b2e45cb..146a0bb58 100644
 +                ('executable','executable')
 +        )
  
-     def run(self):
+     def run(self) -> None:
          self.run_command("egg_info")
-@@ -38,6 +45,8 @@ class install_scripts(orig.install_scripts):
+@@ -40,6 +47,8 @@ class install_scripts(orig.install_scripts):
          )
          bs_cmd = self.get_finalized_command('build_scripts')
          exec_param = getattr(bs_cmd, 'executable', None)
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 123c9a1455..29237427a0 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  940ffdb3a2ce4f6a5ee80032aa115fc7  setuptools-69.2.0.tar.gz
-sha256  0ff4183f8f42cd8fa3acea16c45205521a4ef28f73c6391d8a25e92893134f2e  setuptools-69.2.0.tar.gz
+md5  f404be507829989fcff7a8b63d92f357  setuptools-71.0.3.tar.gz
+sha256  3d8531791a27056f4a38cd3e54084d8b1c4228ff9cf3f2d7dd075ec99f9fd70d  setuptools-71.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index afc7348eb2..cf7016ecff 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 69.2.0
+PYTHON_SETUPTOOLS_VERSION = 71.0.3
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4d/5b/dc575711b6b8f2f866131a40d053e30e962e633b332acf7cd2c24843d83d
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/d1/8e/1d0b941ce1151009c6d98a0a590a608f346d4d272ce95ca09ee2bbb592cd
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
