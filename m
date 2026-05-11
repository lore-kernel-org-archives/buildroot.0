Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5B8CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 17:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9EC580D9C;
	Mon, 11 May 2026 17:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cw_b7ZY6nUrP; Mon, 11 May 2026 17:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ADC980D89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778519828;
	bh=ML/uh5GIe+hf6AYq6Rr8nb3NCP5Ll511UP5PcsVWN5M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OmdIK5fZjLA23HwXaD7eBJsAmTaeJaUcYXLy1aamomPOclFOxGt51K+kHO7kkeOrZ
	 9ckTvt95ZZ/ZYckMbISjp9bIbWY2Rp7b2O/UDi7HVBUfCChDJE6U4W3YsMNF/yo5Gg
	 /8v8tbi6WheljlT0OlGJ+OMFGXbx8TVgQOo+gldl74epmWyu6S4s2Ay/zPdRdg8WV5
	 bsqA9HKylmcETbb54cR5iTq/xtHg+M3Iqd9rE7p1g/M++UBDQrY+37Zjpin4CAxvOH
	 4C/ucBsqqUv1rwv/H1ADz8BD0b2MclM/NFwBZgaNky79uErbNU+KcrTri+B6d5BIr9
	 uo7YdIoWvZAmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ADC980D89;
	Mon, 11 May 2026 17:17:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D19BC223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7A0D4005C
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4eW8ITX1Zf97 for <buildroot@buildroot.org>;
 Mon, 11 May 2026 17:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6EBB40017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6EBB40017
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6EBB40017
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:17:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 836FBB0051E;
 Mon, 11 May 2026 19:17:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 11 May 2026 19:17:02 +0200
MIME-Version: 1.0
Date: Mon, 11 May 2026 19:17:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260511155926.1225557-1-bernd@kuhls.net>
References: <20260511155926.1225557-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <be682df223b959e3a6b38289040e5164@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778519823;
 bh=2aa1O8zDWDjDu+lOnSukZKMjCvKlGXsjBCshBaFDQr0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hr9rskiFqKBJJ5ZSbwnAKkytFINQushy+yzAzYUPTI+3g6cLkCKmzassyyGIVcajN
 DaMT1U4n3MmAXvqb93YrTEZn+jwtOy88V8RPVTDIV9XNBoCPF5nWeAi8R6L7zTxZt4
 7cJ7jD6YXkmRdl1SN/rXJdqkuLeM+MIwIFVQ3tvXuveSLB5QChVHIJYxhIvvWvbezq
 gIKbbA+RsFwEa4ykxWwCAInysNiZCqGYCut8kgDMmQ2Yy8T0byVfyAfgL6zFszOtCO
 UHirQtP+h4tufypj3KXO1iRr2r69ZOHSV/zszxrD3+OkW4SslFpIoRw6ar+FMmCwrA
 1XqMLXOM4OJ9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hr9rskiF
Subject: Re: [Buildroot] [PATCH 1/1] package/libksba: bump to version 1.7.0
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

On 11/05/2026 17:59, Bernd Kuhls wrote:
> https://github.com/gpg/libksba/blob/libksba-1.7.0/NEWS
> https://dev.gnupg.org/T8121
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
