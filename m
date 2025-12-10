Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA49D3C92F
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 16:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B66612DB;
	Wed, 10 Dec 2025 16:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mAzxWQi3qT5; Wed, 10 Dec 2025 16:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AFA2614D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765384513;
	bh=yd99JWgBoX7frFoxuaiFosZbe6+XvdpKcFXFqnAp/3o=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=JEzMoYSORMIzau2VS0CxyiDMCTMLI07eA0bTDvzQCa8cuDhmehwTP4cwPiG4V8AoD
	 Bs7xTM0gbQHvV2KDI7/1mKZAI7OSbWHF64OMV80K3LZVNslMF+ACBbiTHtpnbM8jve
	 iZg3/kifBHDRvjZGCfP8dDL+9VrMBsvju7oll6L01SdOng/fELQ2J2sdvc8I2RqfV0
	 Oa/j1+onsHiSyzKXAD35LzT3g31y78mjnaVDMIebhJspMBkvXRcHGt1i+lKYFmc1Sd
	 50cHyFRlpWz2aHaF0luX46464RHOqRsnyE94slbKhR6mG7mPKGW2dtbyy5o+z1INYT
	 X0iFUjgRRjAIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AFA2614D8;
	Wed, 10 Dec 2025 16:35:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2409DE7
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 16:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15EB240394
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 16:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wB8fXVu90cAY for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 16:35:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C9E640022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C9E640022
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C9E640022
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 16:35:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 685ED1A209C;
 Wed, 10 Dec 2025 16:35:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D71B60714;
 Wed, 10 Dec 2025 16:35:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDF8411931B11; Wed, 10 Dec 2025 17:34:59 +0100 (CET)
Mime-Version: 1.0
Date: Wed, 10 Dec 2025 17:34:58 +0100
Message-Id: <DEUOKQGP1TF1.12VQQ4X9PQWR0@bootlin.com>
To: "Bernd Kuhls" <bernd@kuhls.net>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20251207144243.3696572-1-bernd@kuhls.net>
 <20251207144243.3696572-14-bernd@kuhls.net>
In-Reply-To: <20251207144243.3696572-14-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765384506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3EHIgwHlX9SO8BecWYvCqaBPgfGRhbIUgDNrjzPlQs8=;
 b=cqo5PmL5AcUkpYrUvm6kzJGMYLDqG3+2WaIB7nXFf/eTxuCXFHHTiQz3HoXT6aIB8GCffj
 EYUHKAKbZrVrWSNy/0vmQvjf93Bi6SoGiKtiKBaZb0H0j/VRTOPtvDxQtnuHDYsamDEecJ
 1ob5WRKGgtqI8jsUCfp2MHGSDkTXzrh4ZKrQRaQJGyULChJ4Thwy4YdjCKcuqrukRNPubu
 d0lXBEsVRLZ9u91a11C5PR9iy4+6faSh2CyXzZvExpN1E2Ve1aFzjS9ZIhcJf3kKnOJMOQ
 6fKZppnQnDUgK8C50G5A89be4jan5N1PIKLvt5SBamHnb2WWYuy78LD5blfFdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=cqo5PmL5
Subject: Re: [Buildroot] [PATCH/next 14/33] package/qpid-proton: bump
 version to 0.40.0
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun Dec 7, 2025 at 3:42 PM CET, Bernd Kuhls wrote:
> Release notes:
> https://qpid.apache.org/releases/qpid-proton-0.40.0/release-notes.html
> https://qpid.apache.org/releases/qpid-proton-0.39.0/release-notes.html
> https://qpid.apache.org/releases/qpid-proton-0.38.0/release-notes.html
> https://qpid.apache.org/releases/qpid-proton-0.37.0/release-notes.html
> https://qpid.apache.org/releases/qpid-proton-0.36.0/release-notes.html
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
