Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4205EC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 21:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE5E3812B6;
	Mon, 28 Jul 2025 21:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NW9MwNupS_IQ; Mon, 28 Jul 2025 21:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566D5812A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566D5812A8;
	Mon, 28 Jul 2025 21:02:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 725AC91D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 21:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E91860D68
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 21:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f45Ps8uyHRlW for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 21:02:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 277EB60D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 277EB60D61
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 277EB60D61
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 21:02:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8824B44399;
 Mon, 28 Jul 2025 21:01:58 +0000 (UTC)
Date: Mon, 28 Jul 2025 23:01:57 +0200
To: stefan.nickl@gmail.com
Cc: buildroot@buildroot.org, Aleksander Morgado <aleksander@aleksander.es>
Message-ID: <20250728230157.132355e2@windsurf>
In-Reply-To: <20250724092439.675354-1-Stefan.Nickl@gmail.com>
References: <20250724092439.675354-1-Stefan.Nickl@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepshhtvghfrghnrdhnihgtkhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrlhgvk
 hhsrghnuggvrhesrghlvghkshgrnhguvghrrdgvsh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753736518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCjVpzz39iJq3r6szh0UXHzgMA7+BVVqu6LgXmnv8NM=;
 b=SSytSa/GEw/3XH4FSyDOMDe7Gf55SVMOHWtLt3JDE+G+EpxZhhe6kCJurWyQAvEIMVQgpp
 1LCUj6AARp9ZmkkE5bJUyErcGS04wGp2a8hSV3BF7mI4xM2JJAIGMUlkDgkuasm/tAqQb2
 LiKiFicuGAXZ7L8O4FwBxGimQgqYnucTJK4AvXW1pmEIk/ytQvpe5Kg/z8PsZv2NPozzHv
 Li4vALdfMFWUPzQjwT8cbdu0J0xz06NHxP4kVNyUau7ZLcSbxuU5jZebcEn9QL+xM/z1q5
 FwXIiG4PgKJ1My6IZ0JRuWoJNn4HTVPuw1xl6r3NOo6TtXt82+e/Wm367byzug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SSytSa/G
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: Add option to
 enable AT commands via D-Bus
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

Hello,

On Thu, 24 Jul 2025 11:24:39 +0200
stefan.nickl@gmail.com wrote:

> From: Stefan Nickl <Stefan.Nickl@gmail.com>
> 
> Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

Thanks for the patch, looks good to me. I checked, this option doesn't
need any additional dependency, and is indeed a boolean option.

I have one very minor nit, see below.

> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index 6990996a86..975a45902f 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -35,6 +35,12 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQRTR
>  	help
>  	  This option enables support for QRTR protocol
>  
> +config BR2_PACKAGE_MODEM_MANAGER_ATVIADBUS
> +	bool "at-via-dbus support"
> +	help
> +	  This option enables support for issuing AT commands
> +	  over the D-Bus interface.

By putting this option here...

> +
>  comment "QRTR support needs a toolchain w/ headers >= 4.15"
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15

... you have made this Config.in comment go farther away from the
BR2_PACKAGE_MODEM_MANAGER_LIBQRTR option it is related to. Could you
keep the Config.in comment close to BR2_PACKAGE_MODEM_MANAGER_LIBQRTR?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
