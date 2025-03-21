Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A2DC36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 18:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19A9541E70;
	Fri, 21 Mar 2025 18:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5H9sX8NTVqZO; Fri, 21 Mar 2025 18:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461E641E57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461E641E57;
	Fri, 21 Mar 2025 18:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33B1612F
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 18:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2617C80F56
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 18:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esf3oE3Qo1BX for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 18:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22CB680F4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22CB680F4A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22CB680F4A
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 18:20:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6caeb.dip0.t-ipconnect.de [79.214.202.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 363C1A4C33F9;
 Fri, 21 Mar 2025 19:20:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37878)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tvgz7-00000000422-0QEg;
 Fri, 21 Mar 2025 18:20:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Mar 2025 19:20:45 +0100
Message-Id: <20250321182045.2782233-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742581246;
 bh=t3d75UhVfRMIcja5grJaTC6/kNVQN87HKpn+wSyeNKU=;
 h=From:To:Cc:Subject:Date:From;
 b=R9kbJBufVZEgKoOjTJ6wBLSB4g6JA29GSYY6aTXFrmDeU6UdAJ9m/nJqu2zM3An9z
 tBqTniEKRqHmr5QPGTcY4JDKLnNxvIoLttl9tnXu1U6ok8ojpQFNuhCN/VCZEYhoJU
 cWMOgvDnJkOs34O+vVqy8tEMW2NSMYBdNs5cHMtzDTRa0vsUjL+Nnv2nR4lEjWBV6b
 QQmHJfI+IPpEiPSnEtVghSuzlc+oeo0/IWoGCFbkFOVGmWX0yVPmjDnvVRcAG7S4sC
 gg7shkG3C3P0BSOhJuK4gTu4PnxDeVyXtMsnJ63wOsrxNf05jDChn7sAqi742zUUrb
 U91pCTdQaSFdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=R9kbJBuf
Subject: [Buildroot] [PATCH v3 1/1] package/python-emailproxy: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: bump version to 2025.3.14
    removed host dependencies due to upstream commit
    https://github.com/simonrob/email-oauth2-proxy/commit/02770ad12ab32909bef0fa42ca495ae2714318b4
v2: bump version to 2024.11.11

 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-emailproxy/Config.in              | 12 ++++++++++++
 package/python-emailproxy/python-emailproxy.hash |  5 +++++
 package/python-emailproxy/python-emailproxy.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/python-emailproxy/Config.in
 create mode 100644 package/python-emailproxy/python-emailproxy.hash
 create mode 100644 package/python-emailproxy/python-emailproxy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f0b199440e..7342f42320 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -496,6 +496,7 @@ F:	package/privoxy/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
+F:	package/python-emailproxy/
 F:	package/python-glslang/
 F:	package/python-mako/
 F:	package/python-mwclient/
diff --git a/package/Config.in b/package/Config.in
index dd1dadbffc..4240ddb916 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1101,6 +1101,7 @@ menu "External python modules"
 	source "package/python-dpkt/Config.in"
 	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
+	source "package/python-emailproxy/Config.in"
 	source "package/python-email-validator/Config.in"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
diff --git a/package/python-emailproxy/Config.in b/package/python-emailproxy/Config.in
new file mode 100644
index 0000000000..f1a349ce94
--- /dev/null
+++ b/package/python-emailproxy/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_EMAILPROXY
+	bool "python-emailproxy"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
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
index 0000000000..886173234b
--- /dev/null
+++ b/package/python-emailproxy/python-emailproxy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/emailproxy/json
+md5  f216dea4437131103b1d658cfa1a9bc0  emailproxy-2025.3.14.tar.gz
+sha256  e406478ed86eca2005ed1e17221358a0c37ddaeccfd991d42d2df93febb279a0  emailproxy-2025.3.14.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
new file mode 100644
index 0000000000..fd73110597
--- /dev/null
+++ b/package/python-emailproxy/python-emailproxy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-emailproxy
+#
+################################################################################
+
+PYTHON_EMAILPROXY_VERSION = 2025.3.14
+PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
+PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/15/b9/b2864ab1da9fdf7409589de99501b227352c9a6b8fa1178660debf0a2ad6
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
