Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E273D5B874
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 05:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35946404B6;
	Tue, 29 Oct 2024 05:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sp6MykdjqtK9; Tue, 29 Oct 2024 05:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9BA04049F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9BA04049F;
	Tue, 29 Oct 2024 05:47:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D8E2112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 05:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1942860781
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 05:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioFrHNG-SYc5 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 05:47:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2833460675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2833460675
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2833460675
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 05:47:23 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-20c6f492d2dso56427175ad.0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730180842; x=1730785642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/rjGdf6t02GJf/2h4UPtNZwTikPn4ZyGk7hsCvdWRs=;
 b=RCi3pCzevCXcnNVK/ViU0aC1qg6hgFiUZ0XZXuuAwnoVZ9ZATYKfw5XQOLgjVcE5Mc
 KMrsuUaq6f6ReyOywRT2D2+1zD6/0gWctBf22lyIJ7/wOsMY0g1XPnQNPC2oiXPHTZsW
 ZD5tm2Bw0gCh0xwaUk7wP3MUSRuZoAVuIpUD3usRD4SCTBoIwE1M4yhEpnQO/Uvo3Cpi
 h5/ze7QsQu3DertSPhk3//UvI+aFkmTWR+gT+MLzu7crcwgGU8nhZuD4oZPW6GOMIHRj
 J6huWtiTiR9G89VWXbDUUMOV1BYSEPpPAxG6i9WovlIBrNIN66zJ8jDtVlEwngam/uPs
 B9Uw==
X-Gm-Message-State: AOJu0YwpbSIAmV96sndN14N/7sT+QdBZDpq0qaiol2JnPJD9smFZyOO/
 VU2ss0LRZJTVUyUDSWsjQUDheShRF0v018NPu5d11Jc+Fgv/EsZNp9GpoLT5
X-Google-Smtp-Source: AGHT+IE0zlCEwnP358uZwTII1lwB0NhmCTSrMYhfV/lZJM5k4yV2NyBhrFiGhlrIB55L53VGhRsRAA==
X-Received: by 2002:a17:902:e892:b0:20b:5aff:dd50 with SMTP id
 d9443c01a7336-210c6c19c8cmr139485585ad.31.1730180842076; 
 Mon, 28 Oct 2024 22:47:22 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf44544sm59014605ad.38.2024.10.28.22.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 22:47:21 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 13:47:11 +0800
Message-ID: <20241029054713.786223-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024002847.10348-1-fancp2007@gmail.com>
References: <20241024002847.10348-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730180842; x=1730785642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/rjGdf6t02GJf/2h4UPtNZwTikPn4ZyGk7hsCvdWRs=;
 b=XNBfDEItHlOHA45HeHGmKN4SmjRJgF5XnrkMNL0C5jIq1e3wKfw0ENBLPdPnDebkur
 PqavFNWmFdrA/zmwKjRy4utcC1JpqvwvF7HgNrsspcsoiClqL+rTQX4QN1OXud3CkFar
 H1/cdjPV8m6IH8wyBGvBomiHKeDgLO/6wCxjmdM5OC7FoSqjOW3x6C1NJgMe+Ie811eU
 1RBEKFYy/aiANT2fCTNKxic2HHTvB1SVO0R1fNERnrRGBaR/L022DRkYEnNwLyZ2stbj
 EUJouUPuqXLMdOFgdkLCJhq95T9uduSDLTx0ySqeDHkEJfA9/13rAYtEzFAHunD2wpCD
 0EzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XNBfDEIt
Subject: [Buildroot] [PATCH v3] package/python-pgcopy: new package
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

Changes v2 -> v3:
  - fix help text indent in Config.in
---
 package/Config.in                        |  1 +
 package/python-pgcopy/Config.in          | 18 ++++++++++++++++
 package/python-pgcopy/python-pgcopy.hash |  5 +++++
 package/python-pgcopy/python-pgcopy.mk   | 27 ++++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/python-pgcopy/Config.in
 create mode 100644 package/python-pgcopy/python-pgcopy.hash
 create mode 100644 package/python-pgcopy/python-pgcopy.mk

diff --git a/package/Config.in b/package/Config.in
index 72b8d8bdc9..cd7d274100 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1258,6 +1258,7 @@ menu "External python modules"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-periphery/Config.in"
 	source "package/python-pexpect/Config.in"
+	source "package/python-pgcopy/Config.in"
 	source "package/python-pickleshare/Config.in"
 	source "package/python-piexif/Config.in"
 	source "package/python-pigpio/Config.in"
diff --git a/package/python-pgcopy/Config.in b/package/python-pgcopy/Config.in
new file mode 100644
index 0000000000..b5bde7c3b0
--- /dev/null
+++ b/package/python-pgcopy/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_PYTHON_PGCOPY
+	bool "python-pgcopy"
+	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+	select BR2_PACKAGE_PYTHON_PSYCOPG2
+	select BR2_PACKAGE_PYTHON_PYTZ
+	help
+	  Use pgcopy for fast data loading into PostgreSQL with
+	  binary copy.
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
