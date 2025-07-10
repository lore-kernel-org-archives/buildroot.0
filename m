Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA259C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF20D613D0;
	Thu, 10 Jul 2025 20:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VU1BzDb_kAOw; Thu, 10 Jul 2025 20:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECCCD613DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECCCD613DF;
	Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79C6A114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6079480C28;
 Thu, 10 Jul 2025 20:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJFza9L_p-Kt; Thu, 10 Jul 2025 20:23:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 647BE80C2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 647BE80C2E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 647BE80C2E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso16358415e9.2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178982; x=1752783782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V30e+/AN6MfwBDgWfblCjkJIa1Khb2qZasOj8jQou4g=;
 b=gkf32WaoVTy+ggWH8LLFXRX06NNY5PyUqQzH1iSRt1+tYlDVSye8nJEbKIlhNr8nha
 U1ktI2lRp7+54xinI3EAmch4t6deMgWbAfnjt1vzF/Md56Eeas2DwTKWW3OJHwuS+iGX
 gxrRPCzv8sM4aHlAxnBC2qJGh75QvEcEVSnILE07l0LlFjaKTxjsFO/CZ1vqB4B1Q1fn
 UfvgqM8oXcEMIeCEkZre5tksNcoQir1OUWgErqj1zDb6KtCBkyBOXIjXzd+tQbOR6ieS
 wn7HCpdDnhsjrMJ9xlb3hu9yqACCpYmD9d7enrWxIWLasJETUgsbe7YGmboKOcBXLzuG
 1o6Q==
X-Gm-Message-State: AOJu0YzZT1JcbOk3GbiOUSaWJQP2YZLDhe/W/kkmx7ersfBZh5NshSsY
 CL2ik9ku/UE54QjY7x5wI/hkSOASfvJ3V/ZOVaNff8xyXC4Z8/omyLjKisXjTg==
X-Gm-Gg: ASbGncuTbms0XGKzVKdk1cbIoMHTj5Tl4AxYygbWcvwZehFr2t9KBXseVkpFy/LmQAm
 Y8fEFT8Z+jztit4c8NnxCAj/8MiGWeDAYH9dfa2U7LI+m1VFegFtWbFHgeVlVW1OOKol5j7J5Lu
 pdj0HM8WxLR+O0kwjjkhV99+f3KZsa+cusbAP5el9idZQZ3/ssV8ZH/y2eZ7WJqrMc4DhLbkiSX
 9js54ewkzr36VYaItTPLhtu2cjrZK5FIUSetzeLym2aiD25htWQ9p2kAsekoGQi2Xv8Ngfqw/4w
 TBTBPZ7FifvBKZTlBg3TILUDEFTsoVfkZ0hw5oHep0/zO6y4lOv1NPVzq3ns9DPlgdp7PSyq
X-Google-Smtp-Source: AGHT+IEAWGP4cuhEEzqz+Ttls45RyPzkC9CMONeDuXcf7ehhG8O+YmYArf22uvlf0bky12bseAKH7A==
X-Received: by 2002:a05:600c:1547:b0:453:5c30:a1d0 with SMTP id
 5b1f17b1804b1-454f4257f2fmr1474925e9.21.1752178982113; 
 Thu, 10 Jul 2025 13:23:02 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jul 2025 22:22:45 +0200
Message-ID: <d9514460ee4e70a9b10c4c485a1677af3257ee40.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178982; x=1752783782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V30e+/AN6MfwBDgWfblCjkJIa1Khb2qZasOj8jQou4g=;
 b=HBte+rXr9fsfz0kqmVAAKmuyqMRA+QaljCWCfMNLvnZuA4s81w2okYmuQSYI1z30Ri
 qurNLanKDUFREhHVDIhh7P+63TKv0epoc3mKG+82r6kBwpICLoOCoDp2W0kNBmetf0zp
 g4m1ze7QSiZ37jV9cBkAYTOtN4o+cW0ISJNQaRuOAYxJvod82Gs2TT9fqGkplCqMqR6+
 Dr8HfV+2YihSixD40uuiogT5osykYchl2D7qrHVWKT7MrjEb5AhGQ37v1OGp9HvjK8Qk
 zsRrvJLYTai0sYwW/1dfHCW9aT63GBSYU6Gor3VwWFwk0ggxkYZfw8Dx5BC8/vAfx9rI
 Z9DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HBte+rXr
Subject: [Buildroot] [PATCH 03/17 v2] package/systemd: select merged-usr
 from package, not init
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 255, systemd no longer supports split-usr [0].

Move the select from the init system to the package, to explicitly
expose that fact.

Drop our comment about our design decision, as it no longer applies.

[0] https://github.com/systemd/systemd/blob/v255/NEWS#L7

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
Acked-by: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - typo
---
 package/systemd/Config.in | 1 +
 system/Config.in          | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 320d416203..0cb10ea3d8 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -24,6 +24,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
+	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
diff --git a/system/Config.in b/system/Config.in
index b24004c533..32462241a5 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -115,10 +115,6 @@ comment "openrc needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_USES_UCLIBC
 
-# In Buildroot, we decided not to support a split-usr when systemd is
-# used as an init system. This is a design decision, not a systemd
-# issue. Thus the select is with BR2_INIT_SYSTEMD (below) rather than
-# with BR2_PACKAGE_SYSTEMD.
 config BR2_INIT_SYSTEMD
 	bool "systemd"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
@@ -130,7 +126,6 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8
-	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
