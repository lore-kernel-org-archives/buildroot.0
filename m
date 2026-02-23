Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33723EEC285
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 21:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58F898432E;
	Mon, 23 Feb 2026 21:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zWxEknftMlM; Mon, 23 Feb 2026 21:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C2AD842EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771882325;
	bh=Cd1fkw1Xs4s6nXQzHBoP8rAFDkiyHquM1Jsc0xeD9B0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CnRg71xEdwiIGL2LbpARQA0trEtsBbPTtp/kryh25WPPf81YlnV3tAEuAY0YVQIoo
	 2FXqaMiwwEU0M6cVvICocai0Hic1PmhSlKey4OxY1fu142A3+aPVCuhdXvY8XSk0Zj
	 XB/6FnGeQjg4iB/BJl8Ignf/GMTmlx4uEHt5qycVkliP5fItRS5WkOfUUUqBHfGjo4
	 o+qxavIQfRgocbKA+2TLFIYU0WWV3hp5gKa9OouTxiNA8syyrOrV+1c8H7OGVyO5cl
	 nP5DsNuq5oUCRiMd1kupFFxkOvCO8Q/uvM237NaSBy79NE8+OJkP6+euGvjkYxoOuj
	 jDuWK4EZ7KeiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C2AD842EB;
	Mon, 23 Feb 2026 21:32:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 538AB237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37D16842EB
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8NEj8WUwyb4 for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 21:32:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA6D1842AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA6D1842AD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA6D1842AD
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:32:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 13C6A78035E;
 Mon, 23 Feb 2026 22:31:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Feb 2026 22:31:57 +0100
MIME-Version: 1.0
Date: Mon, 23 Feb 2026 22:31:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, David GOUARIN <dgouarin@gmail.com>
In-Reply-To: <20260217075103.425981-1-bernd@kuhls.net>
References: <20260217075103.425981-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <8532b5015605299a9ec3aaa570e3d8ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771882320;
 bh=V78Un6FuPrSQsZtG3poNFcbb9Ngn+fBC3/GXEcA6kJE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mCeN/KWcYJbr/zBiNzLPfHUXoc4DwYsT6a7K7eonT6Z+FXPOWXkBU4XILKmXgZ3Rl
 tVCEV74/9dIi7udAaoMKzDVxJ+e1PqJvfvmQXAduzKDdo+ps8WmBZrOAl3LxwRgXrj
 bs3ohrcqNdvH8rpyj8xzB55yRdU5xM535zOBDqsQLB2fxuqdqeGgDMwLT9+d9lo6Jl
 Pe/rnWXVwN9UGMKEbAyNeLbmpUhbOQExbmBHYw2xtVOBprOcUdsg//DljWFeeT5BR4
 4wahE8NZa2jj/0jQs9DuI+1pVzlLTgp9025zXDanI6TRGupgydQ5tQQYH6h/FgVR4A
 uQV90jK93jjbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mCeN/KWc
Subject: Re: [Buildroot] [PATCH 1/1] package/libtalloc: bump version to 2.4.4
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

On 17/02/2026 08:51, Bernd Kuhls wrote:
> Switched license file to upstream provided one:
> https://gitlab.com/samba-team/samba/-/blob/master/lib/talloc/LICENSE
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
