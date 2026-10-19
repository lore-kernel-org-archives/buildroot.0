Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E8BCCF2DE
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6298780F8B;
	Mon, 19 Oct 2026 13:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUEuhftoiK3x; Mon, 19 Oct 2026 13:45:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CEA1680F7E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792417539;
	b=dEsi+6LmCwnKzO6V4mJshZJ9w7x8i3eWh45AvgNvAopPu3TMV4IzZ0NOCzrUFX5gYJ+m
	 9bcuGG/GX0LzJO9QecQ3gvaRcOr5IpghONuad7XnKKk9mY1xuiIGzcKiH6c2hmLo8UFLr
	 UE+i+JWx5DiOPP7g69Ryqgqt5P3qpdjIaAE45I+PTZjgAwXXqMpOaqgHuaXqh1zQVzz+a
	 cy3H3xFJMD61y46fLoRBZJ42Cv4hfEZheJxLbFhY/1HQYVwyuLtNbrhnJQ8YocrIupZvP
	 q98l58IXbBUoTksT93lpbB7kWJhoGRmvpn2jerLFRHuTCX2fMNojL01qnMX49ddlNRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792417539;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RW2CFUTB6baxv0YCeM77Vw3ahNIIQ/HaQAWX5IOctUo=;
	b=J9lgqbOCuJS+QfZzmpHKRBkABK5t4T6gPdraKlXhwalkZY7nI26WTuIhC7hKsF2VRCJH
	 DJVy4WLwmT//MpxZwdonQw1cn5pEm4ep+FadVs5rEV3/6zxI8nB4+6fAqMap/g1P6Qy4v
	 vVkw6Z7elMwSKzILWx1Z2dGEUTUSyfizEkZYSpIPSucsEHXtxtVHAK4B5IaZDR5RH+uyP
	 EbpEmjxY18Y0E2kxz3VLEUGU+2WXsj/++hPLTLZKFI9k56gf916bZJF9NElcmMlir/tJr
	 uBWIbu5/RSTpDj2y3EGYlizzKxR5SNFM1HLLvkd/awdPJl3wFfQvGgOewn0rYPFjcsQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792417539;
	bh=RW2CFUTB6baxv0YCeM77Vw3ahNIIQ/HaQAWX5IOctUo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MeUloIScD+SJoBCPXm+n3kKRCvRt2tGphKkzVGw1UWBt5p9ba+TH87GGDfuN+w9fu
	 k5an1z3rWOzffpg9yiiXPiLLYw0GDOn631iFdo1PbPGyE0fvVtn/t5H31Ykd/lIn8u
	 xXr+B/QPTN7SMoyOh8R42uRZbqvTYc4+p3nlOkWJmPR2+MqKYoH7Kh4Nmz89wcT4X7
	 zPPcVQv/Z5DgEb0Nxo4WGeCy9MjnqRUj9cjX3zMEHXgxHrrsowI9BeJAPMvuYJuB1O
	 ko3nw67WHzhwxxy91czPEMImnx0/SA71JnU/PSXZsCFuwPpJEaaZvtJew6btSCJRgX
	 NrheX2sdJfHhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA1680F7E;
	Mon, 19 Oct 2026 13:45:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC8DC1E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE0E960612
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbnnN6BZJNjW for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:45:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B8F1C605FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792417537;
 b=AN8sXcUzDBILozutkHu7t9JyWhXcrSXVXhS+yoHXQaOXGwMQVFV0tp9TuwOiJ1+J+xn9
 +RDMfYzJIdbrvqJQJWQ/SVHRQ5Cg/+oAyCZ49v/sOdysG68AK6NPSCGx9SAQUMYrPcMXQ
 f4+Gm9uT5nI2mjMmlBVpjlYNjXRdzKYiO/EjpekHG0jKctx4sykmNYQ7oYIo3QRsnb87V
 fHVf8Aa3onYOtjDu77GjA7RkqSZ7jwfmmh104Aq9QKh6AfBHasgKBLrp3gpEnY9Rnwqgs
 P7ZT2myzkynN2dyZb7MKmuD3jae0vg0xl7JnOBzxoV9IDI5BwsAkLABK286TK1QTclA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792417537;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2UFAqdQc2gzQrjjkktMEJYlHybcTmNVBMSAMmTgtMTY=;
 b=DipIYV36lNH6kw6V09zNlaL7D9uZGkveCqeIPuOkl0FLm3ayOqW9gqjyjr3cs7VixmSL
 BCQVW15yJgMx5/jq2Y4UhZ4cHFPEdpJNrJcirIiAnqGwwLxh3uHOtbycaAf+JJTgTvHuB
 peCuBdrEAKp4aGBil3RIJHsS+4F9QVYEcPu7dNUP5T44cJLs1MYj8hlvGc1qCz4ObX+vb
 aAsdxL7tXZVmJGfuGFOyuIjC/mPkgFkcKpv16ZZCA/HJHZ1lMxMyomGquECixciAOsByA
 ZEug3oSArxgv4chlT5UKschkEuRAfnraEg9Q3GFjc2VjqShyqY1a1m8Gm1BbQp54pPQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BxIQWTxY; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8F1C605FC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:45:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8D6E81A1220;
 Mon, 19 Oct 2026 13:45:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF9860582;
 Mon, 19 Oct 2026 13:45:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75B2C10328D3A; 
 Mon, 19 Oct 2026 15:45:29 +0200 (CEST)
Date: Mon, 19 Oct 2026 15:45:27 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atYeiB_drc1nqLUr@windsurf>
References: <20261019121607.780131-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019121607.780131-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/xterm: bump to version 412
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

On Mon, Oct 19, 2026 at 05:46:06PM +0530, Shubham Chakraborty wrote:
> Update the download site URL from http:// to https://.
> 
> For detailed changes, see the upstream changelog:
> https://invisible-island.net/xterm/xterm.log.html#xterm_412
> 
> Changes in patch #412 include:
> - improve fix for regex-selection of a wrapped line.
> - correct limits for a partial screen clear operation.
> - update tables in wcwidth.c based on Unicode 18.0.0.
> - update config.guess, config.sub.

Please stop include partial changelogs, this makes no sense. Either
the changelog is reasonably short and you include it in full (but then
we need the full changelog from 410 to 412, not just 411 to 412), or
if it's too long just a link. But a partial changelog with random
details makes no sense.

We have already reported this numerous times on your patches, please
make sure to take this feedback into account into your future
submissions.

In the mean time, I have applied after dropping the partial changelog
from the commit message, as it made no sense at all.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
