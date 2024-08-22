Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4A8C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13710819D2;
	Thu, 22 Aug 2024 18:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuxsmVFx6NAf; Thu, 22 Aug 2024 18:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 268DB81AC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 268DB81AC4;
	Thu, 22 Aug 2024 18:16:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26AD81BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13D7B60E0A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ybqoj3KgWfgy for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 384A960DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 384A960DE5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 384A960DE5
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:16:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3CAE2A4C26CF;
 Thu, 22 Aug 2024 20:15:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44610)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCLc-000000005D0-26fC;
 Thu, 22 Aug 2024 18:15:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:15:44 +0200
Message-Id: <20240822181546.64900-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822181546.64900-1-bernd@kuhls.net>
References: <20240822181546.64900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350549;
 bh=jOeG048+X1x+UuWd2deFZMekSyjNIfnd9GDE+GpNoIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BtGExK6QzkCU60F6wduogKCrfQGR6q+70uzILERTXbY0Tce4PSk6YWzlvECj3jnUN
 juHtfaz3q/3BloSx5UcPoimPrhVxDpujgRgUfU8+bxgJfVH7fAVgUCsrzYs/gBJ9oM
 B8LDMx0eiytS3jCZ12DW98iIJfuOF3CaXV2QfzdP3LKkWlacJ3GBZnrQFZYCrV3pXh
 0bQP8bEKmtXtf9HdGPvVoY4FHjylaH1DzXY58pKpgp6LWrMriBONSHUqES8+5wJ102
 n2RopYl8h+o0nMUHUC8v/iK/R26nZgj+YfyE3m0cFegHgfbNTpVNU69vKn0SDWqZbW
 y8VK7xDPYi9hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=BtGExK6Q
Subject: [Buildroot] [PATCH/next 4/6] package/spirv-tools: add host variant
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>, Romain Naour <romain.naour@gmail.com>,
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
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
