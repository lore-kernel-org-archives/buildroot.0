Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC583D2F7EE
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EDEC843CF;
	Fri,  5 Dec 2025 12:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4Q87Ll14rNt; Fri,  5 Dec 2025 12:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9346B843E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764938456;
	bh=2XhN9T1zAXsbQmK1p2cM/I6rtBauuBsiEbzHar9oT9A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=IXb9Q/vHYXbychIfKdE/7VLJmUSN01ilGsRExa23eOt9LOR9ddIl5IfBhm40Dfi5I
	 vyIuwAi6HYWhxICTdWgc2pwaMrazEnJUFooJBD8/LPpBelElR90OB4LvfYEW/Ea6hR
	 RPGWcsfUdUx4FCScda1Pw4w6mb6RyFgKfjY3GKon5eoUKbZlRcIB/HfWiOIkiyJ50/
	 ymdvsh7B869egJKhfiG2lEk0hA37F9Bfgb6nYEL9aoM3RZJ0n+Xax92Ds+FYbpQGjm
	 8Xt1OGZ1blvZuhPu+v3crdWNWaVTAmyDTelmQLmwyJ3u5HvRgqL8kalATiQZkF/CrL
	 0j+oP9Q+5/Egw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9346B843E5;
	Fri,  5 Dec 2025 12:40:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF86A1A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1429412B4
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dx0ijK7cWF_t for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0F3A4020C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F3A4020C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0F3A4020C
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:40:54 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3F44C2C89475;
 Fri, 05 Dec 2025 13:40:52 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 13:40:52 +0100
Message-ID: <20251205124054.607309-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764938452; bh=VOGFq35d9/wRY0h1Snhodf01tjvgRNbTBz8mclOb5DI=;
 h=From:To:Cc:Subject:Date;
 b=R6HbxZxj1xrMvhhbr86YH7M79o02NGJbgdd+iPUm7rwqpUxnrGN5tElrMuttezUh+
 km5xu04nF59SzTLLWwBWDrsCo5DD0sbqzETaAhLLpWgTNxg4VdHpoIDKe7co27wobH
 5KloYKcUJNIE2UczQGD4GWYV7O1dst2bJQsOOI2Qz6Z0u3jgQzRe9hUZk0Y7Ewm4qL
 Yq0ydGhatjhVyIwNdbJD6LjALGNslVLhGsALWqUby9I6kFLzMz1T6aLZM5D+FHxEHj
 Qai0S+SmtUtyFpSrPCUcx1fcTwwgRKqieEZ75u7qBCSAtNylTeM5feZBt8Gj6eB4ev
 +D5mh6bg9VMPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=R6HbxZxj
Subject: [Buildroot] [PATCH 1/2] package/python-annotated-doc: new package
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
index 0000000000..23e0ccd358
--- /dev/null
+++ b/package/python-annotated-doc/python-annotated-doc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-annotated-doc
+#
+################################################################################
+
+
+PYTHON_ANNOTATED_DOC_VERSION = 0.0.4
+PYTHON_ANNOTATED_DOC_SOURCE = annotated_doc-$(PYTHON_ANNOTATED_DOC_VERSION).tar.gz
+PYTHON_ANNOTATED_DOC_SITE = https://files.pythonhosted.org/packages/57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c
+PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
+PYTHON_ANNOTATED_DOC_LICENSE = MIT
+PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
+PYTHON_ANNOTATED_DOC_DEPENDENCIES = host-python-pdm-backend
+$(eval $(python-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
