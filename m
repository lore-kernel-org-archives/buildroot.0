Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AF4CAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 22:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87AF160707;
	Mon, 22 Sep 2025 22:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtZQRBJXyoey; Mon, 22 Sep 2025 22:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5039D60782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5039D60782;
	Mon, 22 Sep 2025 22:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC6A5498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 22:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACA4A606EA
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 22:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rX9ENMVm3IZB for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 22:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D72D060707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D72D060707
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D72D060707
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 22:26:00 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v0oyr-00FwCS-ND; Tue, 23 Sep 2025 00:25:57 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 8ce61346;
 Mon, 22 Sep 2025 22:25:55 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 23 Sep 2025 01:25:49 +0300
Message-ID: <20250922222555.351974-3-aperez@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922222555.351974-1-aperez@igalia.com>
References: <20250922222555.351974-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MlUv+e24vHxb293ZcrXeuHUHHFgV84OUQxzehI5Ib1w=; b=rPk56n4g2Lxlrg036a0PChXXFb
 KRYMkWITXWQccUO9o7Hs5YfN/nVU/ykmD98OhSsNNDKyTIpmLo5q9cLgd6/0bfVX+KAD4+VWywI/A
 x76mC7NtS3HGIIorvDKlW4ptreLSfVSxF/uimnN2T6vPSeebQN4FWHLvn+90vVD3w4lK69O8/hqb0
 Hlt+KUSIL3OKjWHuejLf451J1FI4urHjbB8agOSwTvO5Kl4k2EcSXjNqaoyFpXwgN12obdaDPuxNY
 drzAlgQ6D3VnVGE5WzM0/7/pOsvDMUydUdfYumXZk5W3dYQdh164+l6Pyc38qucktxGjbk23/aJ2A
 YbzkBqeA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=rPk56n4g
Subject: [Buildroot] [PATCH 2/2] package/sysprof: unconditionally select
 elfutils
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

The elfutils package provides libdw, which is required by sysprof.
It is not an optional dependency.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/sysprof/Config.in  | 7 ++++---
 package/sysprof/sysprof.mk | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index a4f53a1179..e89a0e539e 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -1,14 +1,15 @@
 config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
-	depends on BR2_USE_WCHAR # glib2, libdex, json-glib
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libdex, json-glib, polkit
+	depends on BR2_USE_WCHAR # glib2, libdex, json-glib, elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libdex, json-glib, polkit, elfutils
 	depends on BR2_USE_MMU # glib2, libdex, json-glib
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libunwind, polkit
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
-	depends on !BR2_STATIC_LIBS # libdex, libunwind, polkit
+	depends on !BR2_STATIC_LIBS # libdex, libunwind, polkit, elfutils
 	depends on !BR2_OPTIMIZE_FAST # polkit
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDEX
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 2670588ebb..f64f6d7120 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -10,7 +10,7 @@ SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
 SYSPROF_LICENSE = GPL-3.0+
 SYSPROF_LICENSE_FILES = COPYING
-SYSPROF_DEPENDENCIES = libglib2 libdex libunwind json-glib polkit
+SYSPROF_DEPENDENCIES = elfutils libglib2 libdex libunwind json-glib polkit
 SYSPROF_CONF_OPTS = \
 	-Ddebuginfod=disabled \
 	-Ddevelopment=false \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
