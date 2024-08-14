Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A789DC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 20:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A79A608CB;
	Wed, 14 Aug 2024 20:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPaHOo1qTwXo; Wed, 14 Aug 2024 20:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BE43608CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BE43608CC;
	Wed, 14 Aug 2024 20:04:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21C321BF40D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F70740382
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWudZWq9CLsy for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 20:04:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F06F402F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F06F402F4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F06F402F4
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 20:04:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE17E1BF204;
 Wed, 14 Aug 2024 20:04:10 +0000 (UTC)
Date: Wed, 14 Aug 2024 22:04:09 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240814220409.5ba6860f@windsurf>
In-Reply-To: <20240813172802.137236-1-ju.o@free.fr>
References: <20240813172802.137236-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723665851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4/4e8QidTkcGk/kCG44EFLqXilOqcatPPtNsteqNQo=;
 b=Y7F+DXTZMmo3XrxCXkPpZ8mlgPnQ97CfaamW/yjNTOKfXM0at44EGZZsCZmhUNyofEEYAi
 nrlc1Z4ZTwxUuvF8FQcxTzUKdK7NiF3qg/UzN0IjJcCZqFFt3ijKNw/y5Aqf9goy1nN+Lh
 UOhqetXaLNifTeR53oH78Y+CWhMuTSnC/YF4+oVxk/1CBlXj8vY8J7TDKFuUkqg0aTijHH
 10AUf/dikTvuh8pD4CEY7lIihk9s8Zq2FWUPZC7gXLcD1edTDFz3vv5Iar8y6yxjISuU0M
 CQezbVLkaWP4yQ2c5HdIySRkbHv74XwRQDBi5scNoQ6TNehjrHgw8Zo7KyhcoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y7F+DXTZ
Subject: Re: [Buildroot] [PATCH next 1/1] package/volk: bump to version 3.1.2
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Aug 2024 19:28:02 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release notes since v3.0.0, see:
> https://www.libvolk.org/release-v310.html
> https://www.libvolk.org/release-v311.html
> https://www.libvolk.org/release-v312.html
> 
> Fixes:
> http://autobuild.buildroot.org/results/82cb35e9be6a57539d4e370ab2c4a4fae9d8b5d8/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/volk/volk.hash | 2 +-
>  package/volk/volk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
