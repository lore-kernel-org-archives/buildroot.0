Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832B5C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E1AA40450;
	Mon, 15 Jul 2024 12:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u132aWsi6J06; Mon, 15 Jul 2024 12:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC9D4052D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC9D4052D;
	Mon, 15 Jul 2024 12:06:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F1CE1BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 558B24052D
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBT3qI93mKUb for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A18940450
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A18940450
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A18940450
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:06:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 454AE1C0005;
 Mon, 15 Jul 2024 12:06:20 +0000 (UTC)
Date: Mon, 15 Jul 2024 14:06:18 +0200
To: Ben Hutchings via buildroot <buildroot@buildroot.org>
Message-ID: <20240715140618.70e6705f@windsurf>
In-Reply-To: <baf799dacd2d518a6e274aa59c7659fe12b68834.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
 <baf799dacd2d518a6e274aa59c7659fe12b68834.1712957992.git.ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721045180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZ17IZvdThk88MFiiOFN431k9SEkQRbJJKatNUpqe18=;
 b=dDDbero2s6F7WLTkJlZfJ/9axAANz3AgoKd/4lyL/DjTzg0VEx34QtOuJktXkn8JkXOEoR
 PJMsa1QKOlVcCGyLZ6DcBmCdlaeelOjMtMSWXTkK+GoB6VQCPtBYJexylz7HwDevv0k+1l
 bPpMlFOxFJDzTvgig4lcSUHYnLUG4R6vLEe49KhtDGk0Uf+HT3Y+vWa1Lq7y8/I4Twljxp
 Z05jYsjMDlWNvZWImArIZULOpnbebAXEnIuSbrNVvMwsCJyKwlDmkY/aL83PD8zEi74Hjy
 G2xMBPoWzPOps3vCTF2j8b3ljyyd/l4v2P/iW018BLrsvHYrAsYsNNl+zMVLZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dDDbero2
Subject: Re: [Buildroot] [PATCH 1/6] package/libgpg-error: Add host package
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ben,

On Fri, 12 Apr 2024 23:43:05 +0200
Ben Hutchings via buildroot <buildroot@buildroot.org> wrote:

> This is needed to support a host build of gnupg2.  It is not directly
> selectable.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  package/libgpg-error/libgpg-error.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks a lot, but I merger an earlier patch from Yann E. Morin that did
the same and also added --enable-threads, because we always have thread
support on the host.

So I marked this patch as Not Applicable.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
