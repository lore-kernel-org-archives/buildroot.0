Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7802DCD1283
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 08:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67D22405A0;
	Mon,  1 Apr 2024 08:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnhjPGb6gURh; Mon,  1 Apr 2024 08:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A452A40518
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A452A40518;
	Mon,  1 Apr 2024 08:58:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 456771BF3AD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 08:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EFEB40518
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 08:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEG2KCjp_EyL for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 08:58:01 +0000 (UTC)
X-Greylist: delayed 535 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Apr 2024 08:57:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4158740316
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4158740316
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.171;
 helo=mout-p-201.mailbox.org; envelope-from=ralf.dragon@lindra.de;
 receiver=<UNKNOWN> 
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4158740316
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 08:57:59 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4V7PnR58bgz9sbX;
 Mon,  1 Apr 2024 10:48:59 +0200 (CEST)
From: Ralf Dragon <hypnotoad@lindra.de>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 10:48:41 +0200
Message-Id: <20240401084841.439073-1-hypnotoad@lindra.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1711961339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GO5j85OxnH+3nOPJiZbCWqY/IysAwxfMxg/lOuc29cU=;
 b=nxquqmFhTbXx5arrXvZ+Lm8Cl//bRZzVQEILW8fayJsIiykZKb8W9t3Oh1DpvLXTitDuY9
 HGcILLMAa1AF/ABc5VTqGV4HIA2KAunIqP/SQFcsLw6jxLCa9JiTatvvjPSOlH58twx9HS
 OEWh9ZiKcd63s3jdK57Jjqim70PruyGbPRmiGGRoSz8xYo7vEV3TANhr7/ey/x8FiK0tLl
 RnV4ikT7O3VxxBtrNI/ejg7sOdtYGmoSpG4byl5p9BMNWGqJUpFb9jAAdlDqXls6PrAKIP
 R5aDmq1NlBDt6aMR7Yi6FTan96nMKjeZvLNDDsnbtBC7M5SGu6NkCrLiWfi8Og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=nxquqmFh
Subject: [Buildroot] [PATCH 1/2] package/python-pyqt5-sip: new package
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
Cc: Ralf Dragon <hypnotoad@lindra.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This packages adds the PyQt5.sip module.

The official documentation [1] mentions that this module is needed
during PyQt5 runtime. It is currently compiled without any
dependencies to Qt or PyQt5, but it seems quite useless without it.
The module was introduced together with PyQt 5.11 [2].

[1] https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-and-installing-from-source
[2] https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11

Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
---
Changes v1 -> v2:
 - fix License and make sure legal info passes
 - document in commit message why this package is needed
 - split off the runtime dependency to separate patch

Backport to: 2023.*.x 2024.02.x
(2022 LTS branches are probably also affected but I could not test any, 2021.11.3 is fine)

 package/Config.in                              |  1 +
 package/python-pyqt5-sip/Config.in             |  4 ++++
 package/python-pyqt5-sip/python-pyqt5-sip.hash |  7 +++++++
 package/python-pyqt5-sip/python-pyqt5-sip.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-pyqt5-sip/Config.in
 create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.hash
 create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.mk

diff --git a/package/Config.in b/package/Config.in
index 33039331f7..d897f16120 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1278,6 +1278,7 @@ menu "External python modules"
 	source "package/python-pypng/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
+	source "package/python-pyqt5-sip/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pyrsistent/Config.in"
diff --git a/package/python-pyqt5-sip/Config.in b/package/python-pyqt5-sip/Config.in
new file mode 100644
index 0000000000..f7be60c8ec
--- /dev/null
+++ b/package/python-pyqt5-sip/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_PYTHON_PYQT5_SIP
+	bool "python-pyqt5-sip"
+	help
+	  This is the PyQt5.sip module which is needed to run PyQt5.
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
new file mode 100644
index 0000000000..fb4a8cb04d
--- /dev/null
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -0,0 +1,7 @@
+# from https://pypi.org/project/PyQt5-sip/12.30.0
+sha256  7f321daf84b9c9dbca61b80e1ef37bdaffc0e93312edae2cd7da25b953971d91  PyQt5_sip-12.13.0.tar.gz
+
+# Hash for license files:
+md5  9cd437778ebd1c056a76b4ded73b3a6d  LICENSE
+md5  e91355d8a6f8bd8f7c699d62863c7303  LICENSE-GPL2
+md5  7ea41d866d6638e430db5287a3f66090  LICENSE-GPL3
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
new file mode 100644
index 0000000000..0114f6db69
--- /dev/null
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-SIP-QT5
+#
+################################################################################
+
+PYTHON_PYQT5_SIP_VERSION = 12.13.0
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/ee/81/fce2a475aa56c1f49707d9306b930695b6ff078c2242c9f2fd72a3214e1f
+PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
+PYTHON_PYQT5_SIP_LICENSE = SIP
+PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
+PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
