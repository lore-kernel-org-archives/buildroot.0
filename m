Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57324C001E0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 20:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9728D6117A;
	Wed,  2 Aug 2023 20:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9728D6117A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S39v8DifShJf; Wed,  2 Aug 2023 20:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB4D60B6A;
	Wed,  2 Aug 2023 20:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCB4D60B6A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 443D31BF8C7
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 20:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A239840491
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 20:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A239840491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5es38liJIkYn for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 20:31:50 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27613401E1
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 20:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27613401E1
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 162E3A4C00BA
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 22:31:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46832)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRIVW-0000Vf-1X
 for buildroot@buildroot.org; Wed, 02 Aug 2023 22:31:46 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 22:31:46 +0200
Message-Id: <20230802203146.765631-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691008307;
 bh=lvDVQPsAOlb39WwMnlCGNXxN57Rr9jcivZrB0Svd9Lk=;
 h=From:To:Subject:Date:From;
 b=YqeDMEaUK1/3RuwMA+z/dB/62AUddWgMeDOBGyS+8MjDu1k94vwvHohGGlCXs1/GD
 cHQAQvR1VfAUtIJyXYoc3/mvLnWqgvVi6uk3G/1cpC6xKl/7eI0jpgvkMNO7I6wceX
 bwOOESicvqomjPQN7FxfMVMoHzt7elSqLS8eWVrF/RD/FPaJmyhmi/rokQMZaRP+e4
 Q4MXLSflRHAxD37jYCtdBCOjHAeLtx2eXMg0b0ezUPEp/kKFkL/9wgzr5u4QnpTsOp
 TrAqkWwplLg0oIhJsS7O+2so+ntKfN4vJ5AgZ/9k2i33pigKcLcJ5faYBZtrQCrRHQ
 uZbPLKvMm3GlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=YqeDMEaU
Subject: [Buildroot] [PATCH 1/1] boot/at91dataflashboot: force arm mode
 instead of Thumb mode
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

Fixes:
http://autobuild.buildroot.net/results/68b/68bf2291201ef1882d8e8d3eca2b1a5ad731e4b0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 boot/at91dataflashboot/at91dataflashboot.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index c66f27e343..cb329a90df 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -11,9 +11,14 @@ AT91DATAFLASHBOOT_SITE = ftp://www.at91.com/pub/buildroot
 AT91DATAFLASHBOOT_INSTALL_TARGET = NO
 AT91DATAFLASHBOOT_INSTALL_IMAGES = YES
 
+AT91DATAFLASHBOOT_CFLAGS = $(TARGET_CFLAGS) -fno-stack-protector
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+AT91DATAFLASHBOOT_CFLAGS += -marm
+endif
+
 define AT91DATAFLASHBOOT_BUILD_CMDS
 	make -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) \
-		CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector"
+		CFLAGS="$(AT91DATAFLASHBOOT_CFLAGS)"
 endef
 
 define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
