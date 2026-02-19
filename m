Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD195E9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 14:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F5EA81DD8;
	Thu, 19 Feb 2026 14:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMWTKi3gMa3z; Thu, 19 Feb 2026 14:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7523682684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771512190;
	bh=Mg6CeLXqFOddRRc4ckFbMnhOvCmjVWHbmU/jv8jZGjU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Erv0wWevn06ARUvHlLSzaKC/w/g/kvmw5kqrnJbW7V7zSQJjl+XtIPSs0XYW2x9W5
	 WmyPo0kEDgsxZiV2FPnCs7KUaOr5zbzzJs1PIbUqJv06TcU49cn10aCebK2MMFqxEo
	 QAH7GIeLpILaI50YZc7l2Xa9VuiDemOY8JpOXnrf41teLhroFoyh8NWmJPgbUaKdYv
	 26iBPlRxylV5EG+JJkajcjdTwsVrC4SkrQEqN5sdrmTotObaczaol/DcXglDeA+0Rs
	 w+7xntSeB+KDs9FBHt6H6GrxARW/pKhzuZuomtQK100pdBbML5mSCz5lUfwRJtoOzB
	 /LzKkMfMJaA7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7523682684;
	Thu, 19 Feb 2026 14:43:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0C3F206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A656E40BAA
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ky-cK-R-UTXx for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 14:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8D7140B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D7140B5A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8D7140B5A
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:43:07 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A783D2C84162;
 Thu, 19 Feb 2026 15:43:04 +0100 (CET)
Message-ID: <7edac15c-28ec-435b-b1ea-6330166ffbc1@bubu1.eu>
Date: Thu, 19 Feb 2026 15:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manuel Diener <manuel.diener@oss.othermo.de>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260218150453.3743924-1-manuel.diener@oss.othermo.de>
Content-Language: en-US
In-Reply-To: <20260218150453.3743924-1-manuel.diener@oss.othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771512184; bh=HLLz2ytIdaq3OBiV8c6Krnf+Nn2ZncjYK5zTuRkEVh0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=r5ZpV0EKUPT4LeWkKD9os7YN4Jj6C8Y2/zvhEwvQexLi18ev5hWwLQaScZqO8D1+Q
 XVnbEyhwvEj2scx1vrruuGPGdo1yDWMDOSPJi1+q7UyEV2oCWHKVegA27qtJH5TGn5
 6jWeHzvVdQqUlbkCtkK2CyPZtzr1AHsmglk/ouDNFrUqyEcqyVpw+WaTjR8vERdOZX
 xHiyN5h/2O1f5s8Q6y3CNqCqN6jczNyYm89FXbcdJDjgt4rlDnKR2LMYW76ul+neWT
 SEKsd2kBRLdjqbwo2qYycYmOpr4fsaJM/VJ0dlvAzshyo5PjEDv/rLCbLaFnLd10DC
 c0XL1+G42LNKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=r5ZpV0EK
Subject: Re: [Buildroot] [PATCH 1/2] package/python-starlette.mk: bump to
 version 0.52.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/18/26 16:04, Manuel Diener wrote:
> See the release notes here: https://starlette.dev/release-notes/
> This also includes the versions 0.51.0 and 0.52.0
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
> ---

Series applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
