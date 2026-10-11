Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1EDCA9ECF
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E893D4060A;
	Sun, 11 Oct 2026 19:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zM4AX-3HESD; Sun, 11 Oct 2026 19:40:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 10F71405B9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791747645;
	b=TMwrixuExv0JHZfVnky4GnJu+DJXGUd42Oq4fuGhyXpm88POETRB/B7olQYpa7oO5RR/
	 IqvkgTZZBmJFiRCL8VQj/MTIsvSFRe85C7JyFjy0XTWqbgczSsIXrIAWxyKJV11mmaW7k
	 j6dLLq4/W3bVOpdkHjx22rZlknjuFW0KX5mm9mGb3OEHeJX+xpvXZMhcCWkObE0ayRT46
	 zKwcHKROeT+ZtmczIfeXEpRSRcaAN5FmDSOHCjRYDqJ4YRvMDQpyej4kzA4vqG+Sqi/wX
	 VZ+6BA/hnvqDLrdQf5zTCVZjmf0WmYxeIF2GgZbVubJQalT2cYsxfDC01f27R3oGPIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791747645;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=usobE9yrGvvzd0q44BvBp7tKrc/ez6fTYF1wJnUf6a0=;
	b=P69IxR1ecDM9joI/Lm2VpznUYZvny53ovO50wI+E05RDCHhp0902ilgCsdaEzWm36xDT
	 0Jc5Cw5U/OInuoobTiO6ZXEt4Sxaift176sujmkkqDvwqXojZ0ZXxEVTKDV9r1fnoXJa6
	 y6QycPhDfDt4AdBGakKGYyX9jz7pFn9ZOYi2eqmhOPy1iX9+0tS4hMjeMg/RT77jZMEqE
	 Ks6rdV8UKXWZfCjhBwa4HHf3gsGcKanYfeTzGBK+CTWXgn/0nANIMjUrkkHx+j5JlaHRs
	 Y2IKDWnUziU0GxOyapfz6HLCcXrELkoLUX/dfJM0hPJ21GypdIGvfPnRDS+EBE4Ewnw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791747645;
	bh=usobE9yrGvvzd0q44BvBp7tKrc/ez6fTYF1wJnUf6a0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHOMTCcZIT8YD9e2DGOe/V3T/aWRv/RrXKydK5YHdRO3IZEYopa6TX85sum+X83D5
	 dZFN8XgW9rmbIk8OdfPJvksf8KOhDmv41lEzUc8Qli1m1Ds43+kvMgzke8klHoUOka
	 FTIZyg4keneKcwDOkdibb7ByIYr9Xga87y78wT2ix+v8Imk0NBQTJ8xxe+3i54tqxV
	 ImoQ1qbcW1adPt1qbjxgM4rF5+NuGNU3cT3VmvqBhtkBFnK74lG1PF+na0qm6OyoYM
	 7RLYJPJelbtuXvW1Np8//iJjShvfYAJiynH3Q00duK8ssKSeTy8Qqu10cU+KORlFLC
	 uQiwxOneO0z+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F71405B9;
	Sun, 11 Oct 2026 19:40:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C10B380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F17F580C67
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbZNEt0jFkwK for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:40:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1D40880C16
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791747642;
 b=OsIWCm1gGMjUNvo2jgkSBy77DxmjL3jTzL64pkiF2ikP5D6QXvSZIBcG0y6S/NZRFVL3
 vXVlwe4FKgS5xna0bGjTYDnOVP9E945Kc2FlZArfJWkQbh1wv5L6+M0WucS0MB7Y77XcO
 rt2Fyolse7OaiVb/6cQq7g4o+0zkgsdVjPuZHIXq8C6TOq50aLg5m/Baklz3yBS0p4Cy+
 pUkL6PRYg0lPbgseEbBje/qkycloXIgj68aL9K5EnF1V0tOGjuiKVuJV439/vMZxQAZBG
 X/GMz7wBH/s8UB4K86ihbNTH0Y5zvTwPOAcFdVe327McysP7iIfJefU09uYtJ/CjMEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791747642;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=eGKUlV7iwHE1s4i503vhfvREj2Z4iL6fcgfWFUO0E3c=;
 b=aT0+fcYsq/tS3tk3Xek/yOd5XFWziW/BN4nEqN3meSNAVCixXOPjQ40MtyDyzbNqRo1q
 5ojquWq0/QCmXvUm818YnrEQirAEvjWEOuai1KTVFTz6Et7Ui4CG8qjuL8baPLvPUBLzQ
 Q52bcixupp0sNYH0heK5Kc4yLARgQLgtQ1RHmbAavJUZjDpNWQ7T+w/p2ok34xDXXBdCo
 AooRU20NGrge1/S4yZYidGZzCbaeLY9bOZLdZK4Dzpmq0apGIcPe8h582+50A1UE+aqaT
 dCCpFbHT/v3CRFl5tMW7UQc+qqDlwiXxPb9uyqAsmAn6OXZe4Lr0nzD0xTiNNwb5Hiw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=IFu71y4I; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=IFu71y4I
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D40880C16
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:40:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=IFu71y4Iyur+8yZjzoHo7EE6WiD2wmUBplJfItKWckSTUV++udO0xQLRACmdnq7U0XUVzrpMS9/SK9polsNg7P/mTyWweHBW8jz6AIjKB4PnJ08K2jl7lBlMvNH275+uZj8QjHvdwISDGL21++aw17k1quzqNINwjX1ygH7v7NX0t/46fDVQTGis09ymKoHv2WwliHaJGBeLQigheZ2/mBryFNtvexYs/Uiqob7nIJirNm9FuIfrIOD9lprf6rerT5ACt417QRYXK2WzkWniK3eGUNmYjJxpWnHe9em6o6+0miZ8pDFMqbehhx+V4X97OPVWKXzJwmdCULFSAxa7xA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=FsQfnaeJOLsx55go4OZ2gbpCn0swehXXK7QjN11/UUQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1477949273; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 19:40:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFzPO-00000009JmR-1xry;
 Sun, 11 Oct 2026 21:40:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,  Fiona
 Klute <fiona.klute@gmx.de>,  Arnout Vandecappelle <arnout@rnout.be>,
 Brandon Maier <brandon.maier@collins.com>,  Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <asvEJkjI2oqP4NOQ@landeda> (Yann E. MORIN's message of "Sun, 11
 Oct 2026 19:15:18 +0200")
References: <20260405185608.1357633-1-fiona.klute@gmx.de>
 <179172462322.180911.14758630260298969085.b4-ty@b4>
 <87o6d05j5c.fsf@dell.be.48ers.dk> <asvEJkjI2oqP4NOQ@landeda>
Date: Sun, 11 Oct 2026 21:40:34 +0200
Message-ID: <871p9wyqj1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2026-10-11 17:52 +0200, Peter Korsgaard spake thusly:
 >> >>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:
 >> >> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
 >> NIT: ${var//} is also a bashism.

 > This script is a bash script:  #!/usr/bin/env bash

Ups yes, I just saw a mention in the changelog about cleaning up
bashisms - Just ignore it then.

 > It also already uses bashims, like indexed arrays for the 'docker_opts'
 > and 'mountpoints' variables.

 > So, it is fine to use ${foo//} too, I believe...

Indeed.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
