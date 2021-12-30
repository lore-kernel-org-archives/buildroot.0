Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE80C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 21:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D7C340385;
	Thu, 30 Dec 2021 21:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vdlL5hh7LoR; Thu, 30 Dec 2021 21:56:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEAA840373;
	Thu, 30 Dec 2021 21:56:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25E6B1BF3C4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0784380F73
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQ3TgfCRW1IO for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 21:56:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id B317F80C0F
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 21:56:35 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 33PVnUUsoNi3c33PVnWXQv; Thu, 30 Dec 2021 22:56:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640901393; bh=MHyhafLby6nbdsE9FH56wD1o1saH/oYXYhj0ZWFJ1a8=;
 h=From:To:Subject:Date:MIME-Version;
 b=bgiYa4pFxOwFpDo5Bk4VTqvQPVLzFPGiokFeILv4Jv47M2N4Vgw9egwAWe/OBZhw7
 h8M2W6+XbwATtgrj9Rq5CQzqW8ZXpuUtrzZ9KwRwdHM+tASivz7fvVAEO6UutQTcbw
 C3iONjtbnFF+DhTJ8LA9kvdMIDAYBYelY1tmwe7eUeujwOHb6FNmF3jzxURu4xwnv6
 8BqXIiNc5ej4BrpQkRucIMuwctxWySSs9qS/vr5az+OfIcGJoY2GPwDdVsKam2r+/Y
 /WeE2/XGKZdjCszwwZD17kIyXpSnW12HOvgD7WGM5tGU+h4aO76sIewDrez694nG7T
 4DWxAsm4A3p8A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 22:56:31 +0100
Message-Id: <20211230215631.2024770-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKLEZGMxWDRx2oQQZ+hdFX93bhZWh6pe6s7GjfLuhDaZmBL/AM+6+SxtAfJ43pPzbdqGeFxekYVTBIuUrOTtZwkmKdUGeeIsTXFABVTBC1jWX0jnSW0V
 2nHF+K+LTD42QG7/PbsTGnEvXoaqqmAxCgYshL6OrrtcK1GGK3ww6Z6W8qRM4/OFXqJj3qQ8cg9hjcjNFIRG872Nkouu/Ef5BeaweejrYWgmvbggZaGgpzfu
 k9yapg361TQioG8Sj4fDPcgedYUdrj21vabUfWiSo/IHbvstU01ZVATTcFzg41yu
Subject: [Buildroot] [PATCH] Makefile: fix build failure due to buggy 'make'
 version 4.3
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make version 4.3 is buggy in various ways, so let's skip it by checking
RUNNING_MAKE_VERSION against the SKIP_MAKE_VERSION list. This way, if other
make versions show up we can add them to SKIP_MAKE_VERSION list.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 0b8c7b2867..a07c05f8aa 100644
--- a/Makefile
+++ b/Makefile
@@ -105,6 +105,12 @@ ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MA
 $(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
 endif
 
+# Check for make versions to skip because of their bugs
+SKIP_MAKE_VERSION = 4.3
+ifneq ($(filter $(RUNNING_MAKE_VERSION),$(SKIP_MAKE_VERSION)),)
+$(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make != $(SKIP_MAKE_VERSION) is required)
+endif
+
 # absolute path
 TOPDIR := $(CURDIR)
 CONFIG_CONFIG_IN = Config.in
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
