Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7798AC982C5
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 11:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97FD607EF;
	Wed, 16 Sep 2026 11:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTP9e4Yosvsc; Wed, 16 Sep 2026 11:09:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1E84E607FD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789556972;
	b=bvrmLWEM4+OGtK/3Zs6VOS7uCHN0Lp9LKO89YNBgGXC2LARF1dYr+95N/XPQRk0g0F9v
	 A+25NybOpjowtTJLbj2J7QjZxlgz1PxvTGMFkzKwGwEpGpT2ZmdmzcOOY2iDJ3B+RjX0a
	 mwnbhsJEpTLRa8g9KBlzr7Rfz9Lq1ad6O6ODxdcazhS2Y0vqbP2maR6fOlPneQQNpGklM
	 Rk2voNy9DxL13zmPDolwixI7tERs2OC9a3b9AiHGnrpX/t2UOGZybkIm1jqqW/5aO72lL
	 EeVf3f7rA6qSsgj0KUtCiJW0Kvff8p05AfWwDyM+QhS6zqbDUtiHfKPzmH4n0Es6HzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789556972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=r+5IDy13NwPc2ao9d4tuuM5UBowBDrQAKIdQ0+dGB7k=;
	b=W5WE6cVmpnyg/v6TBsjNmrbwsgK9YyX3dR1qISiAbzKm1aaxg5eOcnTGa8MsBgc+gM7R
	 tuj1JRCnuBix4wYv+bg+epmL/qGTFM4Zn2+Im4EyyM6UokQvQu1EYrgfFWZSAUC9pqySL
	 l+F5UMorxIbeGSRReryoQgB6libtEK0m5tTnLE2k4AvDJSWg8c69dYrckAjYDqga5bdkJ
	 zDu6uQjUJcOe3yL/yd+mf5W+KwExo9iKr5rnfNUsrD4YB6QMumV1afTasq9eRaASly+ih
	 pznTj1MLhZr8AEhKqDckIwmLHqd3SGRjzWp0rPcJkcdF6ut/5sPj+6M5L209MS+GHVg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789556972;
	bh=r+5IDy13NwPc2ao9d4tuuM5UBowBDrQAKIdQ0+dGB7k=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=NWCr+ZUtqUVvBLfjO2gQcWrfaV1YDxrH/NmyUAQ5Ne3OjOX+toimGxj6Rp5ww2PPt
	 7GFGb35UIUSTkbJ5dwLDlX7O6szVAFxK/yPxvJ/M8vghj8Gn8eY/fqcPCULeID0px5
	 GviC3Kv/LCIZdS7mb4UjNQT3xecsSVJqep3MWP46IQ+J6veIf1dQwWkIfhn/8eaHYM
	 lPdynKTTLNrE4wBbf7qn7m51MURDL+XnbN7t5bcTbR/M1WRnT7EeZ9t0W/PJjoa83n
	 LjD9VvbBt3xDmx5BcKmWp3nfWlxRkPHJQlSS8VSmAUEOWUFEAWnxa9TfWjoCGICv8Y
	 +rEZ8t7BnoepA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E84E607FD;
	Wed, 16 Sep 2026 11:09:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94F33DD9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AB98607FD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4TeLcwIlpbI for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 11:09:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9E891607EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789556968;
 b=pw7lPdj2WzpvTxy25tJma8lZ6fCQx/PLNtSo0ppWyHDWUXYD5TxhfiHn3Hk6Sp5i/D8F
 Nzlkux9/5O1lSdi3EI47KKafiJuIxPBGxr8PuVqlvhwi4lRSjo+YfR86eDgXO0wRf1AkW
 DE6TWBgalZb3qE7VC19XcV0CeCfzut42UlOUw6cOBQb+Ul7iwZ3GOY3YA0DH/xSmRQamp
 Hl3wau3uthYn9n1oF4E0CQg3LfpM0D4AgDBizSU0mububetGuR9QF0bla6hKtLYYK/3gz
 G9y+5WNPMzYx4AQxTWqCfQd1zCRXbZ+arWtgmfl0bXJWbp7pq/S5zMV8XFTZqGX3xNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789556968;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=cSYzar3r1okuZF25OkqPn8YH6yTo4ksMq3yU99if9Ug=;
 b=TXJaE/YUdFavHYWB9IELqEaZkJe718NX6eZF1BWnjFeG6Bcx/kGLmg7tnRLuH3IuQiFV
 h+JC+KES8HvGD3q9GM1Umz7j4RPxAMzqGJ4du/T1eTAAKlkAoR+Ag/XH51IerssPaVrl0
 1xSo40YWDpGsLEEflZxkuObyOn+9XsaTUKwAsP03xWQ2jVwRl//qCO3XCqaGq0Bwj13b/
 cE0ENt287107PSDQL1Ofr3VIU3HoSp2CFF3x0bvuI/ewX1ee+whdYLjggb4ZguXtqLep3
 rY1L1vtE6XJMjN/r5pETVTbr4jG2ddp69HjNvhUNUeN/tK7LMZXlL74DKUKKg6/ctEQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=EfGxFdts; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E891607EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:09:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3se8-1wgQtP2v0C-018DJ1; Wed, 16
 Sep 2026 13:09:23 +0200
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 13:09:11 +0200
Message-ID: <20260916110912.265693-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916110912.265693-1-fiona.klute@gmx.de>
References: <20260916110912.265693-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:PXOv1hICZfQldRqprjUwlLlxK7qNJd7Z/YCkghZ0r8UTT4NuKdJ
 ReJ0Wx6XrwnfdLqtsss6nEgxJT8fu737djsmTyqLnPj5v0jClrBRIoh47GpeNyMwZP3ph6W
 yt1/WqMN6w3uAz83U01zOySWrG9r2/bpQO7bL1PICQqFc7KQpDPh8pEwo8mDd8bTV5J77ii
 bg6LlSuRjbHryWbmx2AQA==
UI-OutboundReport: notjunk:1;M01:P0:BcXcL0AL6zU=;Onlgm5eNnC9Ke/+lAaNRCaQtlkl
 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
 Ge5VtV2NxtsX1NtACJouDIaDvw==
Subject: [Buildroot] [PATCH v2 2/3] fs/squashfs: add option to build verity
 tree
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* add BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS

 fs/squashfs/Config.in | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index cb2f5ec969..9773f5af20 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -121,4 +121,27 @@ config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
 	default "-Xcompression-level 22" if BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 	depends on BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
 
+config BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+	bool "create verity hash data for root filesystem"
+	select BR2_PACKAGE_HOST_CRYPTSETUP
+	help
+	  Create verity hash tree for the root filesystem. This allows
+	  setting up a dm-verity device for the root filesystem, to
+	  ensure data integrity. The root hash must be provided from a
+	  trusted source, or with a kernel-verifiable signature.
+
+	  The verity hash image will be called rootfs.squashfs.verity,
+	  with the root hash in rootfs.squashfs.verity.root-hash.
+
+if BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+
+config BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS
+	string "Additional arguments for veritysetup"
+	help
+	  Additional arguments for the "veritysetup format" call. Use
+	  this if you want to set options, e.g. the hash algorithm,
+	  instead of using defaults.
+
+endif # BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
