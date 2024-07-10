Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C31C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57E9882EB4;
	Wed, 10 Jul 2024 20:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOZ1auCsGJ4Q; Wed, 10 Jul 2024 20:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67FE683EC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67FE683EC4;
	Wed, 10 Jul 2024 20:28:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B09B1BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64C564020B
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtlMtBEFXvOF for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8698401C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8698401C3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8698401C3
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:28:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C7F7E0002;
 Wed, 10 Jul 2024 20:28:36 +0000 (UTC)
Date: Wed, 10 Jul 2024 22:28:35 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240710222835.5c329cc7@windsurf>
In-Reply-To: <38e42162ab203dcbf1b02124a5d6a402@free.fr>
References: <20240623033804.105858-1-lancethepants@gmail.com>
 <38e42162ab203dcbf1b02124a5d6a402@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720643316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bghyvj6dKxB/fK63zmEPFtDk1CUMuhJEJo1NBCOoB18=;
 b=dzXYQW5yByCKUx3pU1t4QRivJxLy3TOiQSQk/h6M6xQphNZuTraVvJsPKcDJ/jAYVIq2Fv
 aPLNCOYj2Xm5myp7Hntof4ISErRIJuONdztuMNcQu1IQsrgUngGXlFY67YYYX1WffRAtdt
 0DnEL5hyzHj9uE0LmFhCqY6uj6mOkR03pLmaKmPRBZZYcLF2BdBAO/QLt9AM1EN2SSUE2m
 whiQQNuBPZceb20N09qIvF76+Tp507lt7o7s2yq6wSvDhhQ4wgQWIFoQpp57zsPHWcSroG
 L17paPK8GwH/W+sVoaO7C9xjiECgpKeqlAJbKGktqmUCFhwqp6OxVX/MGItgVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dzXYQW5y
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: Fix building syslinux
 with GCC 14.x
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
Cc: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Jun 2024 10:10:59 +0000
Julien Olivain <ju.o@free.fr> wrote:

> Even syslinux had no release since 2014, its mailing list is still more
> or less operating: https://www.syslinux.org/archives/
> The patch could be sent on that list, in case the project gets a new
> maintainer or get forked by somebody else...

I agree, but there's been no commit since 6 years in the Git repo, no
release in 10 years, so I tend to agree also with the fact that
upstream is dead. It's pretty crazy that no alternative
upstream/maintainer has emerged for this project (though its code base
is not amazing, so not very encouraging project to take over the
maintenance of).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
