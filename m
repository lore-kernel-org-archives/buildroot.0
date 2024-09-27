Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E26BCF648D
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 23:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E650F400F8;
	Fri, 27 Sep 2024 23:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYBQzQpHhDCA; Fri, 27 Sep 2024 23:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92AF4403F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92AF4403F9;
	Fri, 27 Sep 2024 23:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CAB11BF349
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 23:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF78784DED
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 23:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2N6Ut0FAMLB for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 23:08:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBE1F84B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBE1F84B0E
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBE1F84B0E
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 23:08:53 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a27638f868so10366895ab.2
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 16:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727478532; x=1728083332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RolSFcZuyRZI7BXnb+gYaaSnFhcJsSTUb3UnHhHc14Q=;
 b=p2rtmn2j/n5yDB7snvKE+lFquiO9hpk5Z38Yz3wQ8PbuahkhEr7mZjYsxs2b3bi9kg
 w05O5VuPZdZLSSBjiVCidbcEcUW/yuO9Ca/L/0W6IuwSaz5gORoAr/SxqQNZzvmpNWh2
 Cq/wivkC1j931NI/h8JXXsGHaRqj0VLzuWiYz/lc7puJJov1rLY+ia0ibZGArVd5gI/p
 3wpjabzdcXR6ggFKPste2HFcaIIXxdygPIZ68GDbxj/y+IWEJuW8akCsvI/7Jq3P/C08
 J1czBirbPDpUgtoNmwLKOARZY7W7ErmRD83W0W4QIb6RKM197DclsxgVp6mbickwvD+E
 AQ8Q==
X-Gm-Message-State: AOJu0YyqzFZpJD2X773L0utZrYJyVKxEu7KdvCfnKsmaQ1BBSUcWDOtj
 gmJuZ50NTDr8t6Gv7x5LRyvbGuLgXbqNmCgLLc+Aq02IHPlXkacOcGphv/D5
X-Google-Smtp-Source: AGHT+IHVThET0bOw0+187GRTwRkNLX9Ab1rgNKbZL7TL60YGDS9Jmmov0IpxocpAtltsjnMPKo4zVg==
X-Received: by 2002:a05:6e02:1aac:b0:3a1:a619:203c with SMTP id
 e9e14a558f8ab-3a3452ba409mr47260205ab.23.1727478532504; 
 Fri, 27 Sep 2024 16:08:52 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344d60563sm8707755ab.5.2024.09.27.16.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 16:08:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 17:08:47 -0600
Message-Id: <20240927230848.1853667-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727478532; x=1728083332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RolSFcZuyRZI7BXnb+gYaaSnFhcJsSTUb3UnHhHc14Q=;
 b=PGouJ6IZwjj//Vhunwoy86MauHlBODEEiiDTwHiVAybl6/qPz/Ky4UQ2EDWUYFC1PU
 m2gEbvfJQgx3v+SVbQlKqJP0x8Vk+8a4ykSiQT/GqTCjx0BAVtjnCH+HQpNlWI25gxht
 /w7suQdxtoUngNJtmTj8G5GEmfk+4opjz8OCQkSfVSqINTugm4OTBGqC1BcJDndcI1XO
 0iMep/tLVQrsodM9g0qF+8TnX74Jx+O34JPIeBAjuLy8gLn5YJaozfRCXEi26tyHrhN6
 rKn+InRDwg9kAKeYUMLSxJoX3P4GZ4LzL0MtpKbCI+pLGUr8Aa8+JTSvRWWzZHPT0xNg
 bTIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PGouJ6IZ
Subject: [Buildroot] [PATCH 1/2] package/python-dotenv: new package
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
 package/Config.in                        |  1 +
 package/python-dotenv/Config.in          |  7 +++++++
 package/python-dotenv/python-dotenv.hash |  5 +++++
 package/python-dotenv/python-dotenv.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-dotenv/Config.in
 create mode 100644 package/python-dotenv/python-dotenv.hash
 create mode 100644 package/python-dotenv/python-dotenv.mk

diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0..77216dc70b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1092,6 +1092,7 @@ menu "External python modules"
 	source "package/python-docopt/Config.in"
 	source "package/python-docutils/Config.in"
 	source "package/python-dominate/Config.in"
+	source "package/python-dotenv/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
diff --git a/package/python-dotenv/Config.in b/package/python-dotenv/Config.in
new file mode 100644
index 0000000000..f9b42bd28e
--- /dev/null
+++ b/package/python-dotenv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DOTENV
+	bool "python-dotenv"
+	help
+	  Read key-value pairs from a .env file and set them as
+	  environment variables.
+
+	  https://github.com/theskumar/python-dotenv
diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
new file mode 100644
index 0000000000..710922fba3
--- /dev/null
+++ b/package/python-dotenv/python-dotenv.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-dotenv/json
+md5  68abb78e05460ce558ca255de550e1ea  python-dotenv-1.0.1.tar.gz
+sha256  e324ee90a023d808f1959c46bcbc04446a10ced277783dc6ee09987c37ec10ca  python-dotenv-1.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
new file mode 100644
index 0000000000..324eea239e
--- /dev/null
+++ b/package/python-dotenv/python-dotenv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-dotenv
+#
+################################################################################
+
+PYTHON_DOTENV_VERSION = 1.0.1
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/bc/57/e84d88dfe0aec03b7a2d4327012c1627ab5f03652216c63d49846d7a6c58
+PYTHON_DOTENV_SETUP_TYPE = setuptools
+PYTHON_DOTENV_LICENSE = BSD-3-Clause
+PYTHON_DOTENV_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
