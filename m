Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05726C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 21:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C23EE80BE7;
	Fri,  9 Aug 2024 21:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGmfYDqX03Bc; Fri,  9 Aug 2024 21:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D108F844C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D108F844C8;
	Fri,  9 Aug 2024 21:59:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86C241BF21A
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 21:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3188613CF
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 21:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dd1yECvgtfcW for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 21:59:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D699613D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D699613D7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D699613D7
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 21:59:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F245B20003;
 Fri,  9 Aug 2024 21:58:59 +0000 (UTC)
Date: Fri, 9 Aug 2024 23:58:59 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20240809235859.7c600416@windsurf>
In-Reply-To: <20240809112402.737525-1-zgyarmati@zgyarmati.de>
References: <20240809112402.737525-1-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723240740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpHJi2XW6V/1OPWUlokrs/9uj7gLehRsu03JyfZ4SBY=;
 b=dDL/YtGPel7scZdbTALZi9rXoqLMnT/2woPdXfGmKauQxGymq4lUtBGFKwCEsXIKe4uqH5
 QLP/XECS9+S7GXoNBkS519QxIFhuoFg0W2J2U4ife1ymV9QBzWJXoW3zK4KhLLzWzj99fi
 VpwghlTahKI174GHtbmj2QRF58sWKCXvd7jO7pnQ00sHz9zaOqqb1iENKifSDyo6wvDdh3
 ogeJ6GTQiiyd2z6cC/uacuyF8ZDTVEn+iYQ7zVDw/bKD/3EmxjRXqZaUTFKRXSAdawGr/n
 5vYwlVGgeLsM32EBIxqZtlLErblPtloztBRoI1/RBC/EsHlCGDuOq/YSNBQt0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dDL/YtGP
Subject: Re: [Buildroot] [PATCH v2 1/2] package/simple-mail: bump to 3.0.0
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

On Fri,  9 Aug 2024 13:24:01 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  package/simple-mail/simple-mail.hash | 2 +-
>  package/simple-mail/simple-mail.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
