Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3626CCAC58E
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 19:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54B160777;
	Sat, 13 Sep 2025 19:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9Md2C4QBGcZ; Sat, 13 Sep 2025 19:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05EAD6077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05EAD6077D;
	Sat, 13 Sep 2025 19:04:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADDAB12D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F68641589
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAWUP5Mohizh for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 19:04:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.42;
 helo=mail-ej1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 987BA41584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 987BA41584
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 987BA41584
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 19:04:41 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso375010666b.3
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 12:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757790279; x=1758395079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/dTsQN+S8IA2gjR/wOrJircHgcOCUKsVVB6BVyXYVs=;
 b=HeZhL+gI8D9mgqhmMFUy3vXO2ti6xayvL0Q4uZ1lwg4n3Nupp/mrqTeZEpRFCjSWpc
 qC1QuOYcuD/9JUc/wa3XOsU77PQvBFDv7kh6RA2vCXS2hhaY5SpszaGjUjawIXUe1Xb3
 1iUCvZ/9I7IGj+8LyqJO+S5QpL6Ljltevv7kODbxZxg6s7o1+82ehVplJqHuzwOmHI+U
 nmnGwQxQd65qZVdEW1xrns8jIQAFmsobYsNO3FY2JaEN4DTdkj3PbfoGAI9mO0Pw5JRv
 JgnZDNlQYvBh/hQ0skK1qhC5tiJRBFZzcFBYf6/UEcuJLTb9U3aKmENdX/Nturhk4/pf
 6CgQ==
X-Gm-Message-State: AOJu0YwO+W7pgY8u6SNmA0fZO+H0RoH0FXFSzSJzil/NDz6Atz/TAGWQ
 pCbALPeBelL3TlLjc9Ax14eIW6oLkQcAA1I2jpz3Or0o8cB5D42eiZgIGRVAifux
X-Gm-Gg: ASbGncvol0UB+mQ9aYcXnJ1gt7zJ6qYw6T/SmgLcSaY2c/S0qLeGHPvtCbalpDXrNyy
 UfOq9sbvHuI0dVgH4LrALl3pLmKbF/MICTJPNWzuOo3YokGz7Q+o4mYkjjq1fm96xKIqvRGBtXb
 HIkJJzP+i6Dm3mvWxn+DaaMyBH4MkMXqPXe+Sks4M49DCKMR2xKBiK3nO9IroijtpXQtMcnF/Zr
 S97tMLoQ1dVv4lPP0G+tneFrA0CQBDEEoXyZRRehBS+5/OSFLw6a10v0TnWnTS/JPojGCrjh8M4
 z3abn3bRSvXRmqGZEEA8cUQvuU5oAYam+HERwYxUI9Kl0UQGgvKu5BiF/wvq9EroRRIDE4SU6uj
 H1I1IrOABbuYRPBf4HHpZOX1U5roF0z0QWGMrDrbozV6rKhAT0acZtXMmvoaL4ZREXIaGbG4hEG
 AOUF0BCfgSUhy8sEjcEymOaeKCXWO1XmaWMUc=
X-Google-Smtp-Source: AGHT+IFxDqB3OU/4zIlQZargrU52X3XZo7zzwclYUoqy5oxyn3EvgM0zrdb81ilqwyyZURg1D/L2Pw==
X-Received: by 2002:a17:907:2d20:b0:afe:e745:c3b with SMTP id
 a640c23a62f3a-b07c353dfa5mr751569966b.12.1757790279094; 
 Sat, 13 Sep 2025 12:04:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:f67f:75ec:aef0:e4f5])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b07da7a8918sm243901366b.56.2025.09.13.12.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 12:04:38 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 21:04:31 +0200
Message-ID: <20250913190434.2224911-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250913190434.2224911-1-thomas@devoogdt.com>
References: <20250913190434.2224911-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 2/4] package/wayland: bump to 1.24.0
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
 - RC1: https://lists.freedesktop.org/archives/wayland-devel/2025-May/044282.html
 - RC2: https://lore.freedesktop.org/wayland-devel/2-4IjuOFGtlCZQhVPefO2DnjO26y5dVbL3mW3Get8jPPXw-GPN-0C8VIBOejnP7lZlSZcRGslG3A1DX5ACHiYazNXyx0UVhLyCQjXgdtg0U=@emersion.fr/
 - RC3: https://lore.freedesktop.org/wayland-devel/l2Ybp5Dex4yXCOVJb-VgQiK68CLgXQnBa4SG5cPFKA7tl4rkuLqMFRy_6Kx34pBZ-np3qLQNVx3ID9AKDrk2MEJ5lKueMj1PfE2K0um7KwA=@emersion.fr/T/#u
 - 1.24.0: https://lore.freedesktop.org/wayland-devel/plU5smxin5VXbiedTGtL7CNHe0t2mHtgQlQ3-xwREmSSNYaClAcZpEBV8L7JvMT8JHwdD_a_uSFkDUaP45CAWyL545iZh5gInAdToX6hgt4=@emersion.fr/T/#u

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/wayland/wayland.hash | 6 +++---
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index f7c085513a..8da9dbe745 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-August/043760.html
-sha256  864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed  wayland-1.23.1.tar.xz
-sha512  818eda003e3f7aa15690eedb1ff227a6056b2ce54bf23d45ffe573dc40a914623c5a1358218b59444dcdc483db0503324f0d27091d0ea954412a8b290de5f50a  wayland-1.23.1.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/plU5smxin5VXbiedTGtL7CNHe0t2mHtgQlQ3-xwREmSSNYaClAcZpEBV8L7JvMT8JHwdD_a_uSFkDUaP45CAWyL545iZh5gInAdToX6hgt4=@emersion.fr/T/#u
+sha256  82892487a01ad67b334eca83b54317a7c86a03a89cfadacfef5211f11a5d0536  wayland-1.24.0.tar.xz
+sha512  60216602cffd1473ae15381f9e9a6f3829e742cac83843ca65360ba78bcff8d9442f15eb6a6d5d29c8f74dd920762ca1605f51658d22a1d3c18e338505b9f974  wayland-1.24.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 23903bafcb..6add648d5d 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.23.1
+WAYLAND_VERSION = 1.24.0
 WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
