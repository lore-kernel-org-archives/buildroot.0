Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF781E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F38405BD;
	Wed, 11 Dec 2024 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHpVeZHO4UVN; Wed, 11 Dec 2024 19:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E48F406EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E48F406EA;
	Wed, 11 Dec 2024 19:16:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42CE2EE0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23905406EA
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbzSqMB2x28q for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E006E405BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E006E405BD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E006E405BD
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:16:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF6AFA4C3C9F;
 Wed, 11 Dec 2024 20:16:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47406)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLSCE-000000003Dg-0QbQ;
 Wed, 11 Dec 2024 19:16:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 20:16:30 +0100
Message-Id: <20241211191630.1414970-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211191630.1414970-1-bernd@kuhls.net>
References: <20241211191630.1414970-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733944590;
 bh=0KtGQ47YRwD9pPkL5nMZ0D6ZZYMVfio4XuNSEmPwlEI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FaPrx+OUxxfxmCfXdCWHEM8164gs99q7X8ruAvOkl3nN1vjy7zk8mfhB2eQtq3RB8
 fIVJSg9SbcDax9/PL158XKh5KeYBXqYp/IET8zTylCBYMGadLNWIJKKVLoCu2QtDK0
 veWWMWLtZ+wLewXnnDKtaZYAPX8VZskcfLhTMBCjyLpTXsj9pLwmLbcNmHDH1ykgRD
 EEKjo837QwkmTP5UT3I3Md0TE0VZVCAOJGHoDCwavmvu312yH+Z/c5BDK+t4bz3reB
 SqeFusbZ3c4s54OnKj+IFCF0dL0gM6vXvojg/MKEYicO5qmKcaFqRJRTjIog8sfrXw
 WWy5lYrU+ETpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=FaPrx+OU
Subject: [Buildroot] [PATCH v2 2/2] package/python-emailproxy: new package
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
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: bump version to 2024.11.11

 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-emailproxy/Config.in              | 14 ++++++++++++++
 package/python-emailproxy/python-emailproxy.hash |  5 +++++
 package/python-emailproxy/python-emailproxy.mk   | 15 +++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/python-emailproxy/Config.in
 create mode 100644 package/python-emailproxy/python-emailproxy.hash
 create mode 100644 package/python-emailproxy/python-emailproxy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f0006cfa35..532e86acc8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -482,6 +482,7 @@ F:	package/privoxy/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
+F:	package/python-emailproxy/
 F:	package/python-glslang/
 F:	package/python-mako/
 F:	package/python-mwclient/
diff --git a/package/Config.in b/package/Config.in
index dfae37e1bc..588f3da9c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1102,6 +1102,7 @@ menu "External python modules"
 	source "package/python-dpkt/Config.in"
 	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
+	source "package/python-emailproxy/Config.in"
 	source "package/python-email-validator/Config.in"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
diff --git a/package/python-emailproxy/Config.in b/package/python-emailproxy/Config.in
new file mode 100644
index 0000000000..f5c72d3a18
--- /dev/null
+++ b/package/python-emailproxy/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_EMAILPROXY
+	bool "python-emailproxy"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_PYASYNCORE # runtime
+	help
+	  An IMAP/POP/SMTP proxy that transparently adds OAuth 2.0
+	  authentication for email clients that don't support this
+	  method.
+
+	  https://github.com/simonrob/email-oauth2-proxy
diff --git a/package/python-emailproxy/python-emailproxy.hash b/package/python-emailproxy/python-emailproxy.hash
new file mode 100644
index 0000000000..da3f63639f
--- /dev/null
+++ b/package/python-emailproxy/python-emailproxy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/emailproxy/json
+md5  fa1c82907718c7c643c541606aec947d  emailproxy-2024.11.11.tar.gz
+sha256  97b59c5f9cd5afb1d2146aff9c5259a3ab0d46b074cb50952b9fb4a4d8b4df35  emailproxy-2024.11.11.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
new file mode 100644
index 0000000000..58bb1fb7ee
--- /dev/null
+++ b/package/python-emailproxy/python-emailproxy.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-emailproxy
+#
+################################################################################
+
+PYTHON_EMAILPROXY_VERSION = 2024.11.11
+PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
+PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/2b/49/386e675f2b0706083fdf02ad3666b98d0875a2e1cdcabff8df9fe641d2e3
+PYTHON_EMAILPROXY_DEPENDENCIES = host-python-cryptography host-python-pyasyncore
+PYTHON_EMAILPROXY_SETUP_TYPE = setuptools
+PYTHON_EMAILPROXY_LICENSE = Apache-2.0
+PYTHON_EMAILPROXY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
