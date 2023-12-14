Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7110C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 09:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F28B436DF;
	Thu, 14 Dec 2023 09:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F28B436DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apiw3aYZOkto; Thu, 14 Dec 2023 09:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27A7C436F2;
	Thu, 14 Dec 2023 09:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27A7C436F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44A681BF376
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E6F561AF1
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E6F561AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sma_mTxfNjmg for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 09:15:10 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26E8D61AD0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 09:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26E8D61AD0
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-35d74cf427cso30428965ab.1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 01:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702545309; x=1703150109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d9VlfZRSBKDVujcIi2tKBjGH2CfZ0cjDJmRozT89kv4=;
 b=MP8giaAzfRDltMOTI197PB/40XYTpfyTddx+RF63X7tyoTBBPKBVB+XVM8TDhWmF8H
 ZhT1XslTC4yKFiq1zxYXmBVAp7VRHMqgIpwqIlmr+ZUhT9CN+qj7NqS9NJGEelXbHepj
 eEL76KdEGg07HHzsKRDjjQ05jI22ujqIcEl6w8MUEGOuH7+iHw47fekt879Tu20IUS+V
 PedOW9N0HzvKepxpzHflbSN1GSuzqkRvF4rSiEgBhpiZ0moyGYJOBcyJkND2I//mhKhP
 l6T7fy8RQyWxO05UBcFAjwzqJiYZ2jfi9sB5lQmP4WGmBZncrKaNduPnMo4RwcaiONr8
 YswA==
X-Gm-Message-State: AOJu0Yz2vxIVT/LDttMyYy1K/K7OG/oWSHkBLdg0ZfggTaeNnXolKM9I
 f35VfDgvduIQaskeO3PY/atEfWplp9F7XQ==
X-Google-Smtp-Source: AGHT+IEKMPDEXVijeOxlnTK/J8jHrC/OjPte3TDnVS92AJuxbqbc59USIGzv26CGC7/2Mk8YN13AUQ==
X-Received: by 2002:a92:d08f:0:b0:35d:59a2:6469 with SMTP id
 h15-20020a92d08f000000b0035d59a26469mr8675861ilh.60.1702545308802; 
 Thu, 14 Dec 2023 01:15:08 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 db10-20020a056e023d0a00b0035af0c79e23sm103446ilb.40.2023.12.14.01.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:15:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 02:15:03 -0700
Message-Id: <20231214091504.101102-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214091504.101102-1-james.hilliard1@gmail.com>
References: <20231214091504.101102-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702545309; x=1703150109; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9VlfZRSBKDVujcIi2tKBjGH2CfZ0cjDJmRozT89kv4=;
 b=B7Q8v3WD0+OS+nR1tOheHSoo8E+9eKNbolT76S8/bvwQCZi+aV21CYFCi72R45bMHK
 Y4r305doKqbozSnHZQhv2LdPcDxLxlf5BMt2YP0+l6zLcHFbYcA+1ohTG4L8TIXPC9VQ
 iqFV905o5qRAkFtx7EN3NuIxcV9/z3Tnpwx5Bcgem4GOlWwEp2RJtTAKgXW4rYS5Jrp2
 r2t46GHceWnLsL4Y8Ma5NyAt/kUSo8Nimvae154QzT+lrZlp/YwPA7rUT3dis7VMxp6P
 y1nX9zESumezMTE3hCmrYxN4fx4OW6gRu1vfM68X2GSaKoUuFQ9j89O4wnFokRWPmYek
 nowQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B7Q8v3WD
Subject: [Buildroot] [PATCH 3/4] package/python-pypika-tortoise: new package
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
index d24db2550e..12ddd7b384 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1252,6 +1252,7 @@ menu "External python modules"
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
