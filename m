Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17383D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEDA1411D3;
	Thu, 11 Dec 2025 19:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z89A6Slwfiza; Thu, 11 Dec 2025 19:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA1834111A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481442;
	bh=VusbwZKz/sc6HOtbCmqq2028bpd776SKO4BhHmJQyW0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hWNlyhvZJ2+dnDxpYGkSwaUZdzeHLIjmhXR99NZe334050ykckchNfussqBOfsScj
	 86HehVNeOobXBWtQ/e+JrIJ0tjPxRIqWrkfCteCRiaB11MqmMgD9b+YPOq39TndMXr
	 T3Uc/EHXhamLGcLBkbyzKs5dTk8o0qihnEQConTGgWjDxyLQbjV6OWyAVWx73jw9UN
	 jw3F/IxH1EN72fblr7IFJmBq3p6NqNipRtH/qFPUdE3SvpavyE6rmgD6ZNe+Vd0To7
	 eHoXrH4rQO+x/S1LLlP6OE50KCF8HrJwhM26lzDxftoc3aMWbk6M/kFz4SNKeKV1O5
	 POslO5YYF8Uzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA1834111A;
	Thu, 11 Dec 2025 19:30:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DC4E2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F9C4605D2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcXFgUtrfHT7 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0EED60592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EED60592
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0EED60592
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 915C6B97A098; Thu, 11 Dec 2025 20:30:37 +0100 (CET)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:20 +0100
Message-ID: <20251211193020.1098874-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202202159.3882548-1-peter@korsgaard.com>
References: <20251202202159.3882548-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481437; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=vX66JBLkiYocVANEnI621OfBx2EiKEEeVIyCdSg09QY=;
 b=Jxn4A1eFNbefN2F9MNX12czCE5ztg3A6lA8N9K6FHe2QT6fJ9WS0aq+BpLC+zaB8p/gNYN
 R/bUE3Mndm4zY5Dyf6AKKxL0lbpoouYlDPvmAZAEZntiij26D6jA7A+RiEi9AEI/74urDM
 IJ+AlTokcigzoX/AjKQQZQpLU+ubktijZCu2JkYv5xM6CpGBGkDTbUP59EhngmDG8qyskR
 zsQNcCEgEmAXOfzQxEU+pheIIlhBb8SU2ugQM8KnQJzcsgVut+StDcs+MrbCDT6GT01Ck6
 0XJN6S3rMPHa4GO1/Hp50hM1+59Bji/yAw8eqezqt2w4c63L77qohkdgHqWY3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Jxn4A1eF
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats:
 check_url_status(): use HEAD requests to limit server load
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

In reply of:
> The gnu.org admins have been blocking the IP address of machines running
> pkg-stats as the GET requests for the (many) packages with gnu.org URLs are
> seen as abusive.
> 
> The resource body is not used, so use a HTTP HEAD request instead of a GET
> to limit server load and bandwidth use.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  support/scripts/pkg-stats | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index cfea179458..c659acb80e 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -469,7 +469,7 @@ async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
>      global check_url_count
>  
>      try:
> -        async with session.get(pkg.url) as resp:
> +        async with session.head(pkg.url) as resp:
>              if resp.status >= 400:
>                  pkg.status['url'] = ("error", "invalid {}".format(resp.status))
>                  check_url_count += 1
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
