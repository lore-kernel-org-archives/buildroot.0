Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBDFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:49:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7BA1610C9
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7BA1610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A49246064B;
	Tue, 12 Oct 2021 17:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7Smu36Du2JG; Tue, 12 Oct 2021 17:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFFBE60678;
	Tue, 12 Oct 2021 17:49:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC9611BF9BD
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB382403FB
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0rJ0X1DBS2F for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 17:48:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C87F40196
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 17:48:43 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id r2so14538405pgl.10
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uo4x7NNAvOOuLSB/6zBVfJScI/I7DLLaC6FR9g8Ue8Y=;
 b=IRn+WmBreHeF6Jjrpnpq0cbK928121Og5z/b+a+A6dj535SW5JoWd1aAB2+jtiMM5k
 z1k7oRdXNwNRXVgs4xcILspS7NpWddWnbz3KPzN6oEMSim6LKfuQ80vaX7cY1LwqaFQe
 oIWl+sRyMxQxqgQbu8lhdy3xfPkHVwx6XSRSAGI/ik7b50YDZe660i4+Xbc9e45cmdJe
 2fLfMd0SqaOR7Ga6tBs3gYj395U6ejW1wPylmVbSthp6kfDwOHO2XZ8brV8YhzVtd1Gl
 3g+Nj3rdwI+BqnNYCbGeaLESL/+gBgcX9dgub4hgom4FFHQTe+LNEJH/lMcEqh//Umf/
 zTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uo4x7NNAvOOuLSB/6zBVfJScI/I7DLLaC6FR9g8Ue8Y=;
 b=y4xRyfyRT2x5R6zyQlx9+9iqH7cYd9YLlRjZfhDP/+WTGmxr7VPAftf01onns5hduC
 EfzCaAzH6ebQg0Ho2IiJJKzpLFNFXWcAbw9zl3rQUsZB9qBauKYCJp/ovX+6+rc1zzrz
 CU9p5k0OHjierTftTCQX4j7wWDhjszdUKS6oRumbJ1pvXenbUC+NFbEcr7ccQE5cDs0r
 rHVbQefCT9vqHGxUWXzwBQ1C2MqDt5Bd3nqv4/KIBWLlYdY3B+YGAXT5X9WAmEGwHwrP
 tzUwttkxSjsZLVa6t0ohcYmqdGucmtYugjSJr0nCxwq+1+XbygeGsQhyzAsx1A0b49ET
 4HDQ==
X-Gm-Message-State: AOAM532BLgQS9LH8fpo6NyQAOK2jzPpcsztGSEXEgdzgOEmZJ9AhkXRM
 ag3PI8LCTmbM1sT2aznUsTeckDAlSLI=
X-Google-Smtp-Source: ABdhPJwkMWWF2Ovv7GlW78/Abg4Avt8VpBv99msiPQxBTy3ooN6GnOLHDhEoH+tIlmx2p/6CxvEt1A==
X-Received: by 2002:a65:6a15:: with SMTP id m21mr23731512pgu.415.1634060922759; 
 Tue, 12 Oct 2021 10:48:42 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id i125sm11679295pfc.36.2021.10.12.10.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 10:48:42 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 10:48:37 -0700
