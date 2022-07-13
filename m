Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822A1C43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 14:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E350415C4;
	Wed, 13 Jul 2022 14:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E350415C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xq94Ia4PRe_y; Wed, 13 Jul 2022 14:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DE26415C0;
	Wed, 13 Jul 2022 14:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DE26415C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42B031BF25B
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 14:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BFC984025
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 14:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BFC984025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRp8--40crBo for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 14:34:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33EE282612
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33EE282612
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 14:34:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b26so15798108wrc.2
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Q97xS6xemP0o4MthsI1RIUpaVKh/ayYbbmtctVOnb8=;
 b=MHNWIjVotNfVRYEVz8yDWTGFddVQnrIVLJlAosOgqs5ZXoykyn3p5h6f5KTHcHjnCe
 Kq/YJocqzPy635ZohPIWrY57Vp1fUM9pS8UYHqkfIiSYEXydC7QnnrhxHIt93to/4aoX
 IzXlsO8lfly5fPDtQAUUAbMXWoSCb6wbWU+17JcFjOaYqYS4OAFK358Cr8peOK5MluF7
 2fOWytPDkoTW7hanV7UNsYLOltJhQ5HA5SSZWolDmy+C8vkxpieVG6mzIGvzkL45Qa3Y
 nDMHUQp1n7QeFfR0RQ+Vp/+ONzlxKvfIcEA+GGDQRhuLdzfwlBeqJUIRUV8HCDGYxnpI
 g3jA==
X-Gm-Message-State: AJIora+TrldWor0fEbOb4uk4Vdeyx0y7JN0mqp6Q+92efxnfYJrqFWNC
 lXLcvSbKAByOJnGNdCjhxbknfCDVILY=
X-Google-Smtp-Source: AGRyM1sbdrksox5o4hKXmu3LL6n+njizj4rT3K+K+wo9OVn7/WctV1XMKnZxgsUhs7uXis9h1NpbOA==
X-Received: by 2002:a5d:4692:0:b0:21d:8e7d:b425 with SMTP id
 u18-20020a5d4692000000b0021d8e7db425mr3422731wrq.267.1657722844346; 
 Wed, 13 Jul 2022 07:34:04 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g14-20020adff3ce000000b0021d68d3a27dsm13550830wrp.45.2022.07.13.07.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 07:34:03 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Jul 2022 16:34:00 +0200
Message-Id: <20220713143400.3131102-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Q97xS6xemP0o4MthsI1RIUpaVKh/ayYbbmtctVOnb8=;
 b=ZdPgS7svWDBzgqpHRjsRH1zqlCHORwXUcOBZQh7+vv9b/r7im9caNYLSQ/CR/36r/N
 cFKKtoY5AhgJRQ4DnI4Ztz7aD/EALQ5WfmuuW547z0VF9oCJbbRI5ztxKH7QMgGrZChi
 FZ3D/uOvr7LRnj0pzE11soG+l/fkEDV2FLQr47tubscRtJcDnEOvfMlRLqgRqPASyHCd
 3OlQWXV/hVB9kh/13jEQXUSSwsmN8CkA+84ZnFF7wYB73DW6bBvjmCONn9ZIa8H90qAo
 hN0BxAJ/Po5ShEF6R5nYB6OIgDN0lkOIiX0J5ceMzIuXn8MQwDNGONYCV2jdciuVg6vh
 ju9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZdPgS7sv
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump Linux and U-Boot versions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/mx6cubox_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index a9cea73fb..86f506ef0 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -17,7 +17,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.53"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
@@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
