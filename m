Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE39EA8108
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 12:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F83181E7E;
	Tue, 10 Feb 2026 12:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JsmN03ZZghs; Tue, 10 Feb 2026 12:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 610F281E28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770726686;
	bh=hkG08QrdfGyHEr0xy9t0D2ePUqonRo/zwWozSEXC+Xw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gWd0MC9rUZHYQBQUOoXnfQy+KwmErLNIPynNKe1eO0VrffWn+mTXWOHWaZ3vNNcgw
	 HVskPO3+JscZfMyuM2Q6Se/s8Vmjs5leVwId4FtxBf9lbD3IA57AhmPI2INTKlDakP
	 N6HV02KkpTKLeumfmTTD8km2ZzsM6x3iokbja5247Ybsz8KXRUDUDFzt5SZRrLIuOT
	 I/HqzzM1AkKaWYHOyEfTgTNMsN7iObxtKGVLFsF2IUOk/lgUjwaMpLzX5xjOiws22Z
	 DW1Qhl+eWDsD2Nu1/91Z8HPmNHsiWhVn2HiJ/ZOspz4XCjuszNND6C+QJbj02opVQ0
	 fMomeFIF43HPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 610F281E28;
	Tue, 10 Feb 2026 12:31:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C1E7219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4FA84074E
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yutk4PMKhhGJ for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 12:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D126840166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D126840166
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D126840166
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:31:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 18A3013F88F;
 Tue, 10 Feb 2026 13:31:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Feb 2026 13:31:18 +0100
MIME-Version: 1.0
Date: Tue, 10 Feb 2026 13:31:18 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260210070129.516990-1-peter@korsgaard.com>
References: <20260210070129.516990-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <182b9651515ea3e0660f653767b37b12@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770726680;
 bh=5v28d4a9IxgYa+UadLguUVWpT8aFCBGpXQ6jwp6ZEGA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UM8mp79Y94ZCHAshgzdeTxkfQHPvVa0HzF786iS1trieyRmYTQzzXGTeYA0ItZaK9
 PJE4SFknCzxGVY8rZ5XarISUOkWWZ37AUmeCm9sGZGBazGqkFJRQTQZzTuI29IZlxP
 qz6+W1tx8CFG9msfRqkFHtvi6lo8G1lTdr0DxuLOnQYiHkxNER0hXbIdznFxaD7TYk
 JS+8V9ZHyh9kxkpkWCqNhoR4Q61V3N7o3yTGpFPeJowMdrzSUNSJMYP3/3RSp8KZ2N
 EbEm0FTdzsWThejYtgrnX8GmfJyZ9KaZgJzsvLtPyPTikDGaRohmHU5ASSzfRV9XYc
 g0WupSbmDDE2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UM8mp79Y
Subject: Re: [Buildroot] [PATCH] package/libtasn1: security bump to version
 4.21.0
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

On 10/02/2026 08:01, Peter Korsgaard wrote:
> Fixes the following security vulnerability:
> 
> CVE-2025-13151: Stack-based buffer overflow in asn1_expand_octet_string
> function
> https://lists.gnu.org/archive/html/help-libtasn1/2026-01/msg00001.html
> 
> Release notes:
> https://lists.gnu.org/archive/html/help-libtasn1/2026-01/msg00000.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
