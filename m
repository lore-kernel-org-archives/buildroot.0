Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887A2E77170
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 03:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3937940811;
	Fri,  6 Dec 2024 03:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmKmvMPaX7le; Fri,  6 Dec 2024 03:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E78A41200
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E78A41200;
	Fri,  6 Dec 2024 03:06:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1409AE8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCB2660A64
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttG1if0gSy1V for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 03:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E39EB610C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E39EB610C0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E39EB610C0
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:06:29 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ef70c7efa5so35510a91.2
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 19:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733454389; x=1734059189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQLHc5AIu5AYuVf0BTnbn2iRlnatheHDnFeO+H4g9O8=;
 b=iHGfwWWXZdgDhKgaz45k4SZBe6goTphAZVYT3WOIjsUxKxNnfRMndbxM6DWD504PPr
 9zEpRtC6NzjTdBUzwe7meb0+9S9oowsEmQVnJA3zlAMTVkiGSEpnozXk12MGNPrBpZ5b
 MsNAe+CRAhZ9mYnFU8VIDY/PFsAE93i8OvXdt1j7G54I0y8wJjlalL0tI1dAwk4kXnZU
 Uvxil3mEl8xHFRo10lgrebA5G2zDMxWb0+UIP0rPXJWAqUgG2dNk7zcyymvM0cqVcEph
 DCm17HCfXY+uBsLRY4L8/HIg1zEVMcVToT8sSvyV6oK3VwAfwKSyinoovme7Zl6TlBE5
 ziTA==
X-Gm-Message-State: AOJu0YwzgNnM++e/wOeEnSmZnjvndKsGKTi7KGC5ZKqn+tRXgqzPz42m
 k1Lr6TX6+/8088d0jzSjGs34rC6EDA0V7qWcKd6vmFE30OP380rbkDtrGA==
X-Gm-Gg: ASbGnctIr27xVRKIIYeANMZiorFl4D9ez9nIAJul19OnwQMXxDbcuod1baw8pWkmYmF
 +eHLOr1AAzECszNH28f2zk5qm4U4Tmz3dYKX2H0ihT0X542theagY2VwLlD3nyFSUIxtccOOfmQ
 RYkA+Qrj/RMR7D2SGpV0DAl2qPKF6lG82fRCJE32a5FJa25xQL6WMATVXmDhVgQrs7UILLODdea
 JAxC5BPnInqxiz4Twoa66GQ5HizHx83SSkaElZUIUwxmg8=
X-Google-Smtp-Source: AGHT+IHrkpZdng2b8ynUwXcgWvZuNL9h/Oqz5miEfwlReeu4id7WxEF7Gl3GugA6S15ogA+sI8pSdQ==
X-Received: by 2002:a17:90b:254b:b0:2ee:fd53:2b03 with SMTP id
 98e67ed59e1d1-2ef6aadb46dmr2346299a91.25.1733454388708; 
 Thu, 05 Dec 2024 19:06:28 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a29c5cb8sm1971779b3a.40.2024.12.05.19.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:06:28 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Fri,  6 Dec 2024 11:06:16 +0800
Message-ID: <20241206030618.249638-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206030618.249638-1-fancp2007@gmail.com>
References: <20241206030618.249638-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733454389; x=1734059189; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQLHc5AIu5AYuVf0BTnbn2iRlnatheHDnFeO+H4g9O8=;
 b=CliFRA6kn1lFogpM/2V2kaNSvb1zT9FjT29d+7ElGway2ej4CUAlI8k51IKHz4IZOJ
 EOYDm9Wanr+fpnShAOLU0GOcIcoEmRcbyQeJew3Y5seS9/5gGA1qz5NNw6EmzReQji0L
 vMkkg5lo3/bJOAwQ+q4kGtXLcfiy2Oydw2v6rxU55J26NsqL48PGPCfURn8eIrYTXfEZ
 a1NrUSdMmMM3OKzpRJRTovslRcHG09W230l5nH7L6960fW0CgaaSYVuidizfPGUYzCea
 dV/i35Ssckcm9YknveeypU1ZXn11JZUsL437n2ZvwTqCsUujJbGsNMowJd19gFdAyMA2
 ayRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CliFRA6k
Subject: [Buildroot] [PATCH v2 2/2] configs/cubieboard1: bump Linux version
 to 6.11.11
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - bump linux to 6.11.11
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 configs/cubieboard1_defconfig                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 42d02c9f78..4759f8354e 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
+sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index c3dede47b8..6d189bcf95 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
