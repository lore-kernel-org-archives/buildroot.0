Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D556FC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 11:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A058681A29;
	Tue,  9 Jul 2024 11:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDdXIsvSMrDc; Tue,  9 Jul 2024 11:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF79E81A33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF79E81A33;
	Tue,  9 Jul 2024 11:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C55A1BF59A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 11:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88E9A410B8
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 11:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAqnP57nqScn for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 11:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AD9E40F48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AD9E40F48
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AD9E40F48
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 11:57:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C6AA40006;
 Tue,  9 Jul 2024 11:57:18 +0000 (UTC)
Date: Tue, 9 Jul 2024 13:57:17 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240709135717.6f0f69d0@windsurf>
In-Reply-To: <a11a2bc2-cc24-421d-8333-2f0b622368b4@mind.be>
References: <20240705094449.8550-1-fiona.klute@gmx.de>
 <20240705094449.8550-2-fiona.klute@gmx.de>
 <20240708231151.2606b9ff@windsurf>
 <40102a9d-6674-4a11-bf18-a4ea41164095@gmx.de>
 <20240709113704.65a5c956@windsurf>
 <a11a2bc2-cc24-421d-8333-2f0b622368b4@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720526238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WHRgz/XESgTWpWzjCFy2nVGUW50OjqdwGuDjFKsOxxQ=;
 b=owdZRtnd3YfxUdmH93cMeGotTbzs8RATzJHvEBZDsVn4VdhDvuGMu/kKetXYbAZxDzeLS7
 2t0Xd2eL4pql4UD0lBHbhJ8sP2hJpIuS3QNU61PNHWLm5QMZS0Zo2ZJd5myckrFuYB2QNa
 EXlqaPaGwHFscOGq/iTI4i+FHWykSHdU4E3dIReU+3giTgedWpoetpDdlAs6YtePcJZacm
 UY8aT0oYG2/4xxKsJA6flMIDGWHWv68DfOC2Jg4S79yK0B21kSmUsbeb4rLqaIwXJM9l23
 tn7GdZFSGPihP1ARqMAVOtUwJduHkTWKZFDSHtbPiXRKXtv6lv/P7teC9LRV6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=owdZRtnd
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: describe relying on
 default options
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
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 9 Jul 2024 12:13:08 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > I don't have a strong opinion, but I think
> > section https://buildroot.org/downloads/manual/manual.html#adding-packages-start-script
> > makes more sense, as it's actually close to where it matters. Arnout?  
> 
>   The init scripts are just an example here, the principle applies more in 
> general. It also applies to e.g. ifupdown scripts, or even systemd unit files 
> (e.g. if a systemd unit file needs some ExecStartPre command). That's why I 
> thought that the start script was not the most appropriate place.

ACK. But then perhaps the discussion can be extended beyond Busybox.
For example for uClibc-ng, we also assume it is built with our default
configuration, and don't try to support the myriad of possible
uClibc-ng configurations.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
