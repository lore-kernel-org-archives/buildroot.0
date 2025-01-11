Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA16DE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4307740740;
	Sat, 11 Jan 2025 17:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZ6LKrY2c0TZ; Sat, 11 Jan 2025 17:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6CCA4074B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6CCA4074B;
	Sat, 11 Jan 2025 17:10:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03E50942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1F2340180
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hc9xw-PbILyB for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7704F400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7704F400F9
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7704F400F9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:10:53 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-844ef6275c5so99159139f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736615452; x=1737220252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hn120HFHvbQU5/uMNz8G1oSEhrkN9GFXK4Qyfw3391g=;
 b=lGJV+n/yNwxVtrarZfjMOVr0QGZWVoPtrG11Gvjl5lpW/WDDclRw48CLNefBEJ7dYU
 eebQAaQjpetp44RYe2mfJaCbz8bXRR+aTPdP6zcp5rqlQs+62M9BOJf4AxtSrIeT/jtY
 z01EqKJOLD5OfrU9byV4heOL5CNFxUCQap5rDsnZgm7cAW7ONVuCFl0iW+vEAO2EPpJc
 9u7xQqYQGkXg/xV96ANKdxplVQZ3SqF9bpLLW42KTJvtB5mLwOToUM2uX3ux2w2AxhhA
 pEn7pOIth1OVx6jo85OgogCKAaBtQo9+W2eQgXi6eegpdPv7Tzm492JKwIjWOXiZNo0b
 WfaQ==
X-Gm-Message-State: AOJu0YwuTwjE2C7Qg7byNpx/xgUL0GcHW3EPUaYpBa5KQslB+97z0wNm
 XmIU3j713JKhfzxoQBZYY9CKI47DUl+jGny4OmNbDTBH2K/CUupMWwBNIkziXe4=
X-Gm-Gg: ASbGncvSGY3jD2UubatDk7OqZnFKe2/8B4mVAZhf/Acft9Tro9KPEcOg1kcRd34YTV1
 SdNRlmtFGnxHLAjvqj5Qtg0hrjzawRCL664eVg3BSwg5S4k8rWD97lqDIudbbMHbNa7QwP688na
 FFEPjGkcAaQzzu0rLSGMLfh97ShXKPj1ApTV3ec7ZnkTNOTKB0UmHNrIyXGbbYpbxKNDbAC3La7
 DOsAiCYqANJK+Tl2urLC70XApFC0xdqRlmEBSPGXY67uh5tAyYoxxMb34QeZkTYex+RIMgD1RzL
 rcm3aXOwXyy5/fZMDEKhnyUdAW0rRDs=
X-Google-Smtp-Source: AGHT+IGIbgHV4Mm4fFEH/aWnQ6oEi441GIToxIQHAzyg9UwZeuOo2JdphB4oygtITHMs6Q+R1cIaKA==
X-Received: by 2002:a05:6e02:138d:b0:3a7:e103:3c43 with SMTP id
 e9e14a558f8ab-3ce3aa5af3amr112913895ab.19.1736615452213; 
 Sat, 11 Jan 2025 09:10:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adb7e45sm16742335ab.27.2025.01.11.09.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:10:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 10:10:50 -0700
Message-Id: <20250111171050.2905238-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736615452; x=1737220252; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hn120HFHvbQU5/uMNz8G1oSEhrkN9GFXK4Qyfw3391g=;
 b=QY03DJjUW9n1z8aduznhgNavPD6HMaAxcAYnLsZ+5RReopPiPd+ZOkCdZbGwjlaQPQ
 C4lyO4HXMJ5uQvMOXS++d/8tDtUdMw/O9wPNzXKiI1El1Mkd+Ar9hQfYKMXWETxQFXet
 /nMGiKS1Y5NRmglFOuXclWfJMhwLgmgb3fYwVEG2QZk5mvdXAJhsU1bUvIszM6fzPdFK
 jo21ExPrE9vSpC1uzMWx2hwZiK9xax74OIgA55Wg1aYF5Z19ad98JTnFONga0gljWe5T
 bOVX3SRoGkW9ang5WTSGeCJiEeC3hcO/KSG5i3zw/Or1IDEKGMTUc66g+FH9WvzIqxQD
 K5Bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QY03DJjU
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 75.8.0
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
 package/python-setuptools/0001-add-executable.patch | 12 ++++++------
 package/python-setuptools/python-setuptools.hash    |  4 ++--
 package/python-setuptools/python-setuptools.mk      |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
index cd3cb66a5b..9e12c4b628 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/0001-add-executable.patch
@@ -1,4 +1,4 @@
-From aa232855cf717835a5d16954f1fd8ead315a5fa6 Mon Sep 17 00:00:00 2001
+From 995cf87c0dfc420908847a06661cbae21d16a8f6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 7 Dec 2015 01:14:33 +0100
 Subject: [PATCH] add executable
@@ -22,10 +22,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 11 insertions(+)
 
 diff --git a/setuptools/command/install.py b/setuptools/command/install.py
-index e2ec1abdd..e78ace3d4 100644
+index 741b140c7..5a281237a 100644
 --- a/setuptools/command/install.py
 +++ b/setuptools/command/install.py
-@@ -26,6 +26,7 @@ class install(orig.install):
+@@ -39,6 +39,7 @@ class install(orig.install):
      distribution: Distribution  # override distutils.dist.Distribution with setuptools.dist.Distribution
  
      user_options = orig.install.user_options + [
@@ -33,7 +33,7 @@ index e2ec1abdd..e78ace3d4 100644
          ('old-and-unmanageable', None, "Try not to use this!"),
          (
              'single-version-externally-managed',
-@@ -60,6 +61,7 @@ class install(orig.install):
+@@ -73,6 +74,7 @@ class install(orig.install):
          )
  
          super().initialize_options()
@@ -42,11 +42,11 @@ index e2ec1abdd..e78ace3d4 100644
          self.single_version_externally_managed = None
  
 diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
-index 7b90611d1..216cadf80 100644
+index 4401cf693..38f5d5092 100644
 --- a/setuptools/command/install_scripts.py
 +++ b/setuptools/command/install_scripts.py
 @@ -18,6 +18,13 @@ class install_scripts(orig.install_scripts):
-     def initialize_options(self):
+     def initialize_options(self) -> None:
          orig.install_scripts.initialize_options(self)
          self.no_ep = False
 +        self.executable = None
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index e99fc7d9b2..87a4d877ea 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  ca5ea2d5e9622d6a7b9f6c6664821853  setuptools-75.3.0.tar.gz
-sha256  fba5dd4d766e97be1b1681d98712680ae8f2f26d7881245f2ce9e40714f1a686  setuptools-75.3.0.tar.gz
+md5  a42b075e3e18e724580f4caf7944354a  setuptools-75.8.0.tar.gz
+sha256  c5afc8f407c626b8313a86e10311dd3f661c6cd9c09d4bf8c15c0e11f9f2b0e6  setuptools-75.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index d6b65a2b9e..af59e54d11 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 75.3.0
+PYTHON_SETUPTOOLS_VERSION = 75.8.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ed/22/a438e0caa4576f8c383fa4d35f1cc01655a46c75be358960d815bfbb12bd
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/92/ec/089608b791d210aec4e7f97488e67ab0d33add3efccb83a056cbafe3a2a6
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
