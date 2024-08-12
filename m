Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA70C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2FB88145E;
	Mon, 12 Aug 2024 20:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fqny_HhFgYgD; Mon, 12 Aug 2024 20:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 165BD81425
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 165BD81425;
	Mon, 12 Aug 2024 20:54:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A99A61BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CF2C403B1
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J700e8ktrqPu for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:54:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FCDD403A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FCDD403A2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FCDD403A2
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:54:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D3FD40005;
 Mon, 12 Aug 2024 20:54:18 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:54:17 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812225417.1bf9195b@windsurf>
In-Reply-To: <ZrL8C1qwlKLMafsT@waldemar-brodkorb.de>
References: <ZrL8C1qwlKLMafsT@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723496058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCnJ3x5VCobMf8Fs88WZsgIDHeLf2O8Il2y7Ku1010A=;
 b=grQ9HmLiPoNvtuHJ+J0re7hz/4l6SAXWvVA69ld8fjYRRHJN5tugUiwMnIqyDcNHhMQMRR
 oUzJVi47AfT1FBxDSBdgqAYO3d2JEUyf0FNWB9YjcM7hruS12/bvaWh1Szju3ISQpldUuZ
 oiNyD+lGf953uhy3vDYRsdvBWSbGWZWEFWrXOg6OT9j7h1aLQCtZbTrBQke1PEs8uPKMUR
 a6hfFkZG22jVRybjrgzd0oHVcojlSUDwl66cHufbI/NnNTXLKCaVnuv+g8fR8njzv42lOr
 PKRTxAqvg67yJTjiz56pgH8Fkt0o6HRgSpvjnlIkcsd/o+qEkHOiYG/eLgug+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=grQ9HmLi
Subject: Re: [Buildroot] [PATCH 0/3] Upgrade to Binutils 2.43
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

On Wed, 7 Aug 2024 06:46:03 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Waldemar Brodkorb (3):
>   package/binutils: add support for 2.43
>   package/binutils: make 2.42 the default version
>   package/binutils: drop support for binutils 2.40

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
