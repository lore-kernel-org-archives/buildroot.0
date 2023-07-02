Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD0FEB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 14:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B50AC810AA;
	Sun,  2 Jul 2023 14:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B50AC810AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rs9owxkrgSrh; Sun,  2 Jul 2023 14:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159F780EBD;
	Sun,  2 Jul 2023 14:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 159F780EBD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C58AC1BF283
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 14:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE3660792
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 14:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EE3660792
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGWHuCwqtUGM for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 14:48:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E53CA60777
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E53CA60777
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 14:48:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8EA06A4C01A0
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 16:48:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35908)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFyNJ-0002ae-18
 for buildroot@buildroot.org; Sun, 02 Jul 2023 16:48:29 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 16:48:29 +0200
Message-Id: <20230702144829.3356214-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688309309;
 bh=qkBJKwKe2t8FszW2PgzSs6v4N953gETktVsQty6RpjU=;
 h=From:To:Subject:Date:From;
 b=N4VwW/zoUeZPEd86sRzb7cAen/5k1KIKvAW8tPyTO2SVBgwi7DgjDr0FxER60xoUG
 E8F7hVa7ftKXi7CBaMOHeuWDo62COnCuexVyXpl6OXUspX0w8WRpD+CT2EaDD/gfKi
 eGEnbPbRWr63pYxTyJ0e5ad3Fe5eD5g6d51jSECtVcNmxA7XXJlmc0twLcdS0Nqkdp
 t25S6+h18lb1su+T9fnXhWwVGMsD4oMmybsJL0mjnZVMe0ygPMlcYkYwUJJIItjOTr
 G3n9n3KtGrXQarz6nGP9xXrKArb7nPWXhOLXlrgISruFrArj1fskl/Wk8mZ+PDBAUM
 5xiiK+W7/S5Qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=N4VwW/zo
Subject: [Buildroot] [PATCH 1/1] libgcrypt: disable assembly for i386
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
http://autobuild.buildroot.net/results/3df/3df96fe36802d8c6ac5487bf3d7d7b6c97591d5e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgcrypt/libgcrypt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 4fffe5360e..bd7b1aa091 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -21,8 +21,8 @@ LIBGCRYPT_CONF_OPTS = \
 	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
-# Libgcrypt doesn't support assembly for coldfire
-ifeq ($(BR2_m68k_cf),y)
+# Libgcrypt doesn't support assembly for coldfire & i386
+ifeq ($(BR2_i386)$(BR2_m68k_cf),y)
 LIBGCRYPT_CONF_OPTS += --disable-asm
 endif
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
