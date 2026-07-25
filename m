Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2BEC531D0
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE59160649;
	Sat, 25 Jul 2026 21:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSSOS0XntBNs; Sat, 25 Jul 2026 21:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA47D60653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785015720;
	bh=ehLpBxNtLATshTVwoNzbpI91/MSPF2KCKakJq86x2Jg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q2CpAl8dzJx0l1FkVo0FB8Wmfz0tupyJ4hrbpQZ2YdqbUnn5+7EQj8+VIXPZ/mdZR
	 nS10Fs7bunDHQ1Log+Jmvtm2eqxTNsu5PII3PRZ3MfMiULmH4PSk6rbIks0D1KQZ+Y
	 rrj8HES1EPgxTkfGsjiUCgQUea3snavFlqbuzR/Je3+OOElvRSMFRFBm6Oyw0qD13o
	 KFeWauPkkELdf7UdW1mSJpNlCwmDyRaHY9MIR8BE06XanKr7aDZMzEe/Gp3v4siZT2
	 maGdJrGeVnNkPw9ZAk9O2DR2VjS4THBtpz57wWnLpPomPhmlwQYiwF1dWZed/3LEbx
	 3chVf3OWtv+Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA47D60653;
	Sat, 25 Jul 2026 21:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95882977
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9318080E1C
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVgicm6Hs6gp for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 21:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5FED80E16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5FED80E16
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5FED80E16
 for <buildroot@busybox.net>; Sat, 25 Jul 2026 21:41:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F25A2B00576;
 Sat, 25 Jul 2026 23:41:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 23:41:54 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 23:41:54 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260725092952.292677-1-francois.perrad.86@gmail.com>
References: <20260725092952.292677-1-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <43a187e4a9110b719f5ab395008e563e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785015716;
 bh=5ElfFVB+5hiSrchsBToAQwD8QWMnCh8KVF0WW4+iqvs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HozKI7YnDqcQD97xPq+SUQowwCh9yMG/eL+YBvln1kLk2vOFi5iJwHV3pkb6+oEnh
 fwgHEzI5zi5xTNtX3mtJA3bZwFO8h7pD0CO2yBF5lK9xcOuqp5xIar61i87tPiVqS6
 Iz+qoxCal+Bi6hKAwMA3VdHV3Wsj1BjnLv2rr8V7OqtJRG0WI5CRDH86GGPMeOM3eE
 Wtj6PJwi0yv0K3oWsW9Zwf+OpJvyBcv6PGSu2azyVWKLSFNRZeHcGb/t7tO9vynk6D
 KuOMBOZLvThjogWMQ8rF4TJENQShEAaCeZWyf30yh6MPVNlf/kjM3E2hmklnDFshTJ
 AT5PwW+VZPgmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HozKI7Yn
Subject: Re: [Buildroot] [PATCH] package/lua-dkjson: bump to version 2.10
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

On 25/07/2026 11:29, Francois Perrad wrote:
> homepage switches to https
> 
> readme.txt becomes readme.md
> 
> see changes on https://dkolf.de/dkjson-lua/
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
