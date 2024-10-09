Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381A5CEE337
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFA8B40720;
	Wed,  9 Oct 2024 17:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljAsy-0rTDSt; Wed,  9 Oct 2024 17:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B68124072C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68124072C;
	Wed,  9 Oct 2024 17:32:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BED71BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FCB960631
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnxYu-sXFm3X for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10B1760621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B1760621
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10B1760621
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:32:04 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-8354845c5dcso2142339f.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728495124; x=1729099924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5/TP84ItS2wutFNVliBCIyvqVg3icCgaOjU3qYUN0L0=;
 b=Ms5qZtSd36DUpVKTDLX2MmvmwaQJdDJYX7Hxooy7j4DZTF1sfq9k/b2mGVysKd4+BC
 R/B9UUu2/EWSBUrwMAx4E2GSuyKA0WAd4UWxp2JzMBhAQ96ZSiM8XeHKoReuCkXVvDUV
 48/P0ThEjdgJwGPhCk3kNzrdbRfKWFxeFfF2jtKz7mOAG41l0Lq6Sn7/qFJn+6dgRNBF
 AunRjjXVnXEPXVqTRe0zn70JdWP8BxyMlRMmmzn+y1Z6LxoA9jP+Msorabv587TPMXU1
 /e2N9zxxtP9X6aph2PkPRqIYDwNOWpRgh/AyxeAZE4BFbqvrxyBU6xEfuLhkxSsClIxy
 97Eg==
X-Gm-Message-State: AOJu0YybpnGDXt6/c67vjYKIdiKRcLHwCd1zOkvSTMnOLFf71AmQ6VS7
 6qqrNPHkScuSboLbXSeu7vono9jqxplh6BuW7sfaYwzQy1fvyra3uvrnS9gu
X-Google-Smtp-Source: AGHT+IEjQAiOO2xYzBS5i30ica8dNlSX6mdm2gIN321mwmsvrEvBfm/8GV+L6CTcVpSnjvuNazH0Cw==
X-Received: by 2002:a05:6602:6001:b0:82a:7181:200f with SMTP id
 ca18e2360f4ac-8353d4ad3cfmr341702439f.9.1728495123476; 
 Wed, 09 Oct 2024 10:32:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6eb56ab4sm2135051173.64.2024.10.09.10.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:32:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:32:01 -0600
Message-Id: <20241009173201.3846339-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728495124; x=1729099924; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5/TP84ItS2wutFNVliBCIyvqVg3icCgaOjU3qYUN0L0=;
 b=LNnwh6sd6TU64gzL2cSLwpNodWtllji8rB9e4z9eOgcLjzJulBJ0MMSNOByY67PD6v
 bxxGoRhNvfrI6UbwuryBn8R93aLfzEfX23wGntB/dcLafcX3i0zAZpwVGG03uGmslDkx
 cbs9GJWTAPd7Q4uHDuzYM4f3PVM0fmeXdXjc0v37EIW1NjxNGL2g8FfIl89mipXNklhu
 qijTQwT3fkULzhqZyRacUQaeCz31oo3+wi3hKYdKgKgv9AMZayygfdahNHNPrqTqXjUW
 T4mtz6lbs9Nvy7NiAt7cjHSp3hiGQ/IllJCTeZynCezcz3o/HwcVo8l+XR+KmnzfM6ts
 Z9Mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LNnwh6sd
Subject: [Buildroot] [PATCH 1/1] package/python-pyproject-metadata: bump to
 version 0.8.1
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

Migrate from setuptools to flit build backend.

Add new host-python-packaging dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-pyproject-metadata.hash                         | 4 ++--
 .../python-pyproject-metadata/python-pyproject-metadata.mk | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index af5121c63c..093be17e75 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  048ef3f91a5ba7c89a33894cb2c7725d  pyproject_metadata-0.8.0.tar.gz
-sha256  376d5a00764ac29440a54579f88e66b7d9cb7e629d35c35a1c7248bfebc9b455  pyproject_metadata-0.8.0.tar.gz
+md5  fdaf264fe130f45ba830222b95c556fa  pyproject_metadata-0.8.1.tar.gz
+sha256  e6b494d4fbac8007ed0efd3a08df067bb28a299fb113b885ce77e492ad1f0600  pyproject_metadata-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index eaf31ff591..08d2b4bda4 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.8.0
+PYTHON_PYPROJECT_METADATA_VERSION = 0.8.1
 PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/cf/cc/428b057f8c229b7c374efe9d6a6a35e693f79e071e25846ab0c55e59d337
-PYTHON_PYPROJECT_METADATA_SETUP_TYPE = setuptools
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/fa/24/47dc876eacddcf7125fe59cd26b064530c7e58655dae87f6928bf47aabaf
+PYTHON_PYPROJECT_METADATA_SETUP_TYPE = flit
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
+HOST_PYTHON_PYPROJECT_METADATA_DEPENDENCIES = host-python-packaging
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
