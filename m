Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C6CCA47E
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 13:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BA540288;
	Tue, 26 Jul 2022 13:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BA540288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elL6iKPbQgB5; Tue, 26 Jul 2022 13:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E1EA40167;
	Tue, 26 Jul 2022 13:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E1EA40167
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 748CD1BF2B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D7BF40167
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D7BF40167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v9FKK6fp08Yr for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 13:13:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87ECC401DD
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87ECC401DD
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:13:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 21CDE24000A;
 Tue, 26 Jul 2022 13:12:57 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Date: Tue, 26 Jul 2022 15:12:47 +0200
Message-Id: <20220726131249.2009383-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726131249.2009383-1-thomas.petazzoni@bootlin.com>
References: <20220726131249.2009383-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658841179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvkw2Qg2yeYeOkARRfBfC9z1NabEHZ+r1pe3vPLjoW0=;
 b=poGU1iJCBET31ccI5Y5dwpQVobUmAlJxPLMN1jUI/c0XLE1tmRELt+YNPacS4fYxbWJSqv
 eKqmqCdTxj+m08M34+ug/PwyDMfz1zr0obOSB2lYDYxUAnTy4Pg0HzgLKFYs0PXu+89DwO
 vqGVv9IpJYESLI9g1RonxwB3QAWY8cRoztI39ngh59O/b3YF4Gx3AsI0zn7dJ3k3nxJJjJ
 PwSXpRoAfZK7lgPdsj2fKMrOwwsQKUyRTIuOLgRhz6K8f4xibwI6BNa41u8njpEXPYieWk
 JP/Nl/CfeVOUUhw5qAcPIxFG0PUZ86DaQqgznxxGeINmwQcEifkNTsKO9JKDUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=poGU1iJC
Subject: [Buildroot] [PATCH 1/2] package/uclibc: define
 BR2_UCLIBC_TARGET_ARCH for ARM64
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

So far, BR2_UCLIBC_TARGET_ARCH had a value for all
architectures... except for ARM64. Its value is passed as ARCH= when
building uClibc... which is currently empty:

/usr/bin/make -j33 -C .../build/uclibc-1.0.41 ARCH="" CROSS_COMPILE=".../host/bin/aarch64-buildroot-linux-uclibc-"

And also in uclibc.mk, when we inject the architecture in uClibc's
.config:

        $(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH))
        $(call KCONFIG_SET_OPT,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)")

We enable TARGET_ (which doesn't exist) and set TARGET_ARCH to the
empty string.

Nobody noticed so far, and it happens to work because aarch64 is the
first architecture in the choice of architectures in
extra/Configs/Config.in in the uClibc code. So, when the architecture
is not specified, aarch64 is used.

As we are about to add some logic in uclibc.mk that will use
BR2_UCLIBC_TARGET_ARCH, we noticed this missing definition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2eea4d30f3..873d2053c8 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -124,6 +124,7 @@ config BR2_UCLIBC_INSTALL_UTILS
 # uClibc architecture names.
 config BR2_UCLIBC_TARGET_ARCH
 	string
+	default "aarch64"	if BR2_aarch64 || BR2_aarch64_be
 	default "arc"	   if BR2_arcle || BR2_arceb
 	default "arm"	   if BR2_arm	|| BR2_armeb
 	default "m68k"	   if BR2_m68k
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
