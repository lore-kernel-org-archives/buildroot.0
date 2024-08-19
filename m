Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEEEC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4139F80D5C;
	Mon, 19 Aug 2024 11:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njvuY_8JEr9h; Mon, 19 Aug 2024 11:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 521DC80DF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521DC80DF3;
	Mon, 19 Aug 2024 11:07:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C41111BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFA0F40186
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncLd0_T7mQIw for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:07:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D3EB40549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D3EB40549
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D3EB40549
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:07:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF5CC240004;
 Mon, 19 Aug 2024 11:07:08 +0000 (UTC)
Date: Mon, 19 Aug 2024 13:07:08 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240819130708.2a1d8f90@windsurf>
In-Reply-To: <20240818194750.818808-1-petr.vorel@gmail.com>
References: <20240818194750.818808-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724065629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTHtmYXGN3gTqpEGpURT/IEATB9+dE9K6i+dXgaEx3I=;
 b=bQh29n5+RFDqprwPcZxZTIU5I+wpBe4xzvkXGBC1Yy+xjHzBKgCVRKEBUQ9n3abCsXrOHx
 kaBHHvyDGxwIrpBMnrYtAbwZMhYPpjdtvyBzjXWVLzQyqxMpMD4KKrJvtWLnbEr7SPAMe8
 ID6GHFXjG2jGxer1QIcRsPLC09yuONFNvVdFuw/UamoQs3sPQgu/9DxjwoPs16bxOhfu+S
 6RybSkxVnqkbrzO6/ygzpPfb8oYUNaSGE0/khVHgOBIFNHc32Ru7X4uDVo6ztgMo8akF4x
 MKyMqgDBEAprxSX3bq55BDH7BXjHxZmH26kWntP3/Cs2hGdpnBxCy4a8fiVnfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bQh29n5+
Subject: Re: [Buildroot] [PATCH 1/1] package/fping: bump version to 5.2
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Aug 2024 21:47:50 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/fping/fping.hash | 2 +-
>  package/fping/fping.mk   | 2 +-
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
