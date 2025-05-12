Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EA0C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 19:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AAEF81A3E;
	Mon, 12 May 2025 19:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2f1rPwsdbY8; Mon, 12 May 2025 19:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9706681A0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9706681A0D;
	Mon, 12 May 2025 19:54:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E462154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99DAB4073F
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1z8vwYQtnDpt for <buildroot@buildroot.org>;
 Mon, 12 May 2025 19:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1BF0408B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1BF0408B0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1BF0408B0
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:54:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A96A478035E;
 Mon, 12 May 2025 21:54:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 May 2025 21:54:18 +0200
MIME-Version: 1.0
Date: Mon, 12 May 2025 21:54:18 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250511161547.3195183-1-bernd@kuhls.net>
References: <20250511161547.3195183-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <78fabbc07ba4f32978fae99b23fd36db@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747079659;
 bh=28oSP3O5EGIYBIl6cPHEREy/OsMCcZslDkqy2GAntoY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sZu6c0uTqzRtytiqCLv/ZQQm1M2Hru27qEwYjc956eEYEBhkwPm5SMAHNc7Lp+OiM
 2AgDL2H3Ylo354tDjPdRc7PaathGCvBgtq7Y1yUl5ok+i2chklOyPzjf2oU9DQs4vp
 /7aZao3REjfXKuP04LUJyoTKIBoSq47QfhTWYONdLa4UruHrHrSoDmQ9xBnaAc68Il
 D5AX02ltGqAVWJ1TBr5ztpK+rF/PVglE1busM5p7o4ET1gr6iW8w3wnbuYLyZXeRfd
 nag+yBL/J/kxODhuAnphAAdiXWnR6VxQXqmg1FVKD4E9HkktHLADJttYGY/SRd6Qx2
 XAvh1zU7U8efQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sZu6c0uT
Subject: Re: [Buildroot] [PATCH 1/1] package/nut: bump version to 2.8.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/05/2025 18:15, Bernd Kuhls wrote:
> Release notes:
> https://github.com/networkupstools/nut/releases/tag/v2.8.3
> 
> Remove all patches which are included in this release.
> 
> Updated license hash due to upstream commits:
> https://github.com/networkupstools/nut/commit/1cd56ce019a0005d2c9083c3eba26af13a9b2581
> https://github.com/networkupstools/nut/commit/91585bf708fd5128ca9e23c82800a0c50f39db14
> https://github.com/networkupstools/nut/commit/f9a41e7225a472443c34c008fbf4c168bd94b904
> 
> Upstream commit 
> https://github.com/networkupstools/nut/commit/4ddc5aedf322a6ff2803aa7cb7509057ac7edbbf
> sets PKG_CONFIG_LIBDIR=/dev/null when cross-compiling and the 
> pkg-config
> binary lacks the host triplet, but:
> 
> "If pkg-config libdir is already defined, we suppose that callers know
>  what they're doing and leave it alone ..."
> 
> Add PKG_CONFIG_LIBDIR to NUT_CONF_ENV to fix library detections.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
