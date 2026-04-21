Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D3DF8FA9A
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 17:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAF7783E32;
	Tue, 21 Apr 2026 17:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFYMJ4HWOUxb; Tue, 21 Apr 2026 17:16:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A78D683E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776791764;
	bh=w71rAUKrfoCG0SlMF6fRky5ZvUpy9CCiOzET7RE1Xq0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hYHC31/2AGkhKNqXFeI7TnpMLBFtDEe2JfKn6xX0laCfqdZEhEiLStgwXJz5wX/5N
	 yfGOjvcqC1w+Y3BGecqebz3CIZyrK4D9xAQ/eMytlU5W8S61BdNK3B32z2rip4Et66
	 FHM7EopHkMlgrESLK6FLoAJIxI+HsEqzsi6VGYrfJmREt+U30Y/39IT8kQlF8KwsMh
	 kXAlfRVxmudWdIyRDQbDna+6qXTylL/hgPwFLCYy8sMc6xrimXI2AcrxOvRT7+3xuf
	 uRhsHxeglgSqjKMqzrwRhkVaNi5N/7lqAAyZdp8aKBBNi0rXMHjfal3QPJEKiVghO6
	 56+pGWVpDq2hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A78D683E12;
	Tue, 21 Apr 2026 17:16:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FAC0183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11C594028F
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSCEDuRS_jG2 for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 17:16:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0918840262
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0918840262
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0918840262
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:16:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id F025419F5A7;
 Tue, 21 Apr 2026 19:15:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Apr 2026 19:15:58 +0200
MIME-Version: 1.0
Date: Tue, 21 Apr 2026 19:15:58 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260420173847.2353616-1-dario.binacchi@amarulasolutions.com>
References: <20260420173847.2353616-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <0112b0a4ff923ed9ca92503a0717dd9d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776791761;
 bh=F1z8ro4c5um9Ga/fVNOH0Q4QRA5afvcEUMLrKZlK8YQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ATqU9GikaYP8STwsh20QXRb1u6Not3SdKL+Uz41Tnu4Gjc3GjQlzj/nM1ET+Nv8sG
 guaIrQzlK8X/IMpAlSZjVEN2SzBsatu2cfr+7WB2vqebSdl3h/bA+VwJgc1G/r1awy
 4NJ4nDzZiICmxUXWMzgGhIUaOdpr2lLpz94L9WCzdk4usYsbrTMZOcJIugrpamCCYr
 +n69lPP5jF6jqLMuP6Ijq9PkayrmcGcXWHWYq40+knCt1/lDp+p3B8UCgQvK7mQlSB
 zbMOGmngn5GcQyIr2O8SmLVwLvnpNyre8YcUXmKUOrH2+AI0xr5Isi4EgcJfpPfiQG
 qGiSSccoX16hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ATqU9Gik
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.2.6
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

On 20/04/2026 19:38, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
