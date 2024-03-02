Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C450EC54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 17:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD523403C4;
	Sat,  2 Mar 2024 17:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4u8M8XRQ7yjQ; Sat,  2 Mar 2024 17:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DCEA40A17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DCEA40A17;
	Sat,  2 Mar 2024 17:01:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1CBD1BF2F1
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 17:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BFE7403C4
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 17:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoribThIe1Ep for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 17:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F36840A48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F36840A48
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F36840A48
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 17:01:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FE8A60004;
 Sat,  2 Mar 2024 17:01:34 +0000 (UTC)
Date: Sat, 2 Mar 2024 18:01:33 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240302180133.1f54c1cc@windsurf>
In-Reply-To: <20240224214113.58103-1-giulio.benetti@benettiengineering.com>
References: <20240224214113.58103-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709398895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4VELL7ln0ASgvegvCFxPn7kyWSLPzHMzF9Jbk4vI4V8=;
 b=ocm/7QRZ9SRzJvXMEuIm1MmlaM48LYoIG27XOFQD9frE6vB7r/DircRakZXfs1PXyopj6b
 K+ntydlNW8Mfa/SVrpiR/9eqFEByYQw1dsYp3nlO3+OiyWlGUbOmJg/D5vwhfjsKzNtbXQ
 PSYj+HcvcPi6xviP5lkcdZPrZdSKlkPkLslpztvXF2e6g3j75UQIdRog1KvEvBbt+Z7UGT
 UCFSBdhHbpfY9bvInmRcnoKtKwYILj5j5lM3wRmma4GdnGBmeJqrLjrPbZlF3CeL8pbMNl
 7MSlO9e0tav5Nn8/CXL274IQF2+ukwP75uUEP4xI2ZVWR1DEMPP4fQRJ4kQo/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ocm/7QRZ
Subject: Re: [Buildroot] [PATCH] package/mongoose: bump to version 7.13
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

On Sat, 24 Feb 2024 22:41:13 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> https://github.com/cesanta/mongoose/releases/tag/7.13
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/mongoose/mongoose.hash | 2 +-
>  package/mongoose/mongoose.mk   | 2 +-
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
