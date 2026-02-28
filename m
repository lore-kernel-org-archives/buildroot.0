Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4741DFEE4E2
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 10:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1808418F4;
	Sat, 28 Feb 2026 10:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CbcgNfhgfCm; Sat, 28 Feb 2026 10:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7170C418E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772274032;
	bh=1dL2EfAH+1hdhM1fuL0Sa2W4lQAU5UAz2Q96U6mwx/4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WuJMt2SYa90B9267bIkWRXG1/WkmWjTvlBfinnPIPLZABRTnLGe06rgfIAFt69w/p
	 uNTOvD73EPsnZF6Hg9a+ZJ7sdlrLolc9T/Seu+YlZDpDQJ/SuQGoEdphNCSBxSrZfF
	 ykZiWXdLV8LXuQyER23BZkYU9QuMDJQe/bFY95fCPzB4I7ekhdlyHuXS9z3OcAlXWj
	 gSsJXqTuNbcr9WKH9V/yg9DpEn0xZ3kpgC4tzvS8BbSqo4UP+XLOLcKJWmlqIzaB4l
	 ylSO63nNcz751YslfyIoJIONk22mdkAJRts12TLL7936J5qwh4P9/3StFtJMACSeOR
	 T00MkCJSP4PoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7170C418E0;
	Sat, 28 Feb 2026 10:20:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB13218D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C855440177
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eCtuzOwTQQm for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 10:20:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1412B40018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1412B40018
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1412B40018
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:20:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 06E3D78034D;
 Sat, 28 Feb 2026 11:20:25 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 11:20:25 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 11:20:25 +0100
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260228090820.1811802-1-lazzer@gmail.com>
References: <20260228090820.1811802-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <e12b29c992708d8c868cdca0968e6830@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772274028;
 bh=2cc22BCcG8RKWuRZeKoXfSgTSgxN/VhQWrDHP0ve+rs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bB3qdc8bsST2qrkR2/2u6j98t9yFoBzvTJFdLu0A9vfUNTJR56gzkxvphQxwi8fZE
 buHhUmRy5SSU2kV4Fda4PJqT4qLs9QqHkuGAuG3FNjpR27X49vQOUQaBrdrT8JLt/w
 HbNFFxNRlQgspCgy4C//8XJGDdVYdtXJTwc0s8UgcNRIl7iR9h5donhxMqlnz9eo2e
 ZSCceVgb0mYjK1Qk8rSexouNNQJ7kIOHzoUb8nltS3XysRWrj9ylEAPlidKgbSZh3a
 wADQ02ZRnVDGNhwtRSPhXTRecSlW1vUnwyy7k5HtFekJ4bGfLrk8a4GashhaxYvBpX
 hrr0FYvFg8Icw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bB3qdc8b
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add option to
 select Airoha EN8811H
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjgvMDIvMjAyNiAxMDowOCwgTWF0dGlhcyBXYWxzdHLDtm0gd3JvdGU6Cj4gV2hpY2ggaXMg
YSAyLjVHIEV0aGVybmV0IFBIWS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aWFzIFdhbHN0csO2
bSA8bGF6emVyQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzLiBGb3IgaW5mbywg
SSBhZGRlZCB0aGUgbWlzc2luZyBMSUNFTlNFLmFpcm9oYQplbnRyeSBpbiBsaW51eC1maXJtd2Fy
ZS5oYXNoLiBTZWU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2NvbW1pdC9lZjRmMGVjYTFiMTc5ZjVjNjIzYjY3YmFiZTg3YTZjZDFmZjEwYjM0CgpCZXN0IHJl
Z2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
