Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFCFEEA864
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 22:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8EDF81E99;
	Thu, 12 Feb 2026 22:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwYG4dzpBtrd; Thu, 12 Feb 2026 22:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2207281D68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770933971;
	bh=ixykNnq6JVjbKZBkgjCI7O1hjf+FRTotHdnp+Ww7y3k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hQWdM9/6C5kA9Bw9aJGmXSeGXpx62zf5hoPkjrpq/B/q8xrzMX8BRxNv8DhC5IpqR
	 pdNY7rGIjt732435Tu3yfEfM40/LaPjpfsKUffd7rxo+OuqQEwZaby7Wzjkh7R9Kop
	 7V2ggdiZQ0+b71XuwdrIA58cd5b17zrFmxqdj0JmkPF5WiD7EP5mAJdXYG43Gq4pf5
	 azvrUExau9f46JANwgFRqAcBQIhGN1XeZ0LRJiLIUUPV8kpwLVum2U/OSBLD8Z5KJc
	 wCMv4MgGB7O/Pcav6XpkhYIUvtu1NqOlCLMhahsAbD4MUCfkZbqD8da6vA7CmzVrL/
	 Gi7XHb6TCCY9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2207281D68;
	Thu, 12 Feb 2026 22:06:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2591D1CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1404481CBA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnpVwuw-24Su for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 22:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3440581852
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3440581852
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3440581852
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:06:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F3A4813F879;
 Thu, 12 Feb 2026 23:06:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Feb 2026 23:06:04 +0100
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 23:06:04 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
In-Reply-To: <20260212205815.1029590-1-thomas.petazzoni@bootlin.com>
References: <20260212205815.1029590-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <84d769f2ca440a28044225e0d87b669c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770933967;
 bh=Ta6KP66/BMu31cCb47s6Gpyxix4iCB0GaUQIemBf1B8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XmhAmlj09yMKZwYSZv7CQjLXN9riocX1/WVQZ3UJDO4nDtuzAjajND/gSoo6ho4H1
 6NVefeCqwy+VUp8KFBeViCkbkG2Y5hKphUgNZfgXmIpocKKj1JP6ElJHKfX1YnIffh
 Nn+wrGxkXMsEuZtEpCK1431uxa8WYj/hqM97O2GIf2DUiJeVGSAaqDYJ/k8syouKiF
 uqPByXcD8qYSwmCrHR+Inoyi+UZys1gHSaUFXauwQ/25Gn5uvYMX93QVEataezebeI
 wX8GYD5oGAta7haEqxTxTZ+X0P2LIHxOFt1jSc8cSYZEW3ZWH9J/MZmCl7pB6JlRCC
 4v3TAevbOTIbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XmhAmlj0
Subject: Re: [Buildroot] [PATCH] package/libxmlsec1: drop mandatory libxslt
 dependency
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

On 12/02/2026 21:58, Thomas Petazzoni via buildroot wrote:
> Commit 7eeb574f0ec86e372bcc8a551e8e9bb88b8d6555 introduced the
> libxmlsec1 making libxslt a mandatory dependency, which it isn't.
> 
> This commit therefore make libxslt an optional dependency of the
> target libxmlsec1 package, and drops the dependency entirely for the
> host package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
