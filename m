Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31032CD343F
	for <buildroot@archiver.kernel.org>; Sat,  9 May 2026 09:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92AD40DE1;
	Sat,  9 May 2026 09:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQxFqv-3kPOu; Sat,  9 May 2026 09:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 946AD40EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778319541;
	bh=JHlPJJCQewBur+BsTQRYQz4AFHqe0n0cSp/jcMBo5ZE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=aQogIWMPXVwudXJ9P4z5qJNAobAy/6bZk+3urSvOIuJAIyXpW9k65sukrkp4oElZB
	 2epPodHFYCIvCv0026uVUq+dOrda9GgHPm4QsxbQ6XjHo4lPYEdj2LBLkD0sdY5tMa
	 jJIh53/flVcZvk/l9+wpec5z9wrBxfRmOQcSgB7M8ddw+69fpBOyZV9UnWUPAE1F7W
	 kI8QOAsaS/+kFz/QrUq+SGYQrEkQxoMiOimtWXyeqpWGNgwgJgkv3HpZccyQbHLXLe
	 VLlyEjFs0TSfU+O2GEvXqZORlPhaXTgPSliPqBRDNkAmiD8ZVvna6rO9NT/lXIjxOh
	 axApcrKY4o/TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946AD40EC5;
	Sat,  9 May 2026 09:39:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C800272
 for <buildroot@buildroot.org>; Sat,  9 May 2026 09:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2A3F6133B
 for <buildroot@buildroot.org>; Sat,  9 May 2026 09:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ik4OXjA9Cb2k for <buildroot@buildroot.org>;
 Sat,  9 May 2026 09:38:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46B4F61346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46B4F61346
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46B4F61346
 for <buildroot@buildroot.org>; Sat,  9 May 2026 09:38:57 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1956034009; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 09 May 2026 09:38:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wLe98-00000006vgr-0yDi;
 Sat, 09 May 2026 11:38:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat,  9 May 2026 11:38:51 +0200
Message-ID: <20260509093853.1651716-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mpG4TP2im1RVPTnjKndrmCJgwLTvIO/kKv0Sgq0KBQnPhGOr2LRfXjc4FlXbNAiuBO02U233zzLe27iBp1hWI7PtD6uhejTlGWyjC5aU9AuzaQ2ebxqaAg/FIb7lPNrNC3lXcmZGsytadTbLl6ljTgJGkrUN5yjTQpHVGjLK7+3N5mXFMOnUgEWVuBCfl009VC8UgfSJooGImoBYRF1lhdA8w3CJmzDpPUNfb+nG/ynaf0W8IYJ5ouUw8qBFwgAyB0/8SeW66P5k9/TgyLeVRy6rrLNuAMKXbjKiD9K2f4EaWGVK6NybozfzNr18uMdzR1KmmACEmPJVN+96ynWptg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LqUlHTsaJso8FbuL+R+g/+wtcFiPcXAEbnP+SKmV98w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mpG4TP2i
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] Revert "package/python-setuptools: bump to
 version 82.0.0"
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

This reverts commit 51365ff06379aaf6fcc9a751e8ff32ac694f3e92.

This breaks u-boot < v2025.10 builds using binman, so revert it for now
given that v2025.10 is a quite recent release.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332016
And many more.

Longer term we either want to upgrade all the defconfigs (which will not fix
the issue for external users) or find a way to patch older u-boot versions.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 0236a13999..d0ed270e9c 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  6e65b88d2466b35e86e5187b99502b1c  setuptools-82.0.0.tar.gz
-sha256  22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb  setuptools-82.0.0.tar.gz
+md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
+sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3c94931fbe..e013000c57 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 82.0.0
+PYTHON_SETUPTOOLS_VERSION = 80.9.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/82/f3/748f4d6f65d1756b9ae577f329c951cda23fb900e4de9f70900ced962085
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
