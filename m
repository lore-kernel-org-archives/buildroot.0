Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBA4CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA8E3403A8;
	Sun, 18 Oct 2026 20:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuIsGgmC3alg; Sun, 18 Oct 2026 20:53:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8C994406D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356821;
	b=ZX8BozNKRgHEPz1E5CL1DcXu8jIokgttVAdjaJKHK7HXWnrPSn/3wKqlW9AspcTmvf5f
	 ZV6hTVQRh/P09sIViO0vrl1mI8EbIO71esQSr4eqGs11BO4utOzGG6jpCG0dUkPh63nOm
	 /z9QbiZxDRexxtnHH9+uD1lZMNhrncXia3BPgiTeich68CVgJWV44FTYPuUktMDNbq9AP
	 ibQZIjpXH7ir3ul2ZcPQDauOW6N4HQXKdQgSP19VFxS4cI6I25jOGvzXphG51OiBWjDz3
	 rrGcfMaujHlKQU9zca4WWmnitePFnAyvZdvSe7940jjWdJdkI6oWJJdtdU4u0ba0Zog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LnS6O+yHMXmmxOdlEIyEMnJCPnhgVa7lQE65SVDxzdw=;
	b=dHtCGOUtk/yennc1W/CeQStGP/Fl5agNaX/tBld5unjdhmMJm89mozjWj87Zf58Bp/Hl
	 rrYLjYIJO1ZyTtKhITlKy0yg0V09AG38G0Wi1SeIbOhdTAN0GAJ9WP32YU8f+tJa7P91E
	 OQqF8WGziyZijaKLQwZFm51rVaCuyi7iEBSMk++Gtgk4srlemizVGXMWGF0ClWiDq/pzn
	 rldI9NuPZk6dB1wXc3b67++zgAAvxFLzbG8YdqqnTCJviAT3bUcrE+/uNa+9K/lYC80oV
	 DF/paryhTIVZv+4m/LCiRnXr6GlhpJOfCdij/bazmzm0frNToEqNLMWTj0c4+jR6jEg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356821;
	bh=LnS6O+yHMXmmxOdlEIyEMnJCPnhgVa7lQE65SVDxzdw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CUJOdW0Z8S+IIYXSH4+KeIOaFE2bdhkrCv6rMjTo5NsBqFb7qrI1dbBsoAdDfIu+e
	 p/5WPCR21Jid1GxwO+7k4Uql/UmuRn/Sm9aQUrweWoOHgzDFaXIACn0pLGJFqQxcj5
	 OQ9ZM38v02SoMIV5yDzzGAfoLIVVOM1fgJaRIZ9RlB3BTAxA+yiQv2CJl2PRzoVqPI
	 9POJtxDgTjuarLyqTmFtYZCk5Xk/7zSzWikJFf6sh1qM6ILi/g3q3I6dhirlFPbpxH
	 yAFoLKstjn5ldxW4JxVrqWXopedJnTMunePyXqpMOPC5iAVK0rCSXr3pgS0RDALRe8
	 XId9FU/jdwAoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C994406D1;
	Sun, 18 Oct 2026 20:53:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CC732A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1340A40068
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUdbQ7lNLQ0I for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:53:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9A6F740049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356818;
 b=J3A0eu2SN8ux1tlI3L23sZRC+K8HLR6/UlLQeru0OL7jexA6VB9Oahdh0QCTgyYsRPvc
 cAIInq7qQOay0A1Xe7ukVTML7/l7S4i5f9QbxCSpFXt/kNZmVVThMSbhR5aX2MULRqLP9
 /3CX4dajInBI0Guavj6EZKO7TkMjZetGc3gzsiFMZsCMBzy7pArTJFypas7DhnTIcS9yv
 ho4/pJM2dRoEn230RnpvKksI4UMzAf+0cIrv30qXUvsG25ryiIa8rQEXQVdprFH1sZvxC
 U5kSmu9KzhPTkhF18H8R+yW9Q4r3VfvQYeiRR2VH+xECfDjHTHpLzl2/HAqT6FP4XQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356818;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=ECRUo/8H8Hgjad00uG5rhBpYcK01j51ljvr8XvzwGwM=;
 b=iG9SR0VCRRhgMbjq4fAXFliW4Pql/pzsC/TV70RAJEXM94YaOaQ8txmowTyJ497HpGvR
 rL/dTfcymE/QEi8o9UO1D2eNB05xBNwismILYqLVUmjt8g7BS8TEjmrB5R8nXg0zC+iCh
 MEGsZUEB+StPkqE9TfKkYecx+gTNHQOBgr1Abvmrx/uA4ry+yVb0CZKxsa/T1jktgVZeb
 Zu0COcLthZAn+tWWqEubAkHITlJftMaXu1pgDRin7fM59MoJAC/FB2sN+DhN0bPqHYExW
 okrgdUjZrhvl7zRXg+TSqrCKFvWWMgcr4on8fL3eYYo63bzssI36XHuU1DxUKX04hfw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=K6RAvWdv; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A6F740049
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:53:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 03907C653FB;
 Sun, 18 Oct 2026 20:54:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1070860582;
 Sun, 18 Oct 2026 20:53:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A377A1032868C; 
 Sun, 18 Oct 2026 22:53:31 +0200 (CEST)
Date: Sun, 18 Oct 2026 22:53:30 +0200
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>, 
 =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Message-ID: <atUxxuCurBoVbJar@windsurf>
References: <20260828-xdp-tools-tleb-v1-0-463c25b5a99b@bootlin.com>
 <20260828-xdp-tools-tleb-v1-2-463c25b5a99b@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260828-xdp-tools-tleb-v1-2-463c25b5a99b@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/4] package/bpftool: allow building on MIPS
 architecture
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Aug 28, 2026 at 06:46:48PM +0200, Th=E9o Lebrun via buildroot wrote:
> libbpf supports MIPS since commit c86cb27 ("bpf, mips: Fix build errors
> about __NR_bpf undeclared", 2021-11-25). Unblock the build by a setting
> BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS=3Dy if a BR2_mips* entry is set.
> =

> Built and tested on BR2_mips_64r6.
> =

> Signed-off-by: Th=E9o Lebrun <theo.lebrun@bootlin.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
