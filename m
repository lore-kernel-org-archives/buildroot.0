Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363FBC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 024E680E57;
	Mon, 19 Aug 2024 20:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B50XK2vnucS2; Mon, 19 Aug 2024 20:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE59580E77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE59580E77;
	Mon, 19 Aug 2024 20:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 131AB1BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D701404F7
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Riv0S05m2Mz for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:33:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF00940403
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF00940403
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF00940403
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:33:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73A1EFF804;
 Mon, 19 Aug 2024 20:33:00 +0000 (UTC)
Date: Mon, 19 Aug 2024 22:32:59 +0200
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20240819223259.32986492@windsurf>
In-Reply-To: <ZsOmCiZLr7t6bPYz@curiosity>
References: <20240818203134.1512793-1-geomatsi@gmail.com>
 <20240818203134.1512793-2-geomatsi@gmail.com>
 <20240819125936.33b32adf@windsurf> <ZsOmCiZLr7t6bPYz@curiosity>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724099580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saV9x21cgNe1kt7ms68nQkVOp8ZeBvs9SZvcg6qc1Tc=;
 b=ObBnDIPa8vBwp7hacoDh1W0FyTm+F/ojjZNcV/8HPFLmMndMedaRvvpqlotJG0GoDNwftq
 c40V5ErDKWRrxUdNnIAaiAiCo0RjVcUfo3yVAAhiE3a9R8+kgzwLkvV80HuNUAdLim+JEC
 NwQoApQVPLGSQIJ4rgc+a+Qx6qyl+voQ+2rd1GXnuZdOK7ovS5IWqlFQMzvY0Luz5gnHot
 LWeifL2yDjI6Wm8Y0RQ01K/no0WGE/4rfk6S5+vGvM0UT6TTs/uGVzXM6CdqBEb1jdP30z
 /928aBNgXUe5CKn8F7Pn2Nhbp0najB9qy/xks8fFWN/VlBMcSaC5rZikNwrM6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ObBnDIPa
Subject: Re: [Buildroot] [PATCH 1/2] package/wpa_supplicant: wired driver
 needs headers >= 5.7
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

Hello Sergey,

On Mon, 19 Aug 2024 23:07:38 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> > And that should only enable the offload support... when it can really
> > be supported. Could you check this?  
> 
> I like the second option with explicit kernel and libnl version check.
> I build-tested several configurations and it works just fine:

Excellent!

> I will send a fix to hostapd mailing list. If it is not acceptable for
> whatever reason, we can fallback to the separate Buildroot option for
> MACSEC.

Sounds like a good plan.

> BTW, the idea and draft is yours, so let me know if I should keep
> your authorship of the hostapd patch.

I have written/contributed enough patches that I no longer really care
about authorship. Feel free to stupid the hostapd patch under your
name, it's going to make things easier (and in fact you did all the
testing, I just threw some random untested one-liner code in an e-mail).

Thanks for all your work!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
