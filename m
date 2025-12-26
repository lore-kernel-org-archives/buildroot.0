Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F372E8FDB8
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F5360A92;
	Fri, 26 Dec 2025 20:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umhg5gbQwmRb; Fri, 26 Dec 2025 20:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2C8260A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766782098;
	bh=EC1Zi3zwYoDV/CVEFcrNsZEup7ML6UvmnwEWcpqmqTE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cSzl5jSaw1OfDmAnxGq8ddLBPgVUa0ftc/c4oz0H5Cg70oSxGJD3Dzo44Oot7/sJI
	 lvIqsk7vqyUUZbYxwsTBCcNniDKKhd6LBOL51PUwVh/ou9rjHpZEMhdwsSvmmJ616S
	 D2aiqyD+yD3CBeJ0lZxsVyyCY7+wTceoGU5fI7PneQt+/NRif8umjya8f4eOfgivR2
	 sMvvOFz9L6J/Eo4qkbdGsJdfz35YazY05E+MGn+VOqI+uWohJ08k32f9aWJ1mqCFWs
	 tmVROmco7gEh7k6p8cpFHeEOmF6AZ2UjOIPMLOsAhsIpJMzrYITDzpc/JuGsUIvsK+
	 zGgEnCwFbmhSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C8260A9B;
	Fri, 26 Dec 2025 20:48:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1911EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7925404B6
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNsZMg-XaTsj for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:48:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2EAE4037B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2EAE4037B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2EAE4037B
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:48:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BC7C32003CA;
 Fri, 26 Dec 2025 21:48:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 21:48:11 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 21:48:11 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251222125208.83961-1-buildroot@bubu1.eu>
References: <20251222125208.83961-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <ed29a7af1b18d11f2a767a678091507f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766782095;
 bh=8jex9GzfPbed9dGHlwG70sskum02DzF/x/sQjgeWUdY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VIp7Lh9+0gQC7e0ig1aJbDBer7HeJ4qsQcyBrR+2X1ia+cvU6diGtd4vhEkoipjBZ
 i2z5f1sT+K20aOzZRSYdyowUcv2+vh0lzMBeHT4mgHlcqVVw09l4I/8T+srMS/GmC9
 vDt8rsFaizHF8x93EWFMS+QludW6cgR8ph38w65RXjf3L7nD3Ken4ytnmZU41VMWf+
 JG+EFOqqhMYWZdsXZ8YMpct7ZbzH0PJJyf8HNEVhesryIoiYjSAHIgObvDoJCzt9Ud
 yIirLhK07/pCcaOZxHgqlwIF1Sp5BbiBaYUIe+edGhKmJjewkn/KNXaU0orBpohrg+
 hVMmNFQ+Yi0UA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VIp7Lh9+
Subject: Re: [Buildroot] [PATCH] package/python-apscheduler: bump to 3.11.2
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

On 22/12/2025 13:52, Marcus Hoffmann via buildroot wrote:
> Changes:
> https://github.com/agronholm/apscheduler/releases/tag/3.11.2
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
