Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62042C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A88641969;
	Tue,  9 Jan 2024 06:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A88641969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6TNHMiEB4CG; Tue,  9 Jan 2024 06:02:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6F441901;
	Tue,  9 Jan 2024 06:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B6F441901
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9D801BF3D8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B302A82948
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B302A82948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mS8xMyGXW2T9 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:01:35 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B143382923
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B143382923
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7ba9f1cfe94so94533839f.1
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 22:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704780094; x=1705384894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5iV6K+fd1FCDau2or78HfdcpqCdvV74QLax9nmaEhvE=;
 b=wwecPmdC5nhAgQgDWvBGJe2bUMJpg+i/MJ2S9+RmM2rizWIPIO0tKGneiduSsEEm3g
 m5r0airMfbZRB/QO5jKAsd2oewUPuOQCxsnUEci60vnKWm0YUqm4GHp72IzxKrklIHr5
 ccb6OrrG37xuPLvykBDlcQJ/qoKetYopuoTsZmKTRnd2plvgmrpARAM0eb4aMk1/wFBO
 adVEOEak8aiQ2nyI240cNQ3YN4Ng+hfeJrG3Jx5DxcEU44CRS3xA/2BnAtTHxK8GEh1o
 lY1XpdQmOqB1CpyKx+DWxj4yQPQ89Q7ajVt/A7PSZmBgHdw/eA+tHPGZB0OKHqLgL2zJ
 RSwA==
X-Gm-Message-State: AOJu0Yy9r2H9AlnY/2pGtQdUHKSqUsb6b4BQI8MkheKkrPEtyuBSww+P
 UAeiS0fP+zN2DG2WzS9rsi93k9pKfuoHTg==
X-Google-Smtp-Source: AGHT+IGHVPFpHoCOj6ou1tL7S1/0SJS3FE1kJiHJzeMA5CPoPH0MZM2TOGPlw+wOEB5SvQfZb38Xdw==
X-Received: by 2002:a05:6e02:1947:b0:360:8cad:8184 with SMTP id
 x7-20020a056e02194700b003608cad8184mr256430ilu.7.1704780094427; 
 Mon, 08 Jan 2024 22:01:34 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 n15-20020a92d9cf000000b0036063b51610sm410975ilq.27.2024.01.08.22.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 22:01:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:01:27 -0700
Message-Id: <20240109060128.3974794-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109060128.3974794-1-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704780094; x=1705384894; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5iV6K+fd1FCDau2or78HfdcpqCdvV74QLax9nmaEhvE=;
 b=fjvGvZ+PtvSvidnGHUIOy5H2+MO9ONl3VFiaNAY4LoGI3cmFy/gyLBXkxs++L6lrAM
 h1VWNFPSQ0TxLPRSqmJp30PfOYO0eei5fFdTnqeiOf3yWfGjyHR7WvHpXe5/dMZdqFqs
 Ec5CLP8dBd4fNQ9on+fXqdx1L7dpE0sCtMeEb9OM+LJD/QrDzStmp7BbsX9X4fIsRuTy
 4sXe+AgXEwaoV78SJad5nX9/ZoP1etOGjh5GPSMnzbcw3TF4rOJW8W8lDPpUVTceYbXf
 pccKU3/0QBz1aeoUS9mdT1OxEOo0+kKF46Slq/NbxWLPPI5+SWVUO9YNsT5PRH+y6OFz
 WLpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fjvGvZ+P
Subject: [Buildroot] [PATCH 5/6] package/python-jaraco-collections: new
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                 |  1 +
 package/python-jaraco-collections/Config.in       |  8 ++++++++
 .../python-jaraco-collections.hash                |  5 +++++
 .../python-jaraco-collections.mk                  | 15 +++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-jaraco-collections/Config.in
 create mode 100644 package/python-jaraco-collections/python-jaraco-collections.hash
 create mode 100644 package/python-jaraco-collections/python-jaraco-collections.mk

diff --git a/package/Config.in b/package/Config.in
index e296e5cde2..df258f2945 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1151,6 +1151,7 @@ menu "External python modules"
 	source "package/python-iwlib/Config.in"
 	source "package/python-janus/Config.in"
 	source "package/python-jaraco-classes/Config.in"
+	source "package/python-jaraco-collections/Config.in"
 	source "package/python-jaraco-context/Config.in"
 	source "package/python-jaraco-functools/Config.in"
 	source "package/python-jaraco-text/Config.in"
diff --git a/package/python-jaraco-collections/Config.in b/package/python-jaraco-collections/Config.in
new file mode 100644
index 0000000000..a6fa721d4d
--- /dev/null
+++ b/package/python-jaraco-collections/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_JARACO_COLLECTIONS
+	bool "python-jaraco-collections"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jaraco-text -> python-inflect -> python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_JARACO_TEXT # runtime
+	help
+	  Collection objects similar to those in stdlib by jaraco.
+
+	  https://github.com/jaraco/jaraco.collections
diff --git a/package/python-jaraco-collections/python-jaraco-collections.hash b/package/python-jaraco-collections/python-jaraco-collections.hash
new file mode 100644
index 0000000000..0308d48641
--- /dev/null
+++ b/package/python-jaraco-collections/python-jaraco-collections.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jaraco.collections/json
+md5  2b12f44216432f1ce2ead377fd7a2b93  jaraco.collections-5.0.0.tar.gz
+sha256  1680e8d09f295f625c7ba926880175a26fdbe7092b4c76d198e30476b21cfe68  jaraco.collections-5.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-collections/python-jaraco-collections.mk b/package/python-jaraco-collections/python-jaraco-collections.mk
new file mode 100644
index 0000000000..1400e286ee
--- /dev/null
+++ b/package/python-jaraco-collections/python-jaraco-collections.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-jaraco-collections
+#
+################################################################################
+
+PYTHON_JARACO_COLLECTIONS_VERSION = 5.0.0
+PYTHON_JARACO_COLLECTIONS_SOURCE = jaraco.collections-$(PYTHON_JARACO_COLLECTIONS_VERSION).tar.gz
+PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/e6/85/9c4ab9772bcc2c9b4beffd56aca70f646e4a1f3a576579fa401d742b46a8
+PYTHON_JARACO_COLLECTIONS_SETUP_TYPE = setuptools
+PYTHON_JARACO_COLLECTIONS_LICENSE = MIT
+PYTHON_JARACO_COLLECTIONS_LICENSE_FILES = LICENSE
+PYTHON_JARACO_COLLECTIONS_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
