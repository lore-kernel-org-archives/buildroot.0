Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B5C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F53B40164;
	Thu, 11 Jan 2024 07:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F53B40164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwtvh1IZtI1f; Thu, 11 Jan 2024 07:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62DE54017B;
	Thu, 11 Jan 2024 07:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62DE54017B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA581BF3CB
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7D3A4255F
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7D3A4255F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbAM2th5f0DR for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:17:11 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E363342537
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E363342537
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7beda2e6794so94092139f.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704957429; x=1705562229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MJfnUOxb7pNH7fkabHMYPkT3VLi8BIRae+bIO/x0AHk=;
 b=vxGm/tZDxXlVTuP0jfL63ow1hOgS/fMqOuwzlG1K1j+65LmbWiLQad38b6lQC8M719
 bjV2LX6/062/rZ7VbSouhx0VXFY+aGCLo04ln3XnzvsMvHlvRaWFD4IZeqgxoOxzQyP+
 zaLJg8aK5zOYXFmk0zmCArE6fQDbjcp4nhHUIqPCr5RahTnQZ9noVqfqyzhe5iP54lyP
 ilr35q1fpmDa9thRnMz5Crn1o/qm7dGC63cTX1xLjK2x4/Jn7NqwNb8G9ouEKiTg0HnN
 AOvNEfp1xiGIg9J4r7ysEhXPvUGzLNBl/XULViaNcwluxZTlLKfh4dukO2FdDLFb3Ekn
 MddA==
X-Gm-Message-State: AOJu0Yy9vcMxESsR8d7j3UC3cxonXpQ0sUgmPTFSyZpeuyc+DGKI1MvK
 L12SSVcyw+Pff69f8btqa6Vb7Cb+JbZFUw==
X-Google-Smtp-Source: AGHT+IEwkur8L18TIj49KByCDHk47hbaXAHyMTJWaxhGLKjpGyURM+XaPACVHYutU4d6ihcC50T7gA==
X-Received: by 2002:a6b:a08:0:b0:7ba:fa7c:7e9 with SMTP id
 z8-20020a6b0a08000000b007bafa7c07e9mr275521ioi.17.1704957429553; 
 Wed, 10 Jan 2024 23:17:09 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 y68-20020a02954a000000b0046e3e31bae8sm162629jah.101.2024.01.10.23.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:17:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:17:06 -0700
Message-Id: <20240111071706.3073259-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704957429; x=1705562229; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MJfnUOxb7pNH7fkabHMYPkT3VLi8BIRae+bIO/x0AHk=;
 b=FE/A6SYYe5FwbQfLfn8BQVxrdg07z3aF53hN0FMHP0wBOgXK8mw9XMj0cCwKgKPjaM
 0FgRYR8ppoD4/xm2sq/zP0Ba/9UC4SGfJPWiowEQycPi7TvdIX7vcctl/UeaCgZiFciN
 P8IA+abFUwH64KCeQ4YGJbJXWU/h7AzZqBUjY3iH3zvYDcn4vvdWDbwxrfY4+Gdi989p
 7M8xsfyX7ZpRpBVYb/CFfTCPrNKEwYvbYaZJGD0igp4R65BXzMoo5zpVkxX/NWNxmWTo
 FzCPMNVctJQ55Ym1u61ISOtFPWvwyTGBoPVCv8qMVbR6hPeMfy9KwQNvzrmk+HWxTn76
 CCDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FE/A6SYY
Subject: [Buildroot] [PATCH 1/1] package/python-sqliteschema: bump to
 version 2.0.0
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

Drop no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqliteschema/Config.in                | 1 -
 package/python-sqliteschema/python-sqliteschema.hash | 4 ++--
 package/python-sqliteschema/python-sqliteschema.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-sqliteschema/Config.in b/package/python-sqliteschema/Config.in
index 102a615765..3097102100 100644
--- a/package/python-sqliteschema/Config.in
+++ b/package/python-sqliteschema/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_SQLITESCHEMA
 	bool "python-sqliteschema"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
diff --git a/package/python-sqliteschema/python-sqliteschema.hash b/package/python-sqliteschema/python-sqliteschema.hash
index d5fe6e7af1..7fe8ee925d 100644
--- a/package/python-sqliteschema/python-sqliteschema.hash
+++ b/package/python-sqliteschema/python-sqliteschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqliteschema/json
-md5  46da4f7575a0cc6c1d92377a279e5188  sqliteschema-1.3.0.tar.gz
-sha256  1acdd5087cab54a099135a5623bb1960019816e2e3042b889c637901a832d3c3  sqliteschema-1.3.0.tar.gz
+md5  b7fd543b82ad709f70cdc06c4ec8639a  sqliteschema-2.0.0.tar.gz
+sha256  fe6cedddf10de8934ec1ace8319340a2256667e4a1a36f3da4fd1c0956124dc8  sqliteschema-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index c399ebd6f6..4b224048f9 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLITESCHEMA_VERSION = 1.3.0
+PYTHON_SQLITESCHEMA_VERSION = 2.0.0
 PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
-PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/3d/ff/91cfff0c96f9ba2bddc27d6855db4907af77551a267b86740c8842beeb78
+PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/29/e7/4482eebf6d8ff7923bb3fd0e9239d3e634f67125cfda3001c88506b939b9
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
