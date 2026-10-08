Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345BBCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D0060EBC;
	Sat, 10 Oct 2026 09:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdgDEJj1sn6R; Sat, 10 Oct 2026 09:27:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F38DC6090B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624464;
	b=Ak2ZEYsi+qZXmVzP/KrNyrtt8QRF/CeVi/B7DNw0ZKitruNIq+dVbBZcCdhFQ+l+HvF9
	 b/hYtRO6pId1pgV8bltVZoOjyBY23Df2v7rvIxQjLKi88p3lbo78h0nEr322js2f8Rk4i
	 MBfhyvxiW70aKpTrIJAzVJkxgMIDu+b7D6JzJesYvJiSh1KHSonyQyw6idNWBO0WylZm2
	 eMHmGBBJlFQHjRDpKngmlKtw1S8MiDQuFk+1TH6Bl3I2qEx+9UnnkR0i9WCpH6eOETjy9
	 y4hdBJuULGXErBaiuqAvAf0DlLjMnhtvvvwM8UgmhkWlOh94ICGqmFSjxuqF6k7VaXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624464;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6TbJhcrPE7/lzR40Y3lskxTQBlRoX38F9VWKCiCjTRo=;
	b=mjHfhv9vuWerOK6kfwqgHqUq5sClSGwmckWpzk5ZEaeK7qPTwyKrF5fUKBUiIwXj5Mz4
	 +Umt1YMvUoVfJuL9kB/nx39HyJ0jE8+EbBIqprdFLcs9y2pnWZP89Br58yhyTmj99+RyW
	 2y3H48UvSwPPP27I0RshN048Hi+ORgbtqvJT7LSIuVvoIN5npbCWL9ugqueOXRdiJ/rGQ
	 NGZsAh8kWHLknd9u9u8U6n/wNoWGINAc8MrTu6NTiMAEiSPA6qsBxhEBsofw53tNcrWU+
	 MFlz+h28WGl88MYYNTh2bDwtnM6fTeyNcmIdNENnz/pOZwh9V2cYM2OR6I7MsaOGmiw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624464;
	bh=6TbJhcrPE7/lzR40Y3lskxTQBlRoX38F9VWKCiCjTRo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GRuAgvcWe7Njl+/yCs0Rp1zWuzrFK4KZrPhnEpV4ZWaCKqRSnbRG+ikdlJKtZrANm
	 rLnWyqcv3FOu5Pdjts2NagLCOR0z3Rl0rmYcQ0M+GrqWgzoB7Ty3XDUblLQooDuMJ/
	 u7d9UDvxChdBFTsHEpm3YFj3IHwbkl4F9mEXe/sWLdmecLMV9DZ6vpJG8u8Lwe1Z9E
	 W2lwWZKezNBVSslEJzmpBhnvgbPWufdzX4QiLao+3rqqIWXH6VrBDpamP+JdS2jfSp
	 LXhaYc+73ITVd1JGEDaCysUgp8TzaICQqFKnjq7mVI/HJf/NmqyhfzKd9FZFCr3Zrs
	 ntUlFonUYcXXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F38DC6090B;
	Sat, 10 Oct 2026 09:27:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 897CEA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7774D811F1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQNbSfb9fR8C for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9A8098111D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=VryHnnEolKGnRFQymgwcVsp/o18L+jYzV9Araidsz7J6WRIrJyZau4nrgExTvCpF0TbB
 YsnRZlTXCbr4A8z3kKkAy+HZ5UZJOKppbw0WsRkzPxelbPJnao3vnIz+CsbmF2arY3sEE
 t2va/yE/YVHEvgFCYRgoPtX9ybJk2dTTaaS71hxR97/RIYNU4yhq+/Zb9naCa70dpGV19
 Zh6mYXkktMYziM0I3zmSGu5tUqPAuXr6xghUUlheJqE5Yh9GnyoJbaGOa/0T32QYu6ivu
 /d2ZZgaEx9bhikGi5bKrlHk3POR/c2e8onhOSFLY/2gn80rb1MJxOxgkLU5gDGAIV7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KbQA8i0gw5SImuNXq25IuI+vzcSbmY2fGgH6kiZ8m9c=;
 b=hzJVAcnuNM4zh64qB42ZIcJFBmTuUdb6vKKQ3o47hH911Cqy5+WwnVXlcnYxsV/eu025
 5Q79Q5MnTV2AS+mr20gg5ZZsWwaLxLdeVyWf645ytgYlJmb7xVmY+iJpw2QvZEbMWecdW
 su7mp4QMKPKnaGrEXnPBOwLqr5a1B+ofIU8Z2DI88gZwwVft3YeY1Kvw5ePz1EK33kco7
 U5OCdJn/9CTaY9IXWUY6bv64KNpWAerd2ztxo1Srtxk6zjAg0CCVOaibhNmakF37gfaqY
 LCAjwGyaEglOLawfPWUotYQP1+6pYM/1CZrBo/WI/kzZpKMB3aCHfF8v+QMmYfFP35Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A8098111D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83DDC8F1BD; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:01:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 975fea490f5257887fefcf7ce90e7b6a85299061
X-Git-Newrev: b666aa79d1909dc58152831bd6fbc8f7d7b8b701
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.83DDC8F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lvm2: set
 unconditional dependency with "=", not "+="
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4403999094997196622=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4403999094997196622==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b666aa79d1909dc58152831bd6fbc8f7d7b8b701
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This is a simple style fix.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d236b45fc43c3979eecb183bf2995dddc4b3aec0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/lvm2/lvm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2fc24be60e..87d53b4d72 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -25,7 +25,7 @@ LVM2_CONF_OPTS += \
 	--disable-nls \
 	--with-symvers=no
 
-LVM2_DEPENDENCIES += host-pkgconf
+LVM2_DEPENDENCIES = host-pkgconf
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.

--===============4403999094997196622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4403999094997196622==--
