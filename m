Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB77EA3F18
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 08:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 479B34043B;
	Tue, 10 Feb 2026 08:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3oYqPnudhrs; Tue, 10 Feb 2026 08:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C82D6403A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770711104;
	bh=g6zf3LmL7chEJEDiLIa9qnVd6RNZKtHl3M/6jPKiyFA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WKnQPo3Ja54pKmFUm9Tx9e8gQjBDPnKmF6jMFM/VGTWtT+7rDiYxyJyRXwtB5APS4
	 DH51f0gB8kADegL8G7ZRWD7QJgktMaDxoDkRVas2RIlXTvWz3KeejKBMQ4n6n5Ro1/
	 uhpui/jE7HlC4Guhj6Nf7O/mr+jjxmFcLxaoX+JmBlgIFRJAlZrHj/G+0vsC4j6Gf6
	 5DT/od+hZWd20pBhMHdhvxKGAsfB6e9VPM6hToBsOYOsioGeUVcUhaI1vz7xn6Ef91
	 LGYF22VWqkW67AzGkPX8gSyNiuOL3/SVg0zWlfy0kq+fnkLGmdCb3+npK0f42hQgft
	 kONOd809LLmWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C82D6403A8;
	Tue, 10 Feb 2026 08:11:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E43451A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 08:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D289460891
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 08:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkDIIxTjtVdF for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 08:11:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABDB2607F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABDB2607F7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABDB2607F7
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 08:11:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -221582504; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Feb 2026 08:11:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vpiqQ-00000003O63-0Xfv;
 Tue, 10 Feb 2026 09:11:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 09:11:36 +0100
Message-ID: <20260210081137.807581-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XkhH7bN+2vmWpG3w02atGvO4l1WPZUcZpqso1TVd08TLtOCXeCTB+CD3LYTbwrwB8GIs1R7GI0sIM+fgIed9HRs05Ql6iuoCRmCssID1AQIvbA49uO64BNgfWvT5xePeX0MTMmDJ7aw2qjSCJ1OyvB2gbdoyEJ+XIluCrIT9gXeHa0ubx5rsGh583K5oUddVjMNA/4jcD9mSXegdyni2ogDm5PE0SI/BeCYjcShF5fDoub5u/dPhXVA/bm8pSDa6pzKFMZ6zFc70bBdcIby9XnPHBUqkE2nNx6dxiUdqaEf2jkYd14+7paYHeFjsBcss31oquN14S5h3HVBk2xHaBQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=QS1DBDvzcDc1N9wO944/xtg1iMQl5RUhwD+8wx9BPQY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=XkhH7bN+
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libpng: security bump to version 1.6.55
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security vulnerability:

CVE-2026-25646 (High): Heap buffer overflow in png_set_quantize when called
with no histogram and a palette larger than twice the requested maximum
number of colors.

For more details, see the advisory:
https://github.com/pnggroup/libpng/security/advisories/GHSA-g8hp-mq4h-rqm3

Release notes:
https://github.com/pnggroup/libpng/blob/v1.6.55/ANNOUNCE

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 4cf8718cc6..7901f82c3a 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.54/
-sha1  3dcffaeb58daa7b754bebe93cb008342964d9f39  libpng-1.6.54.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.55/
+sha1  13f7bedf27009e59961f823cc779a5f9f5341a91  libpng-1.6.55.tar.xz
 # Locally computed:
-sha256  01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805  libpng-1.6.54.tar.xz
+sha256  d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d  libpng-1.6.55.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index d052fa7862..01c1cbbec7 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.54
+LIBPNG_VERSION = 1.6.55
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
