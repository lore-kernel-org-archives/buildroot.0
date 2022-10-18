Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916EAC4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 08:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29F7D40A99;
	Tue, 18 Oct 2022 08:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F7D40A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZ5wny_uPdz7; Tue, 18 Oct 2022 08:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FC7C40A8D;
	Tue, 18 Oct 2022 08:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FC7C40A8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA8C1BF34E
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 08:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48AF360FE1
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 08:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48AF360FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wwSPyGt0131w for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 08:07:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC7760FDF
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CC7760FDF
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 08:07:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id b2so30322598eja.6
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 01:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U9N4xqOrRevboisvd+i0dds61fVLtsefHO0Wgd8BtZA=;
 b=nwwkT+7ozL6VxKnI2AkttmDlh3tnMznq8isr5V+yvHfFUPqCEVhbUhtjPgmAQwStpc
 /wDY833XNqZvXB+tqeqTssLXM5bF0WicOn4H1Hp4rY94SW4kIkdOdxQin/CO0pnRIC8V
 vOalFXtoGQVC3xL49hvMJmzU3caZEaWAG7xSM/apfK/Xzq8mP6H3j6rsSpa+7bI3PNFz
 nk/eQ8e4AbH/nE/rjokXUYTL9C6Cno1ICFqEj1yXVWxMIKTZ2AGEJ/n6kmsTqfuibRbV
 pZUohLD965nFUL35WiOBP2doEt1fSEzxOLGOzJkcNsEBwlGZZBzg48nwScfO5jxca6Nb
 rf2A==
X-Gm-Message-State: ACrzQf1E7aLiA8kVlN6PV645NZkGcKjc+Qlru1P4JKfVu+0n892iebjW
 i94Q4fchRAPWTsRZgQO5Xz0gHVl3Nk0=
X-Google-Smtp-Source: AMsMyM4nTqWKS4e2MmnEmLP4mHnHZ/Sd21nHOEjy4nh77cCvIYKEZFDshVSM34nUdLbURlkciSs/Fg==
X-Received: by 2002:a17:907:3d8f:b0:78d:b46e:eadd with SMTP id
 he15-20020a1709073d8f00b0078db46eeaddmr1409632ejc.277.1666080439843; 
 Tue, 18 Oct 2022 01:07:19 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 sd42-20020a1709076e2a00b00722e50dab2csm7158174ejc.109.2022.10.18.01.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 01:07:18 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 10:06:55 +0200
Message-Id: <20221018080653.1586970-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221018080653.1586970-1-heiko.thiery@gmail.com>
References: <20221018080653.1586970-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9N4xqOrRevboisvd+i0dds61fVLtsefHO0Wgd8BtZA=;
 b=nI9DYK3FXFkeSaGTzGINAz9J4wlhTq5K4Nc1aJm6JCCd1n7ayX5W4xAnHt3/h+bRhA
 DIY9FJvRElNFsI+iknD9jARHbtQ93kMYanpCrVzzerpfhOLE3UD8DfN8o4x8unAYeobU
 z8HDhPXg5jUER4nXgwJKRGvBgE6vOqQ0OrNN/u2YZozhKZ8dGAE7+h066m23tx0U06+L
 DzH7mXSZcbiHdNjlFHXg2jaThD7yY2pTsDDEBCsX/YGtoERkfYHJytRkZTsGfKH3Awlj
 Z/RxIuRbdNmW+UHDrkejhcg6KUNvuzGd/zHOSuYgTPQsrTTm80jvRuMm58nFQLnw6LfB
 ZB1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nI9DYK3F
Subject: [Buildroot] [PATCH 2/2] configs/kontron_smarc_sal28: use linux
 kernel 5.19.16
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
Cc: Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_smarc_sal28_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 25846c8cbd..e502b2b67b 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
