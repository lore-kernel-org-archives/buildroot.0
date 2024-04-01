Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3393CCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 21:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7269A40769;
	Mon,  1 Apr 2024 21:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBnclWvzlsJL; Mon,  1 Apr 2024 21:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08F5440761
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08F5440761;
	Mon,  1 Apr 2024 21:24:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1456D1BF338
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 013BC605DF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHC7LHdGFQq1 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 21:23:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0205605DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0205605DB
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0205605DB
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 21:23:55 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-368713f2f23so21285235ab.3
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 14:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712006634; x=1712611434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lwi9kZp+/mE7jDEl7FmGXdokwT33DZRizJZGaqxZUX4=;
 b=lEDPUJPyEEWIbROmtnNtC50ESGqT2tSSq3JZMkpTbgz/TxzUNs5bWmEeuJy4GCDkjv
 ZM28boom1zrmHuvltHlcmn6vt8gpW6IwK2E60ICON8jXCw5hc48sPBuHcWXmRHLV15bf
 6erutU43vRmCrKoL4yweTnHBxw2SJnPSI6Fv/ZFrmA65TKdRW6zyv/rGef8+Wo3Dh0Tg
 ezey91togzx3k54W2wzlz9jzHmpXcSecBX3qaxEiT4T2Ey6f1fRjsJ9eFVLAVePwRDO1
 DnQVFspvYQDecxj0CgG5tvZ9Wf8Ge8n3adyJaXfSLtkUoyHVmaQfdocZeYJ5IGfiA97n
 XjeQ==
X-Gm-Message-State: AOJu0YznF8ZJUTnUWUQxWp42QDzdO43SjHAjQuWF/L88GUcjdVL8ObcK
 d8hcDcbO1UXV7RZpigRvm/MOI9o7jYztGTS+SBLsAEJPNdVnYMxz2HPmreCSGhu0LQ==
X-Google-Smtp-Source: AGHT+IHVY3RrLN0SY4KOvjjs5f6T/pJY4M3q2VtySjI4FyGNeyXrG8wAECXasyZCZayNTn44E8CEig==
X-Received: by 2002:a05:6e02:1a84:b0:369:9adc:8ae with SMTP id
 k4-20020a056e021a8400b003699adc08aemr7749554ilv.10.1712006634153; 
 Mon, 01 Apr 2024 14:23:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 d23-20020a02a497000000b0047708160be9sm2813844jam.147.2024.04.01.14.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 14:23:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 15:23:41 -0600
Message-Id: <20240401212344.1345395-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401212344.1345395-1-james.hilliard1@gmail.com>
References: <20240401212344.1345395-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712006634; x=1712611434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lwi9kZp+/mE7jDEl7FmGXdokwT33DZRizJZGaqxZUX4=;
 b=JfHyH+guOuoaoBbraI8iaxbdXjfRIzxijS1KG8PlFsYTck7YOGBsFambe5Z7TBvbOT
 wMMCp8NOUZaPieUAZvLf2Q6IjXmsUCT4+W1a1fD6Dwy7TB+wm9u72Xzg4dYJ4acBkiJI
 ilE3/tIyb89qKK/ZA77uk8LS08dU1uWEhlkjajMwePjAwvkhuevvD31AN75SVjMU0RoH
 CCF+NOE5XRf8lPBz0eYTiIIyagPg8Q2ZOmWLOcRuSTCG7sDePXFTdI316eGr2CgIT2eL
 OA0VXY3FMMd4ZPUmk6jk9tbN6grD91FqoRLmyLgqU+ofIi1fn838j2Nmcxl+0koFyiUb
 9GvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JfHyH+gu
Subject: [Buildroot] [PATCH v4 2/5] package/python-tortoise-orm: new package
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
 package/python-tortoise-orm/Config.in             | 10 ++++++++++
 .../python-tortoise-orm/python-tortoise-orm.hash  |  5 +++++
 .../python-tortoise-orm/python-tortoise-orm.mk    | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-tortoise-orm/Config.in
 create mode 100644 package/python-tortoise-orm/python-tortoise-orm.hash
 create mode 100644 package/python-tortoise-orm/python-tortoise-orm.mk

diff --git a/package/Config.in b/package/Config.in
index af9f1e38a9..5aeb5b02c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1381,6 +1381,7 @@ menu "External python modules"
 	source "package/python-toml/Config.in"
 	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-tortoise-orm/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-trafaret/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tortoise-orm/Config.in b/package/python-tortoise-orm/Config.in
new file mode 100644
index 0000000000..62b1a5a86e
--- /dev/null
+++ b/package/python-tortoise-orm/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_TORTOISE_ORM
+	bool "python-tortoise-orm"
+	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
+	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
+	select BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	help
+	  Easy async ORM for python, built with relations in mind.
+
+	  https://github.com/tortoise/tortoise-orm
diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
new file mode 100644
index 0000000000..4796c8277f
--- /dev/null
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
+md5  aa5efa50e69d0a67b75c187f7550acd7  tortoise_orm-0.20.0.tar.gz
+sha256  283af584d685dcc58d6cc1da35b9115bb1e41c89075eae2a19c493b39b9b41f7  tortoise_orm-0.20.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
new file mode 100644
index 0000000000..cc1c2126b7
--- /dev/null
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-tortoise-orm
+#
+################################################################################
+
+PYTHON_TORTOISE_ORM_VERSION = 0.20.0
+PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/3b/84/8ca142fe370d59c4e3135825b2822d199c4f885ae855657c1a7361e68511
+PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
+PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
+PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
+PYTHON_TORTOISE_ORM_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
