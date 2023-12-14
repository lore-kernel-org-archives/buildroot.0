Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DDAC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 16:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A1380BF9;
	Thu, 14 Dec 2023 16:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A1380BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxNPewaznFqO; Thu, 14 Dec 2023 16:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FF0781971;
	Thu, 14 Dec 2023 16:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FF0781971
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 696AC1BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 418BC403C4
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 418BC403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2q7-PpEVKeT for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 16:54:50 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05B0E4010D
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 16:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05B0E4010D
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7b6f4330598so349256239f.1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 08:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572889; x=1703177689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6cYPqSnmN2TWQb4qa+Qf6rnMzgtpqn5zQwwvEg1ZVA=;
 b=vnnwI1yPfCs/t2CwGoocJyYngVq50HJQt+9ODh7NM61kmmMXIJCJr3Ym2u2QidX8xz
 MruNG3UolyhxlY5hYfyMbSBJYlA/i7YI8H5M7pTGh/YRjgNImeA6gbTF+TSq41qzTvUb
 KoYt7CQCHatC/vJY1TKs4v16MgGEn77bgT+E+W6hIi3Zv8Q3xe3qaycflAn22MybtSff
 YCIgczybF07LHfDnZ8kOpplhpL4A4TiIqs/HwDLX0X9VuRN11Q/S2x3MncgwMMmnkvpG
 mAxnUSD9OsAAjE4s4AutE5Rf9FayyJKjd9fkr1sgMnR5DSG3KGYRH5zdwaM2fdtQHxzg
 ep7A==
X-Gm-Message-State: AOJu0YxyeqDYGrv3FdcV+8aNXtoVDuYLk0+LIg32fn00rlgeuEzyLwMp
 HUqhpXjCWwvMNE2LvyDxaX1u1/zu0Id1vQ==
X-Google-Smtp-Source: AGHT+IEAUygGZiCJb+TiH/AsBRLRvGckzz1hxdozfaVST/pqHaeio8TJtwWmlaumigIqT+6XIgCdBA==
X-Received: by 2002:a6b:a08:0:b0:7b6:fc52:bf85 with SMTP id
 z8-20020a6b0a08000000b007b6fc52bf85mr10726281ioi.22.1702572888723; 
 Thu, 14 Dec 2023 08:54:48 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 u16-20020a6b4910000000b007b7372af699sm2912178iob.9.2023.12.14.08.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:54:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 09:54:17 -0700
Message-Id: <20231214165420.181703-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214165420.181703-1-james.hilliard1@gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702572889; x=1703177689; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6cYPqSnmN2TWQb4qa+Qf6rnMzgtpqn5zQwwvEg1ZVA=;
 b=NWCAK90XdPB7eZ5Ke02GCEbT1YEGAlhfsQ1jaFYHyJiUo47iNOeA4RYr+Sox6/X9Bn
 aVZKZQqwUjty3lYJYGEmM6v1bhLv/rdnALqVvOgqWmsY+7Zuj4NHZA6k4WZ4q+VrAdDv
 rUDUOnVbVlUqSg0Ay8qN5687Fq6rkeuwJKMvZarqPyugvprt4/jVQjaDt4y8egfK4rq+
 hfgpcVeIr917P0KzHTEtuXJjSIFV9SiWbiywkAYPZUMX3IqAvXc56eH5c2iXxRVius3P
 EtaZ3ZZYBxVNHsSannoYzm4B6Yrol+YLSrZTjMeXZdB/9iYl6qr4e70Emj+67b2u45uz
 8POw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NWCAK90X
Subject: [Buildroot] [PATCH v3 5/8] package/python-uvicorn: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-uvicorn/Config.in           |  8 ++++++++
 package/python-uvicorn/python-uvicorn.hash |  5 +++++
 package/python-uvicorn/python-uvicorn.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-uvicorn/Config.in
 create mode 100644 package/python-uvicorn/python-uvicorn.hash
 create mode 100644 package/python-uvicorn/python-uvicorn.mk

diff --git a/package/Config.in b/package/Config.in
index 8a97eb2897..cf530b1355 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1375,6 +1375,7 @@ menu "External python modules"
 	source "package/python-unittest-xml-reporting/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
+	source "package/python-uvicorn/Config.in"
 	source "package/python-uvloop/Config.in"
 	source "package/python-validators/Config.in"
 	source "package/python-versiontools/Config.in"
diff --git a/package/python-uvicorn/Config.in b/package/python-uvicorn/Config.in
new file mode 100644
index 0000000000..3e769392f9
--- /dev/null
+++ b/package/python-uvicorn/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_UVICORN
+	bool "python-uvicorn"
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_H11 # runtime
+	help
+	  The lightning-fast ASGI server.
+
+	  https://www.uvicorn.org/
diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
new file mode 100644
index 0000000000..cfa999e210
--- /dev/null
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/uvicorn/json
+md5  a1af843e7e305d551030abfa09dd3b15  uvicorn-0.24.0.post1.tar.gz
+sha256  09c8e5a79dc466bdf28dead50093957db184de356fcdc48697bad3bde4c2588e  uvicorn-0.24.0.post1.tar.gz
+# Locally computed sha256 checksums
+sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
new file mode 100644
index 0000000000..887e4ac390
--- /dev/null
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-uvicorn
+#
+################################################################################
+
+PYTHON_UVICORN_VERSION = 0.24.0.post1
+PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/e5/84/d43ce8fe6b31a316ef0ed04ea0d58cab981bdf7f17f8423491fa8b4f50b6
+PYTHON_UVICORN_SETUP_TYPE = pep517
+PYTHON_UVICORN_LICENSE = BSD-3-Clause
+PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
+PYTHON_UVICORN_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
