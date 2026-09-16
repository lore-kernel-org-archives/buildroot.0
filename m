Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC9BC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9FA80C0D;
	Wed, 16 Sep 2026 20:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swdQrziOkLJ7; Wed, 16 Sep 2026 20:42:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D28B6808AC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591341;
	b=dR5IMf/f7LeXfBjbsjJe+caransn9l5rlDquz7c4BTI60dCa8CmCdKj6RWSlC2pI2JGy
	 kmm8pkNP35oOmBomWGGdjfjpi2COuklc4UIaZlHRQjeu1mLzYCfZ2mulm2dkni1jvqSVo
	 2Q2U/aPSUtdR3wP51GGjcIBHVVtSH0QMcruK6PtlsliycGaO7V7G0KbXbtGrIbOSYyAHa
	 aA2A5EaaMGqDpe7eCk/usH4QpTibD1nIZ1SVYFawmLmdm4+jlOYzuXudcPboBzHPZIWZi
	 D1BwBmUDRWhpqnBtJP0Kj9B+pAQeDSzhJTLF804dr5IhVGkYhZ0ooPQgIt2eKuyaNXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591341;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZBP7Hk4Eudg5PDYojBt49/nYi3pq0EyeM/KCGJJT1/I=;
	b=s8I4RL24C1AVI3OiqjdVyH8gFBDnc3p30SjSjZC+u8d58X7b42wvbDA/h0Gmw4mFo3ZQ
	 AJWkk5746VKPJDdUUWqa5UvhMMAAQl1bkPG70C6VcNlmFiyoohWfRFO2LRFtu7CGcw/sf
	 PsDmBsHvC9liZ+cjIdyWdYTHZYBU1VkqR3s3oPPKRYwnp4trkI/actwnUUVv1bTmpzrj0
	 SMCjbzrONxUZzgvMZnMTBB3tEaWcF2psKbEzf1RAa7Bi+JiYpFuJyHsSo/oE6r5MXr3rQ
	 /SF2HHDsLR5kdotKzqa0hoXfSJzemNHRdmP3sTE3fSGOaRu7OKzzer7zPltKMs3X9KQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591340;
	bh=ZBP7Hk4Eudg5PDYojBt49/nYi3pq0EyeM/KCGJJT1/I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ep6aPqPxSf9+oWiTLkB8OPivYq/709Vc+sGSLAX2HaQ0uoy+dKocQW6xQWJElWNK1
	 U9C6taXH6w56zhXIGK8m8JkPSAaqXEGJneTYHU+WaxPgDXlCKloOOpVIIGjZHPQuCE
	 UysBCafAeHxKX5E0+HaLkYFNwexaA1Crsk2yUDeSwOV+xn7/9q55A3rb3LedJdJnnt
	 AoW7FRvjW7pa3Ci690sB+DU6WU/KokIfjaNkz4pDxAerBOS/Pha5rIPtAKd5rjzcUV
	 jaRn9223bGzfirC5K5IxckQsbqQuuwpSIXYEAio/KCbTeeS3QZ86teSDwj5HQYlS/f
	 b0XUSAWst0W+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D28B6808AC;
	Wed, 16 Sep 2026 20:42:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9765413D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA5040292
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SMy8N-r-HBO for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:42:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F0E634033D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591338;
 b=EcWtwZuQTT3XLXqgV2yC1uZahmPAQHD25qJuNzHWjn9XIAuitS75gni05HRmDHkhBhzo
 nVDELNxf0obzaQ8aBY89JXPsNKzigmqQjdZvnWwY0ap+J+KWpNWzPio6LdxMgsd+sHyGq
 JI2+xR5kX7TNZjKru7A6LoQnmcFw5W2Q9Rs+eyiow2awlRT0QYInMwYHhaYtDsPygkDid
 oSBwaxpnbWoTAwcPcNno0CdyZDFq4YZqbSFslR3X91SXRaMtgf8xvT5DiXNm0VrFutRWj
 pZhdtkP2vwD3DbrWBudq6lL2zbguiTXoBxwQrhTA7L2vmRx3qLuvRn08/B7Sq8SJT2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591338;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=XuJrK2tLzTVEqgcYJ3OR/9orYI8jg/5IfqhlMZgjXro=;
 b=Jx6Q9wilUOZ11kn/dYWTkMeAaTvyKSK8OoZk67hhSpROW4VaQpy6hyoI0QDUnrdnD4qg
 0GIy3U1Ttky4gU+jzETXllaMcdmu5phkhenRkA1VzHgz7iyv0Hcf3kW+ZMYMAXD8/c3yb
 KHaMn0nYR8OaHw/Ujkes9Il3A9VhNYUA2+nEVsGnGdnel7jq4UfBRbNSJwAyUbjqJPGQ/
 3ggbf4tJQGdWoxG6srd6YDGQCAUxHC9EjsYSl3Pz+qt86YI4sxwjPx2gULtyDt9wE6ehU
 rzAtHB9EN3LEI8QxW2IzFzTbM//WtabBmfqpAzo7noPeXTJnZ8K+XPzIXyRoUuJQ/pw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="Hc/ai3CN"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0E634033D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:42:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E75A6C5CD6B;
 Wed, 16 Sep 2026 20:42:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D068D60337;
 Wed, 16 Sep 2026 20:42:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D1B8211C7B00D; 
 Wed, 16 Sep 2026 22:42:09 +0200 (CEST)
Date: Wed, 16 Sep 2026 22:42:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <aqr_GW6vKPuGCOuh@windsurf>
References: <20260916194222.1478392-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916194222.1478392-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/bind: fix Config.in comment
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

On Wed, Sep 16, 2026 at 09:42:21PM +0200, Bernd Kuhls wrote:
> The commit should be shown when !BR2_INSTALL_LIBSTDCPP is true, also
> treat BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS as arch dependency.
> 
> Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: security
>  bump version to 9.20.24")
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks!

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
