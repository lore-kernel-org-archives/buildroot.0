Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904C3CD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55216839BF;
	Fri, 12 Jun 2026 16:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAUyIneJMW1d; Fri, 12 Jun 2026 16:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D24C983880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781281944;
	bh=K9MVVkRP2j80WyEhKdDT6hgkVyYta9A04r9rMXOM/TA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bWD2jpMZcXgWMMIBqUudRURn8dA2iOgLhT968yD/ZBavVCfv5NFO2a2og91QuyNf4
	 o0TC+AE4kKsHy7Sj72hxMtDOYO4XaJpxkGigeOA4wGPR36PtpC0fW2Xgqc8ptLF5Af
	 cwkSGML3hHpuP2lV6KYXU7jLM5beC+6DwGo1/Kv13AnuR1H3sUH5qh0VMB3AD514K0
	 SWw7LTXoarQHsN84gLaRGH0t3XFTy3NAyYYUmaJaxlSJhxqwxrULlgKvhm4kc/Yt9z
	 AO+YFnE1N4ZHBB/qAO4FsUDY9qd0qw6Iy/umZzNts4gvFyQwF+AArp05CAkxLc8ji+
	 mmKZQKD9zDS/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D24C983880;
	Fri, 12 Jun 2026 16:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E995F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C0A74070C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCL3862crEPO for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73C0840059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73C0840059
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73C0840059
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:32:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D921213F8BA;
 Fri, 12 Jun 2026 18:32:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 18:32:17 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 18:32:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260608182230.1212023-1-dario.binacchi@amarulasolutions.com>
References: <20260608182230.1212023-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <f17246e1b2f57dad45684b4e66066d3a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781281939;
 bh=3gDQAyFAbqSALS60JDNM+0qMe7if7cb6V/FOJ0Vr7c4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BShUMj579OGZGp9ISLF2Wz4E5PR4yEIFPK1KsW46MhuqnlYyGle0l+XY9YGlirhLM
 MhYbeIGojZ8if7iI/+OktXOOEJya8Qi/rZwlR+BSHoQrh3mddglT9XQvJ7qOeLMK6t
 98Sf7+oXpP/aE9szCOi9Mbv1avvKP1o/oE39BOjaIwk/nqsS8ueijIqKzbOFPAHtOq
 hgr6Qq5PrrTSA3qfF1XUmFNsnUQg7OOyYQhtTTAuvzCaCRO3epsQY0WZIrQACe2X5i
 m9VpumcZauSVe87cckMRYGiyqXRc8b0ZVsXOxJUKGFoBX0z8wBiOgioKgnp33aDpww
 KJu7YuxeaQMQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BShUMj57
Subject: Re: [Buildroot] [PATCH 1/1] package/libgphoto2: bump to version
 2.5.34
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/06/2026 20:22, Dario Binacchi wrote:
> The removed patch has been merged.
> 
> Release notes:
> https://github.com/gphoto/libgphoto2/releases
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
