Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D0EE748EE
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 21:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C179C60E93;
	Tue, 23 Dec 2025 21:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cupBgL9aBhzg; Tue, 23 Dec 2025 21:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C2160E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766526131;
	bh=rWdL2WQvWAPZ5fEV+iKKSNeSs/Err9lnmSX7ShBQ9Zg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=C51LCmhTt7iTLkwrCU4nIxJZ4L3uPWz4gACLmXQSceHIhs3D5vfaZcqjcyFsDKOam
	 EIU1XOyP/KG6dTAjFUtJACEkxzMo3YscqLri3r+jRD/45BxP1a65fmgHs6w0imnxsI
	 pIRoGtAQBn6ZAds+mXC8M0lO30BmRHhiatUmJwDoJ9kuUdyqvYZWVOaiBHnAEp/BHf
	 pNA2+fDlZQwS8QpDKOjVtuMl5xMtONZBRI7GVcdgK4Fa92oe2dusITZhx/Uf6fIwzk
	 V6B5SHE1SNSXSWUaAEuuCz/L8yt6JsZbWvy93NfygPqAu5FYPDsZqaP3renENqTkRf
	 V0ytPqQdBYoZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C2160E88;
	Tue, 23 Dec 2025 21:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 136C4BE
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED3FB409C8
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GL53zo6Sryt for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 21:42:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C41840357
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C41840357
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C41840357
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:42:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2A80F1A23BC
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:42:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8BFB60716
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:42:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 085CF10AB0CC3; Tue, 23 Dec 2025 22:42:03 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Dec 2025 22:41:54 +0100
Message-ID: <20251223214154.582451-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766526124; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=nvlcUAWdlclD1Ud+eu4w4Zy1q99AYiHVz+ytpMOYiIo=;
 b=nnJTJzsPGEexj3sC0feaJkOpAQppvZ+cBp8uAKRd3QSkGz0j+nF3PxnZDdwaPlsCPVUZK/
 wSt+6xCwIwdKoa4ATxVKW3B0/lqeUER6prVE4y18DeB/to5zn06ttEkgDz5GMwI5AuiLL8
 9n7F7XAnCsIWX0rqgX6u/S4J5ENXFW+OJ2ATUFMeV7cMNfcFye38Z5YL1lvci36jdyYJMa
 Y1e+jcB35ISV9XUYmqDgammOcDTcx+E4Ri8DvRyHKtx0bND+TMt6sRf+j1MjDzteMJdA2J
 MhPbRMKFFYx8mfkqSi1B+KeqbhE7/tgFvBAjxXZQuxXCq8hpdXto2Ju0V9IxKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nnJTJzsP
Subject: [Buildroot] [PATCH] package/libdnet: drop support for Python module
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

The libdnet Python module no longer builds with Python >= 3.13. The
issue has been reported upstream on August 17, 2025, and there has
been no feedback:

  https://github.com/ofalk/libdnet/issues/114

Until this gets resolved, we have no choice but to drop support for
the Python module of this package.

Fixes:

  https://autobuild.buildroot.net/results/4df6bcaa66d79efac3619a47b08f3cb02c13e276/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy           |  7 +++++++
 package/libdnet/Config.in  | 24 ------------------------
 package/libdnet/libdnet.mk | 11 ++---------
 3 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 75e0ae3c4f..7c598e0e68 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBDNET_PYTHON
+	bool "libdnet python module removed"
+	select BR2_LEGACY
+	help
+	  The libdnet Python module is no longer compatible with
+	  Python >= 3.13, so it had to be removed.
+
 config BR2_PACKAGE_CVS
 	bool "cvs has been removed"
 	select BR2_LEGACY
diff --git a/package/libdnet/Config.in b/package/libdnet/Config.in
index 473e8aea22..9fd6a85c36 100644
--- a/package/libdnet/Config.in
+++ b/package/libdnet/Config.in
@@ -5,27 +5,3 @@ config BR2_PACKAGE_LIBDNET
 	  routines.
 
 	  http://libdnet.sourceforge.net/
-
-if BR2_PACKAGE_LIBDNET
-
-config BR2_PACKAGE_LIBDNET_PYTHON
-	bool "libdnet python module"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_STATIC_LIBS # libbsd
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
-	depends on BR2_USE_WCHAR # libbsd
-	select BR2_PACKAGE_LIBBSD
-	help
-	  dnet module for python
-
-comment "dnet module for python requires python3 package"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_PYTHON3
-
-comment "dnet module for python needs a toolchain w/ dynamic library, threads, wchar"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR
-
-endif
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 8eebd1050d..12491a93bf 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -12,18 +12,11 @@ LIBDNET_INSTALL_STAGING = YES
 LIBDNET_AUTORECONF = YES
 LIBDNET_CONF_OPTS = \
 	--with-gnu-ld \
-	--with-check=no
+	--with-check=no \
+	--without-python
 LIBDNET_CONFIG_SCRIPTS = dnet-config
 LIBDNET_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
-LIBDNET_DEPENDENCIES += libbsd host-python-cython python3
-LIBDNET_CONF_OPTS += --with-python=$(HOST_DIR)/bin
-LIBDNET_MAKE_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
-LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
-LIBDNET_INSTALL_STAGING_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
-endif
-
 # Needed for autoreconf to work properly
 define LIBDNET_FIXUP_ACINCLUDE_M4
 	ln -sf config/acinclude.m4 $(@D)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
