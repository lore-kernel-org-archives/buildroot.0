Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5BDC54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 068AF40622;
	Tue, 27 Aug 2024 16:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jp63c2Ar-SQB; Tue, 27 Aug 2024 16:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5F45405AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5F45405AB;
	Tue, 27 Aug 2024 16:40:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED3E11BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77F8402EA
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gKdTTK7XkTw for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:40:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84A6840131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A6840131
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84A6840131
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:40:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 723C34000B;
 Tue, 27 Aug 2024 16:40:53 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:40:52 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240827184052.40f8bbac@windsurf>
In-Reply-To: <20240826094756.38632-1-buildroot@bubu1.eu>
References: <20240826094756.38632-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724776853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQNOMLTT88gPgXD5TKSEg98YcVg1syrqbckB9V4B8lo=;
 b=idIg8axTVTryyu5JD8UHeGRWtwG2m2Y11cIIEcWwGNePUi6iNxmmwUVoVLX57zH2HxAuC3
 kznafjGNBfrcRgCG4GDbqZuSZLD+ujCG5XL82U11/cMs5DWI0pewxSy15ir8EMxRun06lt
 OLUdp/gtdXqkwektm+syi1FckV6j6adJueA1wEio8AkBW4l2un4cz7naSYJvEJSPoLXfHd
 T1e7lNXv+OgTabZyRBjg+gxY2a2G/QjB4XDb1ymR3BPWci+EXwtWlLxAwhe00rRWewboht
 rUcrSqDDfsJe5g4JsIdC4Il0LMdSK7jNugMVrryV3+U9A7pVawC7ECioGVGqJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=idIg8axT
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to 0.112.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Aug 2024 11:47:55 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog: https://fastapi.tiangolo.com/release-notes/#01122
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-fastapi/python-fastapi.hash | 4 ++--
>  package/python-fastapi/python-fastapi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
