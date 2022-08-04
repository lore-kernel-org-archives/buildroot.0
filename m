Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E59C00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 05:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 525E240531;
	Thu,  4 Aug 2022 05:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 525E240531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vx1fWFXHbsOW; Thu,  4 Aug 2022 05:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45015403F9;
	Thu,  4 Aug 2022 05:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45015403F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 301D81BF2BF
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 056CE403F9
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 056CE403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5Y7dTE8dxTj for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 05:23:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4C1C4026F
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4C1C4026F
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 05:23:42 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a89so23924621edf.5
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 22:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VAz2j+d+RT7JVAv1Gfpf4d+SJYi/rvAolXHrwv4wQ4k=;
 b=26NpZTUwUgHotgVS43kSsl9Z7+MP7VDFqnEwdyL6/qTCijPmXyiIaSuuIfPW0ZaKNQ
 Lm/KZ+CBNPxVLxn+wiZ5K5hs+8RbBJGOXzN7kVRKgmhurVareHH7z+u3ey3OIV09ki5N
 R/em50nsP2NggUE23mrMBKIfmCBHJ17/InU2/xUFFU3DhxZzi2XUzrR4Poj9CxsODMEN
 HIXkiCRQkM6QzjbYB8UvNjmpe12fyOfbK56rHMWZz/pKg8XU3GxXJwdNKYDarncgz/jS
 FJ3qH9hznOPjLalCyzoTxP0DV4AzctkYqljLk9B2Ugh/uUzJoWMkbU+QDNJTR64ZQISM
 7Xvw==
X-Gm-Message-State: ACgBeo2ZboeF6P192e7a0FYhABIufDILw5jKjgytV00FS3NLam3jfNdB
 /G19k6mcLjBBjSqtU+QP6rraaiv7/uE=
X-Google-Smtp-Source: AA6agR5rzqQPBF6pGjdDxAJqw3EKU2qRQiVYrtIjdv57F/0XuDgLPMDpX8WQIMNM7UDALDmwAWoSuw==
X-Received: by 2002:a05:6402:4392:b0:43e:5033:40f8 with SMTP id
 o18-20020a056402439200b0043e503340f8mr242278edc.245.1659590620337; 
 Wed, 03 Aug 2022 22:23:40 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 kx4-20020a170907774400b00730b942f6aasm1084153ejc.81.2022.08.03.22.23.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Aug 2022 22:23:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  4 Aug 2022 07:23:31 +0200
Message-Id: <20220804052332.19537-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc;
 bh=VAz2j+d+RT7JVAv1Gfpf4d+SJYi/rvAolXHrwv4wQ4k=;
 b=iXoHc2p2/sci375Kv2VKAOwTJGfQC7M2CkaCpoH8kN1m4xe+iSjbrkXt1gKFF0eW/w
 gP4gTRP5IB27ytk/trhR9kwgVgceJucVeh2RSVF5ylbSgBE3KQ7MIQIxUnN+Tf3jokvd
 INy0NlvKJ9/LLCj7zZwMU53M9aKhHx24msaAFJElY/uYCFMtVDv9IAFY6g8if8dnq+Nv
 HlXbws3tn2+JPGBfeK46m39XzZbROhm1bj+++UelyGTRbIZ5uKSuySATBY7EN1KTi78i
 lL2iu6tZLBj/f672wN6mtC9OqhUn2+cTfDUsv6Voaw5M/jeX9y1QeJBwGtmCd30f+eAf
 bOfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iXoHc2p2
Subject: [Buildroot] [PATCH 1/2] package/python-dtschema: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-dtschema/Config.in            | 10 ++++++++++
 package/python-dtschema/python-dtschema.hash |  5 +++++
 package/python-dtschema/python-dtschema.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-dtschema/Config.in
 create mode 100644 package/python-dtschema/python-dtschema.hash
 create mode 100644 package/python-dtschema/python-dtschema.mk

diff --git a/package/Config.in b/package/Config.in
index 61783ba400..93bd5571cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1022,6 +1022,7 @@ menu "External python modules"
 	source "package/python-docutils/Config.in"
 	source "package/python-dominate/Config.in"
 	source "package/python-dpkt/Config.in"
+	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
diff --git a/package/python-dtschema/Config.in b/package/python-dtschema/Config.in
new file mode 100644
index 0000000000..961d0e04b2
--- /dev/null
+++ b/package/python-dtschema/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_DTSCHEMA
+	bool "python-dtschema"
+	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
+	select BR2_PACKAGE_PYTHON_PYLIBFDT # runtime
+	select BR2_PACKAGE_PYTHON_RFC3987 # runtime
+	select BR2_PACKAGE_PYTHON_RUAMEL_YAML # runtime
+	help
+	  DeviceTree validation schema and tools.
+
+	  https://github.com/devicetree-org/dt-schema
diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
new file mode 100644
index 0000000000..7b183e28e3
--- /dev/null
+++ b/package/python-dtschema/python-dtschema.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dtschema/json
+md5  ed75defac9a7297a567f278994b14d5b  dtschema-2022.8.tar.gz
+sha256  1befe7c9f74cea248a8b524cf6185ac48912a5b2aae96854d77cb94584433ca4  dtschema-2022.8.tar.gz
+# Locally computed sha256 checksums
+sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
new file mode 100644
index 0000000000..263061dc98
--- /dev/null
+++ b/package/python-dtschema/python-dtschema.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-dtschema
+#
+################################################################################
+
+PYTHON_DTSCHEMA_VERSION = 2022.8
+PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/95/be/cb576760b9578cb69da020aeb80f3c2d05ff46b4090ab350c1e05691329e
+PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
+PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
+PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
+PYTHON_DTSCHEMA_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
