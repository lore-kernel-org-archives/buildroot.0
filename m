Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32115C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC27E403B5;
	Mon, 24 Mar 2025 20:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWWtAdHlMWY7; Mon, 24 Mar 2025 20:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3094F40401
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3094F40401;
	Mon, 24 Mar 2025 20:06:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 443C7E0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24FEB40001
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8grCHJtxi9dB for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C3B940895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C3B940895
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C3B940895
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:06:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3D74C780514;
 Mon, 24 Mar 2025 21:06:21 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47660])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 21:06:21 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 21:06:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323190511.3336129-1-bernd@kuhls.net>
References: <20250323190511.3336129-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <bea296f01d20d924e7ace266885a7130@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742846782;
 bh=a0+ZZ4FDUznavsWRl57z9wix87FMwzh+7xo1FpBcDc8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BtclGDlhDo5wovntdI+/KDq3In8wTw1PRFzv+m3pNN+n/Pi/Z/DpUDq2RAtMrxNb/
 YAKX7dfhsAtAC+1Sf7+GBd52rvM7Jivo8qPjlhUj8MaY1gehfTWi+FwQNqob+16ODk
 T9l4Uw/ZeXYZbhqbg3kTUyIyChVJ+ThE2mxJnd9nfbp0CxK1jzYOWuMQCYveMv3/d5
 8/KFevH5+g8LwHvxH4RuzmDbnIRDzO7hA4sPwMmL5yhFqPY7npZ/jexbVDs9OFkp89
 M3JfW0xfjr8ZCPO2JXRFbVMw8CF7AwU4oeklCH1X5rThfJYTU6kfqcWwkBl9DUp2+T
 bdj+2Maz8kdpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BtclGDlh
Subject: Re: [Buildroot] [PATCH] package/tinyxml2: security bump version to
 11.0.0
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

On 23/03/2025 20:05, Bernd Kuhls wrote:
> Release notes:
> https://github.com/leethomason/tinyxml2/releases/tag/10.1.0
> https://github.com/leethomason/tinyxml2/releases/tag/11.0.0
> 
> Fixes CVE-2024-50615: https://github.com/advisories/GHSA-884x-p7qm-gq3f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
