Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D05AC83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 16:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D761682032;
	Sun, 20 Jul 2025 16:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5G0S6XTGteFk; Sun, 20 Jul 2025 16:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1597E81EC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1597E81EC8;
	Sun, 20 Jul 2025 16:31:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F0F71F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 16:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA85540C32
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 16:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bugWBRQBAUFp for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 16:31:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F6C940BDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F6C940BDB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F6C940BDB
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 16:31:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7AD3919F734;
 Sun, 20 Jul 2025 18:31:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 18:31:26 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 18:31:26 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20250720150333.2644053-1-dario.binacchi@amarulasolutions.com>
References: <20250720150333.2644053-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <dca8d4ab577dc801c52c42f92aca15af@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753029089;
 bh=o+jJxp4J4yxSCCbZu9M5I8Lghs4HZJPMcyRIpSkkT18=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h7k3Io/vVTnkXm7JGdYhK4d1NRSgBkokuOJEYI0RLOloEvKAEg3k1f123zx89QObl
 VP2GJAzwV1pd0FFR0LLCmLjj+3UVgcWdKvSZaRaf+ILQaMr2TryhON0/FpwLcM8YC4
 zADVez/AJKvg6ziNhY0NjcJ8rOJWeoUlNGLFnglsUDxtIyxle9t9agqJTjjBLnoDyc
 SFTR2j2G+FOmIq8PkRKL0cVO8Vw0v5QZnLlGVmRNfkc4Kf7R2TzUIcLh2i+OWuARh6
 jyvltCkEc6JSqW1GnSfSvXDNh3oSDczNvF40ozmxbfq+wY8M+dxVHA7Z4xlhyQZPv5
 71IM2RfqFrK0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h7k3Io/v
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 Linux to 6.12.39 and U-Boot to 2025.07
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

On 20/07/2025 17:03, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.39 and U-Boot to
> version 2025.07. The patches applied to U-Boot by Buildroot have been
> removed, as they are included in version 2025.07.
> 
> The patch has been tested on both boards.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
