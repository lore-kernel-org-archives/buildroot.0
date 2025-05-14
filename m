Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F4EC3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7388382D;
	Wed, 14 May 2025 16:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgXXwofBgThT; Wed, 14 May 2025 16:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E718399E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12E718399E;
	Wed, 14 May 2025 16:58:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35DE4153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A5C241215
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7iWkoccVBxGJ for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3EE5741486
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE5741486
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EE5741486
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso465475e9.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241909; x=1747846709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=STuXwDsZQPMaBjrNbiNHaRMHyKY/9iqo2tl8IY/WdnM=;
 b=E9hCauqsE8RdxR73ZiY0wNPZGOBvPlv8F5VI5RD0gNzX9BTlyOAPidBjKkDP4N22YC
 cOZuIG/fNeVSeP/nJDOGkP3Y0NYsyZherklCJZDxYAb7z1ux5V6mP0XNxXP8N0fZYaqg
 FffsIjB+/6EaMr1vn2XvIQD5Ot8s38htt7MKm6YJ5hf7rFy/VkJmhsl+CRYQmMs41EB/
 UOGBpDQ5y2mMBSJYd/HobiiZg7jnBiU9vGuJ4wxZlsq2FkwRIaf980LLFRLcY89dbaYj
 HWmcqK9bchlfhVMNIR1jADrW0ZAG6bj9ANdF6eYLtaf6BMwBcBHLXu0WhDjurWqyyaMW
 rGxw==
X-Gm-Message-State: AOJu0YxabkduRSCzTHTC3jQtBRqNSvPw5C5lRnQHkiec76PyzsT+YWXU
 Z0ZveUVZ+t95JXdHmOoQ8zHW9iQM3rAdRQ87vrSUNvQdoclSSGUgshXAKA==
X-Gm-Gg: ASbGnctCpof5mF+ApplVBsmhDx6Tw8bGnNyJB+FZrsRpguPUWHHDSn2XpLslAI1XLkR
 FEYzHfcAGplJPz5l8NG3ER7c2GupqHwNT7MqLSWoim0TnN3dgdt+uM5D7YTxga0nTTb228WsjZP
 iBmzdpdWKr15ZwL6gVMhirhfrOSTwUubxMbFt157aIP2edt1GqftJn9dxMyJTKn/JXrpiEEDi2W
 j8+J20gOJhr1Mje9E2NGDw1n351jEwttIIkZYWucC7DoqBLW8iRwy5f1fdUIIcFj6XIPd4Bgri0
 e1lcN0wgvkSTYwqWHItNUD5xmcqrwAOM6PI3FVQ6yNzlLRoAHHDFQwFqV6Unhw==
X-Google-Smtp-Source: AGHT+IHRsAU7YhUawzIwCNKGqi3p5ge7ME9+025KQFqbLywnJRyUauimnU4K/dB0DpKcri0JjJFpYw==
X-Received: by 2002:a05:600c:8207:b0:440:68db:9fef with SMTP id
 5b1f17b1804b1-442f2160fcbmr35837875e9.20.1747241909208; 
 Wed, 14 May 2025 09:58:29 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:29 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
Date: Wed, 14 May 2025 18:58:15 +0200
Message-ID: <614fb4ebe91cd66d14b25e087a865802e3781978.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241909; x=1747846709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STuXwDsZQPMaBjrNbiNHaRMHyKY/9iqo2tl8IY/WdnM=;
 b=jq6R0F6E5c07GMHI+0mnKW2/ku1PsdP3VWpv1WHg+HewD0gVM63Yo9Ki8ecgBrXKdR
 46CFzLavuIQOvNbo+ihwkLrXQwEV9ubS185RCWkcpmXr7marjrJvv52HkA10c8ph7i3J
 9tXGqLe4LA/GEYwgDlqd0Xnj4/XWCpAlpO3M2c3Ulzzt8KiuKEYGRyIemnZva/cZieuh
 cMx8svwuS4vXQzzKE+JRe24+nDMevZ7d/o0MZQXJd9wUvWzQFWxPuYqqt3p1OTXgy/JY
 c2qgVBMaZxKnpMFxukNxNpCJqfeJscQsUzLZOLdgR4MOVck65ZYBiWEzVGw2xQnJjbZj
 vDEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jq6R0F6E
Subject: [Buildroot] [PATCH 03/13] package/systemd: select merged-usr from
 package, not init
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

Since version 255, systemd no longer supports split-usr [0].

Move the select from the init system to the package, to explicitly
expose tha fact.

Drop our comment about our design decision, as it no longer applies.

[0] https://github.com/systemd/systemd/blob/v255/NEWS#L7

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
---
 package/systemd/Config.in | 1 +
 system/Config.in          | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 851b91aeba..fd7671480c 100644
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
index 2499dc8208..2f42e5ddf9 100644
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
