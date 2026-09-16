Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5F3C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74102607E2;
	Wed, 16 Sep 2026 20:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqX8llrs7my9; Wed, 16 Sep 2026 20:19:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 94760607BE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789589959;
	b=HOXLvnZqY1mWd2Obg5KTUNMoQMRuCgAnmMXTBOVjA2aVKwj2sUz+yTmrSbx+KnWtsauf
	 3qOVbfQtOaVoOggWYPeSD14878OoTrEfkhoGa/z2vrXy3JAUkOXsPDP5SeQ7+pY6QHLhe
	 OfXZfC2OC22M8nK74zVbsM48MqmgRa/6RXxFwECKzZN0aw8A45jVNmrdtGdeFpmZztN4i
	 fkRmcmspGXv4mdxXILehG6AS9SDv+y9raUp9/zZrXfkZlp0Zc3W9uScu/goS1UnnCMgUm
	 e2+Cm6rhZBmSy4GA61sY+XYJOVEstaKAcEkdvsu8rruMkzGDFbqWxlJVFLMbuothSgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789589959;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+rQzo6Wbu8dnUHdvzuVW1T93/kkt6VhBwRBG9Ob/YA4=;
	b=Ix9OiKfloXYqqLsdgAgI7cDHer+E5F3gL3OejJ+2PTd5SV/oPmOMa6LzxgduoZ+oaGRl
	 hIMbCNlSD3bUUHa4vZRFh8jUqkmBWs51qN7bR6TyLjhsq5pTBvCYIoA8SWSvTzXOrK3iz
	 GLworhYp4hKfDCbqUHApuzT0qgGDDROIOBv8D/CPebKbIuYY6LTpdYL5AMtNSpvfuAGh6
	 RyBDer/TbTQk0gtrx1ua9VwHRPUJatPD9Q0AXI0hyYc+fRbg3r0q1e4hSBQGhZ8GalAfA
	 EXWndNjT9c0/NTtjJvIvRJNndX1YaO/79E65uCUbdZ/7CIsFMPCSelU6uEPcyPSis4Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789589959;
	bh=+rQzo6Wbu8dnUHdvzuVW1T93/kkt6VhBwRBG9Ob/YA4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SmJDi3GxhW6yexFK7n3WGaC2msaY8IDixaHcnKiHwxyITJIyK5I8P/5VsFsjla+ZX
	 Qu3nXDoLXOnQjRXfpV6NhkuS7mcvPFKLKXe6gwKYgr09czhH2clwOcv1Hy0uL5lbvd
	 M++h/Na13iZa9f5IjrCCEuJIMWbsYgEwLVBOghKy8fpJwTXdPdF2cTAHnpjr1EBO0d
	 ClLjxmW1u1z68i4nPh2cuuum5l0gVAq5aLEhMVlWSLY1cv/CsBcvbzOQo0Dx4dh8L1
	 wcREVm6XAYuilt5vy/gUspIkkCw1XQPp9xGMN/dU4F9b10R1cqH8ZcU1ElUM95yxXr
	 RdrdfAtVI2rFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94760607BE;
	Wed, 16 Sep 2026 20:19:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23A2624D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1570880E31
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nu0Ae7Ya3lXW for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 165A980E2A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789589957;
 b=ZIjgWpeF8Uq1buGR1H/UtOR2zOVuihPBlLLxxk5gfUSPI6XbqLqX85p1lAvZvGaTd6yy
 PmCSN80TBUqkKfUo+CpOImTnY4WNUuXPbDaVY0Cdn3Nj3IAC+BKhXgcl6muolJJeAche5
 qFyjzYK8uPfwuQGtzNHZQ7zwOTutzEjKKpL7vuNpfpfix7meAapwTAHzyIWi0XShJItql
 FY2a36Vf7q0Oha9ooluVjTxjFoqx4Ijv1pgWowiJk/Qj0T8tutcUd6ylys2mYrWcILaq8
 zMKW8FG5R3stLy6gTBoFjeyRKAPfTOFHkCOYiKZxcDJw6TyaicVlyhYrzyJXWZZgsIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789589957;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=sMG9UYuleY1yJV74oE0oPl14o/t8VbRH0ItCc1VyEos=;
 b=a4nRaUkYpQRHCdphccV5VWqPeVabi/VP6a/UFXnBymPGVxg2qyQ9n6P2i270gTcAmpra
 tFotRmGZ6ZNKdzY+Tzbd18rP49gc6e2GCGTpHA3wB0sGvwYwnnxSLBwQCa9jLtS/wTGrH
 Yn1FGi22gdpUWx2aDrEjriGJL4kiQx/sMdh6ucRgM570exVGhsuki8L1TmAr0BnlPyu8+
 m+9gQmyv1EGeWyJ+vpvKhIJ5IndvL2PWWGBia2DDgBKLquuRvVfC4SzRVGrBOHhaK0KFx
 APS7h2D8Np3ATT3SXxic9tJ1EzklYoJwOxPN5s5BRCXqhp+4/o92OteWnVxN7vzeW1g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NyD93MzD; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 165A980E2A
 for <buildroot@busybox.net>; Wed, 16 Sep 2026 20:19:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 96DEBC5CD6B
 for <buildroot@busybox.net>; Wed, 16 Sep 2026 20:19:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 840D160337;
 Wed, 16 Sep 2026 20:19:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E488111C7B00D; 
 Wed, 16 Sep 2026 22:19:08 +0200 (CEST)
Date: Wed, 16 Sep 2026 22:19:08 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <aqr5th5xk9Lfte1r@windsurf>
References: <20260911080611.55857-1-francois.perrad.86@gmail.com>
 <20260911080611.55857-2-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911080611.55857-2-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/luv: bump to version 1.52.1-0
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

On Fri, Sep 11, 2026 at 10:06:09AM +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

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
