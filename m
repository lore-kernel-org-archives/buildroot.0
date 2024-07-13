Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5DDC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 618F74098E;
	Sat, 13 Jul 2024 14:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JivEHbN1EQUe; Sat, 13 Jul 2024 14:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304A740993
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304A740993;
	Sat, 13 Jul 2024 14:19:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38F481BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26082400A4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvO0nUBKjxHY for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B201040096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B201040096
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B201040096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:19:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAC9120002;
 Sat, 13 Jul 2024 14:19:22 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:19:22 +0200
To: <yann.morin@orange.com>
Message-ID: <20240713161922.13602404@windsurf>
In-Reply-To: <89fdb022da6dac26d2c05be4c56242747f59abfb.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
 <89fdb022da6dac26d2c05be4c56242747f59abfb.1698941362.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720880363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQFIrm4gHJcKa3hyqyExUbwI7EGAsoOex/+6dDeBplU=;
 b=ZhtmpHD/XFShjjVyL/GpCL1eZ/O2UN5M4Pelv/bJsIhC9KA3c1ajsZwN7qxgqAsiBInTR0
 VW87lNLFBZ6kWXM+GJ57a3dWmnfg4LUpnKmfOLZ+plAhClEl13/WZWSijrV+RImCsTWBsb
 Wwfc7KMXe+UPvDygtGykw9ElVaxfyx/VAGlHct0Nn9DHOEZ+F9nC8uxkFmqcTLC94zEqlC
 dm/7tQKx76a3BBIvLsr2LcOMrWxNGq29Vc7Mu8WrUIJGNCcjOvMXBFwbVW/79NbgeT06RG
 HB8JgemjS063aMB8TxFGl3/8RjG9cpIuWNAI234Hujsq4sJj5qvCCYpbnlmQoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZhtmpHD/
Subject: Re: [Buildroot] [PATCH 5/8] package/libgpg-error: enable
 host-variant
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

On Thu, 2 Nov 2023 17:09:24 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> libgpg-error is needed by libassuan and libgpgme, the latter
> being needed for skopeo (to come in a followup patch).
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  package/libgpg-error/libgpg-error.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

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
