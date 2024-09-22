Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F4CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 19:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14815605CA;
	Sun, 22 Sep 2024 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OesQECKOjX15; Sun, 22 Sep 2024 19:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F63C60657
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F63C60657;
	Sun, 22 Sep 2024 19:38:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5492E1BF3D4
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 19:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5127481193
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 19:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIkjBROvge7k for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 19:38:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4B5F81191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4B5F81191
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4B5F81191
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 19:38:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0835.dip0.t-ipconnect.de [91.58.8.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0B2D2A4C2C34;
 Sun, 22 Sep 2024 21:37:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60994)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1ssSP3-0000000065g-2tvE;
 Sun, 22 Sep 2024 19:37:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 21:37:49 +0200
Message-Id: <20240922193751.862053-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240922193751.862053-1-bernd@kuhls.net>
References: <20240922193751.862053-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1727033874;
 bh=hWbiP2ZxvpMFZZ/NfU1LOmPr0TKoWQ/657+8kPOcpuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aRxOoPNpFlYpKytQ1ANxT1TMzEPuX9A7xf9UwPpxhdNUEBndjbTUuRXaw6xh/n7jy
 uKI1m54w0+rqmVlw5ggu+QX/8CQrlfELmsaFncR0cwSZNkKE8nYMR5O5S5nfcR++eN
 4XGGh+FPtR/ZSU03fJhT+gxJAOEeiBzRhPsDW0ZzMLQU7t8dbaW1Sz7l7uiblvT2CW
 TSOc5yn6ohk9vQKP8W1vtsrGoCP+fpmsDteyDoK2koAEWoybEZ40NC1YgI8jGdYgu+
 uqwKwzS3zIehmgOKv4YsrW6qZxqxg36htAF8Y15hBRF5Ozd+bZ9c19L6i9bP8Qe38F
 HwXDa8+c+mRWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=aRxOoPNp
Subject: [Buildroot] [PATCH 4/6] package/spirv-tools: add host variant
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
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
