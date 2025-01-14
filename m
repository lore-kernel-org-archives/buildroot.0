Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24504E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 19:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD3BF406F3;
	Tue, 14 Jan 2025 19:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdu7oNx_sA8f; Tue, 14 Jan 2025 19:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB5F64099B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB5F64099B;
	Tue, 14 Jan 2025 19:43:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3994B8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E7C40707
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6f2Em3Z6Vkx1 for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 19:43:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AC45406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC45406F3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AC45406F3
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:43:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 93C8DB0053E;
 Tue, 14 Jan 2025 20:43:10 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57200])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 20:43:10 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 20:43:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250114091520.529839-1-dario.binacchi@amarulasolutions.com>
References: <20250114091520.529839-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <64664f71ff429221ff8108f6b115a3b4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736883792;
 bh=cKtY+rdEosbz7yN2YoSvsMPkWG7tSmUvZ8twUv7wq3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HOnS714g+j+RWKCn8P8X9pV/19Q8FemSweCosxjsx4HsiooO+IyvF6AE7HWb/80wv
 lavH+Avlh/qmZcEEcYr+LwZ2m/6NeGYWiarA5cXO5K0IOmifY7f/q4B9yok26vYVdV
 oPocfdroqdA+XlzOvWlIWLHlY1hY3DT34jN9rLyCgQ66oTMztrjAV1ZeEzEc1t11P6
 H+9n8Trbbb/bwaTaf4eCDQv9KGjNby90J7Ewjte5oR4OuCKIFog0IisGxf2z33ULzR
 2WyMiwPr7drGhRjpYgYQmDl5oqZlMz9YcS+mb5EAs1goBUj0F5WJHqgl94A73pOx++
 Mmz9AlzLDpyTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HOnS714g
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.201
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

On 14/01/2025 10:15, Dario Binacchi wrote:
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.197
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.201
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
