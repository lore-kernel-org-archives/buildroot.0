Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE0D74941
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 22:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E02B80C47;
	Tue, 29 Oct 2024 22:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gc8omYdtX-Ws; Tue, 29 Oct 2024 22:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EF6180C45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EF6180C45;
	Tue, 29 Oct 2024 22:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95DC9494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8420B80C47
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paag7ysyTBrN for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 22:10:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09F1380C45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09F1380C45
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09F1380C45
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:10:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A5C5E0002;
 Tue, 29 Oct 2024 22:10:03 +0000 (UTC)
Date: Tue, 29 Oct 2024 23:10:02 +0100
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20241029231002.747985e0@windsurf>
In-Reply-To: <20240911122010.2922087-1-guillaume.chaye@zeetim.com>
References: <20240911122010.2922087-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730239804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yc1pLbt7KV5MHD2+f3f4kfY62Cf+HH6Img/OtlZLOo=;
 b=V3/SkcARrIhmlWFOQtgLC8INinaq9ycJNSUvVeE6dOgXe4TTRQWgRgJjgznSk3eUYgTsJu
 txwAtG+Rqw7A06TlLs36ja5UKgtF9weiFnKnGCVF44gNdflympgvFHfhhtHmDb6QC9Dgyc
 dU5IYWhwtDZBMg7OpUpo345NoruHw609HxD4Z9qbb09Hdp664C7OHg4xP16wl3LbEe5tGw
 jeL0OJ1Umk54tXZ+MCIcgu5x6G+kWaROqiJbzY0LTfWpLn4VVa3sxP6Yh6tvci6D8ty+mg
 03a+furZBjRsvgt9uqhrG4304kwsxe1dHLqLU/YTEsd06SxcoFx9MZXMq0qLtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V3/SkcAR
Subject: Re: [Buildroot] [PATCHv2 1/1] package/systemd: add EFI support
 option
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

Hello Guillaume,

On Wed, 11 Sep 2024 14:20:10 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> We need to compile systemd with -Defi=true flag to mount automatically
> efivarfs in /sys/firmware/efi/efivars
> 
> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> ---
>  package/systemd/Config.in  |  4 ++++
>  package/systemd/systemd.mk | 10 ++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)

Applied to master with a slightly improved commit message. An improved
commit message would have helped in getting your patch merged faster,
by providing a clearer explanation of what you're trying to fix, and
how.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