Message-Id: <20211012174838.1222576-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012174838.1222576-1-aduskett@gmail.com>
References: <20211012174838.1222576-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/python-pyndiff: new package,
 drop nmap ndiff option
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ndiff package provided by Nmap relies on python2; moreover, there have been
pending pull requests to move ndiff to python3 for over two years with very
little engagement by the maintainers (https://github.com/nmap/nmap/pull/1807).

Remove the option to select ndiff altogether, and introduce a new package:
python-pyndiff, which provides the same functionality (and more) as the
ndiff provided by nmap, and is compatible with python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 Config.in.legacy                           |  8 ++++++++
 package/Config.in                          |  1 +
 package/nmap/Config.in                     | 12 +-----------
 package/nmap/nmap.mk                       |  9 ---------
 package/python-pyndiff/Config.in           |  9 +++++++++
 package/python-pyndiff/python-pyndiff.hash |  5 +++++
 package/python-pyndiff/python-pyndiff.mk   | 14 ++++++++++++++
 7 files changed, 38 insertions(+), 20 deletions(-)
 create mode 100644 package/python-pyndiff/Config.in
 create mode 100644 package/python-pyndiff/python-pyndiff.hash
 create mode 100644 package/python-pyndiff/python-pyndiff.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 3ec48edb87..a4b5c88dea 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_PACKAGE_NMAP_NDIFF
+	bool "The ndiff utility has been removed."
+	select BR2_LEGACY
+	help
+	  The ndiff utility provided by nmap requires python2 which is
+	  deprecated. The same functionality is provided by the python
+	  package pyndiff.
+
 config BR2_GDB_VERSION_8_3
 	bool "gdb version 8.3.x removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 09e9665f48..fe5c8d43b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1150,6 +1150,7 @@ menu "External python modules"
 	source "package/python-pymupdf/Config.in"
 	source "package/python-pymysql/Config.in"
 	source "package/python-pynacl/Config.in"
+	source "package/python-pyndiff/Config.in"
 	source "package/python-pyopenssl/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index 51dd3423ea..fc6312d0fc 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_NMAP
 	select BR2_PACKAGE_LIBLINEAR
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_NMAP_NMAP \
-	       if !BR2_PACKAGE_NMAP_NCAT && !BR2_PACKAGE_NMAP_NPING && !BR2_PACKAGE_NMAP_NDIFF
+	       if !BR2_PACKAGE_NMAP_NCAT && !BR2_PACKAGE_NMAP_NPING
 	help
 	  Nmap ("Network Mapper") is a free and open source (license)
 	  utility for network discovery and security auditing.
@@ -32,16 +32,6 @@ comment "a symlink from ncat to 'nc' will be installed"
 	depends on !BR2_PACKAGE_NETCAT
 	depends on !BR2_PACKAGE_NETCAT_OPENBSD
 
-config BR2_PACKAGE_NMAP_NDIFF
-	bool "install ndiff"
-	# ndiff only works with python2.x
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  This option installs the 'ndiff' tool.
-
-comment "ndiff needs Python 2.x"
-	depends on !BR2_PACKAGE_PYTHON
-
 config BR2_PACKAGE_NMAP_NMAP
 	bool "install nmap"
 	select BR2_PACKAGE_PCRE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index f3994e9b38..f22a2295b1 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -61,15 +61,6 @@ else
 NMAP_CONF_OPTS += --without-ncat
 endif
 
-ifeq ($(BR2_PACKAGE_NMAP_NDIFF),y)
-NMAP_DEPENDENCIES += python
-NMAP_CONF_OPTS += --with-ndiff
-NMAP_MAKE_OPTS += build-ndiff
-NMAP_INSTALL_TARGET_OPTS += install-ndiff
-else
-NMAP_CONF_OPTS += --without-ndiff
-endif
-
 ifeq ($(BR2_PACKAGE_NMAP_NMAP),y)
 NMAP_DEPENDENCIES += pcre
 NMAP_CONF_OPTS += --with-libpcre="$(STAGING_DIR)/usr"
diff --git a/package/python-pyndiff/Config.in b/package/python-pyndiff/Config.in
new file mode 100644
index 0000000000..58ca35ba97
--- /dev/null
+++ b/package/python-pyndiff/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYNDIFF
+	bool "python-pyndiff"
+	select BR2_PACKAGE_PYTHON_XMLJSON # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	help
+	  Generate human-readable ndiff output when comparing 2 Nmap
+	  XML scan files.
+
+	  https://github.com/rackerlabs/pyndiff
diff --git a/package/python-pyndiff/python-pyndiff.hash b/package/python-pyndiff/python-pyndiff.hash
new file mode 100644
index 0000000000..0afecfb6e2
--- /dev/null
+++ b/package/python-pyndiff/python-pyndiff.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyndiff/json
+md5  32a9f994509cb883bbfeb563171f2668  pyndiff-1.0.2.tar.gz
+sha256  8a519b18a7bbb315c043d4543719ce9fb6db8098bfcdd04cb8054b276cc91368  pyndiff-1.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyndiff/python-pyndiff.mk b/package/python-pyndiff/python-pyndiff.mk
new file mode 100644
index 0000000000..e25374956c
--- /dev/null
+++ b/package/python-pyndiff/python-pyndiff.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyndiff
+#
+################################################################################
+
+PYTHON_PYNDIFF_VERSION = 1.0.2
+PYTHON_PYNDIFF_SOURCE = pyndiff-$(PYTHON_PYNDIFF_VERSION).tar.gz
+PYTHON_PYNDIFF_SITE = https://files.pythonhosted.org/packages/83/3b/fb13918710c4fba40367140f22e3449998f4f66869a7564d0e547ad99ef8
+PYTHON_PYNDIFF_SETUP_TYPE = setuptools
+PYTHON_PYNDIFF_LICENSE = Apache-2.0
+PYTHON_PYNDIFF_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
