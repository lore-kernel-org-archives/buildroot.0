Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEB0C25B7A
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 09:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4A260AD3;
	Wed, 22 May 2024 09:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeaZsqmb-9WV; Wed, 22 May 2024 09:56:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A448A60585
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A448A60585;
	Wed, 22 May 2024 09:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2C31C5999
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 09:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7450281A92
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 09:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dHfzqTQ80JP for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 09:55:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A251817C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A251817C0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A251817C0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 09:55:56 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9i4y-00B1rx-1Q; Wed, 22 May 2024 11:16:12 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id b27e11e7;
 Wed, 22 May 2024 09:16:09 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 12:16:06 +0300
Message-ID: <20240522091608.3659847-4-aperez@igalia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522091608.3659847-1-aperez@igalia.com>
References: <20240522091608.3659847-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5O/FazIWj/EH/Wz4hZCzN2Ez8IvfN3KUF/J0xvQhHIk=; b=PDwR80FjXaSiv1MRbdHednKs7p
 +7N+uZpNXby4kXAbpcyTmXVfuOaXak76NOrI2VXL4yt0ATNgvRVcYFFlUz0+/A0Poc+8CPBIK6x/r
 pmn/Uie1EU+VTcyZbW20YRaQIAeUeTHNI+PZ2CjojYdEAY9ilIQkhz0hSbGBYdYYF1gJf+R5MNFe9
 yMC9dgVnx14rfEKFD+CYfi9QNJptL4Z9Sc1rumVVKtb6foP578heZ8QvY1W63YeObliOpzjakQdLq
 f4zz2sazI9NEeW7Gq1esCInnwg3aeJyszjUH2ccYm3DQOhQmin5NjhO+p3p5yCMEYa28TLJxG9paK
 mbkxV4PQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=PDwR80Fj
Subject: [Buildroot] [PATCH 3/4] package/libavif: new package
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libavif is an implementation of the AV1F image format, which may be a
frontend for different encoders and decoders. At the moment only dav1d
is packaged so that is the one configured.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libavif/Config.in    | 13 +++++++++++++
 package/libavif/libavif.hash |  3 +++
 package/libavif/libavif.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)
 create mode 100644 package/libavif/Config.in
 create mode 100644 package/libavif/libavif.hash
 create mode 100644 package/libavif/libavif.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a9d..f9539719cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -55,6 +55,7 @@ F:	package/brotli/
 F:	package/bubblewrap/
 F:	package/cage/
 F:	package/cog/
+F:	package/libavif/
 F:	package/libepoxy/
 F:	package/libmanette/
 F:	package/libpsl/
diff --git a/package/Config.in b/package/Config.in
index 1b6a5b0dab..e83642823e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1674,6 +1674,7 @@ menu "Graphics"
 	source "package/leptonica/Config.in"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
+	source "package/libavif/Config.in"
 	source "package/libdecor/Config.in"
 	source "package/libdmtx/Config.in"
 	source "package/libdri2/Config.in"
diff --git a/package/libavif/Config.in b/package/libavif/Config.in
new file mode 100644
index 0000000000..a15e9fc733
--- /dev/null
+++ b/package/libavif/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBAVIF
+	bool "libavif"
+	depends on !BR2_STATIC_LIBS # dav1d, dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dav1d, pthread
+	select BR2_PACKAGE_DAV1D
+	help
+	  Friendly, portable C implementation of the AV1 Image File
+	  Format.
+
+	  https://github.com/AOMediaCodec/libavif
+
+comment "libavif needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
new file mode 100644
index 0000000000..f4599cdb0b
--- /dev/null
+++ b/package/libavif/libavif.hash
@@ -0,0 +1,3 @@
+sha256  dc56708c83a4b934a8af2b78f67f866ba2fb568605c7cf94312acf51ee57d146  libavif-1.0.4.tar.gz
+
+sha256  10952217a6d404de8bf8a997fbea9b88f682df1fe98cb9b9f467ade641525639  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
new file mode 100644
index 0000000000..fbd313114d
--- /dev/null
+++ b/package/libavif/libavif.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libavif
+#
+################################################################################
+
+LIBAVIF_VERSION = 1.0.4
+LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
+LIBAVIF_LICENSE =
+LIBAVIF_LICENSE_FILES = LICENSE
+LIBAVIF_INSTALL_STAGING = YES
+
+# Only the dav1d decoder is packaged at the moment.
+LIBAVIF_DEPENDENCIES = dav1d
+LIBAVIF_CONF_OPTS = \
+	-DAVIF_BUILD_APPS=OFF \
+	-DAVIF_BUILD_EXAMPLES=OFF \
+	-DAVIF_BUILD_MAN_PAGES=OFF \
+	-DAVIF_BUILD_TESTS=OFF \
+	-DAVIF_CODEC_AOM=OFF \
+	-DAVIF_CODEC_DAV1D=ON \
+	-DAVIF_CODEC_LIBGAV1=OFF \
+	-DAVIF_CODEC_RAV1E=OFF \
+	-DAVIF_CODEC_SVT=OFF \
+	-DAVIF_CODEC_AVM=OFF \
+	-DAVIF_ENABLE_GTEST=OFF
+
+# There is no CMake options to explicitly enable/disable usage of
+# libyuv, only autodetection :-(
+ifeq ($(BR2_PACKAGE_LIBYUV),y)
+LIBAVIF_DEPENDENCIES += libyuv
+endif
+
+$(eval $(cmake-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
