Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A94BE6FE51
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 23:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F528272D;
	Tue, 23 Dec 2025 23:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uikXPw8tqXav; Tue, 23 Dec 2025 23:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FB878271D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766531537;
	bh=uyY3jPjCVNfpDLdtxQPjuv/ABaEZUY8/j02mOxRE1VI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m6xOgiz4YvkFEo4mseA/x9XC4iUEcuYQ9OGBekQn877ho72Vi61BXnYEeryGtgwOC
	 z+eJ67z+YzhJ2CEdFtggqPp4S1tbDCtenJbVMYXmH3EVnOqS6fE/N0ig+2u/0Mtwt2
	 WitO/EUhdjLS+aMpbwDGn9APHfEqrhiXRIaRlemfBEUFgjyhl2xokjTKBy5iJzCT6I
	 58y4+tzSkLdOvi5s/hO7wgME2wzGA/4ou+t4rY2hCAP4GP8ornkNCdP02z2r31cF0Q
	 dluqqUUJLumb/8TmNbB1MsRfShQX7yEJQAFQ5/IUuzhfzZzKfFPWInjKfQCVakng7y
	 RbBch+4bEJOXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB878271D;
	Tue, 23 Dec 2025 23:12:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26BB1B9
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 23:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D08D40249
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 23:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S53p494YAHen for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 23:12:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B2274021F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B2274021F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B2274021F
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 23:12:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EC773B0053D;
 Wed, 24 Dec 2025 00:12:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 24 Dec 2025 00:12:06 +0100
MIME-Version: 1.0
Date: Wed, 24 Dec 2025 00:12:06 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Ga=C3=ABl_PORTAY?=
 <gael.portay+rtone@gmail.com>, Julien Grossholtz
 <julien.grossholtz@openest.io>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Martin Bark <martin@barkynet.com>
In-Reply-To: <20251218201147.2617551-1-ps.report@gmx.net>
References: <20251218201147.2617551-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <91cdb7139983622d809532f33627f3a7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766531532;
 bh=15jS3sDexGI5zqW8UyU7PW1j0t35CJGwHGK3mTUtd5A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FOegV7djdX+fhlYt828rohuWp+WFqEYbZ4H0wdjppQBnkH5wlmi6Et/X/ZDeGqFkB
 nwls5JbJZRdVYYaHGtnyiBxNpsIByQY9dhd99NLlquK7x6VecB+PE9SeRN08TLJ/hs
 quzngJMVvxnwdzg5q4JhJ0susCYbPUNptOfU1M7DXQj6mDLYpCxd3Td+WDwCnftCJt
 R2pclsxhKABgKangzKGr23vXr7b1J8Mnza9sJe0kYkfaO3t4DN7twcOsIibqqUO5sx
 Mc9SEdrdrUATohFYVhnYnbx/TofUlS2BfVV2C9TcoVuE27Na2tNKI+1a6EI0XlH6fn
 SCErD916FDa+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FOegV7dj
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/raspberrypi*: bump kernel
 version to 21b4101 (6.12.61)
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

On 18/12/2025 21:11, Peter Seiderer via buildroot wrote:
> Now based on 6.12.61 (from 6.12.41)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
