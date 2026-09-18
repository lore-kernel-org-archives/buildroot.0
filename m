Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB536C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 16:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A431812DF;
	Fri, 18 Sep 2026 16:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPLKYXhrQian; Fri, 18 Sep 2026 16:47:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 54CCA81322
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789750025;
	b=Oi5mD+k0fpNUd0S+akyRMkJM3A2CAujsdMEYLHkTICrEqy53xs+5vQCy9xtiZLJ0fFOf
	 3arVMPBlSJyuKO3F8u1zYzy6D5X9mm1pEYhKeIH+KzPxUuP/NebnJx3KsH/AnuFmt9mwe
	 ChxdbrCbpzmCrf0/HCLUZo1KBQnh2IhYMGgFSWX+UR4GvwvAw+9kx4L6SIAG+tobwU5op
	 c5DcV415885yG8bS4Ws9PtlVSvSl4ycqqx1VnyE7y5grD/BG7rYkSBPSaKdms8u3Zclp8
	 whcPaA1w5gdSofUZjRJsGBDHeQWcbsSNnDg9yo1tVqB84FRfpgN1VhWLn9I4YIbyE1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789750025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Kk4DOlN6bFkNSPnVFNo45uYK5aTP0LbmPGXzLU6tLps=;
	b=jYE2i8untSK+y86jWZcablrjcsTMZgPFwlXpIQQn+47jxMrbkDS9siyJA5k3449wfSkd
	 cZpSolRIqBfxFP1bx1viy5K/FwbHRtj1S8W62q6Vj7iE5MGvTOH3NyDyWVk8kG7X7ADWW
	 mZJZoq0ngpxoTX+rNLeO99D29mqZG+3D0OCuerDwK+9334N9gPoAE1x5aZe3PGNUH6D5w
	 ySXnUX2/IUjIRDZxI1pSvg4PVzutACJm1QdbZUloDAuMcG7pjW6rMLe0wC0gnExz1Rbr6
	 FczU0+ZowcijI/OzGXcB6rFaf8/Rb1V8SbiRyiJrMiDXD/tX+VUkvVBjuXGa9ltJWUQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789750025;
	bh=Kk4DOlN6bFkNSPnVFNo45uYK5aTP0LbmPGXzLU6tLps=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OW3/+EK4O1UcUv9H1igoi3nyAWpblpAjFamJbWHjPpyPwbyskTFfSAyH/eF/yx31l
	 zEhekL2T26Rn+nXI2WpQ72y0PBS7aVFjrkp47iPXYhedX8p7+sQLvM3kxgLFq4tcDL
	 1iJRwHPkVdiW9/KFv4rgm17dTdiTcAb4vZSN3DwvSuJNGJRq0Bv/2Dlc7z+1nbo+Xl
	 RI326ZqnP9GCYCrQ15INHb5fvECZE2w+hb58ZhYrJhwBnTcRObNB92LyYQ0CEtNyW6
	 5Ji2zCEsoVbAnReXXsBnWv5w3276VEiCpBkON4iaXvTcuGUY+NxIdqxORSnPhVChsF
	 rFqtEdnSj+/Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CCA81322;
	Fri, 18 Sep 2026 16:47:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2555E362
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 16:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B51240BE8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 16:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4ifWzDsZGbT for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 16:47:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E339640BF0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789750023;
 b=PrXR7Mo129gSPLjRcUR95sLjLyXY/eIkroa0l8Ng95/N4RR6XoNbBOP3GrqWz/TvIPa1
 MrPZX4M9Vr1h2KtJyr5PLW3VudIg6fux0LlSTqid+BitdVzxULbvu3zfOVdLBI9EqM3en
 /UWNSlE63i9vPIqizX5DEaTUyyStmBVWOTwyJHRSLQlKvSUCooNtJDNDq6OTIszVxU30I
 6zXfQoXQygvmFnv/xyHPydHSpD7AAhL4sJ+ufb7R5MARHUYPZGN8RkQygUAcnFNyzFHH0
 K6M43bVi4kR9djXIISirRP2ZrynKMwzMDmv4z19qwqsAgnLUnL70RI244m4fIP4hE1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789750023;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=OrBYeq/sKCJYRi0z/BbHgQnBDooHuIQah3BDmJ5gfgE=;
 b=sv416Sx4ItQ/l8T+foh9nCG+0cxPJzyLh+P2Aih6YwaR82CeyBPSUpo1r8NV9KUjowYs
 aeALdW9xSL12OK3gdvpRfw0w5ly7wMbuwAGa036GA4uWrHacf+1DzQkoZopHIjhJTIjLQ
 xnlOMJaaplUC9qKL1B98eimWGK/0WuZbH2IISVJGYk3t/jQEyabp2UGWUCVBYCalldSY0
 FCgu2v6jN8/sEdtA0qsgZNJq9ADwS4K4FiV3qkFncGEip9C1JwX7BcW3XMcVtL4YfTZp3
 AE/tMFRyQllQR224L4NRCPEJgat6qZUGiTF5wisaeHQ5w8LCMWSyYX4OjuBvFvB0Fsg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n7pMOem6; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E339640BF0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 16:47:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2DE9319F738;
 Fri, 18 Sep 2026 18:46:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 18:46:57 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 18:46:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260918143217.2032351-1-bernd@kuhls.net>
References: <20260918143217.2032351-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <1ba22710713e5670a34f34041794792b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.100.1
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

On 18/09/2026 16:32, Bernd Kuhls wrote:
> https://lists.exim.org/lurker/message/20260918.121220.0f87338e.en.html
> 
> Contains the following security fixes:
> 
> * GCVE-25-2026-09-50-1
> * GCVE-25-2026-09-51-1
> * GCVE-25-2026-09-55-1
> * GCVE-25-2026-09-56-1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
