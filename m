Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6F6F364AF
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 18:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F8CD81A1C;
	Thu,  9 Apr 2026 18:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EU4h4lQIDbHI; Thu,  9 Apr 2026 18:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFF1818C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775760056;
	bh=9qssHA+vCOZ8QHHHQ0j7hW8fyJJptAHDDFAGXQlucg0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sx3y1g2ZgZd//mnizC7Pxm5+pLfwJKRZPVkjpatMsxKLDaiHLlcmPgSAVb2L/aMrz
	 82FlZk+nsoDuEn3tnVrWqMgqWfPz8jwPI5tIDQWoCm9TcLWPhJJiEoFfcr4pERTitl
	 KBg5u3Iwz8s0KdYdv2kUaXEm8uxe3euXm/YGYhKZsDvTixa15CKbBpdwnJfKYBXjoC
	 62LSZ9sl0+WUApJlIuALU1P4AHp63ARkVmW7Mf/vMKFTpOtRkZVl7u5I5O8k7wh93b
	 iaaOBbFL/taWBYDbgc1wxzQzky/YitUv6NuLM3HXblBCJE62k7O1xA5qbqkUr65fTz
	 a4w+WAVKrk8Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFF1818C4;
	Thu,  9 Apr 2026 18:40:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AD50194
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 18:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7029A4046E
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 18:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1-J8OGHbqDM for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 18:40:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3B4D401C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3B4D401C9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3B4D401C9
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 18:40:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c238.dip0.t-ipconnect.de [79.214.194.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47149A4C0E42
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:40:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57198)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAuJ6-000000004H0-2yMQ
 for buildroot@buildroot.org; Thu, 09 Apr 2026 18:40:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 20:40:47 +0200
Message-ID: <20260409184048.3180731-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409184048.3180731-1-bernd@kuhls.net>
References: <20260409184048.3180731-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775760049;
 bh=rsqAlh8S1TljFhhIiSBaSEfA4rFtoAVUSjdl1ut2qjY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TGns+hJr1eQtmipE3z0HQU45rQV9jXAiPYLrPVDzWzUhhUGtIlwmEEDiN+p6tANnH
 ZM1Ev0Zl2ccZxVFbRQcBUkRn/MuAqxZP+c8uCxTD8sFvWozp89JH36RD9Jt/3YcZQ0
 B5LnG+QQcZCWxOxcv13AzUl68p6giHiBAPgRAzO8ggFW2ycXMzwWIAePEtnXssR7JT
 VBkapdIHGRHQEDHedfDFfckYTmWjm68KYnDl9zr4FPKiUKSbYtdgMMfeVIYeEFLbIJ
 A7tpBYotZcRJGoYue/nGigbsGou1+IoZ5Bhrai1nG5Dsa6f8qtl8CAudKfI5FIK8qR
 80MMsCL7apEWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=TGns+hJr
Subject: [Buildroot] [PATCH 2/3] package/kodi: depend on host-openjdk-bin
 instead of selecting BR2_NEEDS_HOST_JAVA
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

This patch removes the dependency on java being installed on the host,
instead we make use of our host-openjdk-bin package.

Build-tested using this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

by running 'utils/docker-run make kodi'.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/Config.in | 2 +-
 package/kodi/kodi.mk   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9661ab47bc..391a687cbd 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	# i386: needs sse (see upstream PR 10351)
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	depends on BR2_USE_MMU # libcdio, and others
@@ -66,7 +67,6 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON3_PYC_ONLY
-	select BR2_NEEDS_HOST_JAVA
 	select BR2_HOST_CMAKE_AT_LEAST_3_24
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 02feb17b4d..8c4666c2cb 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -33,6 +33,7 @@ KODI_DEPENDENCIES = \
 	host-kodi-jsonschemabuilder \
 	host-kodi-texturepacker \
 	host-nasm \
+	host-openjdk-bin \
 	host-swig \
 	host-xmlstarlet \
 	jpeg \
@@ -100,6 +101,7 @@ KODI_CONF_OPTS += \
 	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
 	-DENABLE_TESTING=OFF \
 	-DENABLE_DEBUGFISSION=OFF \
+	-DJAVA_HOME=$(HOST_OPENJDK_BIN_ROOT_DIR) \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
 	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON_PATH=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
