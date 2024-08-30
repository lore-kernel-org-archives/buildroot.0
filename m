Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C1FCA1004
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 15:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1605E400D6;
	Fri, 30 Aug 2024 15:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4VMkuGxsEIk; Fri, 30 Aug 2024 15:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4C0D40350
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4C0D40350;
	Fri, 30 Aug 2024 15:29:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D90F1BF2B3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 15:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A31542564
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 15:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xff5K_jkYE_1 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 15:29:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0F1042550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F1042550
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0F1042550
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 15:29:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7362E240002;
 Fri, 30 Aug 2024 15:29:21 +0000 (UTC)
Date: Fri, 30 Aug 2024 17:29:20 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240830172920.0ede0f66@windsurf>
In-Reply-To: <87le0e32jm.fsf@dell.be.48ers.dk>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf>
 <87r0a994or.fsf@dell.be.48ers.dk>
 <20240828154253.206391b0@windsurf>
 <87ttf47nr6.fsf@dell.be.48ers.dk>
 <20240829234416.4131264b@windsurf>
 <87le0e32jm.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725031762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=701MMOdSzVlw52gaXuo8CEbVZWBiRJz61frjuKqeets=;
 b=Y2EBq6PNocF+N1ur5TcSxg1I4imgIUok5x6fF7ZPuYV2lnZfCOP/nVc2b5XmHv6OgRNwqg
 lJiThnVsaJv2HSVtLyhW4fzFwkU4tnmG1tFuUAON7031/dC0zV4c1C2A0WWEV1gcfRiX4A
 O44rWcUcTDK1CBkhQDZZM0hHY262IPDDwJMRlBXGf2HtTKCbcl0bnnBcAwYmpmRAae0BvO
 FNoahLnwsoMBJDBiFYhRj5Gt8hJlLBr4LFc7lA24H7EIheE4FrrfGnhbGKzSX7hbF7r6b+
 8X5k7Lebh7hPqdkG3ZNr/HHz6HUUqcnS3itqD931q3jeqw0g+qhg/nW1sQGTAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y2EBq6PN
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: michael@amarulasolutions.com, Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Fri, 30 Aug 2024 09:14:37 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Does such a tool exist? I am not aware of one. If so, maybe we should
> recommend that instead of dd for writing sdcard.img from the host?

I'm not aware of any tool like this.

> 
> Anyway, I find bmap a bit half-baked, E.G. rather than wasting time (and
> space) compressing and decompressing all the holes that are then just
> ignored it would make more sense to have a file format encoding the
> holes (E.G. tar --sparse or something custom), then optionally compress
> that for transmission and have something small and simple (E.G. not in
> python) on the host/target to write it to a device.

The Android sparse image format looks like to be what you want.
See https://2net.co.uk/tutorial/android-sparse-image-format. There are some
C/C++ tools at https://android.googlesource.com/platform/system/core/+/master/libsparse/
to generate/manipulate Android sparse images.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
