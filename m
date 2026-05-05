Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7594BCD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46AC4812FD;
	Tue,  5 May 2026 19:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fub6uEWoM169; Tue,  5 May 2026 19:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7233C81324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010789;
	bh=HG8GYBl8NbJZjnkulmqHrXs68C5oXvY/E53PKZ9+sPs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cv1Z5pbPr+im8ZXcxxoDTNytBumJvlTqMkC2qw0vGgZl5YpwlQXQuC42VUypI9W0B
	 V0t9UVIuRfxXKvEVfJbsB7ZUrmeMs9aME1I+kEm4Kyw6NjZxuPn87133mr/13cba/M
	 z6M2O6l1AHAbWHxKZ9bjChB8Ld1oldrgjXpKY7ouI4FgM2gUaMw4tIW4itfDuJ+xvG
	 HxGZbOzYVjb0kWT+rBhGVbIEdGeb+00htC6AZvlIXxKCHqbmkXLpjXrVbJHElCAAhg
	 RNr4z1Ky5O+8AXnfUVM242QccC+T/wfAKoF4ER77Gv/tBXs4JOXlcDqd5aR7QQnGZy
	 1lGlSv7bKbpfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7233C81324;
	Tue,  5 May 2026 19:53:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDAD2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CB61811BF
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9TLkIfAk9fY for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:53:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0AC7E81270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AC7E81270
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AC7E81270
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D72E2B97C07D; Tue,  5 May 2026 21:53:04 +0200 (CEST)
Message-ID: <1b5fe7db-3e08-450f-b0db-22454ca223b0@rnout.be>
Date: Tue, 5 May 2026 21:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <20260426153334.1026982-6-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260426153334.1026982-6-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778010785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=q5uhiyNtJ+ltji4uaYtiyF9RYVUrUarVcXvehCQQZ1U=;
 b=m8RM3fPwTqO3DutIwpuT9xkHuwRNCXGNAEY2Ak1NZWtRwftOWiXA5D5VTBIpnoLwOiILYc
 ZSVxa0Ei4up3aHaJcCD0rBpIk+ITqwGVypMDW5VDG9QWRAEA6fUcs4pGVJgDodIF5EV+o4
 XLLgeX+4ndQ9s+3qQ40QSPioK22GMRLb37zhYwXv1UzXILmePnudrr914Mio8CqRGBvn17
 Kba+hnvmWuf1my5BixyE7PeS0r7fcdDD9EHqOyJrCHIa9LO5bXxaHBtySVEMn7lobuvqnv
 iXQrvYCQwEEBUmO6nFqqhGSZuS26q9iZmya4OQPoUMobq8zQVkqOegP46eNi0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=m8RM3fPw
Subject: Re: [Buildroot] [PATCH v2 5/6] support/scripts/pkg-stats: don't
 buffer whole file searching for infra
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2026 17:33, Fiona Klute via buildroot wrote:
> The file handle can be iterated over directly and each line is used
> exactly once, so the only effect of reading all lines into a list
> first was higher memory use and complexity.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

  Applied to master, thanks.
  Regards,
  Arnout

> ---
>   support/scripts/pkg-stats | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index bbd1e3e6f0..5dcc812e2b 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -197,8 +197,7 @@ class Package:
>   
>           self.infras = list()
>           with open(self.pkgfile, 'r') as f:
> -            lines = f.readlines()
> -            for line in lines:
> +            for line in f:
>                   match = INFRA_RE.match(line)
>                   if not match:
>                       continue

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
