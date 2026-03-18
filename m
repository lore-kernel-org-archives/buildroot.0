Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4781077603
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B46360D61;
	Wed, 18 Mar 2026 18:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0LDV2hsPm9v; Wed, 18 Mar 2026 18:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B0B560C11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773859280;
	bh=0ZP065da24y4r9thA9suEFLUbT9DolKX+kbV03nSFEc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YD0gK82jhmmSct4zwR6A2CFU9VQyzu3DDJWK2vWMTe/N2jApTvcH96WFMASZ85bh4
	 oVnodgnybTcvEcQ9jGJ1S/FgFbW4K79vQCbqpLnaqaa5/SnK7eEINlGt7jh7VF3XiQ
	 uI4heX5ZYrSmHn1auOBoZp/5SvBbLb6XTyQGcqkIME+b4veUQrTeI5V5P0ix2BSq6x
	 Fwze4G3+UHdWo5ivZKh8inrDMwHGLKHi6iq5uKYgK3gP1pXcpM0jOcODJ6yxj8yLZJ
	 G9vL+9JtA0HiFmiqEA0yipgU5bFyRJ+hiPqUX34jH1RoOjqEYpJhHt5zSU+JhOBOsE
	 G6Q3RyUyWshdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B0B560C11;
	Wed, 18 Mar 2026 18:41:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A34ED1BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94AEF41712
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXMLVoHZKmbc for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.11.138.130;
 helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCC8741710
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC8741710
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCC8741710
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:17 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, heiko@sntech.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Date: Wed, 18 Mar 2026 19:41:08 +0100
Message-ID: <20260318184110.2121178-2-heiko@sntech.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318184110.2121178-1-heiko@sntech.de>
References: <20260318184110.2121178-1-heiko@sntech.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=TCPKHEF26tPhO99ttyvnCxkRbIH8+AO3jss2x7yNq4I=; b=Y2s+LqZbuIN9pDWJ0jog4n62G4
 QexBI3DM+h1S0CyoDl564sln3LB/Jjp5XoGlBo19hHD62Dpn1EBONIEGFsDG9AxwxwY3IU99nMqtH
 wKDet188TjJjF6CA5vk6VMKeRF3UDKJxcRUblOCqMYacD17RaTZcGmys2OgouNWEYrGIy/3nJz/sd
 fsVHgj5TauGi15LIYn92S/YQ+H+SJ2hii6ZJxX+jUBFLUR6htGBhDIsFzmxaktUfgAteZHf7+3yyj
 l3RIRNnllNk2VZj9/XMYZdz9YOlwRQi3VxU+yuiKOGiB03UQQEWRRkekX8riE+Xdv4TgDI+iMOQZl
 b/zi1iBg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sntech.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256
 header.s=gloria202408 header.b=Y2s+LqZb
Subject: [Buildroot] [PATCH v2 1/3] boot/optee-os: add option to override
 the CPE_ID_VERSION
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
From: Heiko Stuebner via buildroot <buildroot@buildroot.org>
Reply-To: Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

CPE_ID_VERSION defaults to {pkg}_VERSION by default.

When using custom tarballs or repo-revisions, this VERSION will contain
either "custom" or the repository revision as its value.

This prevents tooling like CVE checkers, etc that use the show-info
output to know what base version to check against.

To solve this add a config option to (optionally) allow overriding the
CPE_ID_VERSION if needed.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 boot/optee-os/Config.in   | 11 +++++++++++
 boot/optee-os/optee-os.mk |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index af08375b9a..3e8b0a5a8f 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -77,6 +77,17 @@ config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_TARGET_OPTEE_OS_CUSTOM_CPE_ID_VERSION
+	string "Set custom OP-TEE CPE_VERSION"
+	depends on BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL || BR2_TARGET_OPTEE_OS_CUSTOM_GIT
+	help
+	  CPE_ID_VERSION defaults to the package version, but when using
+	  custom tarballs or custom repository revisions, the version of
+	  that software is unknown and set to custom or the revision.
+
+	  Allow to set a separate CPE_ID_VERSION, that will generate
+	  more accurate CPE entries for the software-version used.
+
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
 	default "4.9.0"		if BR2_TARGET_OPTEE_OS_LATEST
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 1639597407..29d97eee53 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -11,6 +11,9 @@ OPTEE_OS_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_OPTEE_OS_LICENSE_FILES))
 OPTEE_OS_CPE_ID_PREFIX = cpe:2.3:o
 OPTEE_OS_CPE_ID_VENDOR = linaro
 OPTEE_OS_CPE_ID_PRODUCT = op-tee
+ifneq ($(BR2_TARGET_OPTEE_OS_CUSTOM_CPE_ID_VERSION),)
+OPTEE_OS_CPE_ID_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_CPE_ID_VERSION))
+endif
 
 OPTEE_OS_INSTALL_STAGING = YES
 OPTEE_OS_INSTALL_IMAGES = YES
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
