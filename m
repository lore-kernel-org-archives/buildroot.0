Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E3ECD5BB0
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 19:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D0416F7D3;
	Fri, 22 May 2026 19:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcYdo1nGagE3; Fri, 22 May 2026 19:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D8A161530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779477985;
	bh=8c3/xLwfz914jIAzNiLmxAAqgH7l060Dbl79+ocMgTk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OTQ6iXnwekm8BfGQGZoOB1RVXpuuSB2bKchFxiA0tdC1vjGooYPMZ7tw4Fhs4jlnr
	 xFG/JBLdUt4TyWcAmJKwL8rmquiiaSxuk8JARQ9QuSkaSj8a8AatgTYrMi7F36gXSe
	 WONcTcqk/OMMV9J0NNTwKvdPSJHS0Dm1BCRhm4lndvkGofV3QZEt12FfxZyvX4MFe2
	 FgLsx3iaewhZ8JYCvrt3Oax2Ji5j2uiaAbitGpyHRdMLt5jZuNLMZNaXy1T+t5YYoR
	 02FN/6P5UcPaSuxGEqobE/0Nnhb0s+eC6EdA8AgasbmAlpTJc5Kf01BHI71HQm0pWk
	 SBI4ctnf1qmvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D8A161530;
	Fri, 22 May 2026 19:26:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25EB6282
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23228855E2
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0Sc_BPwJguH for <buildroot@buildroot.org>;
 Fri, 22 May 2026 19:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 260B8855DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 260B8855DA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 260B8855DA
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:26:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 92A5A2003C8;
 Fri, 22 May 2026 21:26:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 22 May 2026 21:26:19 +0200
MIME-Version: 1.0
Date: Fri, 22 May 2026 21:26:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260521164224.1462806-1-bernd@kuhls.net>
References: <20260521164224.1462806-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <ca79d7e463f60652fa96ba5e3a3c3aa9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779477980;
 bh=WRqJqHIWKeHTnLCS/LP3IHQzgacFyN2iutkOQ+0rJT0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LT0gLpjwMUAEar+IrXOAVLrWpFvwMCEoP2VzxEP6N+y5anEV/t4+TPuPZKbS6BoE7
 RDuzy8jRdwZQ5sgOtlSk+757DfYGd/NzQrkBgQFlrv0YQQjIOWjjkRFV59G/8OaryF
 XZCR2Pl/EI40eFgfvm0hSl0y39et8JEodds5fY9tvp8E9a4sNgMjoC6SdE2l0hhoBK
 tY9xzEsmI7i5qEdvD/r8w22iq3XgzSa/Ymp96/b7PIH06gJDeA1VIxErUTfKxW0qky
 bfLQ+mxOoxG1a2KS0HduAczpuHenA5/nNHC/GcO1pjsnXa5wpaIdjslTQpEuUh8AXb
 LG3gnOyA8+8RQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LT0gLpjw
Subject: Re: [Buildroot] [PATCH/next 1/1] package/utfcpp: bump version to
 4.1.1
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

On 21/05/2026 18:42, Bernd Kuhls wrote:
> https://github.com/nemtrif/utfcpp/releases/tag/v4.1.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
