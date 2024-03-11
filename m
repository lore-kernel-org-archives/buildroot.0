Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BCCC5475B
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 23:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24BA540B7B;
	Mon, 11 Mar 2024 23:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jU3qihAdQLnB; Mon, 11 Mar 2024 23:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB1F40471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB1F40471;
	Mon, 11 Mar 2024 23:12:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA2B81BF346
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 23:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A83F960680
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 23:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tVrpDASKdOa0 for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 23:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB8AD605F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB8AD605F9
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB8AD605F9
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 23:12:37 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7c8c9f02eadso15171639f.0
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 16:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710198756; x=1710803556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BaAS5TAnloyHypJu0d8Imfxt/UZe8UhXq+X6/Ka/boo=;
 b=HOYhobMUQRPVB41NYexSEec9uMGP0ZZaCID0F9UDsYEEVK0XyeODwsv6Euih3tebdS
 +aSq6De26E8Nlab2asHApLWjTxGrgyVJG8pOf1jKaK//Ld0F8FS/xICnUTxbOFeIdrWv
 1RQgEBTGgkapgTRymPRY3TxctHiNjQ4YaQt57r5CktGDBlZWqew20mhZ5GQy7+930LYm
 T3eIjQsS8w3O+T/8onlHZh/tet+gwIrDbOC6I/PqBlRbK/nsK83RFPFHsv7o5hMCEPpv
 ln1HsJwTpgaxtT4ODPGx52F89tO8D6x1kFlARwTfaohscBN5QgAtpagizFeWA9acV+PT
 jdxA==
X-Gm-Message-State: AOJu0YwNbxGZguAjb/fRS5YuEistVq5VMPd+0hTrdT6aAUT2g1s8oZQl
 kpYcxX+AU/59RXqwM8NX3a9rfy1Sqwv+9+lwI1JGr7tIgl0a5vP1J9wJXy9mifU=
X-Google-Smtp-Source: AGHT+IEbfPDKLjiEqdGoHff9OaUTOLiEk4z9PKDy5RqxA2HNEZIB6oMCibJSTfPMSRY8NTGbnkb1cw==
X-Received: by 2002:a05:6602:2153:b0:7c8:a789:7a75 with SMTP id
 y19-20020a056602215300b007c8a7897a75mr5259383ioy.5.1710198755615; 
 Mon, 11 Mar 2024 16:12:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-232-75.hlrn.qwest.net.
 [97.118.232.75]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056638260500b00474874acfe1sm1924225jat.172.2024.03.11.16.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 16:12:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 17:12:30 -0600
Message-Id: <20240311231231.3188175-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710198756; x=1710803556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BaAS5TAnloyHypJu0d8Imfxt/UZe8UhXq+X6/Ka/boo=;
 b=eDZ9ca8eNjXxNVrMOb5PThDEYpXyo2ghhy2Mm5qkq3c49T0NP03HazBaWPHJ/hVFOc
 MBcZeYCqYJy7XFaESCAUSY8kc51ROM1qljJdY5swlAhgXoaZItxSqkQ/yqNwOpFtohTg
 evKN48A/9UUGmY19ufbJqLzMFZZDYVNwnnxVx87cCsoHxpQutYzVJ744G9gI1owNi0FH
 KWrDR1PCGLgiwzT1pSC+GbsuAX3FbkvnSHc+BekKY1ao3DBUP6zcrjoRzhpDQsJmqFv/
 DeqiNpOlu4O0VlH+edQkVgr/5X+sSwyLkOgZ1hP9jmU/kmBrAVYGiKMnDhtAokzRL6oC
 Cb3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eDZ9ca8e
Subject: [Buildroot] [PATCH 1/2] package/python-email-validator: new package
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
 package/Config.in                                  |  1 +
 package/python-email-validator/Config.in           |  9 +++++++++
 .../python-email-validator.hash                    |  5 +++++
 .../python-email-validator.mk                      | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-email-validator/Config.in
 create mode 100644 package/python-email-validator/python-email-validator.hash
 create mode 100644 package/python-email-validator/python-email-validator.mk

diff --git a/package/Config.in b/package/Config.in
index c677c3ff4a..36a375e696 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1078,6 +1078,7 @@ menu "External python modules"
 	source "package/python-dpkt/Config.in"
 	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
+	source "package/python-email-validator/Config.in"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
 	source "package/python-esptool/Config.in"
diff --git a/package/python-email-validator/Config.in b/package/python-email-validator/Config.in
new file mode 100644
index 0000000000..3b1ffc905c
--- /dev/null
+++ b/package/python-email-validator/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_EMAIL_VALIDATOR
+	bool "python-email-validator"
+	select BR2_PACKAGE_PYTHON_DNSPYTHON # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	help
+	  A robust email address syntax and deliverability validation
+	  library.
+
+	  https://github.com/JoshData/python-email-validator
diff --git a/package/python-email-validator/python-email-validator.hash b/package/python-email-validator/python-email-validator.hash
new file mode 100644
index 0000000000..4342f8d91b
--- /dev/null
+++ b/package/python-email-validator/python-email-validator.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/email-validator/json
+md5  a836759afeb7efdc5d493fbdf8a1bae6  email_validator-2.1.1.tar.gz
+sha256  200a70680ba08904be6d1eef729205cc0d687634399a5924d842533efb824b84  email_validator-2.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  672179752e109134a3fb2bdd0780b29fdb7a03974f0f586a13aead5129562d4c  LICENSE
diff --git a/package/python-email-validator/python-email-validator.mk b/package/python-email-validator/python-email-validator.mk
new file mode 100644
index 0000000000..8d82eb092f
--- /dev/null
+++ b/package/python-email-validator/python-email-validator.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-email-validator
+#
+################################################################################
+
+PYTHON_EMAIL_VALIDATOR_VERSION = 2.1.1
+PYTHON_EMAIL_VALIDATOR_SOURCE = email_validator-$(PYTHON_EMAIL_VALIDATOR_VERSION).tar.gz
+PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/63/82/2914bff80ebee8c027802a664ad4b4caad502cd594e358f76aff395b5e56
+PYTHON_EMAIL_VALIDATOR_SETUP_TYPE = setuptools
+PYTHON_EMAIL_VALIDATOR_LICENSE = Unlicense
+PYTHON_EMAIL_VALIDATOR_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
