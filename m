Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8572AC0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 21:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18EA2606D6;
	Sat, 25 Jan 2025 21:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Diy7IJcKdARp; Sat, 25 Jan 2025 21:55:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 182B160768
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 182B160768;
	Sat, 25 Jan 2025 21:55:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47BE3A6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B2940B73
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSF-CL-FuoVU for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 21:55:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29C7A40B4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C7A40B4F
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29C7A40B4F
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:55:56 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2efd81c7ca4so4397191a91.2
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:55:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737842155; x=1738446955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=neSfDPm7KPZ3cHTN0fzvKG+phOiNu+T0h3108wJm8YY=;
 b=goLEQneISDzf/E239GDrdyU9o9p8poVBUuCqqkSscdZVRdl/q/hOaA/tHa1vN/gREM
 jYGvKcDPPwTRhsdXCQZ7Pi5RPnZT1fko+PQyc0EM0vw6uCTGULTeQ5+YakXu+XYlr+Cd
 JMFKyoAmPxXBLCPe3FZYG4XRaz25TOvHdy/hAnajmcII4crUobDJQFTjobC2MfjBnOti
 dh2r9LALPqnmyOPPHYR5nW10QW4jWXKDs2Wk6hwqvhjhk1w2wGXZr0yUmkU8kNOD3xNk
 MUIHXYT10QfpWVhnDX0EvucM0/A3D4EmwlOXGiObwLr17tOx4/sU2S679tpBA+I4h9RR
 QC8w==
X-Gm-Message-State: AOJu0Yy4JQ+qwgdz0b9OxKfYaYSgZ+ZUzfBwsn3u0NNmJdGONafjlEMl
 Zc1V0zZrntrHb+1lYUBrdna1Hm/O3lrrA+CLwTFTzU+bUn58d+FraXQ+WA==
X-Gm-Gg: ASbGncvEbb6dvshbC2OmEdGw8tinJLdUxQgEW6QNHT+W6QvYcNCNHJU1Tf9fYtRO3fO
 sJy25/IxZQXX+rdOnkeuQiKHYh3lh7OY3tVPt0G1Bkl2Bcy7efFQfZrwxPZTceCZ7BXokjnuPB8
 U2F8DPdEjeiTaeh5XTE0/2Ph3uvWZPEWslJm7P3gD3pmYcBJoVMe5fc8sHLE8OB4fDZZhD1HP/p
 Qh9S1mvu0RjJeF3XhohwgoJQrENk1OMyekJwL0LpTGCwxQMOSk0gU1JRYmd4A1f9TpV+4xpaRv4
 QfUx0yvQ/xSg0cqKb5Jkj4S1FGKgMoGvxF5I7QmsZUgv2ZX1nqkXAw==
X-Google-Smtp-Source: AGHT+IH14kXSDWVnE61doPUUHgn6AaXskMKTw4wsgHkX8mQ/smrmyUY0vNfZc8yaFA3Mfc3lOD46SA==
X-Received: by 2002:a17:90b:2b86:b0:2ee:accf:9685 with SMTP id
 98e67ed59e1d1-2f782c50be4mr50606198a91.4.1737842154624; 
 Sat, 25 Jan 2025 13:55:54 -0800 (PST)
Received: from blastoff3.cg.shawcable.net
 ([2604:3d09:c74:2000:188d:2e58:18fb:96c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa6a755sm4528085a91.26.2025.01.25.13.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 13:55:53 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Cc: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Date: Sat, 25 Jan 2025 14:55:46 -0700
Message-Id: <20250125215546.16759-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737842155; x=1738446955; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=neSfDPm7KPZ3cHTN0fzvKG+phOiNu+T0h3108wJm8YY=;
 b=K7/pJVDBLEHTWTHRVs6m2loizZaL+cWPNU1GHnkM7RUG1KcCMHPuCXawV0E+mp8kP0
 G/efJH8GiH8sItmQcNSy3jFo0MmbR7JM5pmO8yZmvIjw7y3mMaPhA6k9CFfFSW74Zvdd
 qJtD7Lkf5llAZK2143GNVgbNWFUEwK7YlztiXyW6P61+NqM6RfDCijORB7phrJdgc3aV
 M90RJRMu/JMJIPldyBDJ990E9WfwGc/SZxybMo/BHVzAmNxMDriXj/YUOCNxAEDSK3pj
 au9TM46nEXVCY+9M4wmkeby7KgnZykhimGGkfObK/9OcDY410WtwGm6G6CVpmVoMkrlj
 Egzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=K7/pJVDB
Subject: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to 2.8.4
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

From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_image/sdl2_image.hash | 4 ++--
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 53a887c6f9..c34e4c1829 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc  SDL2_image-2.8.2.tar.gz
-sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
+f7c06a8783952cfe960adccdd3d8472b63ab31475b4390d10cfdcc1aea61238f  SDL2_image-2.8.4.tar.gz
+a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  SDL2_image-2.8.4/LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 40b9e3c915..e058cd9f74 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.8.2
+SDL2_IMAGE_VERSION = 2.8.4
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
