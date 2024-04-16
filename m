Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7C2C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 19:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A32B8404D8;
	Tue, 16 Apr 2024 19:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zyDUmdWa-uK; Tue, 16 Apr 2024 19:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 561D24011A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 561D24011A;
	Tue, 16 Apr 2024 19:27:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6734E1BF405
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 19:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5397C6084D
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 19:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6CS6fqZwQnw for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 19:27:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F65360796
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F65360796
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F65360796
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 19:27:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-516e3103d92so1531305e87.0
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 12:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713295617; x=1713900417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sNq9/J5ntxdMOgoT+b3zjQZQm0SusMK2LgLs0CQfAz0=;
 b=svysS7kI86RpC3E/6KfN6n2fQ2XsVbgOljjoIwrzjCCD26B2CchCAnqNPuK4De0Cad
 3fICnIaqRMfM02gn4t4scDcDHiK0Fx03X4nMkOKzR+gS1OHmGhPCoW/3wW7f/zZ3x1Hu
 lKsh/Q2wdTvNWsqfGxynQocOGdmyrk1cpKUTMw4toiz6wuJQkXzGY0QpkVwDBsz8cast
 h/8UCIVxfIxkeu5WaYHFvqJCfrihw1LDkVsf0E0wP5Cu2US0/YRW15dXXCis1xPHCgfF
 EucJp19sQDa3HjfHOsc13oVnU8pXIlpevT/b9BIM6nRxPI21BjJuH0qecDKFB2LapNIX
 AXDQ==
X-Gm-Message-State: AOJu0YxhgHY8rRwHBhkBEjJWW+yMPXoxvHIgM7lmEHeQIEIkdhHiOkwZ
 qKhH2OUCxerz5KMdnPj+U0D7U89DijBaXv3NdaVnku6572U/Hy8wlYIDRg==
X-Google-Smtp-Source: AGHT+IEKhdzVT4LeqoQJJjfSFSuiayZZklUbzbkxXVcR6HpOAXBvSe401xkKXi0/vURF8eXVKj4stw==
X-Received: by 2002:a2e:870f:0:b0:2d8:5af8:84c0 with SMTP id
 m15-20020a2e870f000000b002d85af884c0mr8437523lji.5.1713295617041; 
 Tue, 16 Apr 2024 12:26:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2a00:1370:817a:d2b8:b7de:6cff:8d95:8d3b])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2e3508000000b002d82f0f14c3sm1642036ljz.130.2024.04.16.12.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 12:26:56 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 22:27:36 +0300
Message-ID: <20240416192736.90072-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713295617; x=1713900417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sNq9/J5ntxdMOgoT+b3zjQZQm0SusMK2LgLs0CQfAz0=;
 b=cG/Zjv+klEJ7hRHsAUB0okHTtrXB9Z+b1kM5kD/3QpYN4qQ7qArmeQbVAHhaWeoJe4
 s7cXIduL1H6ofP2yXNYVBbWWwqEiS/lGjOQncGqZnGuRUmVCITORVnVzW8wNXCXsjTIh
 L9s1CKCfl9XZzQ3cCmyLZztTFaqtMlr+Obj0L6GSmYZXT+o/eGKaDTVzM2McEFLIRbqj
 VZ8VQr2WXGpPAK0NMcmUgWyaoHRSTpd6mn8urXHNekn7C+uZesBkX+BHaX7w1jFrTG/6
 EO/MTEVqkd0HIO1oHDV5pS4mGNugzPWo+gvMr3vxmRoIN4kV0JqbBgczCOAKdG+NfpNF
 cNpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cG/Zjv+k
Subject: [Buildroot] [PATCH] package/busybox: Fallback to -g2 in if -g3 is
 enabled.
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
Cc: yann.morin.1998@free.fr, Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linker process hangs if busybox was built with -g3,
so fallback to -g2 in this case.
The issue can be reproduced for example with
qemu_aarch64_virt_defconfig by selecting BR2_DEBUG_3.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
 package/busybox/busybox.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb5e7ad922..e9a7fce554 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -18,6 +18,11 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
+# Linking hangs with -g3, fallback to -g2
+ifeq ($(BR2_DEBUG_3),y)
+       BUSYBOX_CFLAGS += -g2
+endif
+
 BUSYBOX_LDFLAGS = \
 	$(TARGET_LDFLAGS)
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
