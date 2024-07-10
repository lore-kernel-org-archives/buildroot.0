Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84020C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F12E6103A;
	Wed, 10 Jul 2024 21:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rtVKoL873qx; Wed, 10 Jul 2024 21:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 576C26066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 576C26066B;
	Wed, 10 Jul 2024 21:04:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC5DD1BF982
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D88B080BD8
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zf-P4ikMzrRk for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:04:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBD8A80BBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD8A80BBA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBD8A80BBA
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:04:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00F641C0008;
 Wed, 10 Jul 2024 21:04:07 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:04:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240710230407.08161ccc@windsurf>
In-Reply-To: <20240623203557.3830122-1-james.hilliard1@gmail.com>
References: <20240623203557.3830122-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720645448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6cur5tp/bbItPOY0sg9bCORPcGDMQe4itA9WBtjYHo=;
 b=QU1jC5rzbfpeQMA9YZq8adkI4z9VSqHFRv9oBfTTv8brorZzeWbBaQBYs/6VZN08tMTYzp
 p1A/nla9fQwHMC5PlXBoI1Kwq8kv8vqIqf9Aw8Z32/Qw5ppktewR+iWS9Ffm7EU6sSz4+R
 r18u7Kfybst4EUYDE9HXpSTd6NQHWsb/6M3okeDcCBDSWXTDpkvXIgcK2CybcMPuGds+0f
 o1SndzOgq7niSgm3xuSSI+EFjZxcCVpWE3MDJCV4JnWsY854evezK6Rx5xoef27xjEmYak
 7V0nbGS+41kWlYnmndUkmrhQI/3m6SKSLxgYtVTQCx6a7YPMRTHASb3wUvWSQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QU1jC5rz
Subject: Re: [Buildroot] [PATCH 1/1] utils/update-rust: use urllib.request
 from stdlib instead of requests
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

On Sun, 23 Jun 2024 14:35:57 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We can use urllib.request without adding any addition lines of code
> compared with requests which is not part of the stdlib.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  utils/update-rust | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

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
