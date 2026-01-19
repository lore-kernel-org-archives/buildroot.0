Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CBBD29C4D
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 20:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F0E284037;
	Mon, 19 Jan 2026 20:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYVjHZiQ05QH; Mon, 19 Jan 2026 20:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07EB184044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768853247;
	bh=PCTUbgB3A5nqD0XRlbVcFQmyXePjwSKYNFcQcUIclfs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m93xiefBnDYrCrAfEKBjQYuAfHO4YlKk3ZQaxWu6wObowXOSFOHKLNVKp3+XN2rvi
	 wtaUt2LbOl55bez2dOyJf+SpRBcKXTsCHhP+WSu+YVgTOHhQwEID+bGLJzzJ1QkYJs
	 1shkMVLqjl+qVI9rY2KosPjYmuKlj2l8iwwEMOtp38cn5wsAqXqv+ua/xgc0Y/YwZs
	 1qYy1xbP5SEl9YTUT0J9YNzYE9blBIKmi0WWONNonJ3wr2G6JAPHq3xAuvpreQqQvG
	 t+HKXUHa7dQcMAnOTb29HDEjNptAMKcU3UJynzzHxIAbYu3q6KGJNQqCo/9L1K2JwL
	 WyZPy79j1Dffg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07EB184044;
	Mon, 19 Jan 2026 20:07:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BCFD122
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F092B615B8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7QPju4KxcRU for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 20:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 043BF615B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 043BF615B7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 043BF615B7
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:07:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B1CC52003CE;
 Mon, 19 Jan 2026 21:07:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 Jan 2026 21:07:20 +0100
MIME-Version: 1.0
Date: Mon, 19 Jan 2026 21:07:20 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260119170403.2855377-1-dario.binacchi@amarulasolutions.com>
References: <20260119170403.2855377-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <28cf14a7c47c3d7faa53667ebb2b49c9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768853242;
 bh=UkryfJLgyzen9Dv9gFdRQodQ1stSSObQAC2zUxhhED0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oQfvfo+qEGwXOWMMz8HosNtPrcsUPTE+SDUikLjd/X2OzZp54JKb/Og93KoBg3Mq9
 z6O5MBEkkUF/E/DKK/vb0T7Sz31Spb1fBAEZr8uv01BqtoHpSir9E3Mz/+AhP736rI
 4hylru7OLR9f90MOsE3kQYHh8MgbFMkPNwMihqkcZtj10IV/3jJsFKxezOatEbzLwz
 LWbfK07P19mwyssPdazUgOkb6t23SohH+dQJ9Ahum5GtBoZSMZyiZKuRroL1wjwF2m
 c9SPycZoHtMC075sGY+fZuGJX+A/rmObFxmU9bKMg/D25gO7hY5xvJ188dihVKi8Zb
 uHJ+kqKFMAInw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oQfvfo+q
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/stm32h747_disco_sd: new
 defconfig
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

On 19/01/2026 18:04, Dario Binacchi wrote:
> Support STM32h747i-disco board. It includes an STM32H747XI SoC with the
> following resources:
> 
>  - 2 Mbytes Flash
>  - 1 Mbyte SRAM
>  - LCD-TFT controller
>  - MIPI-DSI interface
>  - FD-CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>  - camera interface
> 
> Detailed information can be found at:
> https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
