Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51044C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D344846EF;
	Sat, 14 Sep 2024 08:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRf3Oof7tRiV; Sat, 14 Sep 2024 08:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299DB846F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 299DB846F5;
	Sat, 14 Sep 2024 08:25:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32B7F1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0ECB440634
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIHtlAejDi8H for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:25:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C6A7D4062C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6A7D4062C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6A7D4062C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:25:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0469EFF805;
 Sat, 14 Sep 2024 08:25:27 +0000 (UTC)
Date: Sat, 14 Sep 2024 10:25:21 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240914102521.6112c4da@windsurf>
In-Reply-To: <20240914071930.1189715-8-peter@korsgaard.com>
References: <20240914071930.1189715-1-peter@korsgaard.com>
 <20240914071930.1189715-8-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726302328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HilaBGMSmLNyUeNQXALoE0E75WfxvL8/pVflIiJAnH8=;
 b=VUUdttcfJl4NiQCAbVfh68Qv9JjsNHh5E6vbN86ZbQXUCMvsxuW/rXUFcyED/FUi6Gl4zx
 QF4XUUvHqTIJGRjJslbpSEw1sOk/eP2l1VVGGnEgwMNZtoOXhswuDot8JOf0M2D3cS6HoF
 8jYplSlBEWEEI6qc1+ALDDL7fZ3UJ0umlYBiCswq0JwXFlSBRt7NmN3j8/XTaAFPBhJyqF
 0iwOY8mUd43OJpSkTrM2QRSDAWeEq2py8e5q1EI6My4810YJGfvuqjtyxgGAOt+5sgyAgi
 Ar1UXoqEQvz88eYqcAjqxRwUVNwOYk9Ncfg4VS1zaJFrFCiAeXqa0nIUCoQZNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VUUdttcf
Subject: Re: [Buildroot] [PATCH 08/23] package/libcoap: fix typo in help text
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 09:19:15 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libcoap/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
> index 950aee5279..bd9af479c8 100644
> --- a/package/libcoap/Config.in
> +++ b/package/libcoap/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBCOAP
>  	help
>  	  libcoap is a C implementation of a lightweight
>  	  application-protocol for devices that are constrained their
> -	  resources such as computing power, RF range, memory, bandwith,
> +	  resources such as computing power, RF range, memory, bandwidth,

This made the line one character longer, causing check-package to
complain that the line is too long, so I rewrapped the line.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
