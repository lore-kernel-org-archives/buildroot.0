Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC2FC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA4DC407EC;
	Sun, 20 Sep 2026 11:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ROey1z-Cakw; Sun, 20 Sep 2026 11:43:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D43CD407ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789904636;
	b=J+FhYPpPY/bWusEiz9f7jG0QwNd6QKs4h6b04zGn3mSlwWMVtwwOL+UTX4mf3APcjV5e
	 siasCmw7xSO/JLSPSHfe/xWaaafQ38hnRJIVlUIhebf9s9UylugeJJwtYQp34XmuBIA9Y
	 GJCmIbl/ttGDJa1xmR3Qbd565AdLc/oqtWXylar54HKYsiYHE5Ppc/2h2qlLXmCgs/nMP
	 9pfMMpj0hZQrzSiWnXdQii0uyyX96abxysozfQAouxjKzD6IJ0JzuUccTmbX3XWMwcfUj
	 nYM6uv/Hi5ZeWtn5SAYrp6BxrSEGbghubciXN9tuhqFmBrjNaBJrXcj3H6dPLCoECLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789904636;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EYlbRwGt4t9zHUH9XZ0y9JxDTNrNPRGaNdxydV1xruo=;
	b=Ylc7v/xcjospn9qxtslW/+yP/jP8QJj5Ojv8acucEvvroPPsDZTWQ/5b4C7pJ62tHohB
	 4XTB1U2Lt/wi9Lfx3kXfBwCV/XqoTDPNAa8J5oj1H2Opchsn9ydKv1TLaU9kMDQptMB0Y
	 lvY59JCPc2H0/X6sBZN8mjzP3SAI3f6W6B5kqx735k/ugG0zSwes4ayaVtwu2ycnn6Wg9
	 As2bTYUv9O82/Cwu7c6Pb+EyBJDkILBVjIYxhY15x5Qrwxb4t7rmDEozDrxFFexwy08Uq
	 v81XNLbg7bGsrQMWHeHuWzSfj38v/N8qFST8qoqrkH+MeHy6mq+W6TQpjB2Grfhv51w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789904635;
	bh=EYlbRwGt4t9zHUH9XZ0y9JxDTNrNPRGaNdxydV1xruo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oJ+ql10t/6ObkGMN+u8N2qNeiA6ERK63FRQpJrG9Zp3p0j5M04lqWevHKrfUkZZeK
	 f2H7I1/xNuyVb9E2NHhYHF7uKgshW3fcBB4l6tP8TgFnmeOY1Fs+2x10bw2hJgjoRQ
	 qoimSu+P9wOpNaRFlD8otK+d6SzFldyjIsHO+M/qgjqQicjnrsE3x34a2QfLVo1SNz
	 A79DY25OZK+FL4lcfDJEeQZf6eZ9uyCCMMITRgHp+RJ0HU5ID2cLRdamW5KFkXZ61d
	 HYL3p1yzdYrido2B8DejANpfS0/j7L7FTgyRAxBE+XPPoGx78FjSqf8qN6eYqr1eCs
	 zTww3jzdsYlRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43CD407ED;
	Sun, 20 Sep 2026 11:43:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE7CA224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D46866065C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_qkkHu3BIN6 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:43:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 787586063F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789904633;
 b=prSLFS658XdCQLOeU1sh8T5d3sVrvQKxr97U+vV9nO+f04BhinwykW7iY3Ieu3QfCeOu
 +5BLh4KPaBtTr7SaKxvL8KrHYrS4mSKNIIL476A8C2qdhkU1gM1RqIM+BU54rrx4VU3TD
 ppSqkMv4W85fcfw+4Gl6o+M37UZR/JpteKejn9z7jlU35aJ/4Xt8q5X2j2VbIW/Z7MWKS
 1P+jvo6Ln/MtZO+8D0xLltk+HWQgHwradPwLUsTvCUjI0zRhBern4vyIuTtBx/NDxTNwO
 /ARbHcqdq2uKaMbxteELn+nKl+1H62gRAbmKQzsvDgSib7zTg06Ys7h/2Yl7yUqDpMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789904633;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=imFw8HysnlXGnXALj9k5T3PZttnnj4FgerEC/279t3s=;
 b=gCM43ylsXUWbXM+4p9OskUH6oORRs5e6oh2inp+VD+Ci+jR9eNDF7f5fLfh3GSoqHmOz
 8qqc9E09Puj2b6Zlse9Oq25096O5/UmgFp8GnPDqwP2trh0woUn0jq4ZvpIP/RWq+R2cI
 e/eyEyxK/FdZ5vUDVy9vLkrcQuxamMEOhUpclQFw0xDQqs6nxMb16C46R/o7DUTL51OL/
 9T9wF+zV0x/ZfazgM35RyJ+nHIqpry11U/2y8bmksiPJFIRJsqo4hwYT7IaxP3Dwx/zaU
 KRLCG6OA1tUKMYFpXW2rpJ0I9NqXIh66VHK4E6pIeTmGASzc40NpbPhdsVon+d/aBKA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=upUhxKnm; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 787586063F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:43:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EA8D2C5CD5C;
 Sun, 20 Sep 2026 11:44:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1FABC604C9;
 Sun, 20 Sep 2026 11:43:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AD42D103283E1; 
 Sun, 20 Sep 2026 13:43:38 +0200 (CEST)
Date: Sun, 20 Sep 2026 13:43:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_G5lJZF5BtYeEi@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-74-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-74-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 73/77] package/turbolua: Fix build with
 OpenSSL 4.0.0
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

On Sat, Sep 19, 2026 at 05:58:38PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
