Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F18FCA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 05:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B038813CB;
	Sat, 10 Oct 2026 05:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4MIHK12xo6d; Sat, 10 Oct 2026 05:40:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 56AB2813D5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791610819;
	b=JGNvbcNL2GRId7DypzeLsZASItRnQpYKoEGilxTEpz51FihGluHgoFcSKBgfyn0jcB9L
	 +8d8FjpjuQodcsPBzI5rKQUaKL12aDTlKxNccBv40eDK9ULfMMmghWDXiIaWDEmQplPim
	 Wb1xQuB+Bjk5vSJMUcnTFD9JTLV7G6h5Ric0lnbcuE0FMEVYVJPCntGDkFhY4emMbAhgF
	 3o7MvdABEN5BBJnyvHHfGTd3z+LVRb18pZDzNR45O3+STGx/BBFYt1XCdOJCsRjD9RUDl
	 FkiGRFgZdpMDLmw1YII8xEQ5J6Ep9N1JSIQocNEqsHc+AulCTq0L/CRSLnOq7k/TXNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791610819;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=w4Uy7IZvqRSPfZVQ9XFQugRGcK9SC8g38ln+yOhWfkU=;
	b=m+zEnIC0pi5e4s+lpQOF2w5v5AqJOFPMsop/tfMPQMUK3X+suiKnqzzijNI0GX8JWPWs
	 l5eBXX4pRzK+WPe6dIlQfPQN2NntUSzJCrPCxq+Wz2s0ujTGErvFHE8lM8CTRxU5n066o
	 S4zmOY9rimW13+xwwEYGqGPmYqVVdZvA/zVlo1Ge6d0rRrk00Y30Dp0/sF/dT7BLoOOzi
	 jCpCm9ZnbSvn29kh7fyUaAlctrPw58DzXmQUzVFyI1r1RavXN/gmknCRDniczcUn0r71d
	 PZVh0ASiRgUO9GTZ3XBb2McpK6XIgN3KeIZmDlkWP7V/BYPiDWD9BrRfxecF2jgiGbQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791610819;
	bh=w4Uy7IZvqRSPfZVQ9XFQugRGcK9SC8g38ln+yOhWfkU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CZBqcKWCpJfaTmUhSvUbaJuv9Tim9fgKGnfLBQwv1px6UZz382wJ124zAaRTtHTgA
	 dcazHOJ20nTVw+HM5fooG7uZXi9P6R0IGlXZs5ia1z1zAT6rSXLRPiApGi/DquEnr7
	 gDIsdiXC77zR1OAkFhQjIdVTehbqsg4t4gJf9U2lHVL41AoSXy3cE+PAT2pjnVGDr2
	 NNrpGPuNAwUBntdJGmQrmyDvX0fHOgShjzC3Cvnj1F0/rkxPDYHQPTBsgeg5FcmAet
	 MTphrbxUYvJ94c3fLgPCbCHcRIaEkXcYgqhV8ubjDN3t5JhbIIkG8ujw6wF2rSzRjK
	 CtbfySJfSOf3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56AB2813D5;
	Sat, 10 Oct 2026 05:40:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3BCC356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89755400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1Rvo1raTREu for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 05:40:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C28C140004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791610817;
 b=o9icUfyj7cSiUbwht+3HdZld2ty9SKqW5vu8dHbUAEtmq7Gi8SkRm4TXIqjEP8QpyTS2
 RjqaHi1t2NQhWoVkucwgQI0FxaCN8UV0yhs4sJCDPcnvipmzRB4r4hHsoE93ulzaz1UsM
 gl8opB5ZhRK0vq+h/qp8xukXHq/GFjbSxyitBht1SW3tLYYxv8yhcIGhb+Jgw6foUzDVD
 1Tt0l9Tj17jYiy5L+YhFfmeVS9Zgvx4i/KifdVCtgp2tThcXqNYkQQ//NDWQC08a9sPWg
 7Hw8/GStlPRffhDcwjwcoVrEL/7/Z2KjNRBv3rmPEqxtViqVZb4OlpH9LulKGW7fnUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791610817;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=91GY9xXbImbzYfWtfXF2Qnmm0EoN2OOnNPN710fvDy8=;
 b=cArMrslZRPu0F2KV4pZL7ndrT+W4fpLaA/I56T+jcbrvwvQdmIDkQrY8fgvK8RkjZbaK
 Pks+RnDvgxFiVpKyGxklJ13RcJ5bi+oRiNM0+jHBtwyfPC8neUuttKbFzZJcFovq4yH6a
 JaVyJ1lGfS1eKlDkYZ31uT3a8h6Phbqc0yIsNrU41n/ZsnvWconuy8Ci1dWSqezzWcQ0f
 F0+pjXSKD2hdp84ljJeixrhQz35mOqVHwb1DBiibSfw65CP2auq5jlMTesDa5LUeHwzrz
 LYznHGEAxDwdBSNlE5SOMILCj40rdc3qV1LRaA7F1BNShBYqVLEeHFKgxUo+mqrIx0g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DxhCzY7G; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C28C140004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:40:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E7CC74E411CB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:40:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3AD656075C;
 Sat, 10 Oct 2026 05:40:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E00DB11D70C95; 
 Sat, 10 Oct 2026 07:40:11 +0200 (CEST)
Date: Sat, 10 Oct 2026 07:40:10 +0200
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asnPrZx3V25kX3be@windsurf>
References: <20261009074937.992939-1-mr.zoltan.gyarmati@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009074937.992939-1-mr.zoltan.gyarmati@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/libusb-compat: bump to version
 0.1.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 09, 2026 at 09:49:35AM +0200, Zoltan Gyarmati wrote:
> Release notes:
> https://github.com/libusb/libusb-compat-0.1/releases/tag/v0.1.9
> 
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Thanks a lot, series applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
