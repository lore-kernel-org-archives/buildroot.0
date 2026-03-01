Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C426FD0047
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 20:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 068ED60DEC;
	Sun,  1 Mar 2026 20:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t67uTEgHUIbb; Sun,  1 Mar 2026 20:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 262A960DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772397152;
	bh=lF0Qyty0QKRdYv0Lz9kfKftTas0JZcZJK6QmPx75J3s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K5h6RrrDZpJ8Li9H02idwvAAQvsFfsF6T8U8Qkynqxw0vAOi09g7aG9F5u1XUN3/r
	 6qpWfqa/al6HXYF7mKUR/0VQ6O5Ph3RdTBamY/PnenjgyD6/qPQKI/nFAccwaopaR6
	 rALmW0F32uutfulMr2vnhkWoGdF895sSmJY/XhmMa5rFxdv3Hn5hnpkit0LNf7VmGg
	 6sdZJ8WdLxXcjZcnrkKKTXBLfQMITF5BM981/vaMUsdRyBcP8ZLT/jNJP7bgDaMPqS
	 F2nFIlPhqxvh2AZcomd8LRQCD5ovBKLNijy5fTqMC1tOWdFcuvBAwVlh/iUl35tzmM
	 Zj6zon6s/EzSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 262A960DF4;
	Sun,  1 Mar 2026 20:32:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78F0824E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 20:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EC7541AB1
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 20:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WLnmwJyoAOa for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 20:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6B0640BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B0640BAE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6B0640BAE
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 20:32:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AAFA6B0054E;
 Sun,  1 Mar 2026 21:32:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Mar 2026 21:32:24 +0100
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 21:32:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260301134053.1460941-1-bernd@kuhls.net>
References: <20260301134053.1460941-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <2d3c78d6076a83ff4eaa4c070b62c01b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772397145;
 bh=4HK4TfbsEXt989LC6tFiSXtHBaQkekvle1YpUaI/ebI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e1AlX2d+iVN2oWrIFWfXUmn4KxLUP9Xs+TSHbQTdWnOjnGJPnOsxmjrOWACierXCB
 Smbxqu7pP2MQzafkeET1cDtCsPNq2h82q0WMHK7h9Bnwv+rU9kP/FNEl16Ds5rWoIb
 HwqMJ+sM1hY4YbPBRtBErcy4YSiFRWNS50y/29ybF6bXuWt0dLdK+yyH67Db+tQsGE
 Nd/F0TapZXlCfuByDwU6Ud4P9L/WeJW03qW9+4wfYIhsJv9K1t3pE29Zi77kUCqV1G
 3AKf2tD0GuP3ZrC5dyinxXUZui4kvemJ290rKzFaYfCFXIvd+zZi3JptM3711XHh/V
 54G1d3MgLDJzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e1AlX2d+
Subject: Re: [Buildroot] [PATCH/next 1/1] boot/shim: Fix build with binutils
 2.46
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

On 01/03/2026 14:40, Bernd Kuhls wrote:
> Buildroot commit 101997e334efcbfd9bde3100ae75400177cfa56f added 
> binutils
> 2.46.0 to -next branch causing a build error with shim:
> 
> output/per-package/shim/host/bin/x86_64-buildroot-linux-gnu-objcopy:
>  shimx64.so: file format not recognized
> output/per-package/shim/host/bin/x86_64-buildroot-linux-gnu-objcopy:
>  mmx64.so: file format not recognized
> 
> Added an upstream patch to fix the problem.
> 
> No backport to buildroot LTS branches necessary.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
