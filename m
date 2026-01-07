Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B512D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03A0582FA2;
	Wed,  7 Jan 2026 18:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0iJlESfXXqi; Wed,  7 Jan 2026 18:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F41BD82FA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808944;
	bh=V5PpzfpVOpMWt4Id5A5HXm3c7Idkg0TT2Uvg42rpLmk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mYAsqtysmfwSxsj7hdX1QlRWaiBgs8tUcsOgCSXRUG51JOC4zLdN42gB0ldzcUzxG
	 eY6RvxYYDj2XGHAZlWA5TxvbEeBBG+Fhk8e7JfCZUp0Qq51x+hQtlvFjMylsHGoAnR
	 zZusIMEWu78lKw+ittrHIaM3Xt/sSsfY4kl708KJLvt8obtE2OcLDdNIdbeKoD4M96
	 vWZbupIttVR0NpiVE7l6BKGITvtx002oO3iM4IxtP2+DWpmu3oKs9wH/DM6PXzLlYA
	 xa5C6xVsZti6J/QngWowHiPdxfVoYQlgdvsxXxHBqNHXmxd2P6AVaTzTq0v467uxgv
	 l+96jEQZwgvAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F41BD82FA9;
	Wed,  7 Jan 2026 18:02:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DC119ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6080960859
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjXH81_Y1k6I for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 545FB607FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 545FB607FC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 545FB607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9433313F879;
 Wed,  7 Jan 2026 19:01:12 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 19:01:08 +0100
Message-ID: <20260107180108.2470425-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107180108.2470425-1-vjardin@free.fr>
References: <20260107180108.2470425-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767808874;
 bh=B/U9PjVGLFq3P1nHHZ/TCyVmK4g9z/eE4Jfi05K6tJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VPjGqPaxW4SmoGr6Ys30vhPoH4VwVLC7wJOs+4X/SPRc3uhBOnMUV/4oOr+Y57MZS
 bEUb8NoiQ5+imoNLNzfWwKEtlTgH4dwohk8JUoGpz501If/EllJUd3aucSU/gUW7zQ
 6LErXR13YQ6fMZ+SarxQRoiSASYWDFB9vLNB8vIRYTLp90Hzv+LpexkGVTgbwHyKW1
 7SI2leyK0AlNOiFvVm9U+PHhT+J0Bg2VyQvGcNKag+G+xqn3rem1wm+jKQqBrxSCDt
 rvdzdkCl4ckdj3WwMsp7ps942g87F8u7aQaaEVgsPEyCzSPyrAV8zovnO00zeL3X1o
 U22uMfbl2JYhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VPjGqPax
Subject: [Buildroot] [PATCH v1 1/1] package/python-ncclient: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides Python bindings for NETCONF clients. It
facilitates client-side scripting and application development
around NETCONF protocol for network device configuration.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-ncclient/Config.in            | 16 +++++++++++++++
 package/python-ncclient/python-ncclient.hash |  5 +++++
 package/python-ncclient/python-ncclient.mk   | 21 ++++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/python-ncclient/Config.in
 create mode 100644 package/python-ncclient/python-ncclient.hash
 create mode 100644 package/python-ncclient/python-ncclient.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..4185cbb57c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3359,6 +3359,7 @@ F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
+F:	package/python-ncclient/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index def3db0e50..141e0e07d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1247,6 +1247,7 @@ menu "External python modules"
 	source "package/python-mwscrape2slob/Config.in"
 	source "package/python-mypy/Config.in"
 	source "package/python-mypy-extensions/Config.in"
+	source "package/python-ncclient/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
diff --git a/package/python-ncclient/Config.in b/package/python-ncclient/Config.in
new file mode 100644
index 0000000000..2be69efb2b
--- /dev/null
+++ b/package/python-ncclient/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PYTHON_NCCLIENT
+	bool "python-ncclient"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko
+	select BR2_PACKAGE_PYTHON_LXML
+	select BR2_PACKAGE_PYTHON_PARAMIKO
+	select BR2_PACKAGE_PYTHON_SIX
+	help
+	  ncclient is a Python library for NETCONF clients. It
+	  facilitates client-side scripting and application
+	  development around NETCONF.
+
+	  https://github.com/ncclient/ncclient
+
+comment "python-ncclient needs python3 and host Rust (for paramiko)"
+	depends on !BR2_PACKAGE_PYTHON3 || !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
diff --git a/package/python-ncclient/python-ncclient.hash b/package/python-ncclient/python-ncclient.hash
new file mode 100644
index 0000000000..e3a46c8175
--- /dev/null
+++ b/package/python-ncclient/python-ncclient.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/pypi/ncclient/0.7.0/json
+sha256  318e8e3e72b1d2a766f3665cabef33436fd25b607da5f15657a199c648a68435  ncclient-0.7.0.tar.gz
+
+# Locally computed
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ncclient/python-ncclient.mk b/package/python-ncclient/python-ncclient.mk
new file mode 100644
index 0000000000..ca1b23e441
--- /dev/null
+++ b/package/python-ncclient/python-ncclient.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-ncclient
+#
+################################################################################
+
+PYTHON_NCCLIENT_VERSION = 0.7.0
+PYTHON_NCCLIENT_SOURCE = ncclient-$(PYTHON_NCCLIENT_VERSION).tar.gz
+PYTHON_NCCLIENT_SITE = https://files.pythonhosted.org/packages/source/n/ncclient
+
+PYTHON_NCCLIENT_LICENSE = Apache-2.0
+PYTHON_NCCLIENT_LICENSE_FILES = LICENSE
+
+PYTHON_NCCLIENT_SETUP_TYPE = setuptools
+
+PYTHON_NCCLIENT_DEPENDENCIES = \
+	python-lxml \
+	python-paramiko \
+	python-six
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
