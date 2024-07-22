Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6B4C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3AD4401CB;
	Mon, 22 Jul 2024 13:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJtuQu_QJWo3; Mon, 22 Jul 2024 13:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7FD401D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7FD401D1;
	Mon, 22 Jul 2024 13:41:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0052E1BF2A3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF4D5605A4
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61LsITS02rdJ for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 13:41:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5BFF600D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BFF600D1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5BFF600D1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:41:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE8C9E0007;
 Mon, 22 Jul 2024 13:41:30 +0000 (UTC)
Date: Mon, 22 Jul 2024 15:41:29 +0200
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Message-ID: <20240722154129.024b7f45@windsurf>
In-Reply-To: <20240722131117.273274-1-wdouglass@carnegierobotics.com>
References: <20240722131117.273274-1-wdouglass@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721655691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LG5Zz+5W7/J7W5iRoQb34YA93TNIvrvFSmEBvppzGWM=;
 b=OYkAN/JpbP1xYUR5f6jGnMXDaLGPrjKWvSSn+b3wIZlWRwoONmnTK3ig0oL35fF8k4MlM/
 /CbOcm50U1H+X8g6CgSbntNiZsNmKJHjwD+hGUYirZQU4UJBfYCZUkyjRCzWBu89vhiZkY
 EeglGga0tCdx09wvgeFgJ/Jmu7qs3AGpoExsHNRrvxzJSakwu0RRJHHGO/1c5BmgKEBAQV
 dKl/6HzkjhhPNzfPOsggH4tSbJExhxZ2OcaRyFwnKaPV55sYU40QFngZ92L+asOyQQlOpA
 gkyYHNKitxaPNbnqzkNviya64nLWZNyJZ5M6fJpqBky7CGZrfl2E5k7SF5zCOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OYkAN/Jp
Subject: Re: [Buildroot] [PATCH] package/chicken: move literals into text
 section for xtensa architecture
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Woodrow,

On Mon, 22 Jul 2024 09:11:16 -0400
Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

Thanks for the patch. Would be good to have a non-empty commit message.

> -# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
>  CHICKEN_MAKE_OPTS = \
> -	ARCH=unused \
> +	ARCH=$(BR2_NORMALIZED_ARCH) \

Are you sure that all values of BR2_NORMALIZED_ARCH are supported by
the chicken build system? What happens when the value passed is unknown
to the chicken build system?

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
