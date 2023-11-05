Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E35C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 05:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB8DF821F7;
	Sun,  5 Nov 2023 05:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB8DF821F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GJEx2PHL_i3; Sun,  5 Nov 2023 05:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AF7E821E5;
	Sun,  5 Nov 2023 05:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AF7E821E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D80C41BF592
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC493821E0
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC493821E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8NGY-bkdEsy for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 05:22:59 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E61E5821E5
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 05:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E61E5821E5
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7a683bd610dso122259439f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 22:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699161777; x=1699766577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7caSPFUr3ivBIgf31GVfushKb+llA8QPXMXA5k3n0g=;
 b=CNlj8vzEyza41ZcxLH4YLx6XB/WlIrF8NBjyporHVjTYkZgfIMacwYLdLW6GboJuvu
 k5G7t8R1wcCINGwRzSLSr0pTWXaifIUQksgXjwcqkESx5UlyPUlvghvsAvF8g/8XibgO
 A5nVczZWpSVkcewR/zFolDFe6D0wOTYPfOWdNwE43fRZuL1PtvCp/Eh9LMSGoFgxe4Dg
 ejtNQUWQcI3XEOuGdInagzRb3HSqR0lVSHan2wSHbNlARx67r251hnggLq0xa+NihfbF
 vZJH4jVfyAZyiBhpAqXB3kcC0YCNGfQ6QSifRyyYuq/hftcBs8XkKstHr8rkM6cR2d4K
 Mo0A==
X-Gm-Message-State: AOJu0YxE0QjjZ0Jfjs2Kd+IGvwz6RqighIbTJAyL3sumBYA7ddVPrUpW
 b5SPL+PGe/hEDEa6hyHu56Yq2QZIyrw=
X-Google-Smtp-Source: AGHT+IEkJ23NVFklIar29hkFZGIM5wIHoIZ6k9KUUxd4+k4xv1t+pDsxlYX5bWfVVrsbCUEl1KgbFw==
X-Received: by 2002:a05:6602:3fc7:b0:792:9a3e:2dd with SMTP id
 fc7-20020a0566023fc700b007929a3e02ddmr34598151iob.3.1699161777602; 
 Sat, 04 Nov 2023 22:22:57 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 w3-20020a056638378300b00463fe3a0860sm687914jal.142.2023.11.04.22.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 22:22:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:22:55 -0600
Message-Id: <20231105052255.2835263-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699161777; x=1699766577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c7caSPFUr3ivBIgf31GVfushKb+llA8QPXMXA5k3n0g=;
 b=mHd8Q6SCjw395zpI4fISJHIfEEwRV+LTenfxVyEdxQIqMstFLToXBtGTbOYMXCeVTE
 h5EEAbgRCkSy4zf9KM5nCgR8YmjNPYjLIXqeend86Hdv/REE2vJaLXHHyNRrB11zZ/2Z
 H+o23th9SP4UzjT8dOhMTc2COnpYXvxsPOGy7k/t+JI+Trc5Ga7VtYi9cskXaGDhg1LA
 bsSF4iO+b0G+k0+Uwfy9g84ruJOLh+0JH9wOjlfVh46mVQY5fpi87wC84WAI182WiNda
 hcCNUJf6+0D475P/Zxj/j3LCyRe02vKQ5N/9AJFKDSDELxnxHAIsLUMTV4gdJ0+VGDHJ
 K6QA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mHd8Q6SC
Subject: [Buildroot] [PATCH 1/1] package/python-executing: bump to version
 2.0.1
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
 package/python-executing/python-executing.hash | 4 ++--
 package/python-executing/python-executing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
index 40fd43b5fd..e21418aae9 100644
--- a/package/python-executing/python-executing.hash
+++ b/package/python-executing/python-executing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/executing/json
-md5  e6fa9a6abf00555ccc8a6b3524729238  executing-1.2.0.tar.gz
-sha256  19da64c18d2d851112f09c287f8d3dbbdf725ab0e569077efb6cdcbd3497c107  executing-1.2.0.tar.gz
+md5  91da12f933267a5fe085033db2a3b84d  executing-2.0.1.tar.gz
+sha256  35afe2ce3affba8ee97f2d69927fa823b08b472b7b994e36a52a964b93d16147  executing-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
index 4c968323ea..071e867941 100644
--- a/package/python-executing/python-executing.mk
+++ b/package/python-executing/python-executing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXECUTING_VERSION = 1.2.0
+PYTHON_EXECUTING_VERSION = 2.0.1
 PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
-PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/8f/ac/89ff37d8594b0eef176b7cec742ac868fef853b8e18df0309e3def9f480b
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/08/41/85d2d28466fca93737592b7f3cc456d1cfd6bcd401beceeba17e8e792b50
 PYTHON_EXECUTING_SETUP_TYPE = setuptools
 PYTHON_EXECUTING_LICENSE = MIT
 PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
