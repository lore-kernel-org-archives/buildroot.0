Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD23ECA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88A4760DC6;
	Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4g6kF6z9-yU3; Mon,  1 Sep 2025 09:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A3C610F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5A3C610F9;
	Mon,  1 Sep 2025 09:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E967D2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAD454049D;
 Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJwy6hirWJjR; Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1E6D40498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1E6D40498
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1E6D40498
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b84c9775cso8821485e9.0
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717290; x=1757322090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I3lhW9b8p/YUd3TmoHGwaaXRHj/ggubjNsbDMOpqphM=;
 b=vZmmdtBQ4PISDatT3/efZHoD3DoEHjUhLNBFWHlXgALm0zGnR/n41k6NVM0b+3M8F6
 1l0vy8arbXoInCvCh2JL3NptsWZpUMc4sxKHJxkEYH2jH1zmSn0adu4Z611clWLhgCPC
 KOM8MASDKaUuB7sixBmKU9pdsHQ3w/e/SB0+V9cB0oAxhK+XnnkERYAStVkHJW6G2//y
 3wJe/Lc13pk3/zJtHlAbVHlQfZ1HmXTplk1HTXDyztjmrNYyf4MCq2Xy8sqT7YD5Wr5Q
 LHchwa64ViTP4P9DJ/cvlEAYROdGg1T3vSIF96b5JW20CzZOqWSswk8NyTAl/7hz0m0j
 ypRw==
X-Gm-Message-State: AOJu0Yyc+PH9z3F2apNZhZEz1MOJs3p1iR6KmdDevgjky/ZsefLGWE4Z
 imBx/ICRzthCp34jU27z8V9d8HupRZ10L0ZOVfWGnTbcBZsomzQ2rBrCMK6z+A==
X-Gm-Gg: ASbGnctp5AO7VGDmpZsBQtuh3LMphf4JErzGqaapp0iBElzSgpRYmBqwO2bGpMZYcZp
 OWj49aE8atcIwnwy+NwIC+sv0kUHfj+bqgcJb4LrLDnYHTruj/LxNtyj9WFFi1MgdW2bcpxczoj
 P9t7qQTgbxPBQ8yqYwMbVOnoSu3P1sIv5FHJ+VfEc+7Btlpq0pLt6fBBUKgGN5VwdGYQjC5b7rk
 WvEQGDZ+pPNx185aZHe+rYfrA0lTB48OPV90VpKnxps9pkYR0+3YnPawi+Ieu4iF+jSs+beUsnf
 yo4T7QHLCmk+ahE6esyEcVqff4KA2XacrCmmYjfvnc3gqtGnaJurKcJoCNYQOb7/r9K566A0+Xv
 deL4oLXPniaddZ9VTZPj7Ly+tcz6rx0Eb
X-Google-Smtp-Source: AGHT+IEKHooEJ48Y2dNiFtFzlj1HCOxW2dJ5gRAiK1YP7lDzX4nf8XceIVj1+IQ8oYh5R7AvOJp/aQ==
X-Received: by 2002:a05:600c:524f:b0:45b:8453:d7e with SMTP id
 5b1f17b1804b1-45b85526a68mr60050715e9.6.1756717289628; 
 Mon, 01 Sep 2025 02:01:29 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Mon,  1 Sep 2025 11:01:12 +0200
Message-ID: <2c2266fe2ad8b59be9480eff29b40e32d48bc300.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717290; x=1757322090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3lhW9b8p/YUd3TmoHGwaaXRHj/ggubjNsbDMOpqphM=;
 b=XTE5VSE++y4pkH9LkwUw2tPCmsSVU5+o/LAcmzUkroOrqsDQae4lIDtNDKtLfEwOi1
 BomDJ6HCua26vPjqx43GQpRto/8gWHzVD6UeVEijAuF4wTMpjB5h/3wuaLovqtv0LK2m
 nhls4AbSWvc5T8ytp1mXRAo+1KL/8R9o48cQ1FKBYK1MyhOqqGPXCsN6w+VK1kV76EuT
 5e9xKhI5jaFDTyi2yFGYqa/3Ym6FRKIa654IsnMohfAPqDGznpodMzNMH9pMzqg3rSuv
 EGIfH1Aa2WKnJqmMk6sFIJuYsBOJKNosh2R6Eu5RQV6Pymgret9PiAFyAiwheoNgDyfw
 1+nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XTE5VSE+
Subject: [Buildroot] [PATCH 03/18 v3] package/systemd: select merged-usr
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
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
