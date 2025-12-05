Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824E1D2F7CC
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C0E76074D;
	Fri,  5 Dec 2025 12:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBFZFRisu2vv; Fri,  5 Dec 2025 12:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB5E60EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764938782;
	bh=ufymkOrpumjZtoLV9/Cqi01eyRXjs2Oy927zZQohoRI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=YvA4yiUsYIhncYkw/F0JbPujoUaKOtFN3wNcyGY8oGM9nzP3zBEnMu0vY7NpVVGm5
	 sxqXZJ0VzTc57OO8g8SwGAxXG4eKuTpksCxqA8N87cCVXbitytQUD8yjYgueOD7Cag
	 Wxe20OaVDMrmpZa50QsIEk6R4g6oiSKEQ4VAHi2syxu9HDSEU5breLKU87ZDDrnA/f
	 sG/5BpiggfwRjlu21vI4GQ+pF/Dy+Pkob1zjCO9QlyP4SNZMBtjP62GBCt7w1CLT4J
	 R43+f4QKEvVYRa1mLzPtnBh5qUr0RWz/0v9RTgqLMfMDas706g2Ohye/gzZLYrNLJh
	 wiUXd70XlTIaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB5E60EA5;
	Fri,  5 Dec 2025 12:46:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47726E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E03984534
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YimHHqb6w7Af for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:46:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 297628451E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 297628451E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 297628451E
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:46:20 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D60CE2C89475;
 Fri, 05 Dec 2025 13:46:17 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 13:45:05 +0100
Message-ID: <20251205124620.609798-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764938778; bh=DuBjCeQhG53kIgI/DXpden/M6W1vDtSGaJfaQT8/YZ4=;
 h=From:To:Cc:Subject:Date;
 b=j6JapPVvDCsPp3P1t32thGsqlUIWrw06fXH9Nghop8nc2/SByPTLWGfmNG7WdUNGL
 763F2Ig1122jNKKe5WW136Y6POuwnWlxMwRhX7hMhTfe+GP/7QCdBqog5v1zQFoc//
 2tbBBts7cYt2r8W32nb+e/JWM1r70ET9XNaX2KmcxwIHtrPXtgzmak7aNfy9h2buvo
 cxa+zgs6CjODM4q+kTQIfO4C2MGmK/uEyYXuBhnz8MO0DtWnEeNXNHQhpkESuDiLkT
 OtmE+3/ysgx4x6dqTvIKx0VxVg5eouJhxDgVoOQ2JPTTtWqSlp25iO2DGGIcOVN0TS
 nUGkQut/IWugg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=j6JapPVv
Subject: [Buildroot] [PATCH v2 1/2] package/python-annotated-doc: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Required for fastapi since 0.120.0 [1]

https://github.com/fastapi/fastapi/releases/tag/0.120.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
v1 -> v2: fix check-package errors
---
 DEVELOPERS                                        |  1 +
 package/Config.in                                 |  1 +
 package/python-annotated-doc/Config.in            |  7 +++++++
 .../python-annotated-doc.hash                     |  5 +++++
 .../python-annotated-doc/python-annotated-doc.mk  | 15 +++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-annotated-doc/Config.in
 create mode 100644 package/python-annotated-doc/python-annotated-doc.hash
 create mode 100644 package/python-annotated-doc/python-annotated-doc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5e1fa6401f..06667fe352 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2260,6 +2260,7 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
+F:	package/python-annotated-doc/
 F:	package/python-apscheduler/
 F:	package/python-crc/
 F:	package/python-django/
diff --git a/package/Config.in b/package/Config.in
index 83414b3e0b..47f25e9d94 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -992,6 +992,7 @@ menu "External python modules"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-aniso8601/Config.in"
+	source "package/python-annotated-doc/Config.in"
 	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-anyio/Config.in"
diff --git a/package/python-annotated-doc/Config.in b/package/python-annotated-doc/Config.in
new file mode 100644
index 0000000000..3bd240f211
--- /dev/null
+++ b/package/python-annotated-doc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ANNOTATED_DOC
+	bool "python-annotated-doc"
+	help
+	  Document parameters, class attributes, return types, and
+	  variables inline, with Annotated.
+
+	  https://github.com/fastapi/annotated-doc
diff --git a/package/python-annotated-doc/python-annotated-doc.hash b/package/python-annotated-doc/python-annotated-doc.hash
new file mode 100644
index 0000000000..8ffdae9b5d
--- /dev/null
+++ b/package/python-annotated-doc/python-annotated-doc.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/annotated-doc/json
+md5  825f2ecff1f182cd942ea09907ebafdb  annotated_doc-0.0.4.tar.gz
+sha256  fbcda96e87e9c92ad167c2e53839e57503ecfda18804ea28102353485033faa4  annotated_doc-0.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  fff170779a6acbf65abdb405c087f1cee1786691e4a96a4034517e4a504a0cdf  LICENSE
diff --git a/package/python-annotated-doc/python-annotated-doc.mk b/package/python-annotated-doc/python-annotated-doc.mk
new file mode 100644
index 0000000000..2186601a8c
--- /dev/null
+++ b/package/python-annotated-doc/python-annotated-doc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-annotated-doc
+#
+################################################################################
+
+PYTHON_ANNOTATED_DOC_VERSION = 0.0.4
+PYTHON_ANNOTATED_DOC_SOURCE = annotated_doc-$(PYTHON_ANNOTATED_DOC_VERSION).tar.gz
+PYTHON_ANNOTATED_DOC_SITE = https://files.pythonhosted.org/packages/57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c
+PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
+PYTHON_ANNOTATED_DOC_LICENSE = MIT
+PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
+PYTHON_ANNOTATED_DOC_DEPENDENCIES = host-python-pdm-backend
+
+$(eval $(python-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
