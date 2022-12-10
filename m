Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0796C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F51B40499;
	Sat, 10 Dec 2022 17:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F51B40499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOq4WCxgRm7y; Sat, 10 Dec 2022 17:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 352384048D;
	Sat, 10 Dec 2022 17:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 352384048D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC46D1BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6BED4098B
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6BED4098B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8C0mvFPKOv3N for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:33:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985CC4093E
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 985CC4093E
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:33:57 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id o13so1436961ilc.7
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MsUNBY4aI2+1jcnscf/eays6DxjXfvNCSrz9iA/lDZw=;
 b=FAAq0+2B6gFFZhoN47lzenu97y4kQSWGn+jvgiiBTq+n0yXtOLwC/TNskk7OTsWyQb
 QhErUp5J+FpKSOjC81NUHVSRfmvfEEB5rgUq/n1DeLBymeKQ/OxbTa5x5WpJNoo1weRU
 AXUguce7HwswGy7G3Z/RHmeGivw1Yc3hk76h9f0cHlYRblw2GnRLZkN/ZgWwUfIyUVAX
 TF/CJnS2tPMMKROtSyAiVgfYFrMTjYEpm5ZBtQzsEBmAYSY41jHXS2l3NE2zZj6D1BYU
 gFh3WuH8dyvoCrAxpj823/snXZvUc3HMWyP1Ee8UpRmKZt5/khKgXm4qmFOkabpU1gVn
 4uBw==
X-Gm-Message-State: ANoB5pkDJO/rkPRMJ6JsMC70MX5THTtqYKWboGchAsf4AAX5bfKLR/js
 +Q+J4pOiJMrTwfVIR2Eh23ZqhKmdbG21Lw==
X-Google-Smtp-Source: AA0mqf7G9FIlUgOjg3nPHUCUMNDDFrZzG862Jp2GTWjhxvrnLXlOBnsF5YDrnZpJRU0I0d21fU7Z1Q==
X-Received: by 2002:a92:d90f:0:b0:303:1fe8:e22 with SMTP id
 s15-20020a92d90f000000b003031fe80e22mr6577363iln.21.1670693636537; 
 Sat, 10 Dec 2022 09:33:56 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 j24-20020a056638053800b0038a56fc3ca9sm1551989jar.124.2022.12.10.09.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 09:33:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:33:53 -0700
Message-Id: <20221210173353.2652856-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221210173353.2652856-1-james.hilliard1@gmail.com>
References: <20221210173353.2652856-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MsUNBY4aI2+1jcnscf/eays6DxjXfvNCSrz9iA/lDZw=;
 b=WBunfgc3y8PuIzONa8lCl5aZN2illvo/SGr4KO7BURfy2YXYg5HfOhazYFw9pTUJUl
 oOVykiAXOp89+NjWL4vOQKrUnuX6E/mwoF2BEBEupSQMYJaXIcvZbxkecYki2rpHgMzZ
 wE14B4CvVX3DJPAz9Q7cgBtDcyUtdjz3VmpO0pVz2R+JmKbIjnz5ul6Fv+1xVCZt54FE
 8V/waNZmf6WWD25JTCHjcYhQUBicTdAjXg79pY8c0sR+HvNwRUZFKq6o7Aq0AYS+c3ra
 pONg6jcfmY3F1ud+4uYJYlaI2KMZGXi3y6fwatHJjfbdXeQMGSSb3d38mQXnJ/I9G0qK
 NfcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WBunfgc3
Subject: [Buildroot] [PATCH 2/2] package/python-esptool: bump to version 4.4
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
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required pyaes runtime dependency.

Add new bitstring, cryptography and reedsolo runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-esptool/Config.in           | 5 ++++-
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index b21ccd72d5..36243fa89e 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_PYTHON_ESPTOOL
 	bool "python-esptool"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_BITSTRING # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_ECDSA # runtime
-	select BR2_PACKAGE_PYTHON_PYAES # runtime
+	select BR2_PACKAGE_PYTHON_REEDSOLO # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 7e523a7027..b7246f9788 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  973b63eac1391d3491846d8676c783e7  esptool-4.3.tar.gz
-sha256  03d00312eef258baf83faefd0b912b2251dd0440242da9dcb1b18fe75ed614c3  esptool-4.3.tar.gz
+md5  92c38551bc33bd5271bdea033aa51610  esptool-4.4.tar.gz
+sha256  8acd4dfe70819b1302861ae92894380fb4700b377f5a4739479a4ec276e0b256  esptool-4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 3f33fd7865..0a71e1a78b 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.3
+PYTHON_ESPTOOL_VERSION = 4.4
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/5b/d7/0dae311a94a490d7b7af2f4fab079b34f6244c6129017997bc994f7b360b
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/8b/4c/82d7fe5fa0643415bbb90bebff1f861816903c481ee5156fabd6d76dc684
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
