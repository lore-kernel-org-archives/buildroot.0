Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6545C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54AC4401C2;
	Sat, 14 Sep 2024 13:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g569zq1ANvxn; Sat, 14 Sep 2024 13:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28D904020B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28D904020B;
	Sat, 14 Sep 2024 13:16:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC75F1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB98784170
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EahEpOaIfKFV for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D38FA84160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D38FA84160
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D38FA84160
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:16:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0AA5C0002;
 Sat, 14 Sep 2024 13:16:10 +0000 (UTC)
Date: Sat, 14 Sep 2024 15:16:09 +0200
To: Parthiban Nallathambi <parthiban@linumiz.com>
Message-ID: <20240914151609.520c70e7@windsurf>
In-Reply-To: <20240914125406.3026002-1-parthiban@linumiz.com>
References: <20240914125406.3026002-1-parthiban@linumiz.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726319771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NHQSz3+Eo75E0RxP1r6Zy+Mdb0+EPvgOAWJNgbj0py0=;
 b=DXTZ1yKt5Q25lnEHloM+ZJb+KA6FOeOLmy1D4tZCVGajXkH3TlJsauXnHIy+c8h/kHFBvD
 MJ0ETnAEWpedeRrmhWW2dkL+fIrRd07mdgifWQyCCtRwLqmg+1IDFh6wsnqqyDCQDWdxP/
 rjNbyo24ZK6JMlamE7jMmWYqr1JycBclizExf4hnWdgIHx4P0n4xSUHMvfCfEBZahUGFJ6
 2f9q73rBB43NZtfAbshxdbNIg8njOhOjQRTETdBvfiGsCGNpcpqYFvsZYCIGWLRVaeFW7x
 flGX1cns6owx643g1Pe8nJyyyzocnOC7x2kaXf11PBita/F0DHRzDAmdURbM5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DXTZ1yKt
Subject: Re: [Buildroot] [PATCH] bluez5_utils: disable asha profile
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
Cc: marcin@bis.org.pl, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Parthiban,

On Sat, 14 Sep 2024 18:24:05 +0530
Parthiban Nallathambi <parthiban@linumiz.com> wrote:

> asha profile as it depends on audio profile which isn't selected
> by default (BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO), results in
> below linking failure.
> 
> ld: profiles/audio/bluetoothd-asha.o: in function `get_transport':
> asha.c:(.text.get_transport+0x2c): undefined reference to `media_transport_get_path'
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

Thanks for the patch! I believe it's fixing an autobuilder failure,
isn't it? If that's the case, then we like to have:

Fixes:

  http://autobuild.buildroot.net/results/75cd510e55d50a1a2da6e9e285ec7a09201d854a/

in the commit message. Of course the reference above is a random build
failure. Could you provide that information? I don't think you really
need to send a new iteration of this patch, just provide a reference to
the autobuilder build failure. But for next patches, you will know it's
something we like to have :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
