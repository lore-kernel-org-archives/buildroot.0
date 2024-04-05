Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F39BC67861
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 17:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B70E841D6E;
	Fri,  5 Apr 2024 17:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBlZhydQpuwl; Fri,  5 Apr 2024 17:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF54641B4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF54641B4B;
	Fri,  5 Apr 2024 17:55:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B11991BF406
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 17:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E05A40491
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 17:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzFESHSPWKhU for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 17:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.152;
 helo=mout-p-102.mailbox.org; envelope-from=ralf.dragon@lindra.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1559A401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1559A401AD
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1559A401AD
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 17:55:20 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4VB5jv1Vwdz9t39;
 Fri,  5 Apr 2024 19:55:15 +0200 (CEST)
From: Ralf Dragon <hypnotoad@lindra.de>
To: buildroot@buildroot.org
Date: Fri,  5 Apr 2024 19:54:53 +0200
Message-Id: <20240405175454.14431-1-hypnotoad@lindra.de>
In-Reply-To: <20240401084841.439073-1-hypnotoad@lindra.de>
References: <20240401084841.439073-1-hypnotoad@lindra.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4VB5jv1Vwdz9t39
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1712339715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIlknB81Rq6K8mUIOXV0pmKtqB1UTJtjVx6s727AKtM=;
 b=B8a+5NTP4f1nlZaxfthyT4fIqqylL6yUmVQ5Jklatv2JBfSet+Wk14xgs9uAllNIOF/sGy
 SF+u27qDwSLbVAfk8fa/uvxim7the77djjpk4spM+ffyycRUobkmjJT0J4+KUQFU+LAk94
 yLEPIxwd0fgeeUNu0ImFoe5uiibWqE2S2+JdDkzSPkgaZLnkzJ4G+E6UYVrw2rIlsKqO1H
 j+qn87z0+69MT+VMaahOhNkhhuV42pZjX4t+D4WQaAHxuUR9glW+M/mhbn7LfGS/EfNpJw
 BA4OPQo/5EiFED5FjN/SVwNIQO8s+Zehadznbh6aMCQfCBDdDCKghEgG4Clncw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=B8a+5NTP
Subject: [Buildroot] [PATCH v3 1/2] package/python-pyqt5-sip: new package
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
Cc: Ralf Dragon <hypnotoad@lindra.de>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
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

Changes v2 -> v3:
 - add myself as developer
 - fix license
 - improve description

Backport to: 2024.02.x

Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
---
 DEVELOPERS                                     |  3 +++
 package/Config.in                              |  1 +
 package/python-pyqt5-sip/Config.in             |  7 +++++++
 package/python-pyqt5-sip/python-pyqt5-sip.hash |  7 +++++++
 package/python-pyqt5-sip/python-pyqt5-sip.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/python-pyqt5-sip/Config.in
 create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.hash
 create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f6fc301373..9808562ac6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2594,6 +2594,9 @@ F:	package/gupnp-av/
 F:	package/let-me-create/
 F:	package/nanomsg/
 
+N:	Ralf Dragon <hypnotoad@lindra.de>
+F:	package/python-pyqt5-sip/
+
 N:	Ramon Fried <rfried.dev@gmail.com>
 F:	package/bitwise/
 
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
index 0000000000..3eda2c8d1f
--- /dev/null
+++ b/package/python-pyqt5-sip/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYQT5_SIP
+	bool "python-pyqt5-sip"
+	help
+	  This is the PyQt5.sip module which is needed at runtime for
+	  the PyQt5 module from package python-pyqt5.
+
+	  https://pypi.org/project/PyQt5-sip/
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
index 0000000000..e52081ab45
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
+PYTHON_PYQT5_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
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
