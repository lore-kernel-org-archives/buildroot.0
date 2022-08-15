Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50B9C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B9E840298;
	Mon, 15 Aug 2022 20:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B9E840298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbteQnnmC5v4; Mon, 15 Aug 2022 20:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 929304028D;
	Mon, 15 Aug 2022 20:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 929304028D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 414BF1BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A8D840894
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A8D840894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsVmTIFTwxq3 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:30:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE6CE408A3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE6CE408A3
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:30:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 9825C1BF204;
 Mon, 15 Aug 2022 20:30:06 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon, 15 Aug 2022 22:29:55 +0200
Message-Id: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660595408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MXF6W4I6QcVZaD0adYaxXrc8y9oE8Cw+2bWUk8hNXXc=;
 b=mKSqw3UiOGXikAD7zt3QT2FNVqveKayYEVKeoBYxdG/kHqZpXbwk9nreUhqUgUCHpogtR2
 YUp+Kjt7kaCKogV8CgH/3uuqgmhGP04S/DrKPVvZi2HKcsv4M9sWHRUoxjpgPSV2cECR2Y
 VUnYdN90N+p82/QD5mOv1094DKnFamJxSsMKrZy47ehrcMtOJPQS+/fjJ52CJV0I3Cl7c1
 GfNWY2QS9ALl11bXA8VivV8wkwrkW+sDHZDgtXlIZNhpA0XlCn+NnS7TjNItgLXNaY4qzF
 CC+wvrZTCkqfPha+E7egsmanv8La6TkBr3tjxMVKUlpBTmbTWNABHAcOwUUA6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mKSqw3Ui
Subject: [Buildroot] [PATCH next] toolchain/toolchain-buildroot: default to
 glibc as the C library
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is perhaps the most controversial change for Buildroot that can
be written in a two-liner.

Historically, we have used uClibc as our default C library, as
Buildroot was created initially as a test-bed for uClibc, and also
because uClibc made a lot of sense for embedded Linux systems, due to
its smaller size and fine-grained configurability.

Since then, the landscape of embedded Linux systems has changed. Even
though Buildroot happily supports really low-end devices, the vast
majority of Buildroot users are quite certainly running the resulting
system on a reasonably powerful platform, with significant amount of
RAM and storage. In this context, the benefits of uClibc are no longer
that much relevant, and glibc causes less "troubles". Therefore, this
patch proposes to use glibc as our default C library when using the
internal toolchain backend instead of uClibc.

Of course, we will keep the support for uClibc, which remains an
important C library choice, for space-constrained systems, or simply
for architectures that are not supported by glibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-buildroot/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 836af3b22a..9956dc4383 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -22,8 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 choice
 	prompt "C library"
-	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
+	default BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
