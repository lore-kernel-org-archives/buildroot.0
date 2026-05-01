Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F0CD3423
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 18:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3D156F896;
	Fri,  1 May 2026 18:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEs78VLBZVSM; Fri,  1 May 2026 18:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A23E6F898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777660493;
	bh=UQEJlBhO0z5aeg42bmfjNPnzCbCkc0YGzsm9Vv5Stuo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KKeS5ZlFbaNBgI+6o611R4k6d0yLHO7INkKvm9hn6M6r/T8eOQnlwoavO1CFzPc8a
	 ekF8X14RVMk1g0TIUW6FsYOZHChY9Ly13EVvcy0kPKyybTytYhzSgoWS9MTdgI9we0
	 YregYfxyTXPrMhbFdXHT7zKPJPpd+zmNQTPmVoANMSevwYanKn4AD/LHf3hwvPJEuK
	 jaqy02WXHtewLzjGUpG6yqye6w4IFRcdqqGv4BBWrM4jDfqitlIJgkXVYbyBxuFw6l
	 TkJYMH5OfjAY7pExMBtAUXfGIBRmZ92RRjy7tvitnNtlsEKAlKnuIgGSNytQWW90w8
	 ghm2WXe03+h8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A23E6F898;
	Fri,  1 May 2026 18:34:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0373204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6395429B2
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCal37KFhhSm for <buildroot@buildroot.org>;
 Fri,  1 May 2026 18:34:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79329429A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79329429A2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79329429A2
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:34:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A83E1A4C03B6;
 Fri,  1 May 2026 20:34:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIsgv-000000000Qz-39rI;
 Fri, 01 May 2026 18:34:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  1 May 2026 20:34:19 +0200
Message-ID: <20260501183421.2459291-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501183421.2459291-1-bernd@kuhls.net>
References: <20260501183421.2459291-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777660461;
 bh=adQOXl3F3xege5H1VJ0kL353M472vtZzbL9orr2MYak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TMZAECybUWqDkiaPywApc+OFqWPDlkc9hcx2Q/U3mAmHIrM7AveTyOgG9/MAR5YuN
 TXBSTPpooTksJFPewACnlJ55bpeJddCWK4JwEza7XcPofrx3QSvj8TC8tpYA8ZrST7
 G/VtxtLVgUnyATxSkerKZJhpMfuoZbBeSkJsyn3j7Cytjch0ImMHJDXCXj8rdTHd0X
 AivCmxdIKrSD8C57AlBCZw6EHEoLEni3YrAwZ2Rg9B9JHavyJrZ9YHp+SDIAtp08MZ
 T9gKDpapr3Cw9cRw52lEDvxVjis/VxxLSqBGw/OFkgwOF8CJE8CW9X677eyBj8Hy7L
 xk7tODidzVkYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=TMZAECyb
Subject: [Buildroot] [PATCH 3/5] package/stellarium: add extra downloads
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

Building Stellarium includes the download of external tarballs during
configure.

This fails with host-cmake:

CMake Error at md4c-subbuild/md4c-populate-prefix/src/md4c-populate-stamp/download-md4c-populate.cmake:163 (message):
  Each download failed!

    error: downloading 'https://github.com/mity/md4c/archive/refs/tags/release-0.5.2.tar.gz' failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported

  closing connection #-1

due to buildroot commit f87138339b17bc2b1d84c59ea176abb941413550 which
disabled SSL support for host-cmake.

This patch uses _EXTRA_DOWNLOADS to provide these tarball to allow
offline builds.

No autobuilder error was recorded, the build error can be reproduced
by this defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
BR2_FORCE_HOST_BUILD=y
BR2_PACKAGE_STELLARIUM=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_XORG7=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.hash |  4 ++++
 package/stellarium/stellarium.mk   | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index ffd84151d6..b3f2a9ec9f 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,8 @@
 # From https://github.com/Stellarium/stellarium/releases
 sha256  578bada2531e39146ccefcf6a0d202867e403b559f54239e8db9f9c003e04443  stellarium-26.1.tar.xz
+# From https://github.com/Stellarium/stellarium/blob/v26.1/CMakeLists.txt#L858
+sha256  55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21  release-0.5.2.tar.gz
+# From https://github.com/Stellarium/stellarium/blob/v26.1/plugins/LensDistortionEstimator/src/CMakeLists.txt#L6
+sha256  6e899e297485e457ec1bf84844de29921aeef674f9d5caf60277df45dca6ff76  v2.9.0.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 97a0cddfa7..07d4a775db 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -9,6 +9,19 @@ STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
+
+STELLARIUM_EXTRA_DOWNLOADS += \
+	https://github.com/mity/md4c/archive/refs/tags/release-0.5.2.tar.gz \
+	https://github.com/stevengj/nlopt/archive/refs/tags/v2.9.0.tar.gz
+
+define STELLARIUM_COPY_EXTRA_DOWNLOADS
+	mkdir -p $(@D)/_deps/md4c-subbuild/md4c-populate-prefix/src/
+	cp $(STELLARIUM_DL_DIR)/release-0.5.2.tar.gz $(@D)/_deps/md4c-subbuild/md4c-populate-prefix/src/
+	mkdir -p $(@D)/_deps/nlopt-subbuild/nlopt-populate-prefix/src/
+	cp $(STELLARIUM_DL_DIR)/v2.9.0.tar.gz $(@D)/_deps/nlopt-subbuild/nlopt-populate-prefix/src/
+endef
+STELLARIUM_POST_EXTRACT_HOOKS = STELLARIUM_COPY_EXTRA_DOWNLOADS
+
 STELLARIUM_DEPENDENCIES = \
 	qt5base \
 	qt5charts \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
