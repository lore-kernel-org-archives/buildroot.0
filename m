Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014C3D3B994
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 20:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0EF28432C;
	Tue,  9 Dec 2025 20:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9MEBrN-1Wme; Tue,  9 Dec 2025 20:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 984F58431B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765313208;
	bh=riS+ECAmgMxBDefOaWLchDvS6PB0+nYm+q2arYhtQd4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IhX9w8Inh4HIlRwrsPaJiqQwjCyrwkHiqmoANfIEhtCBoUSdkT6uCVV1RoOs3z/H0
	 uRuDtqSy30yjsDDEhJ3JpenHRuaOnWi73OducMp2ZzUEd6Dr1ICAd6nkmjD13SXi/D
	 4mvLaEgf7gs61RxYZ7Og0XV6L9V7OqLGZxBLYCnjV14LSpVKNTUTiinDtB/xq79Tv/
	 6CZz4nQuvvP2LRL/E4CrJk2zG0eqM4Nq9UV7hGtiberuCssl9lu4PEl9L8/5cbQXkl
	 JUPu2RHNIrGSlX6hX4QM4AQ9+gR1fzeVj5W53zlb+zX8Mk8KNX8NFPuW2xShUOGiTU
	 nTX98BfCDMTpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984F58431B;
	Tue,  9 Dec 2025 20:46:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02DDFE7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCEA040467
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqfF-FdxHmxK for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 20:46:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6ADA640437
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ADA640437
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ADA640437
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:46:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2538413F89C;
 Tue,  9 Dec 2025 21:46:40 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Dec 2025 21:46:40 +0100
MIME-Version: 1.0
Date: Tue, 09 Dec 2025 21:46:40 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20251209190211.186523-1-bernd@kuhls.net>
References: <20251209190211.186523-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d92fd347fb2c99afd54097dca4e3587f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765313202;
 bh=JcGU2v5pwFBuLMRdxp19+XEOGAHeAaSq1KkSrBr0tlo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZlMxJcdaV/g7GStuLglaJ3b9OIwI0oZTWI4dVGtbxJ4ImMq0AW4Y4gtwtqHRHZwoR
 MyDLOmdug8URQbbBawiAWfmswCa9UlDsW7ep0Caw1MQ9Vmx/CWpInwUDeRHzKaz3B5
 hNKkDZ/za4obItXwM/dvgUjXOKqDcHULLtG77LA9FK6n2y39GVO9+fMJnGUqs9fXfF
 y2Ej5XtE4QeIfiZhfFjCBZENYHLAsYCXuYdAD6gVW2Fkr0dqo72QE66zNPoUYJ3Ghh
 pM6HI4OYGyrIf1DAWhNl9t40iJTD8yX5T1BKF39+mgqvbdFlS9rlrFaRBBu1uvrT71
 UiQqRdQ4tcN3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZlMxJcda
Subject: Re: [Buildroot] [PATCH/next 1/1] package/meson: bump version to
 1.10.0
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

On 09/12/2025 20:02, Bernd Kuhls wrote:
> Release notes: https://mesonbuild.com/Release-notes-for-1-10-0.html
> 
> Rebased and updated patch 0001 to fix build error:
> 
>     NameError: name 'env' is not defined
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
