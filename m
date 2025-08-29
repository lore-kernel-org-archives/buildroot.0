Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C59CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 14:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 212D161681;
	Fri, 29 Aug 2025 14:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6Pylf1Bq7Ov; Fri, 29 Aug 2025 14:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EDD961668
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EDD961668;
	Fri, 29 Aug 2025 14:34:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3C16D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D917C61648
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMwzg_16GwNi for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 14:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD08A61639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD08A61639
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD08A61639
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C01A31A0E3C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9B712605F1;
 Fri, 29 Aug 2025 14:34:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B8AA01C22D744; 
 Fri, 29 Aug 2025 16:34:19 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
Date: Fri, 29 Aug 2025 16:34:06 +0200
Message-ID: <20250829143407.1970907-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829143407.1970907-1-thomas.petazzoni@bootlin.com>
References: <20250829143407.1970907-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756478060; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=dQK0GkAZ16AfDG1jza0TqasltVMiCMOUB0Vvduu9No0=;
 b=nAw+Je8QG5pObtBk91G9bC/Nw1vkVdHwYf0r918OHGDpJApsx/G4WxXfSQW3xws8xeSpRO
 KRpdy4Ji3o8z+AWPDtLMOzhASrTkInghkYpAo+miR2s0/aIVAjYqvo74FnNI0mMa1sHURQ
 Lflc/QioXkPTBncl6HaVaGBabwOQ7hUkgn21VHw8gg+lvIU3PJknYw2UZIaDrP71/+eevr
 GPCv+hi9QzUGCMtt+t+AFPV3fX1gJXKtxnqrOPIN4SRpKUrgrtwc3/Ew20/G4Ss7EZm3re
 HsVOM5JAUU4tsqaxTXl1cdwEo9EVJ0NsUUJmDqoJFoGcbbLRsFoFKEJRYQcCkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nAw+Je8Q
Subject: [Buildroot] [PATCH 2/2] package/libkrb5: bump to version 1.22.1
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

This version builds fine with GCC 15.x, without passing -std=gnu99.

Changes are described at
https://web.mit.edu/Kerberos/www/krb5-1.22/. Most relevant details:

User experience

        The libdefaults configuration variable "request_timeout" can
	be set to limit the total timeout for KDC requests. When
	making a KDC request, the client will now wait
	indefinitely (or until the request timeout has elapsed) on a
	KDC which accepts a TCP connection, without contacting any
	additional KDCs. Clients will make fewer DNS queries in some
	configurations.

        The realm configuration variable "sitename" can be set to
	cause the client to query site-specific DNS records when
	making KDC requests.

Administrator experience

        Principal aliases are supported in the DB2 and LMDB KDB
	modules and in the kadmin protocol. (The LDAP KDB module has
	supported aliases since release 1.7.)

        UNIX domain sockets are supported for the Kerberos and kpasswd
	protocols.

        systemd socket activation is supported for krb5kdc and kadmind.

Developer experience

        KDB modules can be be implemented in terms of other modules
	using the new krb5_db_load_module() function.

        The profile library supports the modification of empty
	profiles and the copying of modified profiles, making it
	possible to construct an in-memory profile and pass it to
	krb5_init_context_profile().

        GSS-API applications can pass the GSS_C_CHANNEL_BOUND flag to
	gss_init_sec_context() to request strict enforcement of
	channel bindings by the acceptor.

Protocol evolution

        The PKINIT preauth module supports elliptic curve client
	certificates, ECDH key exchange, and the Microsoft paChecksum2
	field.

        The IAKERB implementation has been changed to comply with the
	most recent draft standard and to support realm discovery.

        Message-Authenticator is supported in the RADIUS
	implementation used by the OTP kdcpreauth module.

Code quality

        Removed old-style function declarations, to accomodate
	compilers which have removed support for them.

        Added OSS-Fuzz to the project's continuous integration
	infrastructure.

        Rewrote the GSS per-message token parsing code for improved
	safety.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.hash | 4 ++--
 package/libkrb5/libkrb5.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 0403b3aed0..ae086fe0db 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# from https://web.mit.edu/kerberos/dist/krb5/1.21/krb5-1.21.3.tar.gz.asc
+# from https://web.mit.edu/kerberos/dist/krb5/1.22/krb5-1.22.1.tar.gz.asc
 # with key C4493CB739F4A89F9852CBC20CBA08575F8372DF
-sha256  b7a4cd5ead67fb08b980b21abd150ff7217e85ea320c9ed0c6dadd304840ad35  krb5-1.21.3.tar.gz
+sha256  1a8832b8cad923ebbf1394f67e2efcf41e3a49f460285a66e35adec8fa0053af  krb5-1.22.1.tar.gz
 
 # Hash for license file:
 sha256  7601361a275aadbe35c90185519323c28730d60c553683e56fd06cf9c5f749a6  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index d0ec877d35..ede0b8afd3 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION_MAJOR = 1.21
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).3
+LIBKRB5_VERSION_MAJOR = 1.22
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
@@ -16,7 +16,7 @@ LIBKRB5_CPE_ID_PRODUCT = kerberos_5
 LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
 LIBKRB5_INSTALL_STAGING = YES
 
-LIBKRB5_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+LIBKRB5_CFLAGS = $(TARGET_CFLAGS)
 
 # The configure script uses AC_TRY_RUN tests to check for those values,
 # which doesn't work in a cross-compilation scenario. Therefore,
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
