Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D962C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 18:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23E85606EF;
	Mon, 20 Jul 2026 18:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOp_c1erEG_a; Mon, 20 Jul 2026 18:47:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B87D605E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784573220;
	bh=dAy8pUhK5bmkLA0NHE9jqeHzHgji75l7Q0XzrAiHux0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AASQdt0UnS83iy9zP3oPUGQLEAZ6i59rTHgaetPLQWCCkoFhPv0PrbY4f5WPFbM/s
	 oLHuG1IdnaMh+9ycfDHy8jDe668gX36ibhNaYPTlqzvqKfuoQAycJVRHyOVu7lEUYM
	 jGLhaT3Vm8quS9J40SM2HPmSjOnm5q7khFp4ZZTKMjgoKiHejKnvJPbyYzhiHnZc3o
	 2u2gmwjDne3VB1d8ibcAHk7Nd4uFEOZItL+RnvPZtJ+ELvH5J/Ob8Tbt7gukfJ1AdG
	 FRlVT3gHhY6ImI7sjMdYG+egNJpIXiLWkRA8SiIYdRpCb8M2STchfTiXLZMPCz/KwU
	 FreekH39HFOuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B87D605E1;
	Mon, 20 Jul 2026 18:47:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7243DB4
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 18:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C985B80C0C
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 18:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DU3F4wPklEm0 for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 18:46:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12DC280BF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DC280BF0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12DC280BF0
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 18:46:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47f7444576cso1133354f8f.0
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 11:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784573216; x=1785178016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZTlDlDBF9SuOslqTTbE2kY4VQakkXk/vC6UQAOR/9no=;
 b=j4S9qKPdY+1YEhImdDXwR6yCqQLBmpLtw73ZBDkKOCw9inrtI1DSpCK98/qMT0OaoB
 FAxvZlXtaU7stLeol24cbfTF5yyi/i7GoCAsPFyFJxyaEH2acBtjXPX1dJ7U0n6QmWBH
 HXmFHdqtLnXWZWR3IWSyWuAYFgSXXv85Ka7uYMiQ+N8GDvLgLKNjrivEGZGhWnnTX23q
 ulKaVkrhV68sww/zRcZVXYvJbdQKdV/3uVBTJj3MFBqmy3XR1i/agV5+1jw97wDuCxA3
 IBQZ/NRxxKueSL+poYNsBfOcZUWXgAJv8Ae26U1ArD7xRnJf3hlZsULT4RfC7bjqHL+Y
 sv9Q==
X-Gm-Message-State: AOJu0YytALR35CTCUC/3twDbXjKmbKVOr2zxplInTyfkL5TEvn3Y0To3
 xAciT8IooLz+wCnOyWudPwmI9vsmukPXl1B/KzwSTKUjjFBwwzMhqZ0YDG7K3g==
X-Gm-Gg: AR+sD13oV+vDlsL6FltneAa4OrlQNsqoK4VBAamWLY1PCW7NtsBSCGnBRuJ8vRzW1kj
 1uxEpNL4G+lFFXHbMJPPrnoPMTLP6we6bDSIVcMJ6AC8M13ZoQD3PRvCUtdwv5Qhp9HqTA6u9T1
 gv/lu+Q6yjBdB/XZF2saAzfEX9uskqi/DBoX4qcKo4csW+pTHVAL4EQoJDo6oiYOgVAHvbWCVCL
 Gd+qlV1RRkslvdcKbGP5VMLQ0KXdtEvThw+xoj8q2z9v+Fz3cqKBwXxjhHXrA47kLFJ/BVCeWze
 BVem+P2GrZqeijndkvJr3W3p2bFlBpSWNQiJyAp/zwqer3nZuxlYZabng9MzyCsLB2u8tDqk6T8
 CQiSzZ7YXyAq1vpAGz7HcjH86YfahZ3XXlODHPJWpJb+yyMMxqoRVvR9X+pdZJeI+eTkAm4JG6Z
 A9K+eZil61CYYwayDS+H3nHJx2aFmkOPNUgQ==
X-Received: by 2002:a05:6000:41f8:b0:47d:ef25:ff3b with SMTP id
 ffacd0b85a97d-47f623380eemr18412666f8f.49.1784573215853; 
 Mon, 20 Jul 2026 11:46:55 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eea8afsm33705935f8f.33.2026.07.20.11.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 11:46:54 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 20 Jul 2026 20:46:52 +0200
Message-ID: <20260720184652.252941-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784573216; x=1785178016; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZTlDlDBF9SuOslqTTbE2kY4VQakkXk/vC6UQAOR/9no=;
 b=VY/8gS538hDfO6dOCeh9FRs9CYk3dld6lPQbkfwpzunPvRjjqt6x0NdX1qafSQ9EJn
 XQfvzsZTVeLXiQMs7sW1NA5m+m78ALUu2I6Jc0s0fKHAYVynSgPqzVO/EF8kXGPNQyZG
 MK06grmNcGmXMEy8RNQXaal+uYGCw8BslPS5mOlF02JOItwq3y0pSqs4Am2oHJBd5lJq
 jf2M3t6nizlLSFvDwSqxFOyJglxpAMTIeRKHMkH0Q/ma+8L4s0y4+wBf7a/VBg9Zfpb/
 tJBoUxpOYWddpGnK8EtRGEN4CUgDFiaMtYC2iRYU5fhlvYC5d2Egr8UkFZZIKULdvFBG
 CVTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VY/8gS53
Subject: [Buildroot] [PATCH] DEVELOPERS: update email for Francois Perrad
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c5d6dbd8b..934209d7d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1162,7 +1162,7 @@ F:	board/visionfive2/
 F:	configs/sipeed_licheepi_nano_defconfig
 F:	configs/visionfive2_defconfig
 
-N:	Francois Perrad <francois.perrad@gadz.org>
+N:	Francois Perrad <francois.perrad.86@gmail.com>
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	board/olimex/stmp1_olinuxino/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
