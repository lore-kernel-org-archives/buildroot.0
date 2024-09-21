Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F63ECF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8969401E8;
	Sat, 21 Sep 2024 18:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzPEpb_i04jc; Sat, 21 Sep 2024 18:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83A794070E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A794070E;
	Sat, 21 Sep 2024 18:56:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27B201BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1764481CAD
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiDS5zYujU-g for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C21681C58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C21681C58
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C21681C58
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:56:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cae1.dip0.t-ipconnect.de [79.214.202.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E45AA4C25AE;
 Sat, 21 Sep 2024 20:55:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36328)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1ss5Gw-000000004jH-3tNB;
 Sat, 21 Sep 2024 18:55:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:55:58 +0200
Message-Id: <20240921185558.3647651-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240921185558.3647651-1-bernd@kuhls.net>
References: <20240921185558.3647651-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726944959;
 bh=V1CyvMty14TKtXUuRHKmXBJ3nJ+0/mnXx2eBXAyktmE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qozB8ttRpa+Ylv5ExHNYMY5h6WGlLHCl1y+hdD1i9098eg5U0LIG0A+43D1pa48XQ
 pbzNazQUgUdufGLPRMkHJYT8FaLjuhAsnfkMyaz0k2zQuCs0vKlQ30htqIHppGW/VI
 c4BWh6Ot9NtFEdd+I7ARS13thfHfmi9vaZmmiHNQXAS1MD1NmXMGldt8qTg314Ubye
 FAdHnC2f9wqD0WGnZNx9K/Kd/V1FLZta5Pzjaxs+38RHXRD4Gk6Nw1BgpvpOxXqVXz
 9o3XA6PELbC5hpApnz8iauV2hLOTyHgpg9JCOK8ME5VwYrvaQ5+LHDnyyzbNzCJQxN
 YZiKZpzvVXd6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=qozB8ttR
Subject: [Buildroot] [PATCH 2/2] package/python-emailproxy: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
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
index c9443558c1..b89b32ea51 100644
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
index 4661e3d600..084b95c4e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1096,6 +1096,7 @@ menu "External python modules"
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
index 0000000000..e210ad3898
--- /dev/null
+++ b/package/python-emailproxy/python-emailproxy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/emailproxy/json
+md5  ea254ae1e8d771bb169be41ccc575967  emailproxy-2024.9.12.tar.gz
+sha256  b3fef87ebf803dbd8ed998521b3ec424c4fe7f8f02b6ef1e1e08b2c3a6992f72  emailproxy-2024.9.12.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
new file mode 100644
index 0000000000..89ce3a5daa
--- /dev/null
+++ b/package/python-emailproxy/python-emailproxy.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-emailproxy
+#
+################################################################################
+
+PYTHON_EMAILPROXY_VERSION = 2024.9.12
+PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
+PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/a5/aa/42e408ec6f9c9e06d451b26ae97e127f4644860336b28636bbf14845a35a
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
