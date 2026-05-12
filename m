Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F0CCD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B75040FFA;
	Tue, 12 May 2026 19:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h30dqRg-3xxB; Tue, 12 May 2026 19:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88EE340C1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614617;
	bh=Wb3VzfVvurRUDo7mmciQUDmXW3al3GwdjTguCIx+F68=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PmiDmCTmbZ4kGlZBPaSnCBWStEHvgDursk+J3pWQfeKucjR+pDSkNmBfuGhsE54Be
	 ntocIe9nqA6yHLFP9CLl8Ek/GGIMh6wGlF7Lwb1/WQ6hg4mxL85tuVdxa3U4GRxZaB
	 GqO13e0h5bh0/CtMjMM7NXB8RoSMIbENEiopXxo68AnQQbVgYBdgqDwSTkEXbVf2wR
	 LzidnfdVk0U8FQoqMjSCbz1+frp0ZQYm31zjGU857ZtnyI2GxPSVtWYDs4+OEsmvi5
	 VSU1LKfLrMnN/osXdnQv0O6o0dNuQefKBbO6e/XLsDOyyqFEaePorHq5Bxa6GKx9fp
	 cLhr29KQ8t+Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88EE340C1F;
	Tue, 12 May 2026 19:36:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 223F815F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1378D82531
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdRoTYqDKoUp for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23C7882521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23C7882521
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23C7882521
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:36:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1A6C713F854;
 Tue, 12 May 2026 21:36:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 May 2026 21:36:50 +0200
MIME-Version: 1.0
Date: Tue, 12 May 2026 21:36:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260512150723.1800805-1-bernd@kuhls.net>
References: <20260512150723.1800805-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <4c9699b5e562c89a8c79b67b2a14256c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778614612;
 bh=b1xrGAmU5YYBboYZPY9O+qER4wcQsTjC45+iS5X86Ss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qx7YXlrSkxivO/inl3CRFPBQQOEM/7pqZAUwyMoQFn3rltaS5ybAt/15+6IL+Pl8e
 a325KpmtV1rOZFHRsgjg4aR+7xkPgDG47SUseT0VfDEmR/XAs1nBpFmeZGXP9c9vVG
 TqT5epaiPBbclBSMZCSmoFXHvV2uo8AAWsNAb3z23S1gG7LwZyOu6klRkKrBmvoLKc
 9nu5LD9wu5+EsVSEszunb944YO+ntDKAJr0Y/zeE4ILdb7rk9+ZUBupxuVDP6Zmn2t
 53tkFFsYTmeZ8YsBWtD/zTAZ2YHjK0Lxty7iY3xlPQ/oPCRuNUtizOTgISt4eQljqF
 wrgwyXCmSqIOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Qx7YXlrS
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.3
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

On 12/05/2026 17:07, Bernd Kuhls wrote:
> https://seclists.org/oss-sec/2026/q2/491
> https://exim.org/static/doc/security/EXIM-Security-2026-05-01.1/EXIM-Security-2026-05-01.1.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
