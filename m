Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F961C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 155FF8125D;
	Mon,  6 May 2024 20:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhXh5j0YMmBT; Mon,  6 May 2024 20:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E8B881BA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E8B881BA8;
	Mon,  6 May 2024 20:09:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DF1E1BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43073812DE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jv2n5qum21NM for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F02A80DC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F02A80DC4
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F02A80DC4
 for <buildroot@busybox.net>; Mon,  6 May 2024 20:09:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41bab13ca80so17675005e9.0
 for <buildroot@busybox.net>; Mon, 06 May 2024 13:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715026152; x=1715630952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnePfGD//Mc5K3qnby6odcSCV3ETi0zv0bNmhJefiE4=;
 b=L0jhnyYCI+qq/hTDitdqsO99DVeU3KKZH0QigtCqJAnvFug88o0ApU3Y8/DEd4zFST
 5GYjgr8Tm0SzJVXfl6O/xUKZcg5kOKYR25prige0rVogK3lKWC4O8/GfVCiAYIDUBJjy
 QJNldGlgQAiRGpNpZpK4sMOMJwetQB6BwKnnZpe0YMD2ekqVIz0QZnqpwmnyXKlukYa1
 hxjEZ2QaxDDu+hDBeq8CFdfFtianBjg+/LQAs9dlmUx280WgHhBBYMax1vuGL2KHB7Ix
 IvPmoh7AYhLSeCofSsOrJjXEQ7Jtpm4t2IObd6YNACPxpgVtQmyQ+/BnFN23rgebwTT9
 mRKQ==
X-Gm-Message-State: AOJu0YxGSJoLHu9DfE4qgpYShqOkZsOM5cHrjkPRJD2oYcoKpHpDoa2N
 8ONzLLSa3SMPIxqpgNxI2U5eDU1Eo3Av4rBKk/A6bA0F+3dK5kwGZ8/sKxORDwLZpSQFvsMMDZR
 OeQ==
X-Google-Smtp-Source: AGHT+IFwVFPBJHbuZJf974Q1wyNGeJZqy6S/R57fWUyr27U/imXNCd0BP9hppLlNqy1LxODH1v+O8Q==
X-Received: by 2002:a05:600c:3148:b0:41a:bdaf:8c78 with SMTP id
 h8-20020a05600c314800b0041abdaf8c78mr9005570wmo.8.1715026152285; 
 Mon, 06 May 2024 13:09:12 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5007000000b0034e78c6ed43sm8878791wrt.110.2024.05.06.13.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 13:09:11 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 May 2024 22:08:58 +0200
Message-Id: <20240506200858.30197-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240506200858.30197-1-francois.perrad@gadz.org>
References: <20240506200858.30197-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1715026152; x=1715630952; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnePfGD//Mc5K3qnby6odcSCV3ETi0zv0bNmhJefiE4=;
 b=oveVlyuI78ZZZKbpS9R4e4EAAwY090AjLC/0voOrw9PmI/jx1w/odcHLvbUXnrBZuN
 xNBVJbbWrDFODIwCxDwFmqrCPLFXtVTYCU85XZc1XhGYkpiUr7HRhTh/vStV1K4LbwrQ
 +/CQOIMrEUelMRKW/QFCDQsuPba8uLa9IHtBue6MJ4oN4avX4LgdDtkyqj13NeI19HYt
 QBGqg2C4ke3yFnzja8CE9D+EIOcWYU4zD5wsz8w0WdRXpkVzk5plxP3h84+LiXopHlRc
 lH/JVi4G9Bkd/1sYSqHKLb01VSNxPBskll+r2b3Y+Gs+hRKU7mURdtrhTNVYIJZQcXg9
 cfBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=oveVlyuI
Subject: [Buildroot] [PATCH v2 3/3] configs/olimex_imx233_olinuxino: add
 hashes for Linux & U-Boot
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

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../imx233_olinuxino/patches/linux-headers/linux-headers.hash | 1 +
 board/olimex/imx233_olinuxino/patches/linux/linux.hash        | 2 ++
 board/olimex/imx233_olinuxino/patches/uboot/uboot.hash        | 2 ++
 configs/olimex_imx233_olinuxino_defconfig                     | 4 ++++
 4 files changed, 9 insertions(+)
 create mode 120000 board/olimex/imx233_olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/imx233_olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/imx233_olinuxino/patches/uboot/uboot.hash

diff --git a/board/olimex/imx233_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/imx233_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000..5808d92af
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/imx233_olinuxino/patches/linux/linux.hash b/board/olimex/imx233_olinuxino/patches/linux/linux.hash
new file mode 100644
index 000000000..1dba724d0
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  88b69611093613ce4494527685f833af0c31b986dcbeda7086f69f18f9e0b190  linux-6.1.83.tar.xz
diff --git a/board/olimex/imx233_olinuxino/patches/uboot/uboot.hash b/board/olimex/imx233_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 000000000..c1aeddf06
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 7049cfeac..d45c55ada 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -5,6 +5,10 @@ BR2_arm926t=y
 # Linux headers same as kernel, a 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/olimex/imx233_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_SYSTEM_DHCP="eth0"
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
