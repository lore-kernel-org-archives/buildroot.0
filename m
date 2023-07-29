Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C7DC00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B14B41559;
	Sat, 29 Jul 2023 21:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B14B41559
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00vh73co13NL; Sat, 29 Jul 2023 21:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F9E3414E2;
	Sat, 29 Jul 2023 21:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9E3414E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF7C41BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0DC9414E2
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0DC9414E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5y9bgtUSEVO for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:22:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6F68410CF
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F68410CF
Received: by mail.gandi.net (Postfix) with ESMTPA id B7157FF804;
 Sat, 29 Jul 2023 21:22:08 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 29 Jul 2023 23:21:58 +0200
Message-ID: <20230729212159.403148-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690665729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TtO6cdeiJy4GqScLLxDjRTKwfBunxuxB90/QQo0EQqM=;
 b=nIhLcKVWAHv/TxMzVatypQVB6UY/HkJ0y/bev9F8+L2CqR69bfBXPsircimNSyn9o/3jea
 3UlaBRS5s6tJZSSTfgUlr9HIoGOw66tSit0W0PaZHaCPsWTlah5IFm5zoUnjZnbXqRPFUu
 trJcSxk8QStOVVuuBC4tfY5kjayvmn5TYRaonqXnttvssoWZyLsvpKm3QNfmgzRRXo7ot2
 Gn267PPGpSO5whREsRK6AA+6keNzZTYdIJHTPscbU9rFL+CXa4S29eqet443E2jv26LBcD
 tWZw+WAMrlWGv3Hd71nuLscrcIEbt5Rm0eeS1z6t+3aYKGdBET2M/9FUSpqXKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nIhLcKVW
Subject: [Buildroot] [PATCH] package/crun: allow building with uClibc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc now provides fexecve(), so crun can build just fine with
uClibc. However, argp-standalone is needed, just like it was needed
for musl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crun/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index 45c86f0655..1b69034459 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_YAJL # libocispec
 	help
 	  crun is a fast and low-memory OCI Container Runtime in C.
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
