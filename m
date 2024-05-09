Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CF0C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E850840715;
	Thu,  9 May 2024 20:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKXaJOaOlBDT; Thu,  9 May 2024 20:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB6D94073C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB6D94073C;
	Thu,  9 May 2024 20:10:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3141BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5520E41DEA
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9UAbYx0JifN for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29042402E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29042402E7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29042402E7
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:10:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DBC11C0002;
 Thu,  9 May 2024 20:09:59 +0000 (UTC)
Date: Thu, 9 May 2024 22:09:58 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509220958.490b6b32@windsurf>
In-Reply-To: <20240509193737.168634-1-ju.o@free.fr>
References: <20240509193737.168634-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715285399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOF18HrRRZlKfCjNC0VHIwpqJcSIhB5MuzeO5oYQUSQ=;
 b=C/boFB7gVbAU1JQZHozYLBwy7X/jj4dYrHeaIJu0YeC1duZZIDgYRmuHh8ES29DlgcfmST
 eg0oSiqa6gMWruLde0m9rfHvJQN0/Aha8sGnCdnLecuBIrUp/M+7vj8UlBwDsDAK8cMCQM
 VFlIGSKjXou1gDhp7fODGD3/aGpzYu3DWjk9FGz7SuE1jnzvCROeVs4+5x3veFobfp/Zkt
 kAcHQHg6Mh1dpIRa3AtcKBjrvAU/O6xR0DDS2QuJSK5FDhT2eMM0DSxyGoZvuPOEBGOAGY
 MRYN1jALZbeY8+e2+l7cHAMrrTIUxn0+TiXU3hwOaufj051asHsax7jzYAYAhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C/boFB7g
Subject: Re: [Buildroot] [PATCH 1/2] package/zbar: add the optional
 imagemagick dependency
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
Cc: Volkov Viacheslav <sv99@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  9 May 2024 21:37:36 +0200
Julien Olivain <ju.o@free.fr> wrote:

> When ImageMagick is selected, the "zbarimg" program is compiled and
> installed on target. It allows to decode a QR code from an image file.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/zbar/zbar.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
