Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BB6C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 21:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B884982CAC;
	Sat,  6 Jan 2024 21:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B884982CAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9JrCasE8V-B; Sat,  6 Jan 2024 21:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5D9E82AC6;
	Sat,  6 Jan 2024 21:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D9E82AC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3011BF295
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34C2A60BD0
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34C2A60BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hd2UV0GCYuch for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 21:44:18 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3353E60B3B
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 21:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3353E60B3B
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3606dda206aso4870605ab.3
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 13:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704577456; x=1705182256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lg2/6swzOKwS1w88Vw47J55iRQBCXPLApae6BG626Lg=;
 b=BGriHvBaLoVpcL0ZcC2p7h7g+O/HsXRDL6OCM1AqKuSd8LD3XEThgkEM663DU0ZUob
 aGROH8z/vCMHd5mKUV551Okg9GdOBRG5C1rxa4l/62y1vEN8vy7yELqkinO+xi2hoyr3
 Id9hFq07U1Nwdz4o/u/MuyeJR0xWOvzIEm+SANf9BHR1RLZkhz8B2nuFFbOfbJxpvJfL
 um98jKYQyYZAKz5n8Zo9YlyIVmFaMTGa8nVygjeJtzEFw5WDknFZGmneKuIPOgF1T24h
 KBqEqbJM/yrYigVsk4ca8k7RV0TYtMXHHOLUh0smcmM5KbVjEABPRFSQjULTs9w3oH0B
 7P9g==
X-Gm-Message-State: AOJu0YyvB06qmoXUVn3rhzj/k3SwH813TvEypL5lTHVRZPDEvftwDoIk
 l6uKAp8waL4L4askL4oP3Q1JMj2cyKSuhg==
X-Google-Smtp-Source: AGHT+IE8PeAvSr6W8ixsl0j8n2X2zHquDJaiIV5DaxP5R5ru6yiv6x8fY6y1JMuEzso0cBm+GgNucA==
X-Received: by 2002:a05:6e02:168b:b0:35f:fe58:7001 with SMTP id
 f11-20020a056e02168b00b0035ffe587001mr2896163ila.42.1704577456457; 
 Sat, 06 Jan 2024 13:44:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 6-20020a056e020ca600b00360039199cesm1496587ilg.3.2024.01.06.13.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 13:44:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 14:44:09 -0700
Message-Id: <20240106214410.3294887-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106214410.3294887-1-james.hilliard1@gmail.com>
References: <20240106214410.3294887-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704577456; x=1705182256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lg2/6swzOKwS1w88Vw47J55iRQBCXPLApae6BG626Lg=;
 b=I5UKOaDO7CfCaH47IYcz5T9KjQA8rYr59yCLEbqWcWKyAXid1QybD0nsrAB83nWYRp
 GUMfpETBGlbWe9pyZB1U2vT04QRU7vGgCEPUWNtQa+MWqLzakJYYbGCso2EnH5EHNKXn
 vVjP0reNEUKTZkSnDPpapu45yHMELKxMmO6prqZsiA010+gsJ/VhD9WgmUlt9geXp1P9
 PtLVsLh68ytEDEdc7kZw/OeJnFHWLB4H68cuLFSAKMIsYloC5kmSTEhDdl59CEXOZhTk
 1Gc07QebM/uthWDoImTxVgQ1218rA69IvIWXgv1z8Xsty358vC8DBdx+G8rg+M7KHm6l
 FzbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I5UKOaDO
Subject: [Buildroot] [PATCH v2 3/4] package/python-pypika-tortoise: new
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
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
index ea023a84ef..645393c0a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1276,6 +1276,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pyphen/Config.in"
+	source "package/python-pypika-tortoise/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
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
