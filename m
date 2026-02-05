Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87DAECD99A
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 19:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8973041241;
	Thu,  5 Feb 2026 19:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdy_aaO21qyk; Thu,  5 Feb 2026 19:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AE2241244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770319786;
	bh=0hFykNt8U8SIGnTzQBqutJXZx0A2gSIK9cEaTmTCnCE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gp8mwcdWRFOrPHWu7JR/gVwbSSM0cIq/L7nIe4/FDm8302qQJBekcKFZNVnJYDyMY
	 QoIsJXhHn4lXpR/uADJPDAa3D/HsmRL5fYywPztLd4MBX87BeYGGz3OMhSMHOPsglv
	 yZLjiz6OFnkyJC0V7eTPBpScpJ1Rf1DKhBH5qVHsGbgcaUnY/UMu3cEXK/uUk9gxdI
	 jT/T2Nn2pb3yP4hlWc4kySZdSbdU3hK/btj5UzIdYVYgdbeBBySoknUWz0fOx7aPl+
	 6kuoEpX+Lgi/jkjmsE+xEvAl80r1/vagt1K+whjgnhm5c0DZpXwyY8XGWze9FEBBaZ
	 PcYT0ZzrAE1vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AE2241244;
	Thu,  5 Feb 2026 19:29:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD977173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3B360B19
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfHltRZlg1T2 for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 19:29:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88C2D608DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88C2D608DA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88C2D608DA
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:29:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7BCF1A4C56B7;
 Thu,  5 Feb 2026 20:29:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49800)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vo52s-000000002Is-1MkU;
 Thu, 05 Feb 2026 19:29:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Date: Thu,  5 Feb 2026 20:29:40 +0100
Message-ID: <20260205192942.1729614-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770319782;
 bh=PNTv1qCZa5mukrMEr24nhUwfqP7qRsy5OKwTG91eNZ4=;
 h=From:To:Cc:Subject:Date:From;
 b=RCP1yGfyfIC06y3qlVzubHTCo0ZQX/gZn38AAQkMaLh3KE99+SWQSckLVprf17Ioy
 D2cqsYY9lZhzT88YDLkI0mwskwhbdoSKdkFtd50iaMvVHb7HTqLscMuusleT4Ha1Sb
 WRYhlcRRpiVzPb1PCpPrz+ctj5/UTm0fTg3q5OctcijgasxNoCfVCjU3TOUHqdeiQP
 OqLMhnKr5qSi5oxgvCIqcyoo1N/bAZXq+XKjl39iLmK8qJQRirhIy+CZOnu1yqVbwJ
 NzaKO0O0UObr+Q4bGXRypMUttYdMvkQ9EGdN19QegDVI0fZf62zgCYv3NG9qhAW/gW
 WDz+pHPgnINfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RCP1yGfy
Subject: [Buildroot] [PATCH 1/3] package/libzippp: new package
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

The package will be used as an optional dependency by the upcoming
gerbera bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libzippp/Config.in     | 13 +++++++++++++
 package/libzippp/libzippp.hash |  3 +++
 package/libzippp/libzippp.mk   | 35 ++++++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/libzippp/Config.in
 create mode 100644 package/libzippp/libzippp.hash
 create mode 100644 package/libzippp/libzippp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4676b729ac..319d8058af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -456,6 +456,7 @@ F:	package/libvorbis/
 F:	package/libvpl/
 F:	package/libvpx/
 F:	package/libyuv/
+F:	package/libzippp/
 F:	package/linux-firmware/
 F:	package/mc/
 F:	package/mesa3d/
diff --git a/package/Config.in b/package/Config.in
index 92b316edbb..4131778e21 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1602,6 +1602,7 @@ menu "Compression and decompression"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
+	source "package/libzippp/Config.in"
 	source "package/lz4/Config.in"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
diff --git a/package/libzippp/Config.in b/package/libzippp/Config.in
new file mode 100644
index 0000000000..71b9fed776
--- /dev/null
+++ b/package/libzippp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBZIPPP
+	bool "libzippp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # libzip
+	select BR2_PACKAGE_LIBZIP
+	select BR2_PACKAGE_ZLIB
+	help
+	  C++ wrapper for libzip
+
+	  https://github.com/ctabin/libzippp
+
+comment "libzippp needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/libzippp/libzippp.hash b/package/libzippp/libzippp.hash
new file mode 100644
index 0000000000..9d2f81a787
--- /dev/null
+++ b/package/libzippp/libzippp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9ded3c4b5641e65d2b3a3dd0cbc4106209ee17c17df70e5187e7171420752546  libzippp-v7.1-1.10.1.tar.gz
+sha256  184f3ecf3d8cf4affad2b322ede037fb79a14e8b5b20c38ccbb66e33c23180d9  LICENCE
diff --git a/package/libzippp/libzippp.mk b/package/libzippp/libzippp.mk
new file mode 100644
index 0000000000..d07dfc44a0
--- /dev/null
+++ b/package/libzippp/libzippp.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# libzip
+#
+################################################################################
+
+LIBZIPPP_VERSION = 7.1-1.10.1
+LIBZIPPP_SOURCE = libzippp-v$(LIBZIPPP_VERSION).tar.gz
+LIBZIPPP_SITE = https://github.com/ctabin/libzippp/archive/refs/tags
+LIBZIPPP_LICENSE = BSD-3-Clause
+LIBZIPPP_LICENSE_FILES = LICENCE
+LIBZIPPP_INSTALL_STAGING = YES
+LIBZIPPP_DEPENDENCIES = libzip zlib
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+LIBZIPPP_DEPENDENCIES += bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBZIPPP_DEPENDENCIES += gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBZIPPP_DEPENDENCIES += openssl
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+LIBZIPPP_DEPENDENCIES += xz
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBZIPPP_DEPENDENCIES += zstd
+endif
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
