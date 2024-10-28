Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14ACD33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DADC401ED;
	Mon, 28 Oct 2024 14:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siYcT9nY8TPK; Mon, 28 Oct 2024 14:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E99740111
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E99740111;
	Mon, 28 Oct 2024 14:45:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12B8CAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E78008089C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG-JY5I3UJXT for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:45:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF09B80CB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF09B80CB6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF09B80CB6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:45:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9327240009;
 Mon, 28 Oct 2024 14:45:26 +0000 (UTC)
Date: Mon, 28 Oct 2024 15:45:25 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20241028154525.313f422e@windsurf>
In-Reply-To: <20241027233535.3980302-1-james.hilliard1@gmail.com>
References: <20241027233535.3980302-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730126727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tohJH2DfxKG7WC9SMkKOVpjONToW43IPBW0Yky9tJ50=;
 b=VUACF9xit/fti9u5ZFz/INQfm4yhxJjyu4UmQeulj3ZQfu0cl2TyfCEQYAOkQnwVZuTTlW
 z606wIeX9TJWHSExqs2a31UTU2ytyV6appOwOHvm/sHvNja4rAxBgaRWQmBb34s/hQIMcd
 RsItLVQDo6/Hvokr/CjaL4ULFMD4mvjpoQ4K2x3L1VnEOqTYtk3TvFwLBunAYDPAxewfJQ
 fGAhNN60az8qOTxcMAYpgNCpLC1fk3oBgrdRmI2mqljafcQQZL8RDHolOgPieRHcHm5Mqp
 TyHzO/aKchCwigcJtW3jpRBjpF7YFhOc6gp1I45C57ISSKSKlVdeLYB210L/JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VUACF9xi
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.82.0
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

On Sun, 27 Oct 2024 17:35:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   4 +-
>  package/rust/rust.mk           |   2 +-
>  4 files changed, 68 insertions(+), 68 deletions(-)

It would have been nice to indicate if you had run the support/testing
Rust test cases.

I've applied nevertheless, but I would appreciate a test report in
future patches (not only related to Rust but also to other packages
that have existing test cases).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
