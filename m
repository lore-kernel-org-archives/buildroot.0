Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04DDCD98F8
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 07:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D17540A73;
	Wed, 11 Oct 2023 07:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D17540A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6M-d54A3pF4; Wed, 11 Oct 2023 07:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3847E40A8B;
	Wed, 11 Oct 2023 07:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3847E40A8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBBBC1BF391
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 07:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C19E840377
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 07:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C19E840377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQRLIFZFr13i for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 07:28:02 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D790440289
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 07:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D790440289
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so847352766b.2
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 00:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697009279; x=1697614079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gju7U/KfFUjngzSf0BhtPMGcVrynaKo5OMYAZGGqS4U=;
 b=LhGeYAt+mnGM5rBp6KotS+HY7I5xjmcpKu03GqqzsT5dHc2zDpk8wgi9N1AiSNCJMv
 V4EAyQaBJVmVJWVDxNH46czENAPgA04vTuZmHE0+d9dzYB6fIehmbBpVAGORAHVYak/d
 nljpWLqSlNNG3lNUbmUEbfwjNaACTKUmKG43EXwZB2fqYmwseBkM2/up9QBzz3ZOF6Y7
 RlV0+apODTg5DsH8C89Z7izENOzN2BcBdB2mq7QZfDcwFWYJcpa/CXg73+fG+gq3P0/7
 JMoVw/fwLZ3gvZsHi4ww3bmgIVcPX2z0dh/JBQ4IWt80qfSbODkV6D8rIkN9Ar89szVH
 fsPQ==
X-Gm-Message-State: AOJu0Yy9BA7SIHkY2526ggm+M+XWoKaIkUa5+mkX3bxfc++mLWCkjEm/
 ZQAoVFYOgmLr7rtWRDG2Jjy9mIcxjkM=
X-Google-Smtp-Source: AGHT+IFBNjZy1BjPTAAjT04op7xWVUvZ45cZEfOSjkDibgjZX0cuRO2xpmHtvj+9nrpFEe8kx9wWCg==
X-Received: by 2002:a17:906:9b:b0:9ba:3434:482c with SMTP id
 27-20020a170906009b00b009ba3434482cmr4370208ejc.31.1697009279219; 
 Wed, 11 Oct 2023 00:27:59 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 s10-20020a170906354a00b00997cce73cc7sm9398468eja.29.2023.10.11.00.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 00:27:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 09:27:01 +0200
Message-Id: <20231011072701.1014328-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1697009279; x=1697614079; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gju7U/KfFUjngzSf0BhtPMGcVrynaKo5OMYAZGGqS4U=;
 b=SF5gy+PAWD/l/dQNxF1/nGeqxd32niZrmmWt53wL3fs+6fJgsB+G9jsd8ENL1xFnLh
 3Q/WaaO4f04wGdzzot4ZBL2Pjvk3QRQ5Y9wdjy9oMlnZnF5AQ4hcvK8ZZS9dvk5J8uor
 gJHPHBYthHX6bsWXDq+QkppQyNgFeSYVoTP0Y0vwlchYJwMGlY+Gtb4e/tTmVsiZre1r
 MjuRXu5MFeWLbNiHRYluL+U5rOhVdo2jXM0BhMew1BAiQuMg2lh2TzhTrad2jama1I0W
 XSsBmJYuz/udP3RJeNbFpA+GwzLSV2unjZj4eZwJlI0DklTrTcnuoCbGkxWURZAQHPTM
 M5gQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SF5gy+PA
Subject: [Buildroot] [PATCH] python-configobj: new package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

python-configobj package was removed in
8d264a96172cfa1c1f515d1160b921c013fa3bd7 because of the missing support
for Python 3.x.

Meanwhile, this problem was fixed, hence readd the package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Config.in.legacy                               |  6 ------
 package/Config.in                              |  1 +
 package/python-configobj/Config.in             |  7 +++++++
 package/python-configobj/python-configobj.hash |  5 +++++
 package/python-configobj/python-configobj.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 package/python-configobj/Config.in
 create mode 100644 package/python-configobj/python-configobj.hash
 create mode 100644 package/python-configobj/python-configobj.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ca80279212..b817e80e55 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -724,12 +724,6 @@ config BR2_PACKAGE_PYTHON_DIALOG
 	help
 	  Package was removed together with python 2.7 support.
 
-config BR2_PACKAGE_PYTHON_CONFIGOBJ
-	bool "python-configobj removed"
-	select BR2_LEGACY
-	help
-	  Package was removed together with python 2.7 support.
-
 config BR2_PACKAGE_PYTHON_YIELDFROM
 	bool "python-yieldfrom removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 009f7ba186..1327a13f4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1026,6 +1026,7 @@ menu "External python modules"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
 	source "package/python-colorzero/Config.in"
+	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
 	source "package/python-construct/Config.in"
diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
new file mode 100644
index 0000000000..365aa17fcb
--- /dev/null
+++ b/package/python-configobj/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_CONFIGOBJ
+	bool "python-configobj"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Config file reading, writing and validation.
+
+	  https://github.com/DiffSK/configobj
diff --git a/package/python-configobj/python-configobj.hash b/package/python-configobj/python-configobj.hash
new file mode 100644
index 0000000000..682dc987f1
--- /dev/null
+++ b/package/python-configobj/python-configobj.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/configobj/json
+md5  8dda7b31bb3aea87ecfe3b7a87812b17  configobj-5.0.8.tar.gz
+sha256  6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97  configobj-5.0.8.tar.gz
+# Locally computed sha256 checksums
+sha256  0d95e648469a711f5ec1e59e6d4492150ec65d968c1ea6c6d96154a92879997a  LICENSE
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
new file mode 100644
index 0000000000..fe1776f79f
--- /dev/null
+++ b/package/python-configobj/python-configobj.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-configobj
+#
+################################################################################
+
+PYTHON_CONFIGOBJ_VERSION = 5.0.8
+PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
+PYTHON_CONFIGOBJ_SITE = https://files.pythonhosted.org/packages/cb/87/17d4c6d634c044ab08b11c0cd2a8a136d103713d438f8792d7be2c5148fb
+PYTHON_CONFIGOBJ_SETUP_TYPE = setuptools
+PYTHON_CONFIGOBJ_LICENSE = BSD-3-Clause
+PYTHON_CONFIGOBJ_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
