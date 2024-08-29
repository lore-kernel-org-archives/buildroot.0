Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9724ACA0EC4
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 21:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0A94078C;
	Thu, 29 Aug 2024 21:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3QKTKUm5JRu; Thu, 29 Aug 2024 21:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9ADA407A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9ADA407A3;
	Thu, 29 Aug 2024 21:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1625A1BF5E9
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 21:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0342E40332
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 21:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiFTUzPExHzm for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 21:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FC144010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FC144010F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FC144010F
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 21:47:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CE6720002;
 Thu, 29 Aug 2024 21:47:38 +0000 (UTC)
Date: Thu, 29 Aug 2024 23:47:37 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240829234737.38039ef5@windsurf>
In-Reply-To: <Zs4x6LWMJfdWqApz@landeda>
References: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
 <20240822183742.3550055-2-dario.binacchi@amarulasolutions.com>
 <20240823181741.499173f2@windsurf> <Zs4x6LWMJfdWqApz@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724968059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iyyblOAlo/xmPfHKRPVid3cUQOxquDV5PE4DRgIT3g=;
 b=XYlMSoUj28kByQ0C18bt8uxbi1XswzIKIjPmilXFX2Uy8+m/YXDNbSokcfG20xsLFMJrrP
 7OJJSaXwCHd9433YlBKGBPHU8EwP+OMFs990Mp0cVNQjFAvahPduGAdJfuFdm4SOGkmcv1
 sSWBxG3gguWTb5MnGdptxOQJQgd8MkmHLDDPuWnU7sAaqfv2cyIbAmeNsKwZbgJ7nLW1GB
 r2/OPTBgAqQ1A/82UGkt2QtGykEmzH7wrpD63U1vWfrrgVroDWPNQ4otqO4EQgbh/5m8qo
 8isk4SFS9KX1BxS6B/sne6LJrqTH8YFTfH3Eve1FOxguJh8dn+Frwaq6q9OGPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XYlMSoUj
Subject: Re: [Buildroot] [PATCH v3 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 27 Aug 2024 22:07:04 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > # Packages that provide commands that may also be busybox applets:
> > BUSYBOX_DEPENDENCIES = \
> > 	...
> > 	$(if $(BR2_PACKAGE_TINYINIT),tinyinit) \  
> 
> Good catch! We also need that for tini, then.

Yes.

> > > +comment "tinyinit needs BR2_INIT_NONE, i. e. no init system installed"
> > > +	depends on !BR2_INIT_NONE  
> > I find this a bit odd. In the end, shouldn't we simply promote tinyinit
> > as an init implementation, and have its own BR2_INIT_TINYINIT entry?  
> 
> As Dario already pointed out, that was my suggestion to drop it from the
> init selection.
> 
> The reasoning is that we need to know the init system when we need some
> infra for it. For example, for busybox/sysvinit, we need to install init
> scripts, for systemd, the units, and for openrc, the openrc "units".
> 
> And the "None" init choice really is "Custom", in that there is always a
> PID-1 process, whether in a real system, a VM, or a container: it is the
> first process that is started in that environment. Now, whether that
> process is a real init system, a stub, or directly the final applicaiton,
> it is still a PID-1, and thus treated as 'init' by the kernel.
> 
> The existing tini package is to be used a a PID-1 in containers (I use
> it extensively in that situation) and it does not need any infra in
> Buildroot (it can only spawn a single child and is a reaper); to my
> eyes, tiny-init is also very simple and does not require any infra in
> Buildroot. Both tini and tiny-init are cases for a "Custom" init
> (currently labelled "None").

I understand your point, but:

(1) It is really unclear for the user that they have to chose "None" as
    init to be able to use tinyinit (tinyinit is proposed with depends
    on BR2_INIT_NONE)

(2) Due to (1), Dario has added a "tinyinit needs BR2_INIT_NONE, i. e.
    no init system installed" Config.in comment, which I also find odd

So while I understand your point that tinyinit or tini don't need as
much infrastructure/logic as busybox init/sysvinit/systemd/openrc, I
find the current way they are presented to be very weird (but I can
live with it).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
