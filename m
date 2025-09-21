Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C194CAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 20:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F9184121;
	Sun, 21 Sep 2025 20:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yISF0kNx3GU; Sun, 21 Sep 2025 20:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F5984123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F5984123;
	Sun, 21 Sep 2025 20:52:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B2B8E7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6C1A840EE
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 20:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AkfFz9p_T1i for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 20:52:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C24F284129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C24F284129
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C24F284129
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 20:52:56 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-8c27f68ab99so18382739f.1
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 13:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758487975; x=1759092775;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EZHjIzhoWiMKUmlJSd1sSlvyBzYFkk2V3ye/pcN5U+0=;
 b=Xev5+ec2bD/LN/q39vpDwoXaZVRnKaoudLEg6Alt8fxQ7706uhv94tnsJi04v5NlSu
 XpWtVWo4wuUFSQCUigvwIl45AOWNjYkO9BTOl86d36/gS8fD3XNpBp94/cv8jotJWRoW
 82BuCzd6gzTJn0xkhsScrcoL7dVJoN0sIKQ/KiUyjhHh7M4mC7bAeIVJPEbPXHIiAmjW
 NklO7WF+b92aLQMnzrf7Pm9ZtT2uGuxAeou7D2Qx/lvY40/9u5fayiDv53GTYrG/M9Hz
 WHNFdW2+9zEnanxapQUqx/z/Pg3a69tskbne60bgepgOq7pa3lyKgpvHKP85hSvJctGi
 iunw==
X-Gm-Message-State: AOJu0YwiZ1blTH96fNOW62R/YvF3Eas8uy3UENpQgHAkrwip3ds2LAwJ
 M9sG62qdhcZTdN/ZR6wMGVk+wFem+AGInJV9JkkiKPkq023u7BLw1K4LP8iTxA==
X-Gm-Gg: ASbGnctNLixF/Ey49r4j8D467QIugvuQ0WDblze7InaFT1yw6zOR2GEg5YvLF+uiweM
 2EiG3x8/qZNP5Pw+g7afgRTZ7DCsysyymY3xdr+7lR7dtBPZ+hGSKnOzQ0/WyIn0ml/aGW7Vok+
 xH6zdXFxu/gEYykNsfNIhNQsnP7bR3eqQDB2aORYr2HK6ABBuELWzR3A645uAlvyRKOGw+jdrno
 cxF/CqN+n882xYoaNz6lpoEltiY302SjhKMzBLVpGILdIFrxJexAeV5XQ9wxyzenymO7MQItN0r
 g3PElW2jp+6PBtVtKg+H2nTDYglZvAPLaez+PRCKdc09uZssyqr5xbTd6PNQdZyM3BZ7N7TownQ
 oo7g8zwUWAxOKYZqhX8rTEZlhwtdx2NC0BnOXOo1xqyROc6pZBsQ66dyUkKw3UVEmW3itci0oKA
 ==
X-Google-Smtp-Source: AGHT+IHzbEAKSF3rlaBP29WipJTfJ30SZ2EUOJxW0e77Fde1oy5WRJXAxU+qAAmpgOTtRnW9W/Bh9g==
X-Received: by 2002:a05:6602:3ca:b0:8cc:ea63:79ad with SMTP id
 ca18e2360f4ac-8cceaeccfd8mr44968739f.8.1758487975506; 
 Sun, 21 Sep 2025 13:52:55 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8a46ad38052sm385108339f.5.2025.09.21.13.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 13:52:55 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 21 Sep 2025 15:52:53 -0500
MIME-Version: 1.0
Message-Id: <20250921-bats-assert-2_2_0-v1-1-ec1f45b9f3ac@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKRl0GgC/x3MMQqAMAxA0atIZgOxKlSvIiK1TTWLSiMiiHe3O
 P7h/QeUk7BCXzyQ+BKVfctRlQX41W0Lo4TcYMi01JHF2Z2KTjM70UxmIgzexrrzbaAmQHZH4ij
 3/xzG9/0AAM3uCGMAAAA=
X-Change-ID: 20250908-bats-assert-2_2_0-dc8f39c5d04d
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758487975; x=1759092775; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EZHjIzhoWiMKUmlJSd1sSlvyBzYFkk2V3ye/pcN5U+0=;
 b=lzczjfPju/rJixnnlUU+zntDa4/YmPb4xOYTKeGqiRHU/BODdSgaOu0HOMebmpio+0
 1bW6LrqwI68uZ3kQ32nv+H76I0WSYNbu9ejfzw3cVPPComP+C9fSeJb8MLxdDUFlPg68
 AT4BeNiWvuvrGyZbjZY0T1pUcY59qkTwOev2jWy3K+vVpdSJ7wCZqKAy75b3JlAKBzW9
 4zhF5KdNUYV8wxYLXALTMq1XV1ma1svhzyqXNFlsGfFv4Pszqz59pN3Zgjphw6ZSNTvf
 olAoNLQpF2u6BaCWTxK3FV9sU7onEoSwO8VJB21BXhhq2N2JxEvUdwRSMQQ/ST/qxkSM
 buwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lzczjfPj
Subject: [Buildroot] [PATCH] package/bats-assert: update to 2.2.0
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

Release notes: https://github.com/bats-core/bats-assert/releases/tag/v2.2.0

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 package/bats-assert/bats-assert.hash | 2 +-
 package/bats-assert/bats-assert.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-assert/bats-assert.hash b/package/bats-assert/bats-assert.hash
index 94c3908ab32443e07d395de89a8c1d635f070300..449bd14a26d557ca7c55d7e3429999720c1b85ae 100644
--- a/package/bats-assert/bats-assert.hash
+++ b/package/bats-assert/bats-assert.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  98ca3b685f8b8993e48ec057565e6e2abcc541034ed5b0e81f191505682037fd  bats-assert-2.1.0.tar.gz
+sha256  7ea3b60f495a3c4fbaeb933f81050749917d7dcff00ffdd821779ed211b87cc2  bats-assert-2.2.0.tar.gz
 
 # License files
 sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
diff --git a/package/bats-assert/bats-assert.mk b/package/bats-assert/bats-assert.mk
index c0e37e0048b5766ae5ffc0b2be1233e406f4c74b..dd48f2d59bc34c2299f93d726dbec63a7b6937e8 100644
--- a/package/bats-assert/bats-assert.mk
+++ b/package/bats-assert/bats-assert.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_ASSERT_VERSION = 2.1.0
+BATS_ASSERT_VERSION = 2.2.0
 BATS_ASSERT_SITE = $(call github,bats-core,bats-assert,v$(BATS_ASSERT_VERSION))
 BATS_ASSERT_LICENSE = CC0-1.0
 BATS_ASSERT_LICENSE_FILES = LICENSE

---
base-commit: e8be2cbc168d9ecdba350646862560b8716d54ab
change-id: 20250908-bats-assert-2_2_0-dc8f39c5d04d

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
