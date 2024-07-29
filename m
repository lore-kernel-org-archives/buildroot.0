Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22816C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA9DA80E0B;
	Mon, 29 Jul 2024 21:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6rvW2cKnASW; Mon, 29 Jul 2024 21:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA30A80E35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA30A80E35;
	Mon, 29 Jul 2024 21:20:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0EE21BF426
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEB8B403F7
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0c3VsETOCDk4 for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 21:20:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EAE0403D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EAE0403D1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EAE0403D1
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:20:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A69EBFF802;
 Mon, 29 Jul 2024 21:20:55 +0000 (UTC)
Date: Mon, 29 Jul 2024 23:20:54 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240729232054.5afee4a9@windsurf>
In-Reply-To: <ZqNYUWTWR+HDGnSP@waldemar-brodkorb.de>
References: <ZqNYUWTWR+HDGnSP@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722288055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp0XIVaCgYARH1z9bBn1CIz3qx7iw1qgrdTOpLJZWGY=;
 b=ThnatFa8Rkhh88CBQDnQ/9F+3Dh6TPq3BfayEcC6P41eraNTqA5kHz99EIrJdRtOXjRMxu
 YAIu7ExD88kYLUBbPjkZHD2Fv6rnBtif5dNayyyhgz4FuomMF53gEYkElhyqnoB/MhADyh
 Cm1DsG9bIq+qGLifygS33LtrHPUpYWnUkS0mTl1Zyz2BbaSuVgB80/W9CAAwXVrtZnTFC8
 sZ+hj+1eDYFpRZHUkPm/SudAFSo+8tk3RQnV/+uBbhqEhT8julBRzHPu4JhCuqq2g31NWh
 FWI3X1DNSQKLTRxs98shGWX9IzYPrKHEkxzsdqgQIlCLCRPHfGRYLo+Nyd9H8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ThnatFa8
Subject: Re: [Buildroot] [PATCH] package/qemu: update to 9.0.2
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

On Fri, 26 Jul 2024 10:03:29 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/qemu/qemu.hash | 2 +-
>  package/qemu/qemu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
