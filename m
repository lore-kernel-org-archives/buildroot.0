Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47E6C83F33
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 16:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76F1681E0B;
	Mon,  4 Sep 2023 16:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76F1681E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riZrkL9F7pXC; Mon,  4 Sep 2023 16:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF40D81DEC;
	Mon,  4 Sep 2023 16:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF40D81DEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D812A1BF37F
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 16:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B13A681DEC
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 16:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B13A681DEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4R1QZ-CTCmIc for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 16:57:52 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B030381CAD
 for <buildroot@busybox.net>; Mon,  4 Sep 2023 16:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B030381CAD
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-401d2e11dacso15160475e9.0
 for <buildroot@busybox.net>; Mon, 04 Sep 2023 09:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693846670; x=1694451470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nI/V0KX9bVapFc4sP0wsXvGyicuGM3iDP0o5q0eWRAY=;
 b=K3gUWnKQd6t7ku0BeLd1S/VpvlpBGIlNCxwF6GBm1SVH8CipjhCAA+9QQ0+GcHgecx
 am/G1WaGudIKQvTHguMHJvfWfBQjvI+LveBxjBvP8H7+pwRX3+Ik17Xi3plsGgi7TQnA
 298jG/feqYXduzvshnmVFRcfeJfT3/XMujsV+i0Am0mp4eKoJWGpzru/y9q8xewmyFC4
 1m9WEBtx73va0sOs00RRHgdxWzFhXiJ4H3sfHdzdXVtdJQNoiAtceP95xe9LgwbwFUtw
 vTiyLvXhqNIKBWhT+AJq9FGrM6lshI6bsdSP6fh+XyKXdZCYMOQnIVcsu27itMzVE4Aw
 MUUw==
X-Gm-Message-State: AOJu0YybU7OGZHVZRsmE2cGnZrXTtXCr1kYidZXf5BRCBYSKEuQDRt//
 PcklkfPtoErglsPDf1+w5khzgE+65ZQ=
X-Google-Smtp-Source: AGHT+IGBP1uU59RcBR5opl35tJ2kdx4GNi2YSorLEG1UkLQ5ObuR8a/Of375re9atqEAjlDP8PpgEg==
X-Received: by 2002:a5d:4c45:0:b0:317:dcdd:3fa1 with SMTP id
 n5-20020a5d4c45000000b00317dcdd3fa1mr10434868wrt.34.1693846670286; 
 Mon, 04 Sep 2023 09:57:50 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 m9-20020a7bcb89000000b003fe29f6b61bsm14420098wmi.46.2023.09.04.09.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 09:57:50 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  4 Sep 2023 18:57:45 +0200
Message-Id: <20230904165745.1150674-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693846670; x=1694451470; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nI/V0KX9bVapFc4sP0wsXvGyicuGM3iDP0o5q0eWRAY=;
 b=c8qMF9ydK65huXWW2z2FYA3gut/c/YZxc6dTShF0gnKVaIqSooUbPc0Obf0c+yqtqr
 +Ij4hry2WmGc1NppCWTi5D+b+1DQYzOmRTIFNKXZkpA2oucdJnttwnSVm503DIs0eLnI
 Ini0ocwLl8bpH3v8HnUTKSx5CHvtI/VHfPzRhdEKHM/DX4DGmWSiiLrdWCmYbLowjVm2
 XaMdQocA3h9gNoh9qP1/TyXre4O8FaoWIi5O9Q+GilSwhlndMs1UyHH0kNblU3W3cyiK
 sukyYpnx0/Voc5M4nMu4w9pth/eOYgMNXhrJhMbSrhZudGPmfjpqb4M1t0UdhGZxWQUR
 nUUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=c8qMF9yd
Subject: [Buildroot] [PATCH] package/strace: bump to version 6.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index e6e9c4ec9..c43d3aabb 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.4/strace-6.4.tar.xz.asc
-sha256  27987dbac57fdfd260c6db4dc8328df35c95c6867c8a3d4371d59cdcf4eb9238  strace-6.4.tar.xz
+# https://strace.io/files/6.5/strace-6.5.tar.xz.asc
+sha256  dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980  strace-6.5.tar.xz
 sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index b109578a3..d2ffaafc4 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.4
+STRACE_VERSION = 6.5
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
