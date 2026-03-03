Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9EEE67A62
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD0B0418BA;
	Tue,  3 Mar 2026 17:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3-jILV0c4d1; Tue,  3 Mar 2026 17:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95964183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772559369;
	bh=l33wrRLl6qTqhezyI+t8mcZB6onKvrqSlADGllZe9vQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E2SB4DuXnhUzN/9SJQs0JOVkdlTzuMSdAoGbWxeFMlbHYn55qKkfElOJnad/2eMWt
	 q0kEMqi7HAWY5isBFAg1KnDcvDo/ZYucZqlaZBl3WbgGUTA5Op+89AXY8w3Z8fd+0g
	 fBE2sBXpJ2LEAVdEASCwJ25n1KDZWRv0jnZSE1ecMHPfXUGV/0VzoWct5Ir5DYUiex
	 ggZ5UOn4MtrjEbYe00PZrk+ZA6AiYaca7QPFzoN0ex1io9e5XOnXia6n+wUSWUdkSx
	 fCSM5LijOK0Bq3Ehh2Y5UTMGHC8101m0QaEria0a1PknPs02/dG5hm2hxFnOPEFLMD
	 cYWFNWOEeCs4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E95964183C;
	Tue,  3 Mar 2026 17:36:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 792C925B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A48441834
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WbjsClHyFgV for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D57741828
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D57741828
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D57741828
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:36:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0C5DF19F73B;
 Tue,  3 Mar 2026 18:36:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Mar 2026 18:36:00 +0100
MIME-Version: 1.0
Date: Tue, 03 Mar 2026 18:36:00 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20260303081323.53405-1-thomas.perale@mind.be>
References: <20260303081323.53405-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <3a276541ceb2d1267a81f1136967a64b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772559363;
 bh=iQQezP0STmvGmvROwVoKoSOKiwtzp2LeQGGbFhMAoCs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kRJLSfi9aJcLDsCd/y6epd73UEzfAEftNp95gXcxt74pAc7Wpixp7XbUX2cM35R8d
 0pVHYQczTyPh0qaMaUUt9YG8e1CjyrDORwVQCgJE94g1wOSu3B467Ke7RsjdOKSCUr
 hdIGFYo9Q9c+/oRjKXrGKNzPeLShRHKG24G6XQ9Rk9oSeFiH1xAk0naH9q5iXATYtR
 NcHYv3K2FcxjEShBi5UWmaZ4CIk+HkDMuS2BMLqYK9q5MJZDHfgGpa3A6aSN5yO7Zl
 Y/Hh5oz/HgoH79cahnQbNtMsZ6ZBxoeAZcCsu8XmGwNYzfQ+QooaifbEr7Ryc4qIBw
 813y2rttnvQOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kRJLSfi9
Subject: Re: [Buildroot] [PATCH 1/4] package/graphicsmagick: add
 CVE-2008-6621 to IGNORE_CVES
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

On 03/03/2026 09:13, Thomas Perale via buildroot wrote:
> This vulnerability match on every version of graphicsmagick. Since it's
> really old it's unlikely it will be updated and is thus added to
> IGNORE_CVES. See [1].
> 
> [1] https://nvd.nist.gov//vuln/detail/CVE-2008-6621
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

I applied patches 1 to 3 of this series to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
