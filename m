Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430E0C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0393683CED;
	Fri, 16 May 2025 16:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJ7sbMFr0LUO; Fri, 16 May 2025 16:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9A183CFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9A183CFE;
	Fri, 16 May 2025 16:44:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A7B513D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40896400AF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UomunNmeyzvO for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B0B44003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B0B44003A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B0B44003A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:44:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D7A4F60142;
 Fri, 16 May 2025 18:44:03 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 18:44:03 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 18:44:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250516142827.3211350-1-juanpablo.monterocastro@nxp.com>
References: <20250516142827.3211350-1-juanpablo.monterocastro@nxp.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <aa6fa85b2b6df4d8a161604e3f9ed006@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747413845;
 bh=oUWNh8z807M/Y05nJ582GLoKXxRA9Q+pbPHmIequbOc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=He7e37Qufma8HrkybW+bb+8iPoXv9D3djg7+LHc0+906utmD0j88M/nptLhvCYdV8
 IcZn2EAh6Rd2MdF2KP4CASKdXNaKKGfjP1x+fGqgcMv86KocOm5TMGoTejDfA95lsK
 h+o7QHBPoz7HKvDwyCtFRWfFVeF/x2XXWfuVgD29zgde+7YyEtkTDFylOfGD29ddDn
 XJLWRUcxvbdziGI8W//noJwc/ksjiNGxovRJoQNkuPGNWwgiUWNoTq8wakfKM9Bkuf
 ta8GWhz+zldPHFdD967JaOikZI+8MRp9Mr2HpT92O34vWPgEHCfEoZITWw2JY4GVed
 0pDGBdpns0+2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=He7e37Qu
Subject: Re: [Buildroot] [PATCH 1/1] fix imx9 bootloader preparation script
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Juan Pablo,

Welcome to the list!

On 16/05/2025 16:28, Juan Pablo Montero Castro wrote:
> From: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
> 
> This commit replaces A35 with A55 in imx9 bootloader preparation 
> script.
> i.MX9 families have CortexA55, see link below:
> https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-9-processors:IMX9-PROCESSORS
> 
> Signed-off-by: Juan Pablo MONTERO CASTRO 
> <juanpablo.monterocastro@nxp.com>

I applied this patch to master, thanks. I added info in the commit log. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/a0b51dd088de15ab7a039d7d7476022e826fb4ff

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
