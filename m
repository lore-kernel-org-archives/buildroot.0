Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99471C44507
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 18:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76EFB40775;
	Wed, 15 Jul 2026 18:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFrzBJvFY5iu; Wed, 15 Jul 2026 18:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E0140666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784141549;
	bh=IT4jeHaeCmt6NW62p4R9Gk0pRfXx4oZgAFzECdD2WOs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=flAe5UmS+yYG6t8oz9sy7fiphJj5Qy6anQ0SWonr9cG7dknISj7Go2foTPiVfAScH
	 ew5/mvtfW91wgmZ6cGn0vDmwazpFJpV3YUveMv+n6Pz1ggjuazuoW7/vFJH2IUFMgh
	 qpMNIWQLx3wxjdZHscH0bHRS7c8MSYMGSPJVxbIfiCf1IZfcCjUNsqED/I3tAAqbyD
	 DlcHyDpZeqVDWoqDEr6v0yx+4ouroDvj4n9yv1rPMkiA4eO6fEb3er4r5kdcBqDL6D
	 dYOyv/fnO45uE8EqluRLJkP0fMjXrIHYSa8XjdJu1hSgclKpwVU+iJLRg7t97QS5nD
	 KOefFygev8Awg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E0140666;
	Wed, 15 Jul 2026 18:52:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ADE3320
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 18:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3088480D16
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 18:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1QY6SlucgC0 for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 18:52:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A758E80D1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A758E80D1C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A758E80D1C
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 18:52:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E08AF19F5BA;
 Wed, 15 Jul 2026 20:52:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jul 2026 20:52:20 +0200
MIME-Version: 1.0
Date: Wed, 15 Jul 2026 20:52:20 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260714195710.3293499-1-dario.binacchi@amarulasolutions.com>
References: <20260714195710.3293499-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <f5a7cb7bdca603174381529ca17c5684@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784141543;
 bh=pZr/8C4JrOTRe5wrbvc8PWvlWTZSrcZ8VjFz/HTVIyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=heah9IlUhiNM6QNEmm/eMv6/mfaSe+eIbNSWVQGciybYheK/h5aRHIh2NnPTLMApf
 T/K1d2nHN5w9kvxKxe519tNA94AYg06Fp2Zhf/o5ZzRrYh/SM6VxmnrBBeKplM+JUh
 HeSeL1/FOnRCrud8eMY6FFZlxZFlg36GEYa5rHs4Xm+N3erp5r7FDKzXhdORSl3P9C
 g/fXD2dl/Ng38PhDQxWjBiQ5tYjIKYGRDQEVCi3KoyGL5JhwQK9h2ywBf9aHbqcI51
 jUgSRg1GRBBUmIIpYkKSkRvoUksqT+ckI8GWoHvdUtcFA3Wlw/JA1DwgbjLeDD/Znd
 hO9wgVIPC4bkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=heah9IlU
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.4.1
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

On 14/07/2026 21:57, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
