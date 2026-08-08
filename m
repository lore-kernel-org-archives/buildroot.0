Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D29C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 16:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6729180EB0;
	Sat,  8 Aug 2026 16:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMg3eToE8PCg; Sat,  8 Aug 2026 16:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54FB680DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786204823;
	bh=SjOSnyXDLRbLQ4/I/sPZEDptKM/USh2gKl3D7XJTjtA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dB+plel6885/8B2rgaSYMRg5IIioCgQcC5NKwhZSwkjvfzV38QPcGX5hqKq7gPxWj
	 SKbVacYDUB2tX3wP9g5zdnQhZNYOqbzKUzyFMqf0tv8oXeX48r4rAF8Q3a51dY37fi
	 gGNP6qr2btm4NDOEAwOGG9YcBin5PvbPvZAtqCsSuuxElPkMzUkcIwOuGNcr9gPrG8
	 h6kBLkMwi6GJKib1hhjFdaaeVn+5uREKun/CUUvzNY/B+FkmU6PeljTHQ8FmPTQpTT
	 DfERT5ZOqpyjoTGpBq0IkavtTSf6HOQn0vDar5GA6JzpkFre+70vf5DL4xCbPAxoDj
	 d01PYPAYg4UvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FB680DC5;
	Sat,  8 Aug 2026 16:00:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A20D810E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88232400D3
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxxRvySX51RZ for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 16:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7760F400A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7760F400A9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7760F400A9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:00:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B12502003CA;
 Sat,  8 Aug 2026 18:00:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 18:00:17 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 18:00:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260807184935.2744630-1-bernd@kuhls.net>
References: <20260807184935.2744630-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <6232a194d20a6ada2e32141ec5872ced@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786204818;
 bh=sEIxhVwlD0kON6tR3phT/cFuGvHEOriYbFRl3NPyqSU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KMNrZ+Krajfxrpfgx7VWdPfyx+nn0T3dSdsut8wMcN1m6bkd7U+Yv3qd3sIn317X7
 w70e0ltslbE1iOSRKue12M+/jRfAs+/jnT+DzSl3DL+XMljKQYwAsCMC7xJ87dEyxz
 CrkfLi4bBu7q8sPlV1kMxvxJAXF8/C8luT9dh3gMdKjyAa91f20MJykWhIkSRJLISJ
 ar4CaD/7oIxcdFakj5qGNFXPMrTolKXLv8LD38FQNasasDmJ+Gq+KNFd573MXzkWCS
 3/5A5yysR38ZVHWqz/QD9OE6p3qksU7orzbQ8rHly7Zt4uzBrWemuNSNZQIvQ28e6q
 pYNAnLsOi2N9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KMNrZ+Kr
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to
 22.10.1
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

On 07/08/2026 20:49, Bernd Kuhls wrote:
> https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.10.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
