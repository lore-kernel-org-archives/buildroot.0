Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E26FC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 09:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B0F6F4AD;
	Thu, 14 Dec 2023 09:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B0F6F4AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNUNvVLnKNJg; Thu, 14 Dec 2023 09:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1A536F49B;
	Thu, 14 Dec 2023 09:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1A536F49B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 578551BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DDC183C83
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DDC183C83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_upPHNI4Rph for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 09:49:01 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB9D08382F
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 09:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB9D08382F
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7b3708b3eacso324534639f.2
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 01:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702547340; x=1703152140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2oWqnYFZS0kT0d5ysMHJKrg72qmML/xbsEvXSLZYpok=;
 b=iI95batqRI5FHbM+SDFQSQGTkHqdPj4rahtnl6Dn18jfAtuGhCWnekiQIgDda+9/Vk
 butCUgQEzizBk/zfJs8wD/2UkrqpCAjd72VuoJUjnRtSduR8ClWD375M+UCCh9dIsBnY
 2GB+xQqmz1w9wFInQDzWO8MMN7geeD1UKOMjTIJyAHxtMP0eLiXxSREqd5uTJU1GX9MP
 ZxHooafGcCbLAPkRWOqWjpvPQFTkh3A33B1tEEPNYwsimPH2Z0GV9rmn5Wncna7hHAmE
 4N/VydBQ4hAmAzycjzrcCD5uHG1NwHvQQmyPcmzk9q02FEaehpGDpba7Bupt1Fi2uzmG
 LxRQ==
X-Gm-Message-State: AOJu0Yyx7osfXX+nfE9Zi5MribmCUdo9gJ0H0TFiUjY4o3h8GTiR2cV6
 8oEzInOD29/KqtMSEMh1k8vkcCeqlxZYpA==
X-Google-Smtp-Source: AGHT+IG66huvKch0GNX3Ugv+nyhh04ZcZ/BkmUHcxqEICbfNce4Powh7xrMcP9YzNaYBTXW8wKDJZw==
X-Received: by 2002:a6b:e818:0:b0:7b3:9232:36b7 with SMTP id
 f24-20020a6be818000000b007b3923236b7mr10101139ioh.5.1702547340471; 
 Thu, 14 Dec 2023 01:49:00 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 fx5-20020a0566381e0500b00455d85d6656sm3342144jab.173.2023.12.14.01.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:48:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 02:48:45 -0700
Message-Id: <20231214094846.115655-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214094846.115655-1-james.hilliard1@gmail.com>
References: <20231214094846.115655-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702547340; x=1703152140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2oWqnYFZS0kT0d5ysMHJKrg72qmML/xbsEvXSLZYpok=;
 b=hK2nltYMobltVAM30eQQBumyLB643lzZvlxF6uOt/CWm8SIBi6IAChzgQ+2WM9vp15
 HgBLZMiqFsg32vFk6mEPqFmQBjX5iuE8AHnzW3naHgHS0OPJ9E4AdM61JoKKCF1YNb9L
 JFqjnC6FEqy6U2KkH4l5zaIW8+7W+jZ4ko3RkWliJxYTWPvdYmEZL6BFejBPVAaqvpi2
 8/jEDDuZ8sntlrqIQmaoOY21r85lhi1UqnfKZsPxCMmT/jRYuYniYi3p8pFgjMXANV6O
 4jp9WqEfIB65CSZ3yGx5QowEsFOtmCJ//8uC5dUcpoSIuufY1xF58sWvT1v1k7xJjIgi
 KVJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hK2nltYM
Subject: [Buildroot] [PATCH 2/3] package/python-starlette: new package
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
 package/Config.in                              |  1 +
 package/python-starlette/Config.in             |  7 +++++++
 package/python-starlette/python-starlette.hash |  5 +++++
 package/python-starlette/python-starlette.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-starlette/Config.in
 create mode 100644 package/python-starlette/python-starlette.hash
 create mode 100644 package/python-starlette/python-starlette.mk

diff --git a/package/Config.in b/package/Config.in
index c023e0ef3f..3a4bf21a2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1338,6 +1338,7 @@ menu "External python modules"
 	source "package/python-sqliteschema/Config.in"
 	source "package/python-sqlparse/Config.in"
 	source "package/python-stack-data/Config.in"
+	source "package/python-starlette/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
diff --git a/package/python-starlette/Config.in b/package/python-starlette/Config.in
new file mode 100644
index 0000000000..90f590689a
--- /dev/null
+++ b/package/python-starlette/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_STARLETTE
+	bool "python-starlette"
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	help
+	  The little ASGI library that shines.
+
+	  https://github.com/encode/starlette
diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
new file mode 100644
index 0000000000..3636a0c3f6
--- /dev/null
+++ b/package/python-starlette/python-starlette.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/starlette/json
+md5  2146a2e81a0578bfb1f13c7975f10687  starlette-0.33.0.tar.gz
+sha256  8c21f9592451b2016300c5bbc54b181063367b62720a4048656c070319238897  starlette-0.33.0.tar.gz
+# Locally computed sha256 checksums
+sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
new file mode 100644
index 0000000000..6e100c4ad5
--- /dev/null
+++ b/package/python-starlette/python-starlette.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-starlette
+#
+################################################################################
+
+PYTHON_STARLETTE_VERSION = 0.33.0
+PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/33/cd/2d043173dd0e3d858828102041957d7b2290747e1371878a3bb4cc1380ec
+PYTHON_STARLETTE_SETUP_TYPE = pep517
+PYTHON_STARLETTE_LICENSE = BSD-3-Clause
+PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
+PYTHON_STARLETTE_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
