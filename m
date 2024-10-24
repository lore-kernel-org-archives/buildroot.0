Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EDBD0BB46
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 00:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9826B40227;
	Thu, 24 Oct 2024 00:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVlTSx30trWA; Thu, 24 Oct 2024 00:29:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA1B406E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA1B406E5;
	Thu, 24 Oct 2024 00:29:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9581972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0B6C406E5
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNshRNOYdorv for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 00:29:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67A5940286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67A5940286
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67A5940286
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:29:03 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a4dc2fff04so1887235ab.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729729742; x=1730334542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2tt5uBB8NJhZsC8NsbZDc33eA6cCneqNRnhNRhIyIk=;
 b=Nj4610387jFt4jBleOaa016KDn8knCndn18Z/k7t4bz65eXkI1ziwdAgxYuFHusgfu
 qLQsLLLW+kTCH4l3jOaTQP99aVXu0Bqs3p0zCNIAESKkwor/Sl+CV2SlsD/m9ALJQzhe
 qrPInAV7dEzsEwOj563g8lxNqkJotmgbLRBks0EH2Cfca74MWjCkpu44XZvtZtJF4rmz
 rW8u/WNC/o6E+l078jFYmQuGAH147oGh2GJr/q1DNX0RT/9iaGJoOkvTcw3wSoSdgpVq
 tCzR5PZnfEpowLLVyMkrpaU8M8BGAIaIq2eHpeDIa/x+mKZjvCff+YjBhOyrmHHp6j53
 g6+g==
X-Gm-Message-State: AOJu0YwhNx5HDNOi66nG7LqCYbbr2aa4OnwtO10PDcYTEisaCK6+FDEp
 Ti9VY6HwtGWKLY1Qnao+tmjyqPNR8UzRXzM0XCSrr9ro/ivI6d6po7O0uA==
X-Google-Smtp-Source: AGHT+IGtGWSO3a1geHG9ki5/pFKnIfn1SBCBsNh7tlhbAtjMhHa4WQSkt2Upjb2cn1DsDCfgutxfsg==
X-Received: by 2002:a05:6e02:1749:b0:3a2:7592:2c5 with SMTP id
 e9e14a558f8ab-3a4d59be0c3mr49454375ab.17.1729729741789; 
 Wed, 23 Oct 2024 17:29:01 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4dc8997b4sm3340745ab.28.2024.10.23.17.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 17:29:00 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 08:28:37 +0800
Message-ID: <20241024002847.10348-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014014039.331820-1-fancp2007@gmail.com>
References: <20241014014039.331820-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729729742; x=1730334542; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2tt5uBB8NJhZsC8NsbZDc33eA6cCneqNRnhNRhIyIk=;
 b=fueViFJJp9xA8w1kQfye8+U0+pt/WJQJovCBSKg4+P68HotPZ9Dd337AgMSBlajG+b
 ZwNeE+OS3RrkxUfHMHB3oa00JFm+KCpVk+k393VxCUNc65yNRGODJHxx+aGqwXnVKfFg
 LbdSWvSqdnfT/S7+vi5n+IytgYPOmJixCiktvuLEvGnDy7O1VZLESxS5JpxHKmSiSyFm
 uqGgzA3yvATR1pk/XfiNmXKgrX9GYZMlhT25fXKXHNgBihwOWrmpB1TBOZpbgeO8Y1sb
 +SgTyZYhqhmXsl6zmS3bRIXpqRDvUQD2JPbYtoWzTBHwnox6ulIzecEGGtSIkMztKNlT
 tKsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fueViFJJ
Subject: [Buildroot] [PATCH v2] package/python-pgcopy: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - add missing config menu entry in Config.in

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/Config.in                        |  1 +
 package/python-pgcopy/Config.in          | 17 +++++++++++++++
 package/python-pgcopy/python-pgcopy.hash |  5 +++++
 package/python-pgcopy/python-pgcopy.mk   | 27 ++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/python-pgcopy/Config.in
 create mode 100644 package/python-pgcopy/python-pgcopy.hash
 create mode 100644 package/python-pgcopy/python-pgcopy.mk

diff --git a/package/Config.in b/package/Config.in
index b43e11b806..76f74815dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1254,6 +1254,7 @@ menu "External python modules"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-periphery/Config.in"
 	source "package/python-pexpect/Config.in"
+	source "package/python-pgcopy/Config.in"
 	source "package/python-pickleshare/Config.in"
 	source "package/python-piexif/Config.in"
 	source "package/python-pigpio/Config.in"
diff --git a/package/python-pgcopy/Config.in b/package/python-pgcopy/Config.in
new file mode 100644
index 0000000000..60db29d5de
--- /dev/null
+++ b/package/python-pgcopy/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PYTHON_PGCOPY
+	bool "python-pgcopy"
+	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+	select BR2_PACKAGE_PYTHON_PSYCOPG2
+	select BR2_PACKAGE_PYTHON_PYTZ
+	help
+	  Use pgcopy for fast data loading into PostgreSQL with binary copy.
+
+	  https://github.com/altaurog/pgcopy
+
+comment "python-pgcopy needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+comment "python-pgcopy can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/python-pgcopy/python-pgcopy.hash b/package/python-pgcopy/python-pgcopy.hash
new file mode 100644
index 0000000000..9fa7990877
--- /dev/null
+++ b/package/python-pgcopy/python-pgcopy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pgcopy/json
+md5  bb7940ed821f54f32705c462f7582458  pgcopy-1.6.0.tar.gz
+sha256  0da9235eea4ee9ceb4f52b97523bc89db9a6f8e80f897b49214e814ea13d04b0  pgcopy-1.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256  969191428cb0729e689468bdcd152291a4e168875755c97745cd2df6de5520c1  LICENSE.txt
diff --git a/package/python-pgcopy/python-pgcopy.mk b/package/python-pgcopy/python-pgcopy.mk
new file mode 100644
index 0000000000..09fd7ea584
--- /dev/null
+++ b/package/python-pgcopy/python-pgcopy.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# python-pgcopy
+#
+################################################################################
+
+PYTHON_PGCOPY_VERSION = 1.6.0
+PYTHON_PGCOPY_SOURCE = pgcopy-$(PYTHON_PGCOPY_VERSION).tar.gz
+PYTHON_PGCOPY_SITE = https://files.pythonhosted.org/packages/b0/7d/a5c833f921b20cdb1e8538e72a6065bcc67bbb270fa7a35e98f2d397ce0c
+PYTHON_PGCOPY_SETUP_TYPE = setuptools
+PYTHON_PGCOPY_LICENSE = MIT
+PYTHON_PGCOPY_LICENSE_FILES = LICENSE.txt
+PYTHON_PGCOPY_DEPENDENCIES = postgresql python-psycopg2 python-pytz
+
+define PYTHON_PGCOPY_CLEAN_PY2_SCRIPT
+	$(RM) $(@D)/pgcopy/errors/py2.py
+endef
+PYTHON_PGCOPY_POST_EXTRACT_HOOKS += PYTHON_PGCOPY_CLEAN_PY2_SCRIPT
+
+# Force pgcopy to use the Buildroot provided postgresql version
+# instead of the one from the host machine
+define PYTHON_PGCOPY_CREATE_SETUP_CFG
+	printf "[build_ext]\ndefine=\npg_config=$(STAGING_DIR)/usr/bin/pg_config\n" > $(@D)/setup.cfg
+endef
+PYTHON_PGCOPY_PRE_CONFIGURE_HOOKS += PYTHON_PGCOPY_CREATE_SETUP_CFG
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
