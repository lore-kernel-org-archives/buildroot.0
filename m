Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3054C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A18B96067C;
	Sat, 14 Sep 2024 07:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jh7AQOOyD4LY; Sat, 14 Sep 2024 07:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACFCC60683
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACFCC60683;
	Sat, 14 Sep 2024 07:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F65C1BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA76606E8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhKxbWo9yTCU for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DFCA36067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFCA36067C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFCA36067C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 07:33:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C0851BF206;
 Sat, 14 Sep 2024 07:33:14 +0000 (UTC)
Date: Sat, 14 Sep 2024 09:33:12 +0200
To: Pedro Aguilar <paguilar@paguilar.org>
Message-ID: <20240914093312.56e4e7cd@windsurf>
In-Reply-To: <20240913210301.6681-1-paguilar@paguilar.org>
References: <20240913210301.6681-1-paguilar@paguilar.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726299194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcRaeBCwOVbzzlq5abuO+g3oF+ZKusmHCgoIw0PJ6Ds=;
 b=NKBRaOSistFJo+twCpyWQ3+/UntHCIdbrYeZ7JsPChjaAu0H00xLDNGLvPn07md7zj62EU
 zSUAsfk+JpAdTkQB49CMYa3f6hWuuQxiqorrlG9V0vUW+i4ZNwdqOEcUeShFqExp+wxpkF
 tNn5XbwATmPEUWFo64EzML7a3tFtlYhWyjScNSbXuxHGkEgrrNz9wNs7yk+wJ99/xvHGWo
 hiBME6eKmHTm8pk0Ce90rIEQJhMUALN8zmRZA98E915WFLQNYCFnFrNYGjvWZwEGi4n09G
 hPZQh1aEJiYUhFavFcxZ4Z0dm2aBBU9vrkT4Y1VjMVfN3P02O/FV1qEAtqL+Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NKBRaOSi
Subject: Re: [Buildroot] [PATCH 1/1] package/bdwgc: bump to version 8.2.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 13 Sep 2024 23:03:01 +0200
Pedro Aguilar <paguilar@paguilar.org> wrote:

> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  package/bdwgc/bdwgc.hash | 4 ++++
>  package/bdwgc/bdwgc.mk   | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
> index 917089da08..1e8cc6df98 100644
> --- a/package/bdwgc/bdwgc.hash
> +++ b/package/bdwgc/bdwgc.hash
> @@ -1,3 +1,7 @@
>  # Locally computed
> +<<<<<<< Updated upstream
>  sha256  f30107bcb062e0920a790ffffa56d9512348546859364c23a14be264b38836a0  gc-8.2.2.tar.gz
> +=======
> +sha256  b9183fe49d4c44c7327992f626f8eaa1d8b14de140f243edb1c9dcff7719a7fc  gc-8.2.6.tar.gz
> +>>>>>>> Stashed changes 

Well... your patch has issue it seems :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
