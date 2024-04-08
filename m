Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E49CD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE05540CA1;
	Mon,  8 Apr 2024 20:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0ZeLX-Z5XMX; Mon,  8 Apr 2024 20:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F40BD40B60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F40BD40B60;
	Mon,  8 Apr 2024 20:50:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42A821BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B96381EA0
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ik1A9F5gEPL9 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33FF081DE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33FF081DE9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33FF081DE9
 for <buildroot@busybox.net>; Mon,  8 Apr 2024 20:50:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B1BD1C0002;
 Mon,  8 Apr 2024 20:50:05 +0000 (UTC)
Date: Mon, 8 Apr 2024 22:50:04 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240408225004.6725b245@windsurf>
In-Reply-To: <20240403084005.512267-1-francois.perrad@gadz.org>
References: <20240403084005.512267-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712609405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qe1/lDIleFoprpZ4t8gViDonZiZbKwhwTiDWfTFQ5kM=;
 b=ckpQxWFn+j0qaD0L8XxlUSnQteVi+mLms//8b96if40gBYDCn35S0tfv8J9BPZxgqzJLwf
 pDkHTKzyAoIH16wn+mI9MCJZEclP0MIETL2CRl7yoDsD6wnicSad0/kI2AgUggQmm9lq28
 4rePiC4rYkyhUXeQBvaJsP/lhlJVyderJMsPNMfKX2rMl/ZxFc2mF7SA62lONCCMF8CYrb
 bIpd+VMKv3UE7L7+MTbUqRBv4hTJsD0AE33jdTN4rchityX95BRi3AqFAgIEBdN07mvujz
 TBa92nSmeZxLa5rNgbJUAmplxzgD4MMG2Ln7NpJXBObcsjl5Yb5leeUcEkfCvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ckpQxWFn
Subject: Re: [Buildroot] [PATCH] package/pango: bump to version 1.52.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Apr 2024 10:40:05 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> remove merged patch
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../pango/0001-Drop-Werror-array-bounds.patch | 40 -------------------
>  package/pango/pango.hash                      |  4 +-
>  package/pango/pango.mk                        |  4 +-
>  3 files changed, 4 insertions(+), 44 deletions(-)
>  delete mode 100644 package/pango/0001-Drop-Werror-array-bounds.patch

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
