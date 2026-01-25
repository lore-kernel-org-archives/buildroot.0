Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9150D72371
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7EBE40818;
	Sun, 25 Jan 2026 21:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVK0AFL72--c; Sun, 25 Jan 2026 21:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E65184088F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377720;
	bh=B6oBfIdpDdfn3gaqA+CORu+JM01ofboyqQurUFHA/iQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dSU7D623ZNWsA298xLXGUUEW9yClH/4gyCDcBDHwa5OU/vKWOjLgTdHnpynMEZnh9
	 tM06gpZV44YlB3EY27uDOP5Bu12EuFxdRd13VFyyvlnOBeH5qewaoUvGhjf0a0fhU3
	 uLFPeixQ/ipA+GEIqPdleY7AjWqpKDx72DTWGVE2axhyqOAiRPjdEMfnLEezWQBCnA
	 DJ9hWRg5DhhMGaEt75ctDBy9HX9EsCY36ibndNmbYySAKW81temsAbyXEUwG9mBDob
	 k427GLLOHBOC4uCdIAyml1QYGwln9r5E2+b53WXdN0NKDKMwf4gdLibsgKaOAb4iIa
	 PE5/dj3HbG4fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65184088F;
	Sun, 25 Jan 2026 21:48:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73FDB35C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6462160AAA
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLTyeapm3roQ for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:48:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC13F60883
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC13F60883
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC13F60883
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:48:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BED1F78034D;
 Sun, 25 Jan 2026 22:48:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 22:48:32 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 22:48:32 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260124153325.1060846-1-dario.binacchi@amarulasolutions.com>
References: <20260124153325.1060846-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <5d6258e5a1c8bbbc1a8a5763fe5df545@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769377715;
 bh=8ftqYnnZqqfGUSdjUsgi0eV02Gbcd4CoJ4dQbRV8hlg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F0/RZSSIvMM/Bk+V5Y0hKkIxPZmQQ1RsDeZjZQnKW8JVf8uE4AO/8KzFmnvcFrcdy
 gf4RoK470w2REcaC10sJGqAt3lnk+M9/RDh++U5Oozz2m5GfPmNWXonIvUNP3JgAtT
 aGvYuRMXr6Ew5Gep0D5TzDTKMVkrCLQZF4Qyhq/qlt0MFlIB+jxPgdDaMSmVSkjtJI
 +Gv4HO3pBavKkEUFpoYa1wO31frcUAU3RU3eoL1rCuf3yFOmbQy1LNRav6fpMTPZ9Z
 shBkbi/ezvxbTDZb3JX3RskZHPaJH0ikdxaubkdHq9hYkTufIxKxuAK7ja0L23Phep
 n9oEMasdLChWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F0/RZSSI
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f746-disco: exit post-build.sh on error
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

On 24/01/2026 16:33, Dario Binacchi wrote:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
