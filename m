Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC3BE9A04A
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 06:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E7380F50;
	Wed, 18 Feb 2026 06:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-1VFtNyLngN; Wed, 18 Feb 2026 06:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18D9580F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771396292;
	bh=eQnY5qSEwO9Z8N60FDbFOyvUH8qafFAlvER/eYJCsg0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BXmwxYzrR1ZaZO2++/JYRL4qvMg/ldR/ab0zdSLlRLW9W+cIdfxfeTkd4f/xFoyO5
	 Yyv1zrpMN1q3g1pltw/RBEuAgZqkRUVFbE3t1fighZwducUfIb7SQykEQLA1NL1yMh
	 Zt0gZDdYMDFem3rISEMSOVF8YL02/ux/JCFVO23zn9g/Vs0OiPHbwHUzaO9WpNYFiR
	 TpNDNYkl+OY8SaGBhRCaTFO1vykkMp2xNpnNbM4D+JFCQpbtr3sGdrVdewXOzzFzCD
	 PLU+7tCgmq5+wt5PHu4VCMKSy3ugYJyZdL5R2uj8XoCKJwSSv513uc1Ot4/gH/pZtz
	 wGTAEnlERsyOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18D9580F4A;
	Wed, 18 Feb 2026 06:31:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE471270
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 06:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFBC140042
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 06:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knkElwNbXcQ6 for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 06:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 150344002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 150344002A
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 150344002A
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 06:31:29 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7d1890f7ee4so2970149a34.0
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 22:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771396288; x=1772001088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqQOkkXS/TlniS37Azc2uuVJziYgnZoBpiOZ1ygBTDI=;
 b=PGuq5pN7mOFJH7LIBlOaG/Bsjh1UxV06P1+vTw2dWROFxTI2R41UImFwHmcwY5qyIF
 bdJ6Ta6T2HifKyO7weluPnqr9DmXnphQr3YXVZDwP2GvEQnu5raT2jZQpXT52tZ5/Ixn
 POA1qRm7vJwebUe09McCKlKRGJ5ZL4Escwh76VnSSp5ies8LbinLr7XzkLdRKCBEXne4
 6S4HIE7Ev4hitZImi+J0WXLuwbbn8yQjxVgGtu0JQzNVwOYX7KwDXrXMelYACT+ysmEe
 dTK+gnEZfEu5SjljyI4YiawuidVAyoStGsvQ6L5wsafQqwYAk4LcmHZV2l1EWY2QeIQU
 L+6w==
X-Gm-Message-State: AOJu0YyQWYUFz36NeSEVKnTlkw8T+Vzbo25S8uEMbBFN3Nvk4ddnVtaU
 e0rcRvI40W3PrC8t/ORQIarsiOclkvcYSh9jH8d/JCPVYijiJdKsgQytFcnyjMez
X-Gm-Gg: AZuq6aKSZo6sQTmU6AKEui1/dXNyGTlS9uSw/InNGat1lw6Bq8okWSRjzGAk2XgPRZR
 auy5cUjcm/YOlLKamrVPASquAkgoQd02UJgHVnpPlHrtjr/KXjrgESbmwSsTbQeIZ03lHIRt3uA
 5StWNOvwAAll0JUqGIE+j0Np3MnQElfH0aCfAPoYevWX6iktuMrKGONWTP6rUM2zRcp72lzJtgh
 8hRywRczjd4v2J0X3CpSzWqzt3/L0kjnY6q01T3H+CIxk+/scBhx+sNdwrc7GPVqpjHx2S8TnRz
 AhUeX3E6FE/SSUD7YbBvQ7AmSIyrETytwFltCLVPAWJU/vVYqSOTQfPmj0y1eDEZyFxDAjqYg9c
 nJ0cp9pJJHkW+JtMbsnfATCmhay5O0j0Jue6xF1AucUSzQ8ODkznUyuCkzL0993y+z1MT/mygkB
 /QRjTYF1bbVbhXP7igy9QqTNK0wPGp+Jjq7HJcBHYyM8IMYlpeyDy78/0wa69ARlKB6L5OkRRJB
 yh16tOUjFMKGhQOxqt8dA08+4AhGIltx+FcHSm508Br/nrCCTLzOA53vRpO
X-Received: by 2002:a05:6830:2a03:b0:7cf:da36:4c7e with SMTP id
 46e09a7af769-7d4c2fe5e3dmr12243797a34.8.1771396288243; 
 Tue, 17 Feb 2026 22:31:28 -0800 (PST)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d4c22d11a3sm12444701a34.6.2026.02.17.22.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 22:31:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, Bernd Kuhls <bernd@kuhls.net>,
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Feb 2026 23:31:22 -0700
Message-ID: <20260218063123.546067-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771396288; x=1772001088; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gqQOkkXS/TlniS37Azc2uuVJziYgnZoBpiOZ1ygBTDI=;
 b=UrPwvlrWSdrnf2Ij2vNmShSEqBdYBdElEtWPtMdrB4NyACvmDYTESaZVvf+BE1EMhO
 taScqwVopgryUQL7N4T1x6ODwLBhgbNKz3ZeJnpiZiE5pR/RgtRmZ/0Gizh7S2wMLPcy
 tTw0kdRDNIZYVNYssXRk9jgyefy7FfWYjk9rkMDDMBgRxZQNhmW0ZcGOHeZpLpEyporQ
 qDQZaOBtQSXUTDsxWL82FnuOLBfBWCvvnc+zMBAiDDYxC085kxbJlY+6WDv2UEQfbbID
 RhxQpIV06z0Vbix54XoUM73UOl93bHVioIXFC+uR9yBxCD1nYJZgOZrAgoSuublIhko6
 JpRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UrPwvlrW
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: add
 EGL_WL_bind_wayland_display support
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

This feature was made optional in mesa3d 25.2.0 as it is deprecated,
however some packages still require it so lets add a new config
option that those packages can select until they no longer require
this feature.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/Config.in | 6 ++++++
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e1faea95d5..8a7811b6a5 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -50,6 +50,12 @@ comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
+config BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY
+	bool "Legacy Wayland EGL_WL_bind_wayland_display support"
+	depends on BR2_PACKAGE_WAYLAND
+	help
+	  Legacy Wayland EGL_WL_bind_wayland_display support.
+
 menuconfig BR2_PACKAGE_MESA3D_OPENCL
 	bool "OpenCL support"
 	depends on BR2_PACKAGE_MESA3D_LLVM
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 42693ce928..9c0e5d7256 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -209,6 +209,9 @@ endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
+ifeq ($(BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY),y)
+MESA3D_CONF_OPTS += -Dlegacy-wayland=bind-wayland-display
+endif
 endif
 
 MESA3D_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
