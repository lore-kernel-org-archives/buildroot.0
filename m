Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34186D1358F
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE7A6407D7;
	Mon, 28 Oct 2024 01:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HwQ2Bmszd75; Mon, 28 Oct 2024 01:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3853B407D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3853B407D5;
	Mon, 28 Oct 2024 01:04:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 600B51DAA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE0E407CE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAb853LmDTYb for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B597407D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B597407D5
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B597407D5
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:04:27 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a3c00f2c75so13936225ab.2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730077467; x=1730682267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pUvLsngD5Qe5kx+ylFepW70z7dPZWzYUmw/v0eM2cVg=;
 b=reLz6/3makTr3k3S/seQeV7k09Tcpdq9rEu3zdSQifrzNNsLL2au3XWsx/D+U2nxlg
 USn6KkRxEoIfUseboTfBwK1V04HE4pFSNmA4D7P8NcyEchctUAk+b91mz1Lzq/CIQ4X1
 lzvILw65ghW8J6nOC35So5J2tIOSZtMv9FVh5HWWZ0Q4Da1aMn5R2lH6cSe4dRxAD7Hf
 hPrCxpnE4ndxQLmYr2EN18Co4OONTPUF6C7GknbD7LI94CfpLUhDt6EEOOw1XOka1hpo
 ISPlB6x5I6wvAG0gKYhn4k6uIfrQhSGSGY9+/GRtO1jp7muAHBiYykE7VeVbOyw99SlC
 m6Pg==
X-Gm-Message-State: AOJu0YwbtCiESgTdd1m/dl4LkB+x5QSqKwoRy9Ax9CrjuAETRd1LAsRv
 bRMy+GdbnvmzUNfU/i07sbwNJt0JCEfwJoeHRCreSReFP6utJjcnBr3i0Q==
X-Google-Smtp-Source: AGHT+IFmtcTtKu7QJHc6x70S/+4nEGdtRL8FUaXy7Yf1V7Eecud2gLmjmJtX9OQPSCPgxAMiInqTtw==
X-Received: by 2002:a05:6e02:16cf:b0:3a0:8d60:8b7d with SMTP id
 e9e14a558f8ab-3a4ed2aaddfmr63897965ab.11.1730077466837; 
 Sun, 27 Oct 2024 18:04:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e022e2sm13890125ab.51.2024.10.27.18.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:04:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:04:23 -0600
Message-Id: <20241028010424.4123705-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730077467; x=1730682267; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pUvLsngD5Qe5kx+ylFepW70z7dPZWzYUmw/v0eM2cVg=;
 b=Y7P6k/qgshH6z4AwX9k3zBmfCdaZN2gWNtSfezcTM2zfbkj6EbRreJVLOB4NwIjCBx
 qiBZg6QC5/QwGJS67RUkOUprkGP9mNb1DvMgP+UFlhYnCg7HTJdb53ntBVffEvOnTjh5
 guU9dTYhn+jP3Sw6kGc3nLMcGE9rHA5MWBv28whhG4cRcpAAvhvchGI6FCI0cu9dIuRU
 Sk8DWwyMcUJnEUJYsVOEOYCVV1duVxfDnKe3PktpEW0C2ZFLqBvHRfhLqPLF61dVzI6U
 f6B0J83Z+usALB2zaq1Nri2QIISCo0UwGJ9NwbAYQk0PXhyfg244DY0WhuRvpzHKncfP
 BaiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y7P6k/qg
Subject: [Buildroot] [PATCH 1/2] package/python-legacy-cgi: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                |  1 +
 package/python-legacy-cgi/Config.in              |  7 +++++++
 package/python-legacy-cgi/python-legacy-cgi.hash |  5 +++++
 package/python-legacy-cgi/python-legacy-cgi.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-legacy-cgi/Config.in
 create mode 100644 package/python-legacy-cgi/python-legacy-cgi.hash
 create mode 100644 package/python-legacy-cgi/python-legacy-cgi.mk

diff --git a/package/Config.in b/package/Config.in
index 0e311ad55c..a4fcc56947 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1193,6 +1193,7 @@ menu "External python modules"
 	source "package/python-kiwisolver/Config.in"
 	source "package/python-kmod/Config.in"
 	source "package/python-lark/Config.in"
+	source "package/python-legacy-cgi/Config.in"
 	source "package/python-libconf/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
diff --git a/package/python-legacy-cgi/Config.in b/package/python-legacy-cgi/Config.in
new file mode 100644
index 0000000000..f21706ed96
--- /dev/null
+++ b/package/python-legacy-cgi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_LEGACY_CGI
+	bool "python-legacy-cgi"
+	help
+	  Fork of the standard library cgi and cgitb modules, being
+	  deprecated in PEP-594.
+
+	  https://github.com/jackrosenthal/legacy-cgi
diff --git a/package/python-legacy-cgi/python-legacy-cgi.hash b/package/python-legacy-cgi/python-legacy-cgi.hash
new file mode 100644
index 0000000000..063483a1e8
--- /dev/null
+++ b/package/python-legacy-cgi/python-legacy-cgi.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/legacy-cgi/json
+md5  82a61ea4905ec03f07cf24c586623fa7  legacy_cgi-2.6.1.tar.gz
+sha256  f2ada99c747c3d72a473a6aaff6259a61f226b06fe9f3106e495ab83fd8f7a42  legacy_cgi-2.6.1.tar.gz
+# Locally computed sha256 checksums
+sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python-legacy-cgi/python-legacy-cgi.mk b/package/python-legacy-cgi/python-legacy-cgi.mk
new file mode 100644
index 0000000000..63a6b1c971
--- /dev/null
+++ b/package/python-legacy-cgi/python-legacy-cgi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-legacy-cgi
+#
+################################################################################
+
+PYTHON_LEGACY_CGI_VERSION = 2.6.1
+PYTHON_LEGACY_CGI_SOURCE = legacy_cgi-$(PYTHON_LEGACY_CGI_VERSION).tar.gz
+PYTHON_LEGACY_CGI_SITE = https://files.pythonhosted.org/packages/48/96/ff14ad0f759f2297a2e61db9c5384d248a6b38c6c1d4452c07d7419676a2
+PYTHON_LEGACY_CGI_SETUP_TYPE = pep517
+PYTHON_LEGACY_CGI_LICENSE = PSF-2.0
+PYTHON_LEGACY_CGI_LICENSE_FILES = LICENSE
+PYTHON_LEGACY_CGI_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
