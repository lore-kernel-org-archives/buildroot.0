Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA80BC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678BB41BF8;
	Thu, 11 Jan 2024 05:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 678BB41BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUjogPbarg9O; Thu, 11 Jan 2024 05:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A72418AF;
	Thu, 11 Jan 2024 05:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2A72418AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D5131BF23C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6403F437F4
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6403F437F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eznmzwP2i2bR for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:37:20 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 353E940236
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 353E940236
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3606dc50447so26133585ab.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704951439; x=1705556239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2XHPrkgWjB2woJYKqBJF4BqnfnTzjGoqZ8Ax9UfSwdE=;
 b=BRrvHrGydMQQPG0WAmgTo2UYWek5QFM140YTNx4NXtGpef8hUBICFb3B10E3CB5qHE
 JnjOAx6Hi/9VL0n7/Oe7FXOAHmGk3LvOyEUEKGQXCKGCizrfSJg8ONjHXl5ESs5L0Uhv
 A3JhB9m4FZDicekfJoRXJ5nMRFJH/w+IAv4vxxuWrINc8VlLOV2XQP+FQFyYmpuUEGqA
 pgVCFNikySPTTmDzDch40nKxHb7+6mbejv3989nGVi7va/Nd1zW7oAbJRvhpNGZloREt
 p6JDYxu6VAi7vcfvowfkMTbPlB1n1ppcG8l+R2GAiooclL8ZAMoar7X5HeYbSh6ybCu6
 GDAg==
X-Gm-Message-State: AOJu0YyFQwNVpQqbwZbK6lapo1JJl6j/oIL/Whjx78suoDsowUZ3/j+9
 0Rzzb3/FHrFX5UJHhLfuW3fU9GZ21sUXUw==
X-Google-Smtp-Source: AGHT+IHP1Uu7b/Gtjy+Kw462MH/d5IBvcV1a5JQvdGBRiVWqSj8UHTNVgg7ampSXuFXzOwCZd7iKRg==
X-Received: by 2002:a05:6e02:78a:b0:360:746d:96b5 with SMTP id
 q10-20020a056e02078a00b00360746d96b5mr765755ils.35.1704951438788; 
 Wed, 10 Jan 2024 21:37:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 v1-20020a056e020f8100b0035d79f5d8acsm76070ilo.79.2024.01.10.21.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:37:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:37:16 -0700
Message-Id: <20240111053716.2931403-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704951439; x=1705556239; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2XHPrkgWjB2woJYKqBJF4BqnfnTzjGoqZ8Ax9UfSwdE=;
 b=hJWrCA779log69nRT7b0o33fwmV+CXThHJlcSUazX23C3mkZUTNP9y4nZobXlGZ5lZ
 nVfx7gM4eICC3kNrbu2c+QQEUE0pSpyM/rE6Up6EIW8cYfSFh/riSB0uX4DU8gVMBjuE
 R/b7w6JiWoyCwUZDvIYxwRm7AzuDnYZxc7IlEP74WK3lCTjlnXMjKXrwCClmotOPY/YE
 bHm9M0wrbz3PSUM0QIodJkfOoQunArpmaRzVgsDrUJ8r0YphXSWAektNa1MCNO7vpn+C
 ZQgKh3wAoYJYfvXagrOaNaLBHRJFhu8kA7FJDRGks55EgXztbQqsCowkVp4rDbSjeg4G
 e6dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hJWrCA77
Subject: [Buildroot] [PATCH 1/1] package/python-schedule: bump to version
 1.2.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-schedule/python-schedule.hash | 4 ++--
 package/python-schedule/python-schedule.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
index 3d67be0f5e..59c84c2002 100644
--- a/package/python-schedule/python-schedule.hash
+++ b/package/python-schedule/python-schedule.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/schedule/json
-md5  9bf7544e37824e450457187633a17b17  schedule-1.1.0.tar.gz
-sha256  e6ca13585e62c810e13a08682e0a6a8ad245372e376ba2b8679294f377dfc8e4  schedule-1.1.0.tar.gz
+md5  ecb436a797e1a149bac4643330b268ca  schedule-1.2.1.tar.gz
+sha256  843bc0538b99c93f02b8b50e3e39886c06f2d003b24f48e1aa4cadfa3f341279  schedule-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
index fc6081cf22..11be2e49d4 100644
--- a/package/python-schedule/python-schedule.mk
+++ b/package/python-schedule/python-schedule.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCHEDULE_VERSION = 1.1.0
+PYTHON_SCHEDULE_VERSION = 1.2.1
 PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
-PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/a8/b5/a291a4c0faa491fd5baefa6d89011ece581cff47b23c0a39b42a63383358
+PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/29/22/9dd374cbf76a42ece1f1f41cc8f4957f0ad512577372527cd3dd52758241
 PYTHON_SCHEDULE_SETUP_TYPE = setuptools
 PYTHON_SCHEDULE_LICENSE = MIT
 PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
