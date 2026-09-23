Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB4FC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD99481257;
	Thu, 24 Sep 2026 18:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BU26g_Nh-Ue; Thu, 24 Sep 2026 18:58:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A6BB281325
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276298;
	b=MScr4NJUdrz06S7gJG/Zz9+Zr9/iKCg4KaGOkkNFc55FVSwBgcI3xZOcR+TLr12s3JsE
	 SvdrEAkOg4WBssOjY9NcYTeOiAFaeOomwiKhiUnuH+MexV7xYoHKZAAfD4TU3kBF7mQsy
	 KZOjIQ4RynobzqhTkmRQyzanDuwfqlZGAgs9W9+Gn3WfjwlQzHoIRzEU92zO+ibFrMfbm
	 EBjrsnL8PkUBvDepuPMHH78T0RJqpCD2yfHtDwSgByn4Q39FMhMAY9v6yMNhjjOxiLUae
	 tnOiJugGbqPQu0OqkObfbLaoNdcUO8f2s07hlpPPIY8Z3vsDDwZgJM7VOxniDtLM78g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tHUSxmMD7tWiFO+4KHMAMqSKRFYjEzcWFTyV8NmVAX0=;
	b=NUF8VVKO4XKWPo+5EMMuDymL2CO9XlQIAZO86V44YOjFmZIcgksZ2CBa5Py8k1rKmmTh
	 Zq9g67fCLbEe31KhpPH/FrCI3YRaez0ZKToaoKAIDW+w50ndi16YCYzAWBFhki4vjRwSo
	 yMTs9dg9Ssua/kR7LZ9ALxD2ULpAyTltoi/WT0Xi7ho79PLMHXND9uG7cSZqV0vdIfbiO
	 CIUm3lk4VBqwokr61RltXKj9sIXIxrj5t29sEetvCXNiIfrNNxHqaedl5sjoCXV6p2MNu
	 BEuWGDgGqp9cdq2iLuP+MdgrJcj6akdI3T9m5UBdrQ76kyQU7mxbCbLKToi4ZRjkyBg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276298;
	bh=tHUSxmMD7tWiFO+4KHMAMqSKRFYjEzcWFTyV8NmVAX0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pv16nT5HGH4jgT1I6wUNx5EOrHuvd7MuScIj5DcJHh9ZUDkL1Hzjz8XXUJ5ODrU3w
	 XNxvm4+22YuxvEIC3mMNEiZ1Kf3MJg8qLqd7Y1vGjkFirjpetp648HKLtTiwIN8ANd
	 gN1XOHIxLy+ph+VM5+zVHM62EUh2YUGK6Vw2X/JKBGD8Uo3PQ24dSpQZ8VCnVekr4U
	 OwMTHCzgmP0TGoCaZUnJToIdc+xLPsXxJvO1ESX9gZWZ5kt6iCH2zavz8kagpStC4L
	 5mNdA5pzNMRbJwHBcxdMs1POmXKojJDz23h2VNEDJO2Oj4P0wWINGkUZJxKJ9R5KFd
	 DiklnaAE8lijg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6BB281325;
	Thu, 24 Sep 2026 18:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2ED332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE80440AD2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUPp-PjOzpYJ for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A4BA140AC8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=W4gAzi41Q2sWzLdI2T/wlRgE2mOtfrZCCmdzx7XEl6xn/LXndXPIEgye8tgE3U8RSsDd
 ++9/UE0ouO3Ol36WMqAGW0KeI2U6W30zegTjjAJFc4Qta+3V1goNF1Zdjpx5DA/0mb9DK
 2h5GZOV0spkuS6jJmdMhPfsZmS9xpN2YL/3M2CjeHDx++4e26obZHks8HfOpw0+H8cpy9
 blj3IYmopN0tbFLqCr1lFT9a8JWGzLHBy6H0H4z8mOeffYoGp1JBE0Q2aZaJzoZodLaaY
 cz91ruqzleQY1WGG4eD7Ee4MNd4OZrHhhuEv5CdBZ/QgzpvJ7kx5rEq4KR6Nv462WcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=X1UtmtQw9CcnLvkZmcqN26E+BgX4CWxKo8sAdiXJV7o=;
 b=WFM9fkjYXjK7yVIZvnJ7er2YUPCSegmD2F5+GBOz5VX9rMwikdMuuyEO6g6XcFUx/vYs
 EBkb/4R8LMCcgxXbmDHGr+4CpQqZyBQm/U7BCT3kzV7sQkSiz4PqaUvXkQt9Y0WZn56+7
 0rg9Gmq4vYsoSyX6D66wSC4GJbmYhLk6Pm12s/iUiaudFp+n6j69gdmhJ4tMtYQRn+wiv
 jkYhrkuAZtvrUHDhEM/p5D74afx3KBxO4VbeRaWFcclpofdvL6bq6E/cABfd9PZ9xFGIV
 /RzOJkTnkouFE9SBH3dlpVv88fz+Z64+Jdf7K2d/fkMQOjLy3uXmi/76CsEjQYP/YxQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4BA140AC8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46F5C976B0; Thu, 24 Sep 2026 18:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:38:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c11eafa2564731a3f2c1ce7f977a72dfc284bde4
X-Git-Newrev: 21e709049a237b0e67283058ea948ccc61f9d45f
X-Patchwork-Hint: ignore
Message-Id: <20260924185535.46F5C976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vboot-utils: fix
 build with OpenSSL >= 3.x
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
Content-Type: multipart/mixed; boundary="===============4642675241662553703=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4642675241662553703==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21e709049a237b0e67283058ea948ccc61f9d45f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Remove -Werror from CFLAGS to prevent build errors due to warnings of
deprecated functions:

futility/cmd_create.c: In function ‘vb1_make_keypair’:
futility/cmd_create.c:96:9: error: ‘PEM_read_RSAPrivateKey’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
   96 |         rsa_key = PEM_read_RSAPrivateKey(fp, NULL, NULL, NULL);

futility/cmd_create.c:155:9: error: ‘RSA_free’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
  155 |         RSA_free(rsa_key);

futility/cmd_create.c:191:17: error: ‘PEM_read_RSA_PUBKEY’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
  191 |                 rsa_key = PEM_read_RSA_PUBKEY(fp, NULL, NULL, NULL);

futility/cmd_create.c:199:9: error: ‘RSA_get0_key’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
  199 |         RSA_get0_key(rsa_key, NULL, NULL, &rsa_d);

cc1: all warnings being treated as errors

The oldest build error dates back to 2024 so a backport to LTS branches
should be considered.

Fixes:
https://autobuild.buildroot.net/results/375/37554c5ce784835a36f0068d9a0c1cd931212b44/
https://autobuild.buildroot.net/results/1fa/1fabca11c7839d2d7ed809f30482595719a29c92/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4463009364fa27d2f4a7675677e44fde550b0ec1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/vboot-utils/vboot-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index 3058d61ad8..31ed19e1dd 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -33,6 +33,7 @@ define HOST_VBOOT_UTILS_BUILD_CMDS
 		CC="$(HOSTCC)" \
 		CPPFLAGS="$(HOST_CFLAGS) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
+		WERROR="" \
 		ARCH=arm \
 		futil cgpt
 endef

--===============4642675241662553703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4642675241662553703==--
