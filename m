Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63B8C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 05:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D9B38213A;
	Sun,  5 Nov 2023 05:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D9B38213A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txbvNcv-CKH7; Sun,  5 Nov 2023 05:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86CFA8213B;
	Sun,  5 Nov 2023 05:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86CFA8213B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 144191BF592
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0A6A404BF
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A6A404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlqDnlptHn8L for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 05:06:09 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB2F0400A6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 05:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB2F0400A6
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7a94c5538aeso125796839f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 22:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699160768; x=1699765568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c1YSf2DESUwi6oyzWsH0g6SkwJXk1Lw68BWQ+3IOjG4=;
 b=jz8mHgGROxCXh4Z1MuPu9DUYJWEOFHjG/+i7wmTfnJSGJe1uhc+w8J0Dmp/Mpm7W97
 n/awb2TbE6kxKr1AriExCVaEUOG+grXhopmTavDMMbD89h8rcQktaj+taIlxgEnwlwf9
 44xLxaS30ooyBPz2ViAgobsTWOAWnDe/QrF0Q538kUnvVU/0SAvyFshFrOYtpuhTgI73
 OBJNeV3CjfTgilebFXIVmTTELz8HPVSxQlMw//klQkGbvwxsbJT3n7XngHsE7dMKrRF4
 G/TqDmHgyfYjfGor85FwV+gUNDpTmxLHAIuHkFyBErgprWukx0mg9QSox6kJOZ8jmB/i
 BrbQ==
X-Gm-Message-State: AOJu0YwkzpjjUg099NfAsXYaQtRX38kTLK9oP83P45zxDVQFO/A2eW4A
 OIG31xPxxhP17jpFxosoi30SyUf2Sdw=
X-Google-Smtp-Source: AGHT+IFW1xoLUMFRlecBCIJRsJB5My6p4oPoKOF4HG7wlzVgFPaQK+Iz7k5E7jZG/ggeCRqbmwXQMg==
X-Received: by 2002:a05:6602:2c51:b0:792:8d16:91ef with SMTP id
 x17-20020a0566022c5100b007928d1691efmr34478623iov.18.1699160767614; 
 Sat, 04 Nov 2023 22:06:07 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 s21-20020a6bdc15000000b0079fa3d0d790sm1551876ioc.31.2023.11.04.22.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 22:06:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:06:06 -0600
Message-Id: <20231105050606.2829264-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699160768; x=1699765568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c1YSf2DESUwi6oyzWsH0g6SkwJXk1Lw68BWQ+3IOjG4=;
 b=U99F1c+auPVm89DXwJETR/N2bSD68UZUrEYRbdEq04L6ZVkX6+7Ph4hV/3EBi9Is7C
 SBgI2PtWM7GYHh9rGwSRq8dLCf/7FfP2e9h96OZNcnTKx33dcUxpRfLQUGyTo0p825D9
 sQO6FbH/VSc7g0kPUuvDU99RISNetldMm1iBAo6qA0RbGMj1Iv9/o8VI5w90ltX1Q81R
 c/EmGX8NSU25BOTeMhz4Ss+VquOyTbgHEuIN+LNxkLEFeoKIIR1h+5jpdxm/r2P0hELf
 S7zvikmRVfC7u+QWgbq2kH46swLfLSES5ymSLolbz34JAHyH8BYPhTaXeW3ku21rtDAg
 dQpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U99F1c+a
Subject: [Buildroot] [PATCH 1/1] package/python-editables: bump to version
 0.5
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-editables/python-editables.hash | 4 ++--
 package/python-editables/python-editables.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-editables/python-editables.hash b/package/python-editables/python-editables.hash
index 3c28c44cc3..a34c7ad20e 100644
--- a/package/python-editables/python-editables.hash
+++ b/package/python-editables/python-editables.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/editables/json
-md5  e91709fbb0ef586cb7b785042068ab67  editables-0.3.tar.gz
-sha256  167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16161b1a  editables-0.3.tar.gz
+md5  520de8c3a9dc5dfb2b365d104541c9de  editables-0.5.tar.gz
+sha256  309627d9b5c4adc0e668d8c6fa7bac1ba7c8c5d415c2d27f60f081f8e80d1de2  editables-0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  c73e08a04e1557fdb49525fb7a579f73bcab84a254910b9350ee56daf143932d  LICENSE.txt
diff --git a/package/python-editables/python-editables.mk b/package/python-editables/python-editables.mk
index db67e7a16d..e60d50f9d6 100644
--- a/package/python-editables/python-editables.mk
+++ b/package/python-editables/python-editables.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EDITABLES_VERSION = 0.3
+PYTHON_EDITABLES_VERSION = 0.5
 PYTHON_EDITABLES_SOURCE = editables-$(PYTHON_EDITABLES_VERSION).tar.gz
-PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/01/b0/a2a87db4b6cb8e7d57004b6836faa634e0747e3e39ded126cdbe5a33ba36
+PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/37/4a/986d35164e2033ddfb44515168a281a7986e260d344cf369c3f52d4c3275
 PYTHON_EDITABLES_LICENSE = MIT
 PYTHON_EDITABLES_LICENSE_FILES = LICENSE.txt
 PYTHON_EDITABLES_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
