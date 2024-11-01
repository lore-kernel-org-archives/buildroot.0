Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F6DE6F083
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 18:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF4CE60719;
	Fri,  1 Nov 2024 18:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezmVXygIuAHX; Fri,  1 Nov 2024 18:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C64CF60680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64CF60680;
	Fri,  1 Nov 2024 18:58:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A1C27E1
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63551605CA
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHZzGGw56iUO for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 18:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABE2C605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABE2C605A6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABE2C605A6
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:58:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2F52A4C242C;
 Fri,  1 Nov 2024 19:57:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36440)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t6wqM-000000002yP-451l;
 Fri, 01 Nov 2024 18:57:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri,  1 Nov 2024 19:57:56 +0100
Message-Id: <20241101185758.729921-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241101185758.729921-1-bernd@kuhls.net>
References: <20241101185758.729921-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730487479;
 bh=hWbiP2ZxvpMFZZ/NfU1LOmPr0TKoWQ/657+8kPOcpuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rr4kGgm5Re7KGXuLQvsb0CYw9n4Plo2Yy5V2KJQV4jbphSYeIV7jO+Fe9uVMKcCXE
 5AVg6nJiL46NB7hDqwgyDNY4Wlq5jh5KHojfEt+H44dzqHbag9wLJxmtBVLjqvEP3a
 6O52FQljsL3XZa9OdatLVo/dREEE8Noyo6MtJYimBQCkZZuaob0UtbA3PaOu69gci1
 ifERkaTdsyd1dn9HU6XI/U61tP65JOVg9YKxU43cFBkWxxf4hj05jKi/ye1uGM9nZK
 vxhfyjl3AHkUTZtn63f5xxm8+PP1x7eE31na500oPSECOI506Dg3XL7E+ZQl003Fyz
 sOTpmX8gOuwng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Rr4kGgm5
Subject: [Buildroot] [PATCH 4/6] package/spirv-tools: add host variant
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

Needed for mesa3d bump to 24.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spirv-tools/spirv-tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index e863911b03..51b1c9f22a 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -10,6 +10,7 @@ SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERS
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
 SPIRV_TOOLS_DEPENDENCIES = spirv-headers
+HOST_SPIRV_TOOLS_DEPENDENCIES = host-spirv-headers
 SPIRV_TOOLS_INSTALL_STAGING = YES
 
 SPIRV_TOOLS_CONF_OPTS = \
@@ -18,4 +19,11 @@ SPIRV_TOOLS_CONF_OPTS = \
 	-DSPIRV_SKIP_TESTS=ON \
 	-DSPIRV_WERROR=OFF
 
+HOST_SPIRV_TOOLS_CONF_OPTS = \
+	-DSPIRV-Headers_SOURCE_DIR=$(HOST_DIR) \
+	-DSPIRV_TOOLS_BUILD_STATIC=OFF \
+	-DSPIRV_SKIP_TESTS=ON \
+	-DSPIRV_WERROR=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
