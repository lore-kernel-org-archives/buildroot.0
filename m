Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41FBC54798
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 17:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE546077B;
	Fri, 23 Feb 2024 17:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I86k0sgFGcvP; Fri, 23 Feb 2024 17:10:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F53060829
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F53060829;
	Fri, 23 Feb 2024 17:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7F621BF423
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A57E66087A
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsFvKHZsHeNu for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 17:10:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48EEC6077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48EEC6077B
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48EEC6077B
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 17:10:33 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7c784a9ff80so19428939f.0
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 09:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708708231; x=1709313031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jiuq+++BJVk9ElN0OSjzAS67ObihtRVYinbyEaaSwkc=;
 b=Q+4HJcvfNtUsHjAw4TUtAplc7/fEZ4nUDqVOZ36KRTdLshgyX5Al88zNv0IWOLrvyW
 1/GwMdl2DM/YtuA1iHjr9+2fwU530M/77kPzOtA9eyzss34nlkaW59Y7WF3fcOef2WRn
 cXMYVzOISlsdQorBAlrQRwfKKq6UbpObusHRCIeM35gZ+MjRUckfDvCFaEISSJjGaylE
 tHCgCWQM1hnM6EbXn9vTTb1/3x07V3t/jcKj9WiOyx10COnfu09CVuZq8yBFJch14wNf
 kmACozUPQajCqeMimLQvVUDSevCxzJvgo842mgW0gDiPKYpgODdqcQKNOBpa89KRJaCP
 ZJmw==
X-Gm-Message-State: AOJu0YzQo6/HShra4krSBikB6PLq1uiP7PUjTeZ+zTmdrxAo6UcvBpVK
 Au2es78guC7ORW7rMgGX8x7Y8u+hdcF7i2qQS4AIyMLiT4me+UE+o0RMfSDD7yk=
X-Google-Smtp-Source: AGHT+IEANA/q3/w+EDcnzG33SPKyoOIi5Izr4EAgt2aNqGApDHVPh8BWmDjRcKTculQsouKV86T2sA==
X-Received: by 2002:a5e:c80d:0:b0:7c4:9cb9:dac with SMTP id
 y13-20020a5ec80d000000b007c49cb90dacmr460602iol.19.1708708231361; 
 Fri, 23 Feb 2024 09:10:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-244-120.hlrn.qwest.net.
 [71.218.244.120]) by smtp.gmail.com with ESMTPSA id
 x4-20020a02ac84000000b00474559c17a4sm917838jan.172.2024.02.23.09.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 09:10:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 10:10:22 -0700
Message-Id: <20240223171023.2907242-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708708231; x=1709313031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jiuq+++BJVk9ElN0OSjzAS67ObihtRVYinbyEaaSwkc=;
 b=d5DmbHpHrcqVm4KAR0nycstFuSWRQuCJp5155twO2XRlLW7vcO/ubZ6Q79+RglnKJY
 thsKQVn2/IW9/iLX91ToCH2240o76l+EERhGQTV3UzKOoaoI+Fc7+F5IVRQavV2NQpDJ
 GF5tCWRmfP7TkBcxs+0dLsqQCzvMN/Rq2Ahd0JPPWMV9ZaW8usRyLc/f5L5xJYRsSxqh
 FcJ1iVZmflxZuPOwq58v4++MG6clgTZ7zLZ7NFAKLLdmm3fEi40dDMMg2ecoQDjRCKoj
 r4RfzJfDI0merjsROKaFCIE4J0+7ezFdHAZmX61ncSeczJelY7g1MNXb/FssqqCdqwac
 0zIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d5DmbHpH
Subject: [Buildroot] [PATCH 1/2] package/python-grpclib: new package
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
 package/Config.in                          |  1 +
 package/python-grpclib/Config.in           |  6 ++++++
 package/python-grpclib/python-grpclib.hash |  5 +++++
 package/python-grpclib/python-grpclib.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-grpclib/Config.in
 create mode 100644 package/python-grpclib/python-grpclib.hash
 create mode 100644 package/python-grpclib/python-grpclib.mk

diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..2ddaadae69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1114,6 +1114,7 @@ menu "External python modules"
 	source "package/python-grpc-requests/Config.in"
 	source "package/python-grpcio/Config.in"
 	source "package/python-grpcio-reflection/Config.in"
+	source "package/python-grpclib/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpclib/Config.in b/package/python-grpclib/Config.in
new file mode 100644
index 0000000000..2c4a5e20be
--- /dev/null
+++ b/package/python-grpclib/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_GRPCLIB
+	bool "python-grpclib"
+	help
+	  Pure-Python gRPC implementation for asyncio.
+
+	  https://github.com/vmagamedov/grpclib
diff --git a/package/python-grpclib/python-grpclib.hash b/package/python-grpclib/python-grpclib.hash
new file mode 100644
index 0000000000..cc65209138
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpclib/json
+md5  60ce203e5b9f95de3d7e5721dbce2bd9  grpclib-0.4.7.tar.gz
+sha256  2988ef57c02b22b7a2e8e961792c41ccf97efc2ace91ae7a5b0de03c363823c3  grpclib-0.4.7.tar.gz
+# Locally computed sha256 checksums
+sha256  6c7fa8cf9b94ad5043a6b550a0ffb98356e66100b69dd1cb8e1f82606b436e8e  LICENSE.txt
diff --git a/package/python-grpclib/python-grpclib.mk b/package/python-grpclib/python-grpclib.mk
new file mode 100644
index 0000000000..0bec0a1879
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpclib
+#
+################################################################################
+
+PYTHON_GRPCLIB_VERSION = 0.4.7
+PYTHON_GRPCLIB_SOURCE = grpclib-$(PYTHON_GRPCLIB_VERSION).tar.gz
+PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/79/b9/55936e462a5925190d7427e880b3033601d1effd13809b483d13a926061a
+PYTHON_GRPCLIB_SETUP_TYPE = setuptools
+PYTHON_GRPCLIB_LICENSE = BSD-3-Clause
+PYTHON_GRPCLIB_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
