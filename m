Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A64ECAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 11:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB5B040B0C;
	Fri,  3 Oct 2025 11:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUMTr_XS-hAd; Fri,  3 Oct 2025 11:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CADE040B1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CADE040B1E;
	Fri,  3 Oct 2025 11:52:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43B0D226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 11:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29C3660667
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 11:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Vs6SBBP6Own for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 11:52:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60C1D60663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C1D60663
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60C1D60663
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 11:52:46 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-62fc2d92d34so4458129a12.2
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 04:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759492364; x=1760097164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hgsr8rYu0yUWJ/u9+E3+c0UxOXH2OXN/jDZVsl1Zo0Y=;
 b=F7sfvicpbHbxBwHBcpRHPY0FY+PvEE72rXE0qZBKDVgTfvkX5j3F+wXefpeZMp8f/j
 kH5wnydA+66nf6gQQJXhhnVXvPBgKiA1cf6nOo0so1rTzxCtwk7Jy2HlnFq40JE4gTTg
 PCZy8QnbQ6Ld4mGLOhc2WGmUq782hd4yOhAG7u5v/RsGI4XuNGj7yCYPzd9KoEaZoS0q
 n6JIy9V9ORRBZsLTMDbOpV4xIp6x0ehLfOVnmVRFkcMzTNRi/2EXge2AkcLFHptVSH/2
 +/W5uoAWmGIT5GSuJNIyRpwXb0RGn0r/NlHTwJaGq99Y0av4X1MKBIEAabaiDX9SBieb
 dqhw==
X-Gm-Message-State: AOJu0YynQnKf4pI8sxMBRA0oIO9qPHB5djN1xiKx4qlyOfW43lHQ4W7D
 Ego+Zpxg/Q6a40Gfk4ydtU3yHFODMgTrO4Xv6RxxvYbm5vQj/un5Wbl3tNopahiAeL0=
X-Gm-Gg: ASbGncuhOM2oMIm5qwRyyDM9Y1DZnpw4YWmXatUj7VBrTKih+wdebc6JnjxE+lTnMv1
 Bwrm4gTyv1Z5I8s+Bguoq9HPFDYqU6MJa6I0GTEJoZBYHwcOyyJXnqcYr8+2T5YJtH5p2T6177/
 8xKo5875JYGbQMh7pFI5xwyaLtVsdNaHrFWY7QUcb0H58hQLqhAGn0omcnBb0fGTH+OfVUz2+JK
 ePL45VnSZKNM5B8k10GTWLxVlMcXKr7GbdJJQeO5aQL0yZ93a/zYAZjUJ02TNV55K9J7/oZjYup
 G5MN2WvBkAxvR1fEQcoDoX/x7aIjcVgK7x5PivY4HlRYRnJfGXeuMMCZ7gsOgF0ZEvjtDU0NS19
 vpSE3+3fUlJZ6zy2VRTmONEMmrYJlBzwv56rI
X-Google-Smtp-Source: AGHT+IGsxece3/hkkY55V6W5bhshP7loguCLxAu8vp6TalBN5vxaFfN7P2lPx057pLpCegH9a11zjg==
X-Received: by 2002:a17:906:c10e:b0:b32:2b60:eed with SMTP id
 a640c23a62f3a-b49c3f77bb9mr317337966b.44.1759492364168; 
 Fri, 03 Oct 2025 04:52:44 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b23csm430938966b.61.2025.10.03.04.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 04:52:43 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri,  3 Oct 2025 13:51:20 +0000
Message-ID: <20251003135120.1221002-2-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003135120.1221002-1-raphael.pavlidis@gmail.com>
References: <20251003135120.1221002-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759492364; x=1760097164; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hgsr8rYu0yUWJ/u9+E3+c0UxOXH2OXN/jDZVsl1Zo0Y=;
 b=bFSTQANx9te20dWqGZT9Xm+MqLYB6jvFR7MIm4Aa7/sKNdlnYQ72FMK+QDyVcU+mdz
 /bzG5F73ISkFxToQaupufGRUAMNRwX4KYGiU0XjFdUVMC5I3EJPdoGaDdcBokQBuOQbd
 s8ym8Y0Sl++t5ZnZJR2V/H5QMFOB2BuEjNzCjbaaC5PVMSx2UAptsE1arV/JUYcldPTO
 ToMWYX1z9N+YR6rTCK3UnCjC3E5sOVjva2tfE7dZoIhK90spxy0BtAjCMa7gFt9vfCxo
 LD6g1FzkniI5u4GCmj0jLeLpdl+UFzjx8txs1914oCALcqeWOde5X2dyFdhy/CkW+SXA
 /RIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bFSTQANx
Subject: [Buildroot] [PATCH v1 2/2] package/xwayland: add nettle and libmd
 as sha1 libraries
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

nettle or libdm can be used for sha1 library. Therefore, if one of those
libraries is selected, then use it.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xwayland/Config.in   | 8 ++++----
 package/x11r7/xwayland/xwayland.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
index 4f14f2cc36..a4e4a4e46f 100644
--- a/package/x11r7/xwayland/Config.in
+++ b/package/x11r7/xwayland/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_XWAYLAND
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
-	# We need a SHA1 implementation. If either openssl or
-	# libgcrypt are already part of the build, we'll use one of
-	# them, otherwise, use the small libsha1 library.
-	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
+	# We need a SHA1 implementation. If either openssl, libgcrypt, nettle or
+	# libsha1 are already part of the build, we'll use one of them,
+	# otherwise, use the small libmd library.
+	select BR2_PACKAGE_LIBMD if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_NETTLE && !BR2_PACKAGE_LIBSHA1)
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index a6d584705b..84c8598bf7 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -72,9 +72,15 @@ XWAYLAND_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 XWAYLAND_CONF_OPTS += -Dsha1=libgcrypt
 XWAYLAND_DEPENDENCIES += libgcrypt
-else
+else ifeq ($(BR2_PACKAGE_NETTLE),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libnettle
+XWAYLAND_DEPENDENCIES += nettle
+else ifeq ($(BR2_PACKAGE_LIBSHA1),y)
 XWAYLAND_CONF_OPTS += -Dsha1=libsha1
 XWAYLAND_DEPENDENCIES += libsha1
+else
+XWAYLAND_CONF_OPTS += -Dsha1=libmd
+XWAYLAND_DEPENDENCIES += libmd
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
