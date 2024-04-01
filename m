Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40A7CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 21:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6639140530;
	Mon,  1 Apr 2024 21:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQP5qC8tZbyh; Mon,  1 Apr 2024 21:23:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 150694053B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 150694053B;
	Mon,  1 Apr 2024 21:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B05FD1BF338
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CB6A4053B
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AuSdtRo_ZRn for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 21:23:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F5F340530
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F5F340530
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F5F340530
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 21:23:55 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7cc0b35b75bso151596039f.3
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 14:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712006633; x=1712611433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7I0kmLRN1A6HE1PoeeG//nu/0fT+pd7FFX7dFHHZjZI=;
 b=IjXBcVbTIHk/0jGF9y4uFycTCjMKTnEsxs4DFtfpMh32FIE3uiHBR3ltb0x7Bh5H5U
 DDjOC0H8d38DWXZt+Di+hQxcfOtNC+j3IXSrZ+iw34kfJkp0BrzHemH3gHFOPpLER62C
 l1zkYFOfCV+C7trzF89BBAGOz/F5so08FQdDmYtSLRCvtidoMhIhFmm0FRVyFiEVN5f+
 lKKG0tTNSZsUHP5tjUdRq0GGu7L78bE5egnkw+3t24slMvWXVqYPbL9SArpRg2r2Yqt9
 PkaeHHjOejEzmxDJiPu2AXXyOtnNyHlc7hXR/O9tyh3Yk60XhrS1L6BfTFmarMziXUti
 jhyg==
X-Gm-Message-State: AOJu0YwH4S7IdH2NHsFi8Nj5qisv86OLk59WhDkQTJVt6zFXiHIl3kWU
 Lwm6j+hLYJkfyaPOeGYLPscIC1sKu0Y28LMYBFsidpmoVZ+E8EjxgcrkrJBliBJznw==
X-Google-Smtp-Source: AGHT+IHkYpyExIOA2nyEvlZEOGkJ0NOMM5RjqZSimDKhl93vM8p/wW8vT+prFB9/m/za24Ut25gesA==
X-Received: by 2002:a6b:7b08:0:b0:7d0:bdf7:bb7e with SMTP id
 l8-20020a6b7b08000000b007d0bdf7bb7emr6904814iop.19.1712006633537; 
 Mon, 01 Apr 2024 14:23:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 d23-20020a02a497000000b0047708160be9sm2813844jam.147.2024.04.01.14.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 14:23:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 15:23:40 -0600
Message-Id: <20240401212344.1345395-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712006633; x=1712611433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7I0kmLRN1A6HE1PoeeG//nu/0fT+pd7FFX7dFHHZjZI=;
 b=OpJsf6QH/ohzbNGVjdaPVx+LBVmVWBdzsXqJuUTeFUFV+QSwzqf8qgdQD1jwfAPku9
 nPlytunt1ZZfagLqhy0tQT9NhchFB/l276FSbNo+rWQ6+ArawA64sMWoFq1saPuAefAJ
 1xxbqQdTZybe+AS2v2t5YRwV70mifl3hW6NAiiIdzxP9jvpvFc86cbcvmKYeWKiYceWd
 r82kQ8CDfUT2GdfAniL6MJvJnZJLgibf909z8G8VW3VTwR19YqZBYaRuvWC73XtcQxSF
 2dmGol5Td1vAxPDXiTTXInf9WuBRwGgdviTRAM1fqi+UCXkQ3pGvoEDLYyi2/8MdUpGc
 8tvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OpJsf6QH
Subject: [Buildroot] [PATCH v4 1/5] package/python-pypika-tortoise: new
 package
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
 package/python-pypika-tortoise/Config.in          |  6 ++++++
 .../python-pypika-tortoise.hash                   |  5 +++++
 .../python-pypika-tortoise.mk                     | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-pypika-tortoise/Config.in
 create mode 100644 package/python-pypika-tortoise/python-pypika-tortoise.hash
 create mode 100644 package/python-pypika-tortoise/python-pypika-tortoise.mk

diff --git a/package/Config.in b/package/Config.in
index 410fe0f493..af9f1e38a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1277,6 +1277,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pyphen/Config.in"
+	source "package/python-pypika-tortoise/Config.in"
 	source "package/python-pypng/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
diff --git a/package/python-pypika-tortoise/Config.in b/package/python-pypika-tortoise/Config.in
new file mode 100644
index 0000000000..62e14c6d50
--- /dev/null
+++ b/package/python-pypika-tortoise/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE
+	bool "python-pypika-tortoise"
+	help
+	  Forked from pypika and streamline just for tortoise-orm.
+
+	  https://github.com/tortoise/pypika-tortoise
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
new file mode 100644
index 0000000000..629762f4f7
--- /dev/null
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
+md5  98c9677516f06f61f211f834d51949a6  pypika-tortoise-0.1.6.tar.gz
+sha256  d802868f479a708e3263724c7b5719a26ad79399b2a70cea065f4a4cadbebf36  pypika-tortoise-0.1.6.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
new file mode 100644
index 0000000000..84aa19cfbb
--- /dev/null
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pypika-tortoise
+#
+################################################################################
+
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.1.6
+PYTHON_PYPIKA_TORTOISE_SOURCE = pypika-tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/86/55/1bfd4150f664d2e07b36c8f442178cc1f717bb9ae6cae20f21e851c208c6
+PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
+PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
+PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
+PYTHON_PYPIKA_TORTOISE_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
