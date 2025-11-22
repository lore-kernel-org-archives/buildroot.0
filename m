Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB33ACFC52D
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 10:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E59408C2;
	Sat, 22 Nov 2025 10:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQa-trLyZnt4; Sat, 22 Nov 2025 10:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F6AC4063C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F6AC4063C;
	Sat, 22 Nov 2025 10:54:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AF56122
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 10:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11B0B84B66
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 10:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKKkUEf3WL2s for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 10:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD83984B65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD83984B65
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD83984B65
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 10:53:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8374319F732;
 Sat, 22 Nov 2025 11:53:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 11:53:53 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 11:53:53 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251026154840.85480-1-bernd@kuhls.net>
References: <20251026154840.85480-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c8f015943525068596c7189bc8f6170@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763808834;
 bh=NCFM4bdmJFwpjt6H/apN+iXfTl0wmBiHvW1+50zv9dM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ezqjo/dAnl97vtPcNz9nZsoVj1EyFbd59P10ZRUFYoNDbJLRQYi98R6OISnqoxXkr
 cKrj5J2XNYPpFnXK0qmVEUSrNdHFO18y86OT5JjJhu2oXhrKxtC+LY193TusQjDios
 y/d0ANxjyzyNvQwb8W6wsQp3/9dsb+kcDORl3FneEtWxrHFm0wtWvFxeJjRVKxqdP7
 w0WKIqLveAwZI41hd/wK3IGSf53OCCUZZWQ4f8Bnc5Qkm+EApyK66cUw70Y3rbfy44
 mwgbDv7bF5AXVZRHdnnRpE8WBtmuD82epwhaLnLlAs1Sm7lYWszAaTVUjFbZIuLQ0w
 nUI88auk+wsNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ezqjo/dA
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: add upstream patches
 to fix musl build
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

On 26/10/2025 16:48, Bernd Kuhls wrote:
> The bump of netsnmp to version 5.9.4 with buildroot commit
> 1799cfebfd5ea1312cce74b3807d4aad044bce67 broke musl builds:
> 
> ../include/net-snmp/net-snmp-config.h:1614:30: error: unknown type name 
> 'unknown'; did you mean 'union'?
> 
> due to broken detection of __fd_mask introduced in 5.9.4 by upstream
> commit 
> https://github.com/net-snmp/net-snmp/commit/97df191ff8b16bdc53ba95d2a1c064d2a4666ae6
> 
> Added two upstream patches for __fd_mask detection to fix musl builds.
> 
> Fixes:
> https://autobuild.buildroot.net/results/9d7/9d75061ca917689381c3b32f3e01640701d833a7/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
