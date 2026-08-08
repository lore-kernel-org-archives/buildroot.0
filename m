Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EF2C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 15:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AAC6606AA;
	Sat,  8 Aug 2026 15:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVBexLE7GPMz; Sat,  8 Aug 2026 15:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F398760692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786204561;
	bh=3WnRL/zHUhuyovp24WDt1wEx2cC8go4As+vfWlrc0JY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ttc00mB29/WGLQtgdJ+9RDX7JXb40PyIRGhT6jWWP/uORyK6lwBgffe2eeV2zEejN
	 nOQDg9UW5Dag2iHYiMInsw4dfSJeSwIuE3dWhLKx4QTfgsxOfUIevYUZBLGkc/xZTR
	 nLTMHaNcg1IGGOgBJaep/7Ku2/SVClrjQJ80lc+Tt3TaOg9DFbH9gtswdZzWAsZQQf
	 R4FLegitFrVXG1kbGfVO7CAzWztMG2paKj4lMP+qGEvixmYXg6wUgVdsiqPVodHcFC
	 NVfB/uTBQ4sRQDqXgwqgJLhmelyRxa2mg61VqnnBgjbch/LrsrDLww2hejoV+DZJfT
	 TK+hF7W1Lajfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F398760692;
	Sat,  8 Aug 2026 15:56:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 237B02F5
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09D1280EBC
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_OJiQvNfw9K for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 15:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AA1B80EB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AA1B80EB1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AA1B80EB1
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7237A2003B4;
 Sat,  8 Aug 2026 17:55:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 17:55:55 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 17:55:55 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20260204151412.2337672-1-buildroot@heine.tech>
References: <20260204151412.2337672-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.17
Message-ID: <0c64db102b54160153a467d2766d3fde@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786204556;
 bh=dv7oOSvxq2zqVBj23p7EB2mxgMxCyPWPC7U5XVs+w2s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D8hHpbLujgYTdbC6VPxX0bKSnfFQhcDkH5vffyoqKdhlPLbwtgHIgzVa3nLGr0rX+
 K9U1w87+Klyey2saRzccHQl+jzAwbrIlad3a+Ki9phpre8G97OOsKgcSbmJCCuvwxq
 w5owNPYbubj076MnYp+9lPdLH05/WJnNoRWXhe8aObWZgOdA/qD4dft5TXUf03Pa6r
 6iY6jncSTUDcse3aqzkt+a539PqU8yOck/Y7WIJ8Y8lChBokHJRS/jYrrm1ocJKHzj
 wOlaysu3LKf8vz2ePMKbAgW3xigt4b3QBox8YUAsho3FlHvVKYLaWGcSzO5WcbGEkt
 upvF7NUPuq1iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D8hHpbLu
Subject: Re: [Buildroot] [PATCH] package/botan: cleanup boost dependencies
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/02/2026 16:14, Michael Nosthoff via buildroot wrote:
> - botan dropped the usage of Boost.Filesystem in 2.10.0 [0]
> - botan never actively searched for Boost.System, as it is header-only
>   the dependecy can be dropped too
> 
> The only part of boost botan currently uses is asio. So use 
> --with-boost option
> when boost is selected.
> 
> [0] 
> https://github.com/randombit/botan/commit/aff8cc8a7a5e22e3fedeae7ca82b63d4744ac82c
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
