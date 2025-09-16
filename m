Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C139CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05DB8610D1;
	Tue, 16 Sep 2025 20:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0YhKj5zPH7H; Tue, 16 Sep 2025 20:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E68AA61117
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E68AA61117;
	Tue, 16 Sep 2025 20:27:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA10F12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA7C38350A
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RTrsi0ehuHr for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D46F834FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D46F834FE
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D46F834FE
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:47 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3ecbcc16948so735250f8f.3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054466; x=1758659266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S0+jyRNTtrvHLNq5MUtBUOGNZxbYb/KZbi/50mtd7c8=;
 b=svBzApFjkMX9w7c/Zm/qtliQmmcZEVwvGywVSpkC4cYdckSOlVZ+GmxVi+aWDDNa8R
 T1q1tJ9sXS5lvuhZTOt68uxX2QY+a+6GxpAo6/z2NV5hmMo4FnpKa5O4R1lTD7SwF2Tg
 e8n5EQYEmYB/fRHurOBvJCuvvsNXceCijnsaUB6RqJQexqM1c92Lp2szKgfzdthRNy3i
 PSehSg6lnh8He/3bTPJcVBKEqAvv/OdQ6eE32vL8UrBsAH42oK/uwWSoMk2L2/ovLBW4
 Ke9Vk6dDsLZS2ip8/CxRgqU6CBFXZpgqDe+v0eB8kE17GuMJk2Ts+Jz1cCnLLl6MPbxy
 9Haw==
X-Gm-Message-State: AOJu0Yzm6AZ7LduQF4rofn6AqviP3Sdu+WOFip3j4KvMtkOAM6MZSD7i
 XcyC2jm4azuB5vFGLrOjEo7ihW65+34QJiV7WEmSS1r3QgZrODHNHgj6Dl6hd0aKRZG8uU6lD1t
 TpxD/8co=
X-Gm-Gg: ASbGncs9jCR5qL1afE4tykKUnRsYI9UyLfVrutgOSZRHcOx2I8/DJRNbv7bJTSEGFUe
 Un7Ka/k9FsvfjnlKnOw/0S90fd9XZUivh1nOgcY/6yjn3JicWTHAkO2pvkEBHcvRyWrOIuj4hol
 Q932WLGzSUFnMu3/xPwexteGsm1+3aMY26UHDdEMFGbDc1rPiayzg54Dr4Dnd7gbwC8Aj/qa2h9
 yUdtUb0Bygcc23cgfqDX4ubN5Jji4v6OfnkKlUhOlFufil25KuWwscLB51RfvjfKsSJYFRTO1Gf
 vLSwO4+4NwbX4JoA477B4GDpzO+x/s3YKFjn1Ek+eAfYipZoNckaN1J9N9K5QnZll49tEjqGsY4
 g7IAy11AN5hxRCLSSFJDd3Qg5Fw==
X-Google-Smtp-Source: AGHT+IGvfKdDkeAyEJJMOT9+MKCFStxra8ZHoxfqaYWI0ucP6v1Rqw6MsAsxmiNjvegkMnMrdIwM5Q==
X-Received: by 2002:a05:6000:26cc:b0:3e7:458e:f69 with SMTP id
 ffacd0b85a97d-3e765a08312mr17758919f8f.56.1758054465728; 
 Tue, 16 Sep 2025 13:27:45 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:34 +0200
Message-ID: <20250916202735.1121872-11-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054466; x=1758659266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0+jyRNTtrvHLNq5MUtBUOGNZxbYb/KZbi/50mtd7c8=;
 b=VfkipH2UbMW++C3s5wuP3k7fZIZcMgNGOow6fDqjMTxFhtdE79rmO9gEfyakikOhm1
 W2E/xuKll10XFjPUFpOYr3cW+uZnyuf/NcRlCVqOUHRS+nn63s0JbkGQiwwYKxwMU/kT
 aSBuZ+w3W9m4UmUYIE8zAPzqEQHCAyA9txWmY2eC0ouVUIt9yjDct4Pc8as42ipj+3TQ
 T6St6lYVj10IVdzne31TeKJZ3Z0GucbEjKBdVzKZF/gdcrfN5/8UBuVikgOL1qfbedNe
 CCIArJ3GZvTKket4ImlMvG+/QHHvsOn37DnIDKqSXvcLKOyVYkie2lDnKL7exOgbajli
 55YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VfkipH2U
Subject: [Buildroot] [PATCH 11/12] package/x11r7/xserver_xorg-server: fix
 deprecated CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'x.org:xorg-server' is deprecated in favour of
'xorg-server:x_server'.

See the following:
  - https://nvd.nist.gov/products/cpe/detail/F6729083-29EE-4772-9DFF-80B43980D6BE
  - https://nvd.nist.gov/vuln/detail/CVE-2025-26601

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f480c1c0ac..2ce02ade36 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -10,7 +10,7 @@ XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserv
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
 XSERVER_XORG_SERVER_CPE_ID_VENDOR = x.org
-XSERVER_XORG_SERVER_CPE_ID_PRODUCT = xorg-server
+XSERVER_XORG_SERVER_CPE_ID_PRODUCT = x_server
 XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
