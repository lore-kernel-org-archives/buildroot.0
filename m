Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF219C7EE2F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 15:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28ACF80BFC;
	Mon, 12 Jun 2023 15:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28ACF80BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCq-AxcGlr1k; Mon, 12 Jun 2023 15:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 721218208B;
	Mon, 12 Jun 2023 15:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 721218208B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 855DF1BF285
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A39C41517
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A39C41517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17p4eDbJRr6Z for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 15:21:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E26824150E
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E26824150E
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 15:21:53 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout03.t-online.de (Postfix) with SMTP id 1492B42D2C
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 17:21:51 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.180.237]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8jMa-2NiHrN0; Mon, 12 Jun 2023 17:21:48 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:45842)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8jMa-0001go-0U
 for buildroot@buildroot.org; Mon, 12 Jun 2023 17:21:48 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 17:21:48 +0200
Message-Id: <20230612152148.424853-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686583308-49620266-DA6BF88B/0/0 CLEAN NORMAL
X-TOI-MSGID: c9cce5f5-58c4-4e70-901a-118c06768f1f
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: disable asm on i386
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
http://autobuild.buildroot.net/results/933/93330f9e1867b1ddc1de19b57d70d223b6f23994/

Code failing to build on i386 was added in libgcrypt-10.0.0
https://github.com/gpg/libgcrypt/commit/9d909cb67e70fd792926ac1e2ab305b2cc96bc27
which was added in buildroot with commit
d96b9ed0738bae270c479bdaf21eebd4c1f9930d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgcrypt/libgcrypt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 9232debb3a..2c4743d306 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -21,8 +21,8 @@ LIBGCRYPT_CONF_OPTS = \
 	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
-# Libgcrypt doesn't support assembly for coldfire
-ifeq ($(BR2_m68k_cf),y)
+# disable asm for broken archs
+ifeq ($(BR2_i386)$(BR2_m68k_cf),y)
 LIBGCRYPT_CONF_OPTS += --disable-asm
 endif
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
