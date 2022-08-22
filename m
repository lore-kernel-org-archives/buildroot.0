Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2B2C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 10:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A1360D71;
	Mon, 22 Aug 2022 10:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4A1360D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id estPi-wCKyZG; Mon, 22 Aug 2022 10:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97EAB60D62;
	Mon, 22 Aug 2022 10:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97EAB60D62
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 693EE1BF383
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 10:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EC4440941
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 10:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC4440941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBpFZ12Kotmh for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 10:04:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9626408D8
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9626408D8
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 10:04:43 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id r10so5799449oie.1
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 03:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=9TWVeY5wBGRiFNYpuLMZoTlpOUF+joHz7hEcdnQSjrE=;
 b=UdYd9tcLWLdGcSVKT0QooKXxDrXB2jWbicfUKkDkW6pmWtAZm6zWuJrJUWHsbNasez
 LuKbg1Dmx9g6iolcBqQOeTEitJT61hckwpDnCF0OTN+0CI6x2GnN7C5xxxmDLR6yFXBA
 kjZa9/vyK77VOy9THNno6dpOlOWCZk+wmiq63WYVOn/EhG0kxM4v8NbjrmY1bZVoi7Oz
 1rLQD7D9Y15juvKoMxk9h7U/LePUhG6S33ho8eZS9MgQb9ZRG0MRl46hYfjZ0/DeNkcT
 3Htvu5NZ4AMCJXNKuLmghKMb0xywswXbUbJnSZmvw3hUDxLlFGMBgDL+6rcePLpbOaXd
 AdmQ==
X-Gm-Message-State: ACgBeo3RRdEqd1qWwmbyQXLjUkg2PL0BSIwMAui+G3HunVZKasfFT+4Q
 X8S2PG1Lyvozro4L2xAbx3nv41VXazM=
X-Google-Smtp-Source: AA6agR6gDwLhJf/pNutHth93ugaE+DgBBmwaqgnLe4BeMOq8CfxmIauzkuY+xyD+ODvxXoxyn2Uf8A==
X-Received: by 2002:a05:6808:1148:b0:344:e58d:7449 with SMTP id
 u8-20020a056808114800b00344e58d7449mr11080955oiu.209.1661162682417; 
 Mon, 22 Aug 2022 03:04:42 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 g18-20020a544f92000000b0033a11fcb23bsm2572934oiy.27.2022.08.22.03.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 03:04:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 04:04:33 -0600
Message-Id: <20220822100433.3998253-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=9TWVeY5wBGRiFNYpuLMZoTlpOUF+joHz7hEcdnQSjrE=;
 b=HosnrSXhdSH8ETzKJR2FwtF/req838doVxKG7c9dPnpuAtkCWti4gZ98fWelB8rjVX
 NKvE+Sdf+jxx4VO64m/9ZwEElQmmOVpUHoJH3yDVNyPsyHSJUtJeMlpl889zMBYLlMXH
 NqNQMB4Bdkbk/FjoNaKR+8f3kqCmo+2LRQIuVYafEU/R9OQWRcceieCHxuMrHn8A0nST
 FvAKBrUqR273EF+dGU763E4OHAE0VbWcSCBUGaAl8VNkJf3teTCKMuFsVZMGFaeln9n3
 hAEleWgbngBoD0R3E4hqKA6F/3ILYw5cXgQpWXezd4IrTO0M1grtVs2fS2XxDOuhK1HM
 4x0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HosnrSXh
Subject: [Buildroot] [PATCH 1/1] support/scripts/pyinstaller.py: revert mode
 back to 755
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was accidentially changed to 644 in:
d752f73b0c0e4ba50738cd1e7f4472f61fce9089

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 support/scripts/pyinstaller.py | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 support/scripts/pyinstaller.py

diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
old mode 100644
new mode 100755
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
