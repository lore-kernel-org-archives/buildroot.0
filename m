Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F59C4167B
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 16:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C4F41B47;
	Tue, 12 Dec 2023 16:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62C4F41B47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xk1SSWj9gv2q; Tue, 12 Dec 2023 16:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DAF341B42;
	Tue, 12 Dec 2023 16:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DAF341B42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 500251BF46A
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 16:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 287CA8176D
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 16:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 287CA8176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqS1xPJUJo0N for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 16:02:15 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10AA081762
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 16:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10AA081762
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SqNfW01qXz9slb;
 Tue, 12 Dec 2023 17:02:11 +0100 (CET)
From: Ralf Dragon <hypnotoad@lindra.de>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 17:01:12 +0100
Message-Id: <20231212160112.94272-2-hypnotoad@lindra.de>
In-Reply-To: <20231212160112.94272-1-hypnotoad@lindra.de>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4SqNfW01qXz9slb
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1702396931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAtaKBjeN4bZaGiiaztOH2m6ORRL5kEofVtuEfBzis4=;
 b=ygpTw8Lsg0jkEelIUJTNRwh1EQG+9dZCPQSpsTXZrt8d/vp7hz/kpebEbeDdUa3S9aMT+b
 YIYJOzHllIFlzV0nbvClxp3YL3HHl/nWErs8NVfM27Bsb2+3U12VluiaJKcX8s8LO0GIap
 7r9CTS8XVz9FwL8uO0KBk/exLD6oMS17a8cOyyvzNeQYF4uHzR0RpzkhjWp7vtMox9cLnH
 w56Rqz6LeMfwW+MWn7OVX2wQv43dD46kn+YTL+wG/YjnNMk5IZKmDVGDt0iFeUYsqUzQ9n
 6HE09CtBJ4NGaniZ7BxNpFdWG/nyMnq7/KMFruMjxUZtGXYYxmNI+lw1Zswq+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=ygpTw8Ls
Subject: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: Ralf Dragon <hypnotoad@lindra.de>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following runtime error when importing PyQt5 in python:

from PyQt5.QtCore import *
ModuleNotFoundError: No module named 'PyQt5.sip'

Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
---
Backport to: 2023.02.x

 package/Config.in                              |  1 +
 package/python-pyqt5-sip/Config.in             |  6 ++++++
 package/python-pyqt5-sip/python-pyqt5-sip.hash |  4 ++++
 package/python-pyqt5-sip/python-pyqt5-sip.mk   | 15 +++++++++++++++
 package/python-pyqt5/Config.in                 |  1 +
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-pyqt5-sip/Config.in
 create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.hash
 create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.mk

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..2d6a077d16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1253,6 +1253,7 @@ menu "External python modules"
 	source "package/python-pyphen/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
+	source "package/python-pyqt5-sip/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pyrsistent/Config.in"
diff --git a/package/python-pyqt5-sip/Config.in b/package/python-pyqt5-sip/Config.in
new file mode 100644
index 0000000000..6f26271f70
--- /dev/null
+++ b/package/python-pyqt5-sip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYQT5_SIP
+	bool "python-pyqt5-sip"
+	depends on BR2_PACKAGE_PYTHON_PYQT5
+	depends on BR2_PACKAGE_PYTHON_SIP
+	help
+	  This is the PyQt5.sip module which is needed to run PyQt5.
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
new file mode 100644
index 0000000000..8039cdafd9
--- /dev/null
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -0,0 +1,4 @@
+# from https://pypi.org/project/PyQt5-sip/12.12.1
+
+sha256  8fdc6e0148abd12d977a1d3828e7b79aae958e83c6cb5adae614916d888a6b10  PyQt5_sip-12.12.1.tar.gz
+md5  c2117da3b4c0e081c1c5a9088b8a4d55  PyQt5_sip-12.12.1.tar.gz
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
new file mode 100644
index 0000000000..3f689b9d47
--- /dev/null
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-SIP-QT5
+#
+################################################################################
+
+PYTHON_PYQT5_SIP_VERSION = 12.12.1
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/c1/61/4055e7a0f36339964956ff415e36f4abf82561904cc49c021da32949fc55
+PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
+PYTHON_PYQT5_SIP_LICENSE = MIT
+PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
+PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
+PYTHON_PYQT5_SIP_DEPENDENCIES += python-sip
+
+$(eval $(python-package))
diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
index 9fa7676f98..c2a1976950 100644
--- a/package/python-pyqt5/Config.in
+++ b/package/python-pyqt5/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYQT5
 	bool "python-pyqt5"
 	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_PYTHON_SIP
+	select BR2_PACKAGE_PYTHON_PYQT5_SIP
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Python bindings for Qt 5
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
