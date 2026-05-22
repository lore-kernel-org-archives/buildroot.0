Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB5BCD5BAC
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 19:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A9B885626;
	Fri, 22 May 2026 19:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fX7xetUoktl4; Fri, 22 May 2026 19:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2EC485623
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779479148;
	bh=IDMh+fJt+NLJHJeObsdfs5wK/nbN+8fgDvZi0ZmbGOM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C2/ZDjAmIW28QNPpbK6e9Su8KkVgdcHSBlc/4Or3oTUASbdhYvAA/vCIC7iPw4er2
	 UTvpXWch1GjotcpRhQUu2+DjFY6ynqbfCrdGhHkIi1XI/brDph3kVpwtnY4s4GG9BL
	 hXLtEoYkUO5qiN+vMkwAdHDGWj4BSOO0PgUTbFG3XLztYwEZaQFdW263LhCArK8f4m
	 ASbvteiHnxnxaxXBPkEGTNi2k5WBlj/9VsPjxa+9Hk8ez1wzO5UU5EbVEOe5/gO62d
	 qCzBke2sLE+/s56JZJ0WrRFv89fCzS57GKaaiQzyhmxzc9KJFcawxsTHfs1wF3cmfC
	 r3MgePHJ9Tp7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2EC485623;
	Fri, 22 May 2026 19:45:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA7EA265
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBEEA85623
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Naqphag5zxTi for <buildroot@buildroot.org>;
 Fri, 22 May 2026 19:45:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1589985622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1589985622
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1589985622
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:45:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EB92578035E;
 Fri, 22 May 2026 21:45:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 22 May 2026 21:45:41 +0200
MIME-Version: 1.0
Date: Fri, 22 May 2026 21:45:41 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260519205604.1149227-1-bernd@kuhls.net>
References: <20260519205604.1149227-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <01f1bd17ce4864b67e93256918712fe7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779479143;
 bh=dcWeTVZ4Fc4xF/D5sxlkqX/YTmT3bVhJKSdh45EuJEU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qqQFRlaUO6An/hujR9UU6twNW/HmzP8lVM1fKog+jigYCMmwjEAy8h5OtfkHkZ7EY
 /qB+sHj1pxrcUTn5gE/cN7Vhhqgl1iF2o2yJTpX/W0pNi8dAiAtNcE6mqbEwYXriDT
 T88lP833Z2saDOHQBoRH2SnP7t8rHh/UQjBakyN9n3DSmwkjbLlLwqpjjANKCcUcgO
 4t/63Akmt2lokPTjqoUrNMBo8kURNikJA2EbDrJQI5xrreud0Qzkxf3VeeyqINdgUH
 V4lBV7VBkaQUYY1Mr7ZqCxp41Ud1xjVI61bSPNXJW9EUO1UGisztZ03/mn+Yz9HALc
 CpQ8QXHe26i/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qqQFRlaU
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libxmlb: bump version to
 0.3.27
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

On 19/05/2026 22:56, Bernd Kuhls wrote:
> https://github.com/hughsie/libxmlb/blob/0.3.27/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
