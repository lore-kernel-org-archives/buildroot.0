Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00462C79F89
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 08:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC6C40591;
	Mon,  7 Sep 2026 08:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vflTml6vSpa; Mon,  7 Sep 2026 08:43:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8F7834050E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788770603;
	b=jIs+7/yrj3qjnjPmdE7IK2bBCgVW/i5D3ceb5DQshF85baZhQytf5PuAB7rpqApAmDfm
	 5a69Ahn1vWKavLG+9UzsH8LpvfEUVclzHRlCfRwu2qkGTWnyJHrEQh6T+Cu/M4LFGxiPc
	 lKOw9XPAFppv4nmzmhUk0et++c/HFC1I8gYtsCjDygAESTsh1RMR6JAZDcXrf6JVeSzaY
	 wwxK1DOWYhBaU2gDmUgprhEXPMV69W8s4Kg/x0yfe6H4Tfrwm8xA+DztDe8fkqM3QVJVD
	 gfglsTWrj92wdPYM9wgU+0+gnjn4S5jaW/K1PZJ3Rq7pociuIo4XC3ymZ/ZiGPe+Tcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788770603;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mEuEESfBPmkKabdm+lzUL2upsG+vCyrQewSU3b94qHo=;
	b=AsUg+6ORdWm8khFmhfy6x7Ktmfc9NGml0pQcm7auc8U/rgMcW0uYAlPwqqsu5EpTG9lz
	 iwrlpiDPndApu75xVmTrFWAPr6fw8LHSGY14fjUhtYG2bylAFIm1YwPhixmrD/t8+P7H1
	 mPGbKQ3WW+g1OmwVSEwCWLVzePcGIc8r92nnJ3ZtjNx3upo+y2IYowfYXfZ5KVAZi1/Ol
	 4vJ1Kc2gBYMIntio9OMq6zLNF5VV8pPMMuVlZOk+d6EZnvxyA/DLGdIo2OsZWIqC9fAZO
	 5cC6pngZ8QNSaWpN6gsOd+pgkINDChqCKsVSuwq7Khs6t/4qvKSj2Ss877REb2k81zg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788770603;
	bh=mEuEESfBPmkKabdm+lzUL2upsG+vCyrQewSU3b94qHo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=V3QaiRjQeN/wE/Gy1E6uLqkIcbU9RTEV9Pzl4d0+ipBFgDytlmIBxcTA5rjMaRr5W
	 86OjGigQHXMJlwv9pOw++LEXWciWA0JQXoT1LscfLgIj6xn3zfYJCCl86XYGZNCZt2
	 aNTmBOgIm1axXa4r76HUKRn37IyPvTmZh2viLTOFDV9bAM8DkYyoiKfhATI6ByN+RS
	 Z6GXRW2W6YLBplRXW5PA686cB3egv8vjG/XdAy9eZCcgFu+fVhpJe7ZHYoe2j3Ekxx
	 IV0IaQt2UAg6p9xPY10PqFzM1zmex3ddEzedCwY91aV21SAfSYevOAUdNFNvz9AG9S
	 JribOag9PXvQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F7834050E;
	Mon,  7 Sep 2026 08:43:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E16C72FC
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 08:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D797A4009D
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 08:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTu8uiK6TFii for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 08:43:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C5C9640068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788770600;
 b=JfdO80zfqaVYGYH3hRYR1+ayTTa6HWRDbJQXj836xXjW/CKUuPnHWTzUONFoF0ruicH1
 DkbxTHuQcTaGgsmhIsEo+4tXxqayGCorTg6IM/4dJUMJKsvChTGmy99FQpbRlcD9N+eEv
 XmOhUWn4SSQ6pUl2mM1dw+pC/c9Ubaly5dJsHvPWS1DlYCz4nRHlSgLojcfaKB/fV93Ph
 Ia46ghYgxx81QueHi5o7vDeFg6CTjgFTqB4ZmTZDRuFhwNmEU51awYkXQTpYOG91hp5uh
 BeqL3gqpLEo+7NITEdwdbtPEi9huhBCNoYkb2btJIgliPtPMFCcyH8R9/YaAgalKVIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788770600;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=sVF9THVPutjIQOY4pZAeMXz4zVDeoMYBTNebcM14Nwk=;
 b=ZXgNSo0FHD5RYZRqWA+aeAQlLNZTMP6OIQCnVcoSFfrQZqWQCKj6CezH9x7fbmHktHBr
 W8dba1FSyfjJxt0LHEJ9DPBoQARLqhKaiQywjCXf7aWSjfHe6foDwSwyTZBs97UcEs//j
 UNa1S+q1zfNG6FoEzqtQzVzoHaJAQ5dfGufv1No+oQWvQECXLVjvKW+8SLeKmH542+UIZ
 GhMyXNg3xy7pksuMLFI84RsrJxXby90F+0baxaQU4Ypkn6e+hiymYhzZ+2G0NlOLo2H0+
 1FkdmKWT4UhtNdMaljGu2GjFN9UYfErWonmj3B4nfrejRcUp85oEXoAz0o0Y67kKMrQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WdkMmv5v; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5C9640068
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 08:43:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 44B994E41569;
 Mon,  7 Sep 2026 08:43:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1215860383;
 Mon,  7 Sep 2026 08:43:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2573011C7A43E; 
 Mon,  7 Sep 2026 10:43:11 +0200 (CEST)
Date: Mon, 7 Sep 2026 10:43:10 +0200
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
Message-ID: <ap55DC-QtbUm7vcr@windsurf>
References: <Zq9j8m3YPt0Xh0gY@waldemar-brodkorb.de>
 <20240804231254.6301c5df@windsurf>
 <ZrB+QUlNw6G1wbV4@waldemar-brodkorb.de>
 <20240805093106.20d6716d@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240805093106.20d6716d@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/nginx: fix sparc compile
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

Hello Waldemar,

Do you have any updates on the feedback below?

Thanks!

Thomas

On Mon, Aug 05, 2024 at 09:31:06AM +0200, Thomas Petazzoni via buildroot wrote:
> On Mon, 5 Aug 2024 09:24:49 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > The minimal reproducer is:
> > BR2_sparc=y
> > BR2_PACKAGE_NGINX=y
> 
> Weird, I didn't reproduce it with the Bootlin SPARC toolchain.
> 
> > For sparc only libatomic_ops is selected via
> > package/nginx/Config.in. So I think the build issue is unique to
> > sparcv8/leon.
> 
> Correct, but in the .mk file we have:
> 
> ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
> NGINX_DEPENDENCIES += libatomic_ops
> NGINX_CONF_OPTS += --with-libatomic
> NGINX_CONF_ENV += ngx_force_have_libatomic=yes
> ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
> NGINX_CFLAGS += "-DAO_NO_SPARC_V9"
> endif
> else
> NGINX_CONF_ENV += ngx_force_have_libatomic=no
> endif
> 
> and BR2_PACKAGE_LIBATOMIC_OPS can very well be enabled on non-SPARC
> architectures. Yes nginx only forces BR2_PACKAGE_LIBATOMIC_OPS on
> Sparc, but nothing prevents another package (or even the user) to
> enable BR2_PACKAGE_LIBATOMIC_OPS on non-Sparc architectures.
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
