Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD9DC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E567281302;
	Fri, 18 Sep 2026 21:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBsVcMiV5s_c; Fri, 18 Sep 2026 21:18:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 926A4812FD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789766338;
	b=Cl3SQCaW2Jft6u8/OgxqdxilMceTakt8nvmpHY1F4p1PB4phbw2ylk+5cf/vzdmh0PNJ
	 TuzZ+n+dBQU0LcEzRey21fLCp3HA9wF9LUVpCCu1MhO/xCNy2l8McCPZDzXhBJuzcB5sU
	 +L7NMPoQ7MivcIHOofTiF1dBJUMwKnvS39siBMLYLVhD469BIQfU4guSomdH5xUXjDeN9
	 K4F8tMdopCd5nEWnVL8NXIj0EiyMD+PgV69Pr7/u7u5d5t4er5ToE4yXVgo7x1srr1Qsx
	 bkU1AmxEMVX4fJxQIChU++yYOA4heWI6XgLWhREGpFLVOUykuFgC2e5B+nMxyP4UOVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789766338;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=etlQRXDfnkX69LWCr8O/2ZAqJvDkSbfU6/jBraroTGo=;
	b=cS4IotTpoLy02fy2nG+PGbif2ll0/EOrqjHX8myBlDjQLXYwfuApw7uzxECEMpX4Gr6Z
	 j0ARQ1Gk4sZh3m1xu1f3x8R2W0acGjVDoGesbe5pFkTxUbs2cmVUwjD8QLDscjXJr903C
	 1KgXeWU/a+t5kdjGIR/KmSoN6x6zS7d50xoOY4hDYP83TumtW3Kq7hNzJcGzADSdEogm3
	 UAiFT6TZJ6zK8KCR2Op/KzbHjdb6s/4yhVL8Qi+MGHOp0p5Gua2csc47T2vlwH7h7resG
	 UFeSgip1/N1MVu8/w2on9Fzbwg1nN+i1Vo9PfIjIU/Lp4YcQ4ZbJ82RM6s2P5L0c4TA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789766338;
	bh=etlQRXDfnkX69LWCr8O/2ZAqJvDkSbfU6/jBraroTGo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SgbwebpST+5OK5HeuqhvpMWzvQZtF/y2THSAQ4p47PXx5LaM91ruKUzXuyrdUrTZM
	 NdJn8+G7gBrYg9rk4S1PawLfCT5+nvhsLhFolbFKtqH1HKqSdzB/7Dbi6S2OztNFHB
	 t/Fh62EFLIUGEBUp6ecbWrRr5SZZM30HKhpwasyx+sYd8oKjsD8UtfTXJ7OR05uu5Y
	 6t8NbPOsefdUo0lapwEVRVLUw6mljkLs6jTEMGhI2nVbfRLnfQeIPiIYgxnA1exw66
	 vzpyxZGj8we7nfv7Ao+10BGXLg2P+Et96sbUU337gdsT+0k+Lg4Wt8R37dBlEYcnU/
	 RM2gL0LYpJGUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 926A4812FD;
	Fri, 18 Sep 2026 21:18:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9492224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F75560DFB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqIbqsnlTPAn for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 195D560DFD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789766334;
 b=IpXS/AxJcQ+K8WOUjHa+jveP2ze3QEViUx4HEjRo19B7Rks7Ziz9KK3z2E20TK7dHPTw
 ViHcv8sdw7V0K3ArH82TRrDON+C6caBqX282FVd/9xlOjORUpniyhNXdJVBAYnf8z+Ylb
 DNlcLP26B7B9KHAzZFjuDLlonW26TGsPjxk4rIsUUzCAfSWuD2eYkMP8dtsIjzwOuXtlV
 EGf/9KlIfPkAbJEQz5OnvlFLvd6K6xh2let61+gmt/Vb2Zrrk1or6hUdAVBV4fTjqU3NS
 Cz6pLHZyf8wCVbdnp0rWTk06QcoH24pGvUcUql2gaTmg5i+AI62HPt4OS9SfZxEtaAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789766334;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=+e+HZX/IJ8kS2NQLWbLXVsvREmp3dn5nTyly2FBHgBc=;
 b=Munf0qbY9S34mHWtlmDaLTt1Eql+TuMN3Gc3Htz5RJj/FwW/nsN/VdpIouXokZ7MlkYp
 7gGiPITtDgrgLDK5YmwOp9NqqSV2TgxmUAcF3w4fC2AetF69kmHpK6ivV3H1eXBy71OFv
 bEgUsGt+CObSfCAz/YKSEjzdZXQnYrQADklgdFsH3JeTdaRyrxAdTPAHDg2yev5wjvCxw
 4jWKU5pnP2kF9MVya+L7HHeS+3fn2OaO7a1ATQ/jzmsgPkwq6h6dssvj02jVe2SCk9H1E
 2RRACV7tBsZqz3RmeUA8/cvBnA16HZ6z8ApOm6gZueOUA6V/g2A6voZJFb54rEvy15g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=w6z4N1X1; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 195D560DFD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:18:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8B8DC1A099D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:18:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 584DA60649;
 Fri, 18 Sep 2026 21:18:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0C46C103281B0; 
 Fri, 18 Sep 2026 23:18:44 +0200 (CEST)
Date: Fri, 18 Sep 2026 23:18:44 +0200
To: Sebastian Michel <sebastian.michel@oss.othermo.de>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
Message-ID: <aq2qePaxG9z4-_Mr@windsurf>
References: <20260825074344.74193-1-sebastian.michel@oss.othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825074344.74193-1-sebastian.michel@oss.othermo.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/sound-theme-borealis: add missing
 license information
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

On Tue, Aug 25, 2026 at 09:43:44AM +0200, Sebastian Michel wrote:
> Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
> ---
>  package/sound-theme-borealis/sound-theme-borealis.hash | 1 +
>  package/sound-theme-borealis/sound-theme-borealis.mk   | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/sound-theme-borealis/sound-theme-borealis.hash b/package/sound-theme-borealis/sound-theme-borealis.hash
> index 575cf31c8c..336c039892 100644
> --- a/package/sound-theme-borealis/sound-theme-borealis.hash
> +++ b/package/sound-theme-borealis/sound-theme-borealis.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  dd80a9c6317de29d42786ba7d95b114b64d06ec6c0c17dd18df853a5c668e727  Borealis_sound_theme_ogg-0.9a.tar.bz2
> +sha256  b21ac6d124efc0a25c1f9eae9cab321fc1a41979468eb9293c1a9218a5493e9f  README
> diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
> index 9242837bec..f37b54f5f8 100644
> --- a/package/sound-theme-borealis/sound-theme-borealis.mk
> +++ b/package/sound-theme-borealis/sound-theme-borealis.mk
> @@ -8,6 +8,8 @@ SOUND_THEME_BOREALIS_VERSION = 0.9a
>  SOUND_THEME_BOREALIS_SITE = http://ico.bukvic.net/Linux/Borealis_soundtheme
>  SOUND_THEME_BOREALIS_SOURCE = \
>  	Borealis_sound_theme_ogg-$(SOUND_THEME_BOREALIS_VERSION).tar.bz2
> +SOUND_THEME_BOREALIS_LICENSE = Artistic License (non-GPL/LGPL commercial use prohibited)

Normally we reserve parenthesis to describe the part that's covered by
the previous license, but I must admit in this case I wasn't sure how
to express this somewhat annoying exception/restriction.

I've applied your patch as-is. But do you use this package? I find
this license pretty dangerous actually, so I would personally advocate
for the removal of this package.

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
