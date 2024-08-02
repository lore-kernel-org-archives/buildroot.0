Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC3C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C53681006;
	Fri,  2 Aug 2024 17:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6BMG5nbbXFq; Fri,  2 Aug 2024 17:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6745881089
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6745881089;
	Fri,  2 Aug 2024 17:20:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8A941BF387
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B613E81089
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8y3d4udi1ik for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:20:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 75D8681006
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D8681006
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75D8681006
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:20:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C61DE0008;
 Fri,  2 Aug 2024 17:20:14 +0000 (UTC)
Date: Fri, 2 Aug 2024 19:20:13 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240802192013.03f7639a@windsurf>
In-Reply-To: <20240724182838.4a9f1524@windsurf>
References: <20240724071904.1397662-1-fontaine.fabrice@gmail.com>
 <20240724182838.4a9f1524@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722619214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3mf3U/csPqe3hFWwhEf6uvaK1Uns1NY05jSSXBjWGHg=;
 b=htVQBkhDV85K2CAslj0Gj86wLrEcSc5/qJVJSD4Ht4wBQU8jG/rZIgcXUdTjxL3ejnrzdI
 ZhCQgylg/c44htHwaMTLLJ7fKuIKFVreLRybYkbFotXwv9Rk+miUyP119G44inFt0dFBRS
 OZvYvEoG4TacH71lEfeUkTbfUs7UnDAvwVU1BJ++Y1ROwHvcLeJZ3gn/R36ZC3n6QVo8hF
 dwnFjIi2P1H83z+5m99teQpj4a7mmAfMqwPFynVxuK8HLLpqpJ+2lW/qEcnThlcryfO8Up
 n3BjmBeVTiWu36XMOPQIeiwibTzbjlt4qZ9dXq+8nVRyEp34sAjo4/AmgJTGBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=htVQBkhD
Subject: Re: [Buildroot] [PATCH 1/1] package/ebtables: fix build with gcc >=
 14
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

Any feedback to my review on this patch (this e-mail, and the other
reply to your patch) ? This would allow to move forward with merging
this fix. Thanks a lot!

Thomas

On Wed, 24 Jul 2024 18:28:38 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello Fabrice,
> 
> Thanks for looking into this, it looks complicated. Question below.
> 
> On Wed, 24 Jul 2024 09:19:04 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > diff --git a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch b/package/ebtables/0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
> > similarity index 85%
> > rename from package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
> > rename to package/ebtables/0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
> > index cb57b39569..7e481606e7 100644
> > --- a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
> > +++ b/package/ebtables/0002-configure.ac-add-option-enable-kernel-64-userland-32.patch  
> 
> So why do we have that adds an option to enable kernel-64-userland-32, if...
> 
> > -# for 0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
> > +# for 0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
> >  EBTABLES_AUTORECONF = YES
> > -ifeq ($(BR2_KERNEL_64_USERLAND_32),y)
> > -EBTABLES_CONF_OPTS += --enable-kernel-64-userland-32
> > -endif
> > +# kernel-64-userland-32 is broken (spotted with gcc >= 14)
> > +EBTABLES_CONF_OPTS += --disable-kernel-64-userland-32  
> 
> ... we always disable it? Doesn't this make the patch entirely useless?
> 
> Thanks,
> 
> Thomas



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
