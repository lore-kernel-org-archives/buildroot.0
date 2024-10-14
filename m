Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D04CF2591
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 01:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF4E14034E;
	Mon, 14 Oct 2024 01:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDB78Dz0b-NM; Mon, 14 Oct 2024 01:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72F2C4050B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F2C4050B;
	Mon, 14 Oct 2024 01:40:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 395AA1BF39F
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 01:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2838A60652
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 01:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuDkeBoMbMAU for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 01:40:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69526605F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69526605F5
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69526605F5
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 01:40:45 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2e2fb304e7dso2062561a91.1
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 18:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728870044; x=1729474844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qugfQ1F11w0MlQOocBs5BtB8iD8nd1psc5AEjDiQyvk=;
 b=biGdJw7xwGLVpDf5VpXr8XYtMhZ3PiIZ/weskkhDuKs3zq4PBI/FqBg0t3n6EzokME
 9k1fiyDYSz145aB9Qo1ZstAscrBX1YtO9vrwPUDIX+jZTNd5EF9df6Nr4c8b/L6nKrbQ
 OQP+JON2bQjHsuuWk/bf/PXiDxtOSkYsOS7m/uC4jn+csNl0gpGceiiHMwhljacWsoCm
 ZlnozmWdUnZ6JrGDZr/6uu3YzLlH1NOAmK2qZakWu2G52monvQdqz/FmLlvh2fWg095e
 pXC9QlgZ03ySo4+CIJpqWlI5VUjIERz8Fr9PWxuYAcGts8YDTPh3XATj1WzrC5DjVjAg
 cSXw==
X-Gm-Message-State: AOJu0YwzRVitNZX84eQR3Cw/W0D7Tl9LCfUUAF+jWeMucOBZ6OxMNk6l
 z83vgjTDAggPxnuuwXehHXG50FISM22oSvzqnY6DZSkejmuPJdJjiDu6u8Y9
X-Google-Smtp-Source: AGHT+IHYbGpaiQ3ml+9xedvA0V4ZG687J/RSU3JFXvHJHxF1LAd32TD2QoyX3V2EoDnyGtipA6+qOw==
X-Received: by 2002:a17:90a:c38b:b0:2e2:c9c1:aacf with SMTP id
 98e67ed59e1d1-2e2f0c51950mr12563002a91.29.1728870044352; 
 Sun, 13 Oct 2024 18:40:44 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2e85f5a37sm6447538a91.6.2024.10.13.18.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 18:40:43 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 09:40:36 +0800
Message-ID: <20241014014039.331820-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728870044; x=1729474844; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qugfQ1F11w0MlQOocBs5BtB8iD8nd1psc5AEjDiQyvk=;
 b=LkDn++LoNWGNyFpBxRWZBS4WIEqOEmlu9ZL4vOGTd8it1TydFblCh6X/CYWTwU7nqz
 8jqWdm89BW6qQMn3zqSgDicj+sZFjL4rGE3YfjxUnYAv1nTAM0ZRXA0RpSInjjMS44Pl
 A5/aB9PH020Vvo8+vwkIEk+q2rZNeSLJBsFeMxL9OC2i1ZNUBiC2L+pOwDOXyE74RB5J
 9+Zlz3krkagiXTmcUBJHxxlZ4mugKPOU519gfc0xWbpfXCQW46HzvH7dzQ9Ltw+iLqtb
 y3oyucYqwYg8vhDnh9mBtfKqkig42/Ye+7tMvZzNT+ewCPugLWP5I6cGlCUwefILm3dj
 qL7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LkDn++Lo
Subject: [Buildroot] [PATCH] package/python-pgcopy: new package
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
 Asaf Kahlon <asafka7@gmail.com>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/python-pgcopy/Config.in          | 17 +++++++++++++++
 package/python-pgcopy/python-pgcopy.hash |  5 +++++
 package/python-pgcopy/python-pgcopy.mk   | 27 ++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 package/python-pgcopy/Config.in
 create mode 100644 package/python-pgcopy/python-pgcopy.hash
 create mode 100644 package/python-pgcopy/python-pgcopy.mk

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
