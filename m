Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E904D72371
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D4382151;
	Sun, 25 Jan 2026 21:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g40j95m3mYiL; Sun, 25 Jan 2026 21:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF53F81479
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377683;
	bh=caD1yfwMTLS1bf90LIkNHZJihJuw3NXywkUst9zKzTE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SBGam7wFmbu3/B3PuBdvKUReW8yQDMZ3rK4qVCr71mhvElr+sBgbuxVuh4cyTBBbP
	 RGazXXoaTchkjUwaW/NEWYVCauXOS6s/jWO/K1u3OPyRsH3gjmBFFwT1/tYBWI92G7
	 ulBq2nFOw4WYyDcVFOJ/CkCiUW+acRdloBjwyEBF6HSWVEAPdGCWfHMzM5NhdTPNkX
	 fiAzmcjfGJWQOJR8PzT/MZ0a2gmuqJGcjot1ubFQvhfMkxqJgoI+elxq1H7p/brgN0
	 VeqcMljYHzpz64RQG3Vm951X0BYt8SfEO3d7uB73RoQQjA+kiTAp5jHLBwppx2An0V
	 1lzjDZ10RnZxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF53F81479;
	Sun, 25 Jan 2026 21:48:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B3DD1CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EFDA81479
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GOo9pSG4Xzr for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9311813FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9311813FF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9311813FF
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:48:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BC4FEB00579;
 Sun, 25 Jan 2026 22:47:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 22:47:56 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 22:47:56 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260124152311.680810-1-dario.binacchi@amarulasolutions.com>
References: <20260124152311.680810-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <e8e8729df91f143eb0ccc58ab90fd7bb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769377679;
 bh=Y+ejiliPMUIVmYyEvaxiUvjIQrtgLhDomPaeDdOfGkI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T5oZUI4907EfjC2lK1mXHAqWjkszrSHbsoUyPJn7nL0JJGnNbf/oUNb4xeNaeEeiv
 q66s2yywk2hDvuixJ0/Y+UrDA6ITlzkk87QMGI/8+5y+Hiy9p9ydCG2H6bD9kvQQfN
 zV1kuOGwS2FbcIZEHfSTz5LQdT3ychU6xOFJsVdqSk0B6TU0ZzFwpqwLkswR/MZO3Q
 2sbsusaKNLIk+VVUST8gkJHixo5oYouV7iDb9Sj4HmOhT6/C7byHcIaGsRySCj2c78
 urpxqgJiUs3wDhgMWKZgpeSAnFAoEaM2ZjEGiOINEE6pei/WcUue06G2tdOyUkSS+r
 w7X+9JVhMeZrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T5oZUI49
Subject: Re: [Buildroot] [PATCH 1/1] board/stmicroelectronics/stm32f4xx:
 exit post-build.sh on error
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

On 24/01/2026 16:23, Dario Binacchi wrote:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
