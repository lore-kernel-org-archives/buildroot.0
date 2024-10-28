Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84530D13590
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F39840C53;
	Mon, 28 Oct 2024 01:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_wkJGUk60rQ; Mon, 28 Oct 2024 01:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E74C40C57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E74C40C57;
	Mon, 28 Oct 2024 01:10:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FAB11DAA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C0460BF5
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDEOldGj1cwQ for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58FB560BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FB560BBD
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58FB560BBD
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:10:48 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a4e40a1d7eso9342465ab.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730077847; x=1730682647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Z28hb1P5n/I2XlK1P5x3PiLPoDfMpDCG526O1T5zv0=;
 b=e96XMoxKKXa8W6Kx0fiGgDrx4MZ2yn1IPfknqmBWbd26jB/9H+tbc724fFXXWcfR1S
 9YEE+51Y8MC+2XELNeOLAOzuY+uo1/PG9PJh7/a5+2itF8Kna8PQ/uWXdhreA+Hw+eIq
 gazvDr82nLmwCBc/kkxLjPSy3ApTyicfHiFbikjKMGXQ7SNQDZXxPZVm0w38Z1oLEofb
 GXmjmFvEXM50IG919jz7sjP7CteDR+o92wm1scgMr8zj4zgxWNlDa8jubkChAylH4Tlh
 dpzTf6CP88ul6BGj/+Ic6p83So7kcrDkQuYcq+VYoifCfvJ0axZEEbK/lROkXMAtRnNX
 mKNA==
X-Gm-Message-State: AOJu0YyrYQIqp75CFL8tweCtH6TrfADgSLyMvbLkcg4SbkjuzetNRQ0U
 e0L+IHxUXWWleIi6Rxbq/k1YVx70bKTALVf6jphbB+joEUGBoXLDxZCrQg==
X-Google-Smtp-Source: AGHT+IGZtfprjgmFg7uRNdypwoarc3S8Y9tDvPyPq78AEDDye8LFEfZZAohqwayToYXdOVWJAxU0gw==
X-Received: by 2002:a05:6e02:188a:b0:3a1:a20f:c09c with SMTP id
 e9e14a558f8ab-3a4ed34b940mr64091455ab.22.1730077846969; 
 Sun, 27 Oct 2024 18:10:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6de0b57sm13859155ab.25.2024.10.27.18.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:10:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:10:45 -0600
Message-Id: <20241028011045.4128366-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730077847; x=1730682647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Z28hb1P5n/I2XlK1P5x3PiLPoDfMpDCG526O1T5zv0=;
 b=Xe4oh3B0a8hpgzlcPt6SUnCzZ8dQYTj9YUijJFbJcxYCmb843zZ5CHsVIup2+4Hp0+
 Po2LCv9EDxmw6cVgZlIBWiEvW5OOfVAdGpdGM8SzSc4KqVH8tvy7mVfpPbQ8znoWkjzW
 CiEaaDfqE1/uyqMpPIa6rEcgBGhdIfIeDyY13nVfH5GR+AwvGaKHFlK+l2hIAPecpbVG
 6M+4BQMeGaSG0SIw0H2kLMIB+Bb2VnrYo+CGOEeZh7hOa9EgnnRyK4R99NTgZa9Y4fHr
 lfyjwI8RF2ws0V6tUHqY7AmOyWFhCVpFtfgg+WZ04bC0Fpgbgb9XSqYvA70cOwMn7j6V
 8YSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xe4oh3B0
Subject: [Buildroot] [PATCH 1/1] package/python-wtforms: bump to version
 3.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index 3a1d932d3d..ba68361055 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  722bf234789979ed2ff06e8e9323fa0f  wtforms-3.1.2.tar.gz
-sha256  f8d76180d7239c94c6322f7990ae1216dae3659b7aa1cee94b6318bdffb474b9  wtforms-3.1.2.tar.gz
+md5  58a16ec4a96043b429c196bfafa5fd96  wtforms-3.2.1.tar.gz
+sha256  df3e6b70f3192e92623128123ec8dca3067df9cfadd43d59681e210cfb8d4682  wtforms-3.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 4f020151cd..69e051f150 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.1.2
+PYTHON_WTFORMS_VERSION = 3.2.1
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/6a/c7/96d10183c3470f1836846f7b9527d6cb0b6c2226ebca40f36fa29f23de60
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/01/e4/633d080897e769ed5712dcfad626e55dbd6cf45db0ff4d9884315c6a82da
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
