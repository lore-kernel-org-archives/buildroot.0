Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B9AD1BDF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C3D80E4D;
	Mon,  4 Nov 2024 21:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJrKaLcjth-U; Mon,  4 Nov 2024 21:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A939280E75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A939280E75;
	Mon,  4 Nov 2024 21:21:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B3973B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18C9760750
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxGN52rdTCEL for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F08F46074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F08F46074C
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F08F46074C
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:21:36 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso763284166b.1
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 13:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730755295; x=1731360095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6HTvwAOvXMPSsZSYUhAG6+riAKGEbOk2c8uOKAOKwNQ=;
 b=ZdQ+4DtrZ7C1F3g6l2NX4Sr3A1gQGB4C+SClzvBrEI4KvxvfQt0zhSwD240I++yGnR
 zh7XHjTfdWuK9wmP95H5gIhIacaf30AxoqLYXZ7Fgap0xzC0nskkmftdB/2sBUTyB6QL
 gULceuOY4MZD79w4uRoaTiD/TWgFOoR3NpsXU/Vc86WYAm/rLacmgby7u5pGnE11ivWa
 Is/d8DikYEzO7jvFBnPNCLa9YKzs/PoJCBHxtf9711sITGA416NkLOLrzky7aUvGYQRF
 siOXlG/ZzSqkpyVFumJRrCn3BxUFjowVmsiP6QZBRi/gxVSz9L8EsG/dek5pcXpFHuGX
 GuLg==
X-Gm-Message-State: AOJu0Yzz1OXKcEwfxh59wD2DO0ZmDFy7ZjD1htW0ikDG6VbJIEjwdRQz
 09ZFQtMCB2ECHDPm+DjTfWHAeEH5oF9NhaJ58a/ZHwbBm6VIZ3FTODOt3A==
X-Google-Smtp-Source: AGHT+IG4PgLJ2NnakwoHmr2AeMx/t6y6q9s0ah7HtJrzJMcjTXre35W+7+rqqUFRcuKeqOreUVXo+Q==
X-Received: by 2002:a17:907:94d0:b0:a9a:634:dd2 with SMTP id
 a640c23a62f3a-a9de61ceb81mr3365952266b.43.1730755294733; 
 Mon, 04 Nov 2024 13:21:34 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb17fa1desm31513366b.152.2024.11.04.13.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 13:21:34 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  4 Nov 2024 22:21:17 +0100
Message-ID: <20241104212118.1442429-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730755295; x=1731360095; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6HTvwAOvXMPSsZSYUhAG6+riAKGEbOk2c8uOKAOKwNQ=;
 b=HLi8B/LXgAwJtLUEODnPEQ9fb3B2zTdMKIYx5JXS/IVOOxpRsVhJjMAWu+IXoFn1ge
 MBR3uS+H2GEcamytZRIhv9siVNb/7D++YFo1+L4U9ueK9R1W+YLZW3G3E2Ih1O9AaHqf
 7S/FUg+2dVhKlecSW8T//cFHPpOs+Eev/ABvNPkE+dt5xOyyty/0JfClaQMcDNAU0a7C
 dG/UvxyOSbKkxb9WIXwD0hniYqmS0UvSY8XjCp8RyArcnSmZ1cdAyKKq/wf3DXpvLZJu
 yEts5Vu7kQtzzO1GLkD71w2wy5Zj2aJmvYnFrnt9+5+7vGGpHw08PMwonMW+r4y0ewMI
 et4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HLi8B/LX
Subject: [Buildroot] [PATCH] package/libtirpc: bump version to 1.3.6
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

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index b1113264ae..946e30b807 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  f5b209b2a7f3ffcdcff5b5b54fefc6a90ddec0d3  libtirpc-1.3.5.tar.bz2
+sha1  03352908461ad2122e5be4a678893aaa2ad2ac45  libtirpc-1.3.6.tar.bz2
 # Locally computed
-sha256  9b31370e5a38d3391bf37edfa22498e28fe2142467ae6be7a17c9068ec0bf12f  libtirpc-1.3.5.tar.bz2
+sha256  bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508  libtirpc-1.3.6.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 1020c512a0..2d2675895c 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.5
+LIBTIRPC_VERSION = 1.3.6
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
