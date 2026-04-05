Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB67E9D80D
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 20:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1B980CCE;
	Sun,  5 Apr 2026 20:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkIlVwLi5u1B; Sun,  5 Apr 2026 20:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6491980BA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775419663;
	bh=s0dD3rMBzmAzngi6h5ZS63IT9vBRRrzdqAdRYnqtVfk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e61111HeL2MHUZ/t5KvQc8+/SXCqxo54ygvxSPX3uK+OLIPNqbkQ/I6HD1Wt6rjGA
	 2zw/Bp6a/tSyksLwixpGKXqWYohz63tt3u3ZLRRMe2/X2UCdJXarUVmW8ngE3Ic/V6
	 d3lK7wiW3NtATvora+AtCs9sjQzBGiLaS8CiI2Amx03LNZXhtqZ/o1ieBdSChdozmc
	 0VGQbS0HRm8F+d5sURZ7CR4JRsCZPDeBaviUggPgGOwUKwEwABNxKXtWq/b/i7+Z56
	 MhP50mnTmjUD9VbvZTTLjOp28gcvYb1N0+Hl2UM1u1QlC9tMh37okdQZt5z3VNtZeV
	 MWeum1CkiO2sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6491980BA3;
	Sun,  5 Apr 2026 20:07:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1C431EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D53401BC
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkOVZY2bueXV for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 20:07:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A50C6400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A50C6400A5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A50C6400A5
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:07:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BE746780372;
 Sun,  5 Apr 2026 22:07:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Apr 2026 22:07:33 +0200
MIME-Version: 1.0
Date: Sun, 05 Apr 2026 22:07:33 +0200
To: Sofiane HAMAM <sofiane.hamam@smile.fr>
Cc: buildroot@buildroot.org, Bryan Brattlof <bb@ti.com>, Romain NAOUR
 <romain.naour@smile.fr>
In-Reply-To: <20260404174624.2027159-1-sofiane.hamam@smile.fr>
References: <20260404174624.2027159-1-sofiane.hamam@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <33ae810dc28770d9fa88386ce9bf39dd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775419657;
 bh=MAbR6NNS5zWHLpMU7X6D4UKfwlCOMV92ktS5iwCXR7I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SNqWIcUaCtjuRbVxD3sEYx+RywlCCMxXO8tUzjfKG9zxoDqjy/UOu6BpoI6FdTBOd
 SXiBHFp+BjWQl2BCwUaVszI6Twx7LqHVaF6wxqa4LM5DuuI9rGIJMMz0l7qqBvX4+0
 GebSUrWZUiuwjlcYZzqAvAa5nNtMYHrrUebRICuBEeIRf/6HlTE0y3/WpJbldGQv3g
 8WBG4oaIVTnoc+B5Vl4J5dluWOfDXi7Deo9Z+wosC9SaM4faXUs9/xxa3+hQ51lFn5
 q8xaDT2pMvbU3AdUtCfjEvXM/97WJRwnTc2BK+vDh8VyyDf2UAjERIi4IjpmHyF6Uu
 Y6HMI2kGeW/1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SNqWIcUa
Subject: Re: [Buildroot] [PATCH 1/1] board/ti/tda4vm-sk : Add support for
 TI's tda4vm Starter-Kit board
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

On 04/04/2026 19:46, Sofiane HAMAM via buildroot wrote:
> Add support to Texas Instruments j721e starter kit, also called 
> TDA4VM-SK.
> 
> https://www.ti.com/tool/SK-TDA4VM
> 
> Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
> Tested-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
> Reviewed-by: Romain NAOUR <romain.naour@smile.fr>

Applied to master, thanks. For info, I made few minor changes:
- reword commit log title
- regenerate defconfig with "make savedefconfig"
- fix typo in readme.txt
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/bfc1cde65b6574ffb6ed343ec525775bc577c354

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
