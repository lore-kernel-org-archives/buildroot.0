Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E3DFC9EF9
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 11:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DD7483EFD;
	Sat,  7 Mar 2026 11:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxWtfellNAtE; Sat,  7 Mar 2026 11:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B3883E25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772883785;
	bh=QtI1uJaVXAOatJLdqpRkp1jB0I/jXj+k9ryh+wyF6NU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=REgbKuGzHHQ6/xg+GFyD+44NWPHoM4oI8mV3Tjvp/3G6Mjai3/21nxDAikXFnlOyh
	 zm98Ihrya1r3yQFc1gkfqb0qV3j5hIIYU3OV1s/2pVvle7EAKBZ3K1dgX2pJ2v+tG9
	 op13odz9k+ZYGBWKE3QpL5sIARJ5V0DNoAFr+3OYhXOc+vg8VUuxf2+M1HC1aAef26
	 BzdZTfLsoN18pp4LnDVRWWcZ1dX4Mscs7XXFoC0SXJiYn0V03ao6WX+nUxEaugs4qg
	 nHlh3xJYrwAx4UDWfKzZz3fNBRHrD9Hlelmeitdm4ox4f5INT6saRG4HvBKRBxB7ze
	 Aj2KNWDgSJP3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34B3883E25;
	Sat,  7 Mar 2026 11:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05E0C223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF88983E25
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvvgmUUSBYiK for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 11:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4362C83E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4362C83E05
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4362C83E05
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:43:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1DEBA4C3225;
 Sat,  7 Mar 2026 12:42:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58846)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyq3f-0000000088C-1U0I;
 Sat, 07 Mar 2026 11:42:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat,  7 Mar 2026 12:42:56 +0100
Message-ID: <20260307114256.325624-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772883779;
 bh=xy9C1bEafjR2/+giouRa6HsQHIxETr9e46HRSEI1Obw=;
 h=From:To:Cc:Subject:Date:From;
 b=Re07W3i80+/m/t6pCa2SRBxUwLojpi43Cq2nvDbGp3gODoQUg5U3mRTbrmaRI8OUQ
 97sJmHltutyow/t4GR57P6G+kgtFpSeumdm9AE7ee8ouF/Wxlix44c0sFGlklyEJ5w
 lXOHui/Ji8moWemIX8IDY97+9AQOCH4XjXSzSZ4/eCNHh4JlzPXP5NnBAdBfhwQqFI
 UMTqolHDcdq84aBA18uGKxmYoqRGvVllPPo+HN7A9EWe8ZTJGOxcoOQYO2RwjrXF/Q
 ZfFWX4fkkUmoPx+utQG+b+sueX9qEkf795f8DJgWNzKomJ75jVJ7z+bfJdj7SJkdvW
 iXNROY+j8FzWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Re07W3i8
Subject: [Buildroot] [PATCH 1/1] package/pixman: Don't require vector when
 BR2_RISCV_ISA_RVV
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

From: Charlie Jenkins <charlie@rivosinc.com>

If -Drvv=enabled is set but the toolchain doesn't have kernel headers
with vector support, pixman will fail with the error:

"RISC-V Vector Support unavailable, but required"

When BR2_RISCV_ISA_RVV is set, let pixman decide if it wants to use
vector instead.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Fixes: https://autobuild.buildroot.net/results/92b/92b9bd978be699fb4b9e1e10693260b8401a5772/

[Bernd: added link to current autobuilder error]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
The original patch https://patchwork.ozlabs.org/project/buildroot/patch/20250430-uprev_pixman_46-v1-1-c1608b4d4bd7@rivosinc.com/
is marked as Superseded on patchworks but I could not find a follow-up
to it so I re-sent it today.

Somehow my review from Nov 2025
https://lists.buildroot.org/pipermail/buildroot/2025-November/790414.html
did not make it through to patchworks most likely due to the fact that
gmane.io rewrites mail addresses which might confuse patchworks.

 package/pixman/pixman.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index d02bb0a260..6157ee0b47 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -67,9 +67,7 @@ else
 PIXMAN_CONF_OPTS += -Da64-neon=disabled
 endif
 
-ifeq ($(BR2_RISCV_ISA_RVV),y)
-PIXMAN_CONF_OPTS += -Drvv=enabled
-else
+ifneq ($(BR2_RISCV_ISA_RVV),y)
 PIXMAN_CONF_OPTS += -Drvv=disabled
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
