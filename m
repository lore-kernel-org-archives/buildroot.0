Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC1FCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E5068107D;
	Sat, 10 Oct 2026 15:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KD2kOHOIJYo; Sat, 10 Oct 2026 15:32:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7259080E4A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791646339;
	b=jQD+hjOuVabFoAWA3xB9F6eWEBth81E0KadaMfzkjohuHD9rjg/ku3hLCMjJfnAIqtKG
	 8k44QNrUogzRN8u9MUZRG8iry7iDUbvpiunlkMXR32MMLeSq8EzKxJFrFPLkTPMd8I7BH
	 ud1qpAsB5SuG4MqFJtCIxNqjmsaFK2jj8+hnp6Cq6wcgR2SHNh/VCbNjoJEvAbarSt+g4
	 H5kn0Xglv2ZvN2HGPVSXhnEU84do2xJGm1D4BclHjQieSlzOQufzBjh+Yq8E1XO2YsP2b
	 W4LkWdTQXcEgucQpRXY0HnEdnWyRbS4AMUi2s+R4GnLuJmZqK1UOx4znVBwaMx9nYdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791646339;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:Message-Id:Date:MIME-Version:X-Mailer:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=qjYrEC1efChg5sEV9O7Pj2XIQR3vJMnw3Xpeaq+I32Y=;
	b=jV0RIQ8J6/rrYIxQszzicKqd8sJ7CHfIUErsU+B/wib7EtR49cOJyvhKxSISFeWgyNo8
	 UxBNkRA80imjdk2q5G1TVT1q5twPnbyIC8xRUWZyxw+Zfb0Jp2tbIfSl4YW+lX3KyEF+c
	 WH2pOIkipieFq8CWYXxtt8KqPTubIR/mThiXrSR92f5nkWXiVD484H6LoKw0L05N6sfgR
	 bv3nyTFC8LMKeOq0yiBnEFLx7f05UELIBh5oppwiz0yE1wAIfa5wnaJOpYnaLz6JpVV5j
	 TZdJPl7bL1KnOhBWznGgjZ+gkYGAtoxRkS6fmj0lunlGnGlLnqWeAlO5bbL56nMAb7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791646339;
	bh=qjYrEC1efChg5sEV9O7Pj2XIQR3vJMnw3Xpeaq+I32Y=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d0kbAT+aQeQZyA0lcSLFStNIyyj3oBz+MOy6inKEvMv1tX/iEYb1Pg2MY1vm26Zcb
	 ryRIT1flmCSpw8bL+rPovOK6tYprEMiJe8OgjTc/RMbIW7CdDTJs7p75lSN2PksBMJ
	 2moRGMLe0iqAcFg/XfgWUQEVtnK1i3IUptG8ldG9H3/En4H5EvAYaYCkrDacyI+GPY
	 PI5amml0xOQtQ5KMKpsNk0NP695LoVrNusyrUt94qygWjp1R+HSJ26Q20HCfd7BZyu
	 1OJ31aYhuLqprx8/NbDugFvzio/W6xAGOqkw9464sLEV2iIjLmDwO0FJPuzckJqGq5
	 iD2qKS3yT9gjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7259080E4A;
	Sat, 10 Oct 2026 15:32:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A049E356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86206407ED
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXoS8hZ6COHI for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:32:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 822D7407D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791646336;
 b=nyZvoaY/paS2A7akXVzFDR6XKipbHFxfdZhfvfeXXILMEmnpwrzos03v//32gNTNh3qu
 GWzX6eaZBaEfxMuwAsB9ZUksxyMZMDzAH9TlbAK7Nen4Rk/U4YK58+r8ZMFw1ww7ABD/l
 Zq+AxrnpAK62C3onzvZK1hNarSN7o5KvPfonvYbKgvpYU5e3Atlp8cpjx0Cq05f3BOgGc
 5EjBGORksmHHrzmCd7X2m7+Pc9XzDVHotmbW+3pSys0/GptM6cx2wJyBcWgp1aUhXwjoP
 JsrdKkDd0XzPsnd3W/yfMU21ALHijYYJ2Zsk/0mfYMaDjC44aVNKpj6mB0EMguwhJLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791646336;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:In-Reply-To:
 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Mailer:X-Last-TLS-Session-Version;
 bh=ktR6ObiUUV7LZ1Gf7hLn5H0U5zo7dc0UOd9PMBsuKFM=;
 b=jOv3QI7qi859o8BcqHmRpD9HROz/VONlTNswAZq6/w64znk+pj6YM3xXjoBdTFlMPkrp
 7xIjqjJn/o2z2WZIlX9GxBOjs9UBHLcUcJxgfqcLFUCvvI825bJxQAYRZpnk7DvKh/6qa
 zvDoAnyTWm6pfzUATH11iRsbb85+fLq8Ryahaj51KFEFiLeW96r9+Z0kdpaTBO2EBVask
 aVUvuQ/bW16N+brjZXXX65bVF46ine6CHNCgB9osr0hYNcNiW+LsmYiQnwk01PT2DsrS3
 Ea+5skRXh56hgjT4D1hLSlJwSsF1g1S/1az0Gnn+39GZyu/FmBQO2qkTRXHg1/hksEw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=gH77D0gu; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 822D7407D8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:32:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 66D96B979F97; Sat, 10 Oct 2026 17:32:12 +0200 (CEST)
To: buildroot@buildroot.org, Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261010143708.421070-1-peter@korsgaard.com>
References: <20261010143708.421070-1-peter@korsgaard.com>
Message-Id: <179164633205.140734.18236954927424328230.b4-ty@rnout.be>
Date: Sat, 10 Oct 2026 17:32:12 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/pkg-generic.mk: drop RAWNAME
 variable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Oct 2026 16:37:04 +0200, Peter Korsgaard wrote:
${quote_head}

 Applied to master, thanks!

 Regards,
 Arnout
${quote_tail}

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
