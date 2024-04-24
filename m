Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69118C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 12:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA2D98206F;
	Wed, 24 Apr 2024 12:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rs7fUOYthIpw; Wed, 24 Apr 2024 12:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D2782089
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D2782089;
	Wed, 24 Apr 2024 12:38:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB3F41BF580
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 12:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6368407F9
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 12:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQY99BxF82hN for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 12:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF9BA405B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF9BA405B4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF9BA405B4
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 12:38:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41af6701806so6378335e9.1
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 05:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713962295; x=1714567095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=drKp4HYFIlwUboLQk2Rzvwvd5jmcCr1vaG6TDMsg0Ug=;
 b=mc8U55c22caqmDSwZi8z9LUoPl0ek3KJrKYc9p3kHY8BgQkRFPZxnqVAIUmBE6uxuj
 OlN49AcTmTfQbV7rz9ng6gXAnuNTI5ogtWMiz48LqQMNsgRAbCMfqYRlFfBoJ+2OB2bm
 CciKLonsWX2dF6cn1rSnUyoCNeB9Qdd8IoCq708KB5nFTEc5+XOrzaAXTufstOECtJeH
 ytzop/aaeOkTmEqn6uoPbb0TDwxqph20Ak2mQJI9vO5o6uF+COU+K+y4FP2Hmb5sHX2S
 OIl4vrTMh6KkUAPNnBWVFWKJllfK4wxDYYYj1bbwOGI5rggfDs53pRAr+8V1alQqoiTQ
 X8jg==
X-Gm-Message-State: AOJu0YzEbPkuXORYI/GSHlENoAxiypC9L1+mxVFooNPTepmYz7i8cykp
 /TsfRA+p18s0CeUjq1D4hGmIs8xmKrDfAASfFYJEXW4iqzxTdANqyAoLWJ7pAO67oIwcVhH7CSl
 T
X-Google-Smtp-Source: AGHT+IEBrAYrXLyp2oZFHCUhAoTBY2OAhJHh78BHqCcGqM1JJvsqIajKsm4glTcqCFR9i5JQNOf1tA==
X-Received: by 2002:a05:600c:4f53:b0:418:c2af:ab83 with SMTP id
 m19-20020a05600c4f5300b00418c2afab83mr2047227wmq.36.1713962295383; 
 Wed, 24 Apr 2024 05:38:15 -0700 (PDT)
Received: from P-NTS-Evian.. ([2a04:cec0:1029:8401:c161:55f0:60f6:3bba])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c458e00b00417e5b71188sm23741231wmo.34.2024.04.24.05.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 05:38:15 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 14:38:09 +0200
Message-ID: <20240424123809.406447-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424123809.406447-1-romain.naour@smile.fr>
References: <20240424123809.406447-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1713962295; x=1714567095;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drKp4HYFIlwUboLQk2Rzvwvd5jmcCr1vaG6TDMsg0Ug=;
 b=VKrT3aUesalSssD+owl+6DiHHS4U7naP/Xm3uE62szRqnVFsRdnxmYN8sWCKgpWdZt
 QpYplrEtrgS6AVr5ua+hYiPTbUmlvXGd23t0IuVf7Om04nu6pUFNHjHsKzkw7as0hQuT
 oBNjI+ZwVfTJA4C3Ws84X9blGLnO1WaxtYlZZ/S2W92JsHlRi5S547LHLICKcUrV0O5z
 0FMnyR+bdXzQPRlANT1ttj4U9zdx8XZe6Q4Fu9MAbCzM/Zy2uRCpg1yFIJUJyQtWWk9e
 H1kunkRxhPFNW1YHkXeCQRCjtHmDSEihMobyVSHNsFUJwwSXo7azZxxUXNFnmp4Y9Agp
 c1mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=VKrT3aUe
Subject: [Buildroot] [PATCH 2/2] configs/qemu_ppc64*defconfig: add missing
 libelf dependency
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building the kernel tools, libelf header is missing:

[...]tools/objtool/include/objtool/elf.h:10:10: fatal error: gelf.h: No such file or directory
   10 | #include <gelf.h>

Select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF to build host-libelf.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6664587290 (qemu_ppc64le_powernv8_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119951 (qemu_ppc64le_pseries_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119946 (qemu_ppc64_pseries_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/qemu_ppc64_pseries_defconfig    | 1 +
 configs/qemu_ppc64le_powernv8_defconfig | 1 +
 configs/qemu_ppc64le_pseries_defconfig  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 8c58fec24f..350380578a 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
index 23ad5772c2..fd8936a1fa 100644
--- a/configs/qemu_ppc64le_powernv8_defconfig
+++ b/configs/qemu_ppc64le_powernv8_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_DEFCONFIG="powernv"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 207e5f5b40..ebc3b7a6fd 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
