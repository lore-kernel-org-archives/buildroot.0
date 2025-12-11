Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B949CD41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FED340B58;
	Thu, 11 Dec 2025 19:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNcKEOAbv7FD; Thu, 11 Dec 2025 19:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E1540981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481491;
	bh=udMILCe68FCW8oex8TGsxWmjSIPYWZm7Z8ff6zivx9w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LjtX+VKqXDBi6eybF1zKNgIPCVpcyobzpegEEuFeDlM8x1O2eByKbhpcP3rC6EERr
	 IzVc+7Rt1s1RAZSnW4xYg7ktcSrmyD/Bpd7DDbUmaPdFMqm/fk9mC8r/SZQQLq2tn3
	 zELzgBrqLxJsXfatjqlLavyxaCpHmxCrgQTjvRSs8sinvm9u6fF0hfjHaoCyhAQyg+
	 nQW+h7v3dOzTvEL8ZhTe9AsJ6Yi8a9awGQZijlqPV9A6Q4sHCmovgYYjFqwzwmfWb/
	 lQTe9jPguJqwWAQPEzmtsRSGeFdodrHOnU2B+ilTDCJe6ZdbDloP0vqY3R/xV3o0/D
	 Njewu8I6/5pDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81E1540981;
	Thu, 11 Dec 2025 19:31:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B767BE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A94C360679
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vk1C_aJFUBV2 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A463860592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A463860592
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A463860592
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BDFCFB979EEF; Thu, 11 Dec 2025 20:31:26 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:24 +0100
Message-ID: <20251211193124.1099871-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207144816.3699081-1-bernd@kuhls.net>
References: <20251207144816.3699081-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481486; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=NpRyyykzSJT9XUfrP0X5fhWcC7celFQlxEoe3LbdUnI=;
 b=gDKUcqZv0h8NCxEcC6F6OU1KsfuqDMTfYhf3rsOSgAegrt5eYcNWR0DBzz0MKGdRGDsOpq
 jeaSx7NhI4QMaQClC8CCk8+KKrb0X6mu6fhDowbIgj5Addg22cUQ/MsebOxL45VwRC+KXY
 q6/gq+HqZh1UADp3HRNHQRw7yX3qeX/Nf/HRr52E3/1UZ/JRTodxgkbsq+94cTxMcTXHI9
 tOIXeaUi+kcHmQY31wBLtmCEEUI9kNn1E8R5cMvk2WW6+QU7xpapDbQemYlCvGvkQDET+r
 jPqBEOBAXgZ2dE9Nf5wsbWSl7XhmD8NdLbsZrP1BSzngOSGnEDMl7YnZVdNX2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gDKUcqZv
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Prabhu Sannachi,
 boucing e-mail
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
> Prabhu's e-mail address at Collins is bouncing, so let's drop this stale
> entry:
> 
> <prabhu.sannachi@collins.com>: host
>     mxb-00105402.gslb.gpphosted.com[67.231.147.145] said: 550 5.1.1 User
>     Unknown (in reply to RCPT TO command)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  DEVELOPERS | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5e1fa6401f..5c9eb94f56 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2769,9 +2769,6 @@ F:	package/libdvbpsi/
>  F:	package/mraa/
>  F:	package/synergy/
>  
> -N:	Prabhu Sannachi <prabhu.sannachi@collins.com>
> -F:	package/redis-plus-plus/
> -
>  N:	Qais Yousef <qais.yousef@arm.com>
>  F:	package/bpftrace/
>  
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
