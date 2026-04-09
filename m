Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADF2F364B1
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4D4A81A24;
	Thu,  9 Apr 2026 20:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afd2JC5C_di9; Thu,  9 Apr 2026 20:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56BCE8186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775764852;
	bh=/HVQZlvOYFwURB7sEgiAFUonnrr7TMsgc5Gsbkxqzis=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JKY+frPwS+AO+yP2Am1CKQs/Mec+NPtgqKGjKndqxGWfvCbldqTdgj2WIOlq5xCrL
	 csQzpQ7pM3ZkvZmsHTjjbT6bXKAID1HYxfDoIPSp99xxcEm+xdkdmDwAlLhzrDc+pU
	 QPtbmNfU1FXQNUfETWDOhX5/wRFiHx2GytL161AbbiJvbLyinTkJnfisTVNYswSv2O
	 KPRVF5Cu7jMW/DARKr6fbz76xL7h3UiKarKb+0vVpVlf/IUQ8pHTeTyk/FVAyXgEGw
	 HVn+sNbtLcmKL8jA9LQv83MizO5vT7lPgQ5L1lkwbR5l52qGVpdHdQMzdZ15jWK/5y
	 /5jcAmNM4ByvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56BCE8186A;
	Thu,  9 Apr 2026 20:00:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46817237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 385B040B5A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdj9RYs596SD for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2CEE440AFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CEE440AFA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CEE440AFA
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:00:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 10CBB780333;
 Thu,  9 Apr 2026 22:00:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 22:00:46 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 22:00:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260409131742.278793-1-bernd@kuhls.net>
References: <20260409131742.278793-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <0ff003220963009abb6e518ba58eb1e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775764848;
 bh=HGrL3yWuVoJXh0XZMOvu8XKxOf300dZO+ilpuyxzawA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vYvwk5tmFKPrJhO/yfmnHNUR1Wx/ZLp2pQZWbzyic4ihDkJE55519ovo/EC39ky+C
 4KtwmMEdnwGIFQ7e5OeombYaOsndfJeBsnPhroIznRxELa6KyEFn9s077fCg7RJivd
 YDQESYzuHESzu5DtTyICXNELRL/AunJuYYsHJkE1aeopLRHyi5CVl3fRxqPPr/Lcw3
 Oo38PzB7oUsPTDM/8Sy6HkIBZfRRnKOgOGOmKFs+Wp7OqVY5RVtWwRZKUGkkUZwp1f
 ztESVEKDyJ/znKvMZlTeZs3CN9IeGw6+BSmBs0PisV9WwuCUGXLmkHDvHe1AuRhRpF
 rGXVbAyqc0rig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vYvwk5tm
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: bump to version 10.3p1
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

On 09/04/2026 15:17, Bernd Kuhls wrote:
> https://www.openssh.org/txt/release-10.3
> https://www.openssh.com/releasenotes.html#10.3p1
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
