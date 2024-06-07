Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680D0C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 09:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E216C40AFE;
	Fri,  7 Jun 2024 09:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llackKnDjvQW; Fri,  7 Jun 2024 09:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C95440B09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C95440B09;
	Fri,  7 Jun 2024 09:37:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5D61BF4D5
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BAC0614F0
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGTrjE9F58jA for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 09:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD56F61504
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD56F61504
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD56F61504
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 09:37:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so1950254f8f.3
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 02:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717753034; x=1718357834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcN5RuNKGTNUfQr1wO7dHVXcefCft7NCE/F4mdUZeuc=;
 b=BW+n+2kX/r1NTujaVnoWqjf92JtKpwSEuNF2Vu5Hn7DL2jYth7DEm65kdCUnGrEDHM
 kn/WnSawjLocYBEQMSv9bywmw+xnoNrgs/b5gKeVK7X8mB+o5YnLumg/CMhbPS6RtrsF
 odgNUgLtp+mNRHQGfKdGwLnPYPF+DA5jBjBhUM/Vtv8DKvXiwHf9wSPJ48r/Z/E5BsHR
 Lg8uazo/G4UKyPhz8gkZuP/x3UhWSPqo+fTiZuou09awwhQJkIbnACTdty9dnYjm9nux
 M+4knBNAPSGzQdEJs9WfPdAu4tuNOL0ooM8jO/pWwCaG5j2bf+ORbUketIeZ6ULxnGXS
 9/Ug==
X-Gm-Message-State: AOJu0Yw9k+5VzFTmMemY5/9U6bg0S15ezCJfa8ESDhwx3Wpe0A02cMoV
 4njaYtTxI15EFNx/AlqVYNpQz+nBYFpl4RoOYlqGvw1uNYg41zQ7oaIG7Q==
X-Google-Smtp-Source: AGHT+IF79BGSJyTV9C4QyCfzV7/9tpRWVf96Uz59bsauOjbZTIsPOAFo9m775O0hoG9NXF5NceF1gw==
X-Received: by 2002:a5d:5989:0:b0:355:796:15ef with SMTP id
 ffacd0b85a97d-35efed1e61bmr2038449f8f.10.1717753033406; 
 Fri, 07 Jun 2024 02:37:13 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d69917sm3631523f8f.62.2024.06.07.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 02:37:13 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 11:37:12 +0200
Message-ID: <20240607093712.2880785-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717753034; x=1718357834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=EcN5RuNKGTNUfQr1wO7dHVXcefCft7NCE/F4mdUZeuc=;
 b=REUbpMoGOBYCI7aoTcjY56CkAdJjv15qS9RWkePt8qzCWGHXlT4b+7FvyrFnRVYtpW
 Qchko6HnP88OOY+khQDt4UW92wpgbjDCOy10PWhF78aO7qA5lX7PwICEzIXRjoCpqAwV
 Ox6ZdN3BQqUc3y0tkaOz0J7F9pPLutQmmBfRFK1lafVBTm7Uya5tEfRWzqwlbTuPGBWV
 /B2fltKoO/u62NhO8t5pOG5IoXCyz3xfLFYJtUshq9Pu38QECtD0hBJUpeY68l5Rw3lS
 EsC4H/PWeFpu97oNWKohK/NECa9GvdIsDdCGwFqL+aTn4bd8JNACQjlTGD77APddnzxa
 ZRSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=REUbpMoG
Subject: [Buildroot] [PATCH] boot/ti-k3-r5-loader: share download files with
 uboot
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
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Paresh Bhagat <p-bhagat@ti.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ti-k3-r5-loader is just a U-Boot SPL running on the R5 core on TI's K3
processors, so it makes sense to just share the downloads with U-Boot.

With commit ebe238f2b595 (package/pkg-download: use _DL_SUBDIR as root
dir of generated archives), the root of the generated archive will also
be based on _DL_SUBDIR, but the name of the archive, _SOURCE, is still
based on the current package unless explicitly set. For ti-k3-r5-loader,
that would create an archive which fiename does not match its root
directory; although Buildroot does not care (we --strip-components=1
when extracting), this would be a bit surprising to anyone manually
extrating the archive, as it diverges from the usual expectations.

Do like we do for linux-headers, and force the ti-k3-r4-loader archive
filename to be u-boot-VERSION.tar.gz

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Anand Gadiyar <gadiyar@ti.com>
Cc: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>
Cc: Paresh Bhagat <p-bhagat@ti.com>

---
PS. Not sure if we should do that in the package infra, though, or even
if we can even do it. It's a special case for packages that are both
sharing their downloads, *and* being downloaded from a VCS, which is
not a situation common enough to warrant a generic implementation in the
infras... Thoughts?
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 98a6d473f1..e426f039e0 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 TI_K3_R5_LOADER_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_VERSION))
+TI_K3_R5_LOADER_DL_SUBDIR = uboot
 
 ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL),y)
 # Handle custom U-Boot tarballs as specified by the configuration
@@ -14,12 +15,15 @@ TI_K3_R5_LOADER_SOURCE = $(notdir $(TI_K3_R5_LOADER_TARBALL))
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT),y)
 TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
 TI_K3_R5_LOADER_SITE_METHOD = git
+TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG),y)
 TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
 TI_K3_R5_LOADER_SITE_METHOD = hg
+TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN),y)
 TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
 TI_K3_R5_LOADER_SITE_METHOD = svn
+TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
 else
 # Handle stable official U-Boot versions
 TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
