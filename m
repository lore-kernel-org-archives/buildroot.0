Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B2BD5B158
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 12:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD03640BC5;
	Sat, 13 Dec 2025 12:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nwc1nAZWcIca; Sat, 13 Dec 2025 12:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1B6D40B2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765628706;
	bh=NurSq5NDWeReQIdTP4QmAuzQz1ffanJ3ATrFMU5mZSM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sVB5XSw62fCUKaI5jVB60AHBRtMSOkxGaTl9GqRQ2hNAx5adCf+ukN1JidhUFyLmg
	 OztIOEiOoqrgupPg6nnCbomW9TNofqVAuiTNNVjFZZJQVgHMMKwXVYScvH99BmIYL/
	 uI+yIbcc8DPa9dS69nuock4U0FOGkYY5HUK85GiifH+4BmjdYocV5T9VtD+nIJ8sBg
	 6obJ1fj2TFFgjpbZHRU5A549G17+i8IsVZ2WWmto5n2TDACoHl8KguBE+9Fco2RUmH
	 XqxM3hV9g9QwfEZDcSG1ce124nEKnCVH20C4TTRnjguy6BrRYr/xDm4Aanw5FGVq8c
	 SYq+i6CanLwnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1B6D40B2A;
	Sat, 13 Dec 2025 12:25:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1AA013D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3E81400BA
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05LOBF6GT2Nt for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 12:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 566DA4009B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 566DA4009B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 566DA4009B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:25:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BE04578035E;
 Sat, 13 Dec 2025 13:24:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 13:24:58 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 13:24:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20251213115728.1277185-1-bernd@kuhls.net>
References: <20251213115728.1277185-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d6bc7feb408d5b71c2de5dafe320ce6b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765628701;
 bh=uwSazW3aGoIrZ3kEuruu8TofHycj2RlB+ahiHATcUvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b2NiFYDlIoFIifvq9ISmKyqlWuqBe8EhVooVSy3vohpH7GmoCT06+7v5z/dwJLCiF
 11fiSPamNQKEBy2PDoPcbPVhKrKOBsmeZ80wVitKoRuOuHcgOE3xLD9hOghh43sqkZ
 UgEgULZX5PXwykq8fp+esmfDr4cUk9XoyK6LzVlZ3CdvmAqvimBvXqWONGG4NYCj2E
 Ngtgcps3xuqvzczTcHHR1TPIKMPveqB73u8r3Rg37FtptG23+ZktdpTF3nCJjLgz/L
 l/Ht76FzjEEeYBqyMfEdQRHP5bOVElMeb7mlg/AtXiv0b2GHZLwYb5tC4izHpmVtUn
 FGYFxICy8yPvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=b2NiFYDl
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.4
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

On 13/12/2025 12:57, Bernd Kuhls wrote:
> https://github.com/libarchive/libarchive/releases/tag/v3.8.3
> "Libarchive 3.8.3 is a bugfix and security release."
> https://github.com/libarchive/libarchive/releases/tag/v3.8.4
> 
> Switch to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
