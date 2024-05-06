Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58735C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A2D82B3E;
	Mon,  6 May 2024 20:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYe-VjBiJsD9; Mon,  6 May 2024 20:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450FC82B51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 450FC82B51;
	Mon,  6 May 2024 20:15:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3139E1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B2B982ACA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7beh-3uPJgO0 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 294DD82AA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 294DD82AA9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 294DD82AA9
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:15:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92C311C0003;
 Mon,  6 May 2024 20:15:39 +0000 (UTC)
Date: Mon, 6 May 2024 22:15:38 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20240506221538.2e3ad1b9@windsurf>
In-Reply-To: <20240430203708.75367-1-jesseevg@gmail.com>
References: <20240430203708.75367-1-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1+W8LYiYyoYUnrRvkTc3hzarQ8jeYnaqDbjk37aPZY=;
 b=aZ2USwz7xiv/9Da2H1Ea/P8iMGmp0QhVIgvvD3bNc6m4vMAB4jW0DEBrmUKeLObtGYhLPP
 VCwjOz8o1DR31kuk/+71eS+YCG2dFlltivs1fDq28nSROGM7x3p+2gmYgdVo14iSZ4ZJtD
 LrJV5mnGEPr20DJjyG+hQQuaC4hYMW1VHbLLjWslykDFAG66HqHwgQ8OoWiOADZbgb3lBm
 /pvkYiysuR2ACnVLk5tAoy39T6yQLi9LBUDP5zcGWpezwi80xZI7xFQWzAEkIVD7FNLKU6
 oOI0FKMbEklrus1xcnItwQPFkew9yX1qA510hd//WctoIPFw8Cg3I9BPJvzB/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aZ2USwz7
Subject: Re: [Buildroot] [PATCH 1/1] package/snmppp: bump to version 3.5.1
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 30 Apr 2024 22:37:08 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Drop non-v3 fix patch as this was upstreamed
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  .../snmppp/0001-fix-build-without-v3.patch    | 43 -------------------
>  package/snmppp/snmppp.hash                    |  2 +-
>  package/snmppp/snmppp.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 package/snmppp/0001-fix-build-without-v3.patch

Updating .checkpackageignore after removing the patch was missing, so I
did that when applying. Thanks for the contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
