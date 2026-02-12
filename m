Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF85EEA84B
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 20:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AFEB60783;
	Thu, 12 Feb 2026 20:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlRmaUYo-ATO; Thu, 12 Feb 2026 20:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E3B160799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770929907;
	bh=A2p90EQCrhXZqBAIlduTnI6Mr0VTEoKcaxU1fhO1kV4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=TKDty2V5iaxpkEty+RAUIcu/n6ITD5HXxRzXrQvhurDxivE39CXJkiCVIs5/eXTHA
	 MQqCEG3udWF8NgtRbN/6WC8fHJgE+dNAfaiqLfDoWPb7w8c5XWkXgkRgZzB8qSMMS6
	 TUXr2w3SDpmGGxois8I7uRbVGk+Aul/lQfiI4TrOG2dujLaEGdocnEIZkfYccrUP5s
	 UUpus1LaomwVAhQucfwEIARaslCLGuJLVHRP9jmSCbAwQ7KVKR/+9iH9rNDzKoh/LL
	 ZL2BZ4BlHNQ1tS5SNsxudHTZA4/5NU3hycMK+T3EwlVMv4f2uv4u4gK0KTw/r4tmMi
	 PxQESpImFv73A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E3B160799;
	Thu, 12 Feb 2026 20:58:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AF261D6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3D8A411D4
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eY7PKl1PcBoo for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 20:58:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6D42411B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6D42411B9
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6D42411B9
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:58:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 64D5B1A0E63
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:58:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2A03A606B8
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 161D1103688A1; Thu, 12 Feb 2026 21:58:19 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Thu, 12 Feb 2026 21:58:15 +0100
Message-ID: <20260212205815.1029590-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770929900; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=vuvzTAcceIwVG4TUsY8oyZqb0jGOVFVuny1kQkkX5BM=;
 b=w8IEj9NFZJOPnkil6bT9mLZmAOTJHm19bT2yzqxKANknd7zFWhtzddE5lTbvxteWsMjLpr
 TfFvlm18gta7m2uuyFLgd51GQDNvQT+7LbkRT9yQUFg4MW/dEHaoL+kcNEhLiX+g3xSPKv
 b3Pt4iO5GdkfhZrDIkQcQkT/u2mS0ka4UFiknjtka8GFJm/6TMAtUHELOA1jFW60YvcBLr
 5xpO4oq5yeu6ChoLgQNkjxcFC4wuK+cDngQeEQ+M51ws6vqEf7Ttcd1UsdkZZTxd6onOuK
 +1ntVXNavEvp6F240EEG9kEDYEqUovGtYicaTJQRzd8jW58O4AnmT2p49YpUdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=w8IEj9NF
Subject: [Buildroot] [PATCH] package/libxmlsec1: drop mandatory libxslt
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 7eeb574f0ec86e372bcc8a551e8e9bb88b8d6555 introduced the
libxmlsec1 making libxslt a mandatory dependency, which it isn't.

This commit therefore make libxslt an optional dependency of the
target libxmlsec1 package, and drops the dependency entirely for the
host package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxmlsec1/Config.in     |  1 -
 package/libxmlsec1/libxmlsec1.mk | 14 +++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
index 155efac825..4a686853ae 100644
--- a/package/libxmlsec1/Config.in
+++ b/package/libxmlsec1/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBXMLSEC1
 	bool "libxmlsec1"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBXSLT
 	help
 	  XMLSec library provides C based implementation for major XML
 	  Security standards:
diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
index 08f1f9eccd..d0d553c48c 100644
--- a/package/libxmlsec1/libxmlsec1.mk
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -10,8 +10,8 @@ LIBXMLSEC1_SITE = https://github.com/lsh123/xmlsec/releases/download/$(LIBXMLSEC
 LIBXMLSEC1_LICENSE = MIT
 LIBXMLSEC1_LICENSE_FILES = Copyright
 LIBXMLSEC1_INSTALL_STAGING = YES
-LIBXMLSEC1_DEPENDENCIES = libxml2 libxslt openssl
-HOST_LIBXMLSEC1_DEPENDENCIES = host-libxml2 host-libxslt host-openssl
+LIBXMLSEC1_DEPENDENCIES = libxml2 openssl
+HOST_LIBXMLSEC1_DEPENDENCIES = host-libxml2 host-openssl
 LIBXMLSEC1_AUTORECONF = YES
 
 LIBXMLSEC1_CONF_OPTS = \
@@ -26,7 +26,15 @@ HOST_LIBXMLSEC1_CONF_OPTS = \
 	--with-openssl \
 	--without-gnutls \
 	--without-gcrypt \
-	--without-nss
+	--without-nss \
+	--without-libxslt
+
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+LIBXMLSEC1_DEPENDENCIES += libxslt
+LIBXMLSEC1_CONF_OPTS += --with-libxslt
+else
+LIBXMLSEC1_CONF_OPTS += --without-libxslt
+endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
