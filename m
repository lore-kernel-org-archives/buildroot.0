Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83408C83F1D
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 11:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B6BE40FCF;
	Thu, 10 Jul 2025 11:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKtbPwo7mqD7; Thu, 10 Jul 2025 11:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA4E40FB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA4E40FB3;
	Thu, 10 Jul 2025 11:42:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F30DF12E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 11:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9CA383B30
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 11:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6g2HHYtGPaUa for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 11:42:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A14283ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A14283ABB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A14283ABB
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 11:42:10 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6D5902C841A8;
 Thu, 10 Jul 2025 13:42:08 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 13:42:06 +0200
Message-ID: <20250710114207.1394265-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752147728; bh=32YXf/XSqBnkG3BqrPnBccmVVOxPPjcxEmDwlEBYDUc=;
 h=From:To:Cc:Subject:Date;
 b=O+yp2aQZDh5Xk2PPftnNwNcFna2kElMYWOQ1YSRHigtlB89NwSHr96FDpd9PNlccd
 2VREqZsIM6+9V17TKuPR1OmZ4OX/QzjXtzDn/jfDDsU4n6ljLe2qjHS7pIYatzE6Ir
 5kD6HLlC5Q8N5Jcx9Tj/+FjRl+MNBRPdXaCzKflLIO2VKCfmce1b5f7GLOIV7cgIBO
 SjihHmLpxdFV4FN/bAHG67BNQln3nTZWLMr6V9JulDwMe2R3z5RWoLiv1tom2a4l/j
 SiXAROjZyrbfIfYq0kOhxVkthOlJaf7PNG9mTW6r4AXBXP4CdUM76uGgdD3T8qemii
 mq4NsmsMdwjuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=O+yp2aQZ
Subject: [Buildroot] [PATCH] package/python-log-rate-limit: new package
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

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-log-rate-limit/Config.in            |  7 +++++++
 .../python-log-rate-limit.hash                     |  5 +++++
 .../python-log-rate-limit/python-log-rate-limit.mk | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-log-rate-limit/Config.in
 create mode 100644 package/python-log-rate-limit/python-log-rate-limit.hash
 create mode 100644 package/python-log-rate-limit/python-log-rate-limit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 824585094e..ba4f836274 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2291,6 +2291,7 @@ F:	package/picotool/
 F:	package/python-django/
 F:	package/python-immutabledict/
 F:	package/python-jc/
+F:	package/python-log-rate-limit/
 F:	package/python-pydantic/
 F:	package/python-pydantic-core/
 F:	package/python-pydantic-settings/
diff --git a/package/Config.in b/package/Config.in
index 9a841082c6..560382645f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1216,6 +1216,7 @@ menu "External python modules"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
+	source "package/python-log-rate-limit/Config.in"
 	source "package/python-logbook/Config.in"
 	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
diff --git a/package/python-log-rate-limit/Config.in b/package/python-log-rate-limit/Config.in
new file mode 100644
index 0000000000..06b8a42e68
--- /dev/null
+++ b/package/python-log-rate-limit/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_LOG_RATE_LIMIT
+	bool "python-log-rate-limit"
+	help
+	  Limit excessive log output with Python's standard logging
+	  framework.
+
+	  https://github.com/samuller/log-rate-limit
diff --git a/package/python-log-rate-limit/python-log-rate-limit.hash b/package/python-log-rate-limit/python-log-rate-limit.hash
new file mode 100644
index 0000000000..80bd5d7290
--- /dev/null
+++ b/package/python-log-rate-limit/python-log-rate-limit.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/log-rate-limit/json
+md5  07ff9e57864b1e005e7272f47d92892f  log_rate_limit-1.4.2.tar.gz
+sha256  06963abe6e1c498d16cb302b5f92d864f41bbe09ea4c898cd4e3a7d675b99de8  log_rate_limit-1.4.2.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-log-rate-limit/python-log-rate-limit.mk b/package/python-log-rate-limit/python-log-rate-limit.mk
new file mode 100644
index 0000000000..8b2d423de0
--- /dev/null
+++ b/package/python-log-rate-limit/python-log-rate-limit.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-log-rate-limit
+#
+################################################################################
+
+PYTHON_LOG_RATE_LIMIT_VERSION = 1.4.2
+PYTHON_LOG_RATE_LIMIT_SOURCE = log_rate_limit-$(PYTHON_LOG_RATE_LIMIT_VERSION).tar.gz
+PYTHON_LOG_RATE_LIMIT_SITE = https://files.pythonhosted.org/packages/0d/c2/d3c67f59b934d0edfc00a7cfcac56d17fa9b9832ba8e353217c93187e506
+PYTHON_LOG_RATE_LIMIT_SETUP_TYPE = poetry
+PYTHON_LOG_RATE_LIMIT_LICENSE = Apache-2.0
+PYTHON_LOG_RATE_LIMIT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
