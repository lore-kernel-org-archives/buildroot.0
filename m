Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46591C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA8CB81FC4;
	Tue,  6 Feb 2024 19:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9h6_d6Z5IDL; Tue,  6 Feb 2024 19:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BE4F81F56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BE4F81F56;
	Tue,  6 Feb 2024 19:30:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 485E81BF2FB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41C0A40150
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGcHqAw2nR7B for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAB8C400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB8C400CB
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAB8C400CB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:30:52 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7c029beb8c9so248561639f.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 11:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707247851; x=1707852651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COAfogesZDY6HTKhDAzBWSvp+Vbz/Nup03ICaeEBwDg=;
 b=dcRBkELZX0B0ONpjqeLjZKz8bGOZAHm0Ry/QGz4ccRz0dQVwnEa9TNuqFjB/fCk9S8
 RplBQt1mUjkdBEUhvyGIyvSYcL5V3Xddh93VnEAESa53ndHj5oq4N4J+fGtPdNNIQla4
 v6hkKuFTbc1lkqX8i2RdJoIHtZgqbNa4XmdzrwIW6lVk8+yUbd3Pxj3t7HW7vWIGJpUE
 moDq75U7RYXD9NoL2o2xk4jZz4O6AOxAs4xHXwyol2rAePF23YywiaMZUfP44X7S0nfP
 wFYiQBxeJxB2Ni4r+iMG+gE1wRyvEtRGPD9Qw8jlItqjc7ZFKUwBH6jyqh8Orgafaq1j
 lvDg==
X-Gm-Message-State: AOJu0YxJ3bcXmI84VZ68WVZc1AKFEehH3XQJZ5y1ISoqFKjtHR70iMfq
 JdjUZULOkUYeg/iyzw1JUpaI1bZ2eTgIFZK/Wjljutp5JLltmbZqipeUplBONYg=
X-Google-Smtp-Source: AGHT+IHssxajH+lr2YgmzbMJjh7q+aZoC//KMBVCeeKUQsgZvdFV+tk7TOhvOxRtCuu5msP0+ohpCg==
X-Received: by 2002:a05:6602:1d52:b0:7be:f7e5:44fc with SMTP id
 hi18-20020a0566021d5200b007bef7e544fcmr4307690iob.21.1707247851272; 
 Tue, 06 Feb 2024 11:30:51 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVzHu0Id/p5DrQjjn6mnxAa779NJzW9FJT0ICA4tAK8I8lHQ3f13OGQB9F3GICYAuH8WoCtfxZ2RPxNNW/F8zAPcy5ZniMUyMm8uj+olouvWRkFXyAMzNNLJrmWSWU3E95tlqeTBeSRGrlSiuoGE+6Nt1xVvc0kZCc=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 gk5-20020a0566386a8500b004712ffda5ecsm658717jab.60.2024.02.06.11.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 11:30:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 12:30:47 -0700
Message-Id: <20240206193048.658003-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206193048.658003-1-james.hilliard1@gmail.com>
References: <20240206193048.658003-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707247851; x=1707852651; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COAfogesZDY6HTKhDAzBWSvp+Vbz/Nup03ICaeEBwDg=;
 b=Nps9NjEzazfw1GfTchsstkPdeHC7Vd3t2oCyCSBauttStU3ZPl4I3B3I8E9O4dlpS5
 tFpAanqEVuibBoZuUk8yq0it+R3vzd+nGavcWG1EQ72h+5bjUhLR/8lpVMDQLEyJ+s7m
 lBLz3+1o9p7W1fnZhl7YeIdv9bUWfyT0PPjqcCO9aFZ5LJPlX9LYdkyNV+3y6ThFUNH9
 fdwU60njboGks+lfs7xXAr+aFg3YG9EjvCubya1WYw5Y8jct60obnba4XZel23GRAWVG
 rn6ajffs9mfBsJuo1LTa2KJT/98z/TU2aZIRhJQesUqu4VVDxEocGScilzbJAFRjhQL9
 pCWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nps9NjEz
Subject: [Buildroot] [PATCH v3 2/3] package/python-pypika-tortoise: new
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                 |  1 +
 package/python-pypika-tortoise/Config.in          |  6 ++++++
 .../python-pypika-tortoise.hash                   |  5 +++++
 .../python-pypika-tortoise.mk                     | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-pypika-tortoise/Config.in
 create mode 100644 package/python-pypika-tortoise/python-pypika-tortoise.hash
 create mode 100644 package/python-pypika-tortoise/python-pypika-tortoise.mk

diff --git a/package/Config.in b/package/Config.in
index b48f9eb1c7..d1ed6cf224 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1277,6 +1277,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pyphen/Config.in"
+	source "package/python-pypika-tortoise/Config.in"
 	source "package/python-pypng/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
diff --git a/package/python-pypika-tortoise/Config.in b/package/python-pypika-tortoise/Config.in
new file mode 100644
index 0000000000..62e14c6d50
--- /dev/null
+++ b/package/python-pypika-tortoise/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE
+	bool "python-pypika-tortoise"
+	help
+	  Forked from pypika and streamline just for tortoise-orm.
+
+	  https://github.com/tortoise/pypika-tortoise
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
new file mode 100644
index 0000000000..629762f4f7
--- /dev/null
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
+md5  98c9677516f06f61f211f834d51949a6  pypika-tortoise-0.1.6.tar.gz
+sha256  d802868f479a708e3263724c7b5719a26ad79399b2a70cea065f4a4cadbebf36  pypika-tortoise-0.1.6.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
new file mode 100644
index 0000000000..84aa19cfbb
--- /dev/null
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pypika-tortoise
+#
+################################################################################
+
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.1.6
+PYTHON_PYPIKA_TORTOISE_SOURCE = pypika-tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/86/55/1bfd4150f664d2e07b36c8f442178cc1f717bb9ae6cae20f21e851c208c6
+PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
+PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
+PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
+PYTHON_PYPIKA_TORTOISE_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
