Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324C2CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 05:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E99AB6137C;
	Fri,  8 May 2026 05:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVrKUOrXy5We; Fri,  8 May 2026 05:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7810261373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778219856;
	bh=hPV6yV0Url1V1mgDOEN8mfIKB6uU9fGjCZME3exwaDI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MggkRyugmXAHe9syHkhLmL9HPqfrkq1G8uN5Q/yFOkJw1meXU5otvt+bJlbcNHELe
	 MZRdLqfJOcjbyK5ENUhpuajmZxPywzJkMfX9gSiybF+7GTaXrjGwzqBN3OvMfmCZLF
	 sRYOIALJ3n/40xOprTwMH35Ho7iVz1VoFTc9P+NSlJbj0CVQpghNFiqkNtF+dCt39R
	 ey9/MAVsZjwkLO53eXr3+1r5G8WE1criEY6+KXlyo/2v1J2D2q37cOBbkmwnes6MAP
	 gUJDI0EH5d4nom4i42oPmVGuVX81G95k1PSgXicbKL/MKO1ZDJEKRt4rRLIDahiAK8
	 9vcFPBGsd5Rhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7810261373;
	Fri,  8 May 2026 05:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C9DE317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 05:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42F0941681
 for <buildroot@buildroot.org>; Fri,  8 May 2026 05:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zj0AEEEF9kqZ for <buildroot@buildroot.org>;
 Fri,  8 May 2026 05:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B0D74167C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B0D74167C
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B0D74167C
 for <buildroot@buildroot.org>; Fri,  8 May 2026 05:57:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 48AAB31E054F; Fri, 08 May 2026 07:57:30 +0200 (CEST)
Date: Fri, 8 May 2026 07:57:29 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <af17STLwSLfdAgT4@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.85+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1778219850; bh=MB6PBbBPhAUKN80UlmAhGcNDNos/72fX6rTQWvb9I7E=;
 h=Date:From:To:Subject:From;
 b=Nc9XtsgeBJAp35qPPFQrJwOVL4qm8UcCxQauihe1VCEE6drxT6octamUNfL86RdR/
 GiabATnnVOmiTaBH0THwu3hLRGX5rCW7YyTZNC0ZP5hOFQtp5Zty24hdtiQ9nVS9eU
 2sT5RVFYnI6x0GeR+7/9dvnYOreapW65Vyacdn0Tp7nls11mDCEKD05MQTkRTrDNOK
 8diUH5XiTUgldpPT0LTZNUqoa5tx3KDOwVXKycauUywpXSCB36+w6oBAoX6rgfBPt7
 KoSlyiVaL9pWFQa+OqLW3bYjeJUyW5vlbgx1BXckeMNVz3ITRNrEPLJ9mD7eoHt+zA
 nsd6RgjDXbGow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH 2025.02.x] package/libxmlsec1: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added from Buildroot master.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
Is there a better way to do it?
Do you want three cherry-picks from master to branch?
---
 package/Config.in                  |  1 +
 package/libxmlsec1/Config.in       | 12 +++++++++
 package/libxmlsec1/libxmlsec1.hash |  3 +++
 package/libxmlsec1/libxmlsec1.mk   | 42 ++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/libxmlsec1/Config.in
 create mode 100644 package/libxmlsec1/libxmlsec1.hash
 create mode 100644 package/libxmlsec1/libxmlsec1.mk

diff --git a/package/Config.in b/package/Config.in
index 38da39033b..64225c03c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1910,6 +1910,7 @@ menu "JSON/XML"
 	source "package/libxmlb/Config.in"
 	source "package/libxmlpp/Config.in"
 	source "package/libxmlrpc/Config.in"
+	source "package/libxmlsec1/Config.in"
 	source "package/libxslt/Config.in"
 	source "package/libyaml/Config.in"
 	source "package/mxml/Config.in"
diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
new file mode 100644
index 0000000000..4a686853ae
--- /dev/null
+++ b/package/libxmlsec1/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBXMLSEC1
+	bool "libxmlsec1"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBXML2
+	help
+	  XMLSec library provides C based implementation for major XML
+	  Security standards:
+	    - XML Signature Syntax and Processing
+	    - XML Encryption Syntax and Processing
+
+	  https://www.aleksey.com/xmlsec/
+	  https://github.com/lsh123/xmlsec
diff --git a/package/libxmlsec1/libxmlsec1.hash b/package/libxmlsec1/libxmlsec1.hash
new file mode 100644
index 0000000000..9e0e67e732
--- /dev/null
+++ b/package/libxmlsec1/libxmlsec1.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  a631c8cd7a6b86e6adb9f5b935d45a9cf9768b3cb090d461e8eb9d043cf9b62f  xmlsec1-1.3.9.tar.gz
+sha256  d5e9388534256360c6a009d4f19ab2b8d6ec0aa7ff32a51e22d899ed7beb5c48  Copyright
diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
new file mode 100644
index 0000000000..29222bc16f
--- /dev/null
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# libxmlsec1
+#
+################################################################################
+
+LIBXMLSEC1_VERSION = 1.3.9
+LIBXMLSEC1_SOURCE = xmlsec1-$(LIBXMLSEC1_VERSION).tar.gz
+LIBXMLSEC1_SITE = https://github.com/lsh123/xmlsec/releases/download/$(LIBXMLSEC1_VERSION)
+LIBXMLSEC1_LICENSE = MIT
+LIBXMLSEC1_LICENSE_FILES = Copyright
+LIBXMLSEC1_INSTALL_STAGING = YES
+LIBXMLSEC1_DEPENDENCIES = libxml2 openssl
+HOST_LIBXMLSEC1_DEPENDENCIES = host-libxml2 host-openssl
+LIBXMLSEC1_AUTORECONF = YES
+
+LIBXMLSEC1_CONF_OPTS = \
+	--enable-crypto-dl=no \
+	--with-openssl \
+	--without-gnutls \
+	--without-gcrypt \
+	--without-nss \
+	--disable-des
+
+HOST_LIBXMLSEC1_CONF_OPTS = \
+	--enable-crypto-dl=no \
+	--with-openssl \
+	--without-gnutls \
+	--without-gcrypt \
+	--without-nss \
+	--without-libxslt \
+	--disable-des
+
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+LIBXMLSEC1_DEPENDENCIES += libxslt
+LIBXMLSEC1_CONF_OPTS += --with-libxslt
+else
+LIBXMLSEC1_CONF_OPTS += --without-libxslt
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
