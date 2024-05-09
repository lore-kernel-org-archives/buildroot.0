Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A7CC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62ADA4020B;
	Thu,  9 May 2024 14:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fo8ZCNhHh8yD; Thu,  9 May 2024 14:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 383DC40292
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 383DC40292;
	Thu,  9 May 2024 14:35:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DD0F1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07EEC402E4
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGNt7ealE27g for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F475400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F475400F5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F475400F5
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:35:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C98611BF20A;
 Thu,  9 May 2024 14:35:42 +0000 (UTC)
Date: Thu, 9 May 2024 16:35:42 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240509163542.1a77c4ce@windsurf>
In-Reply-To: <20240416232317.580780-1-festevam@gmail.com>
References: <20240416232317.580780-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715265343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nu+VoRJ0OfxZGrPztZGETQDUXT6eEdgDo9ulsHEQEV4=;
 b=Efz15dIvfXnB9dpX1an15Im+mb5PN11ReJdAxyrA8YtrWu4/YC78WdxZ9O0/yXZxQQgzLV
 NimBYgfevf8RCURKKWyJ+4y7wEXjRiNUaP96Vj+3WUc2uQji58qYBbOe9E4gZdHXp+tx1S
 +G+Caf4f/xx6zEzQRDcHgd+8KuPXgqsfA7+J3g9BpSMuvKEkHLmiLc0t4+2NpomC4ViT7A
 zmpPi8AmAPEZXzSECxUkvlg5ZxvkCn3ZwmraJj/Wl9gJFkEQ0F4rXhAGUqr1M15F0Jzpj2
 bYrQg+mhWmnqYy1xWZarjKCQ90kDvgPnEn0/CqwcldPpAsA4z3LJAVNYaNfODA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Efz15dIv
Subject: Re: [Buildroot] [PATCH] configs/wandboard: update U-Boot and kernel
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

On Tue, 16 Apr 2024 20:23:17 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update to U-Boot 2024.04 and kernel 6.6.27 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/wandboard_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
