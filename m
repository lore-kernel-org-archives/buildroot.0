Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B276E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4A0E81193;
	Sun, 28 Dec 2025 22:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Co63pX7A-9Kr; Sun, 28 Dec 2025 22:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE33E80F1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766962313;
	bh=2ibn0Q/i66oTjxATqK3osLASmJFCl3+n9olscsjRodg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pI0YuJN/oIUo09c1m5gVGacJVfkP4mwKhWZCf7osBDeqGTY7PvF1pjYnAMlKq/EOO
	 0C00Iwxmpvemvq7+biS56Sl69hcKUdOJM2u1uz7WQNjBBlt0gsRjfnsaX/KfLclHf+
	 /b3EfFvI1T4eoUuO+KoMJQ1XJymN57b5+DWMp2yBh9qb6kzE75vV/gjMhQRQqrmRku
	 spd5yZ52QFrv944/0/Y96okZCs69t96jpcmgkU5EpM1kZNX0g8UVBnLxbNmr9+BXVk
	 yoWpCbO4PuhD1zmZ+cmSX7vDDNE/0nITBLhho8QscbiU+wrW2r0Ua9ZtAmkTO/4TJE
	 6HHjaGKvr8T+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE33E80F1D;
	Sun, 28 Dec 2025 22:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C4CFD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E0FF404F4
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFyvU6hhuPWh for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:51:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B1D0405F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B1D0405F3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B1D0405F3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:51:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 283D9B0051E;
 Sun, 28 Dec 2025 23:51:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Dec 2025 23:51:47 +0100
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 23:51:47 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Clouter <alex+buildroot@digriz.org.uk>
In-Reply-To: <20251228113455.3051809-1-bernd@kuhls.net>
References: <20251228113455.3051809-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <e6d9aae150b05003a0eaded92da081b5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766962309;
 bh=jRN7YQ0kEYLDEOkBDSJW+tbhwlwWLd0bmlQ1y22Kjh0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=esOUXm/t5dqoVvo0SWLEgX/Hmin7w/U0BlN9Uz1bKdubOMLenFoNyoTxD/5LCqWKg
 0Qa80yPMUlASP0byGuug4nI1GjqjRVH9jTz8S1X9zEERFqumI5TPIMQwlSIdsZisDc
 344uL3WORGAk5d32HO/EDhUuwQfiZk7GvU04NB0K+lr6l/ilkFi72yb+wQL04ybWAG
 a5FvQFHR3SU+/UiYTbuArY1A2NP1qTNJt0IWUHNi+tuhOKMD8s28VD4oPfyBjWwQcL
 Nf1c3P8RZOUwrsLkNkMaWyZm48yhS/23SL7kcveMdMrpX9GsUJCjadQ03Owanm5cKT
 8IE4oTa/NQH0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=esOUXm/t
Subject: Re: [Buildroot] [PATCH v2 1/1] package/odhcp6c: bump version
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

On 28/12/2025 12:34, Bernd Kuhls wrote:
> Due to upstream commit
> https://git.openwrt.org/?p=project/odhcp6c.git;a=commitdiff;h=adc651ffed55d4b538317e50da1a7ec143dbfd1d
> libubox is a mandatory dependency.
> 
> Fixes:
> https://autobuild.buildroot.net/results/22d/22da3760982b80d5ccba1bef1ca9c90e9b2292d8/
> (cmake 4 build error which does not exist in a maintained stable 
> branch)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
