Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC09C0218F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 10:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4D46400FF;
	Sat, 14 Sep 2024 10:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsgtyFDKfiw1; Sat, 14 Sep 2024 10:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EFFE40179
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EFFE40179;
	Sat, 14 Sep 2024 10:13:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B513C1BF846
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A30C9403CD
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 10:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6rQ36JqJArS for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 10:13:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DFB3403CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DFB3403CC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DFB3403CC
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 10:13:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D39401C0003;
 Sat, 14 Sep 2024 10:13:22 +0000 (UTC)
Date: Sat, 14 Sep 2024 12:13:20 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240914121320.4672b1ca@windsurf>
In-Reply-To: <CA+R_dep6gZd6Kv6SuDPE-+RCfjbNArRd9U+yvnYiZ=YX5R9H7Q@mail.gmail.com>
References: <20240810171335.19227-1-baxiche@gmail.com>
 <CA+R_dep6gZd6Kv6SuDPE-+RCfjbNArRd9U+yvnYiZ=YX5R9H7Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726308803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWSSW+4jdtsIPU1J7KVOPF0RsUCRWACQD+UuyixBl44=;
 b=BJiOIq1ESNlva7NStCwAscjrABorBqbgn4KjeANZ6o4fkW8FUPL9AoyMNCIZQ617VV7UdW
 hd/dnZd2fSR3E/E72cF5M3jdWam3GZQG7QgIcc84POZ+yqIymYkC8YeEULaByub+p5sDkb
 we12uUcYsDP62/fvtTSHJjnZNGxAMzWm/BFBu5ACvmRE0x7ktX40mdGtzIX9Y2v0ol5Jn1
 WgRALNPyBvUy6GoTld4PdHYMNlTYfHowSdNECCstT/8qv6kIdXc87971Ku/WU2vur3Y0Hj
 FWZEuqJIxFTYsnytvcF2xC9uWru933cCe1kCZE8UAQjw3he2qOR+JrLosOvqrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BJiOIq1E
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6: add qt6 multimedia
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
Cc: baxiche@gmail.com, Jesse Van Gavere <jesseevg@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Baxiche, Hello Roy,

First of all, thanks Roy for the review, much appreciated! See my
comments below.

On Wed, 14 Aug 2024 13:59:04 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:


> > +QT6MULTIMEDIA_LICENSE = \
> > +       LGPL-3.0 or GPL-2.0 or GPL-3.0, \
> > +       LGPL-2.1+, \
> > +       BSD-3-Clause (docs), \
> > +       GFDL-1.3 no invariants (docs), \
> > +       BSD-3-Clause (examples), \
> > +       BSL-1.0, \
> > +       MPL-2.0 \
> > +       MIT  
> 
> Thomas, should we order these licenses alpabetically, and avoid
> duplicating the lines?:
> 
> To avoid duplicating lines I would do:
> 
> QT6MULTIMEDIA_LICENSE = \
>       LGPL-3.0 or GPL-2.0 or GPL-3.0, \
>       LGPL-2.1+, \
>       BSD-3-Clause (docs, examples), \
>       GFDL-1.3 no invariants (docs), \
>       BSL-1.0, \
>       MPL-2.0 \
>       MIT
> 
> And order alphabetically:
>       BSD-3-Clause (docs, examples), \
>       BSL-1.0, \
>       GFDL-1.3 no invariants (docs), \
>       LGPL-2.1+, \
>       LGPL-3.0 or GPL-2.0 or GPL-3.0, \
>       MIT \
>       MPL-2.0

Yes, I agree this looks nicer. We don't enforce alphabetic ordering for
the licenses currently, but here it definitely makes sense to do so.


> > +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> > +QT6MULTIMEDIA_DEPENDENCIES += qt6declarative
> > +endif  
> 
> I think it is custom to order these ifeq-statements alphabetically?

Yes, it's good to do so.

> > +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> > +QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_PULSEAUDIO),yy)  
> 
> It may be better to avoid doing the BR2_PACKAGE_PULSEAUDIO==y twice,
> by moving the BR2_PACKAGE_FFMPEG==y inside ifeq
> ($(BR2_PACKAGE_PULSEAUDIO),y)-block above.
> 
> > +QT6MULTIMEDIA_CONF_OPTS += -DFFMPEG_DIR=$(BUILD_DIR)/ffmpeg-$(FFMPEG_VERSION) -DQT_DEPLOY_FFMPEG=ON  
> 
> What about splitting the long line to increase readability?:
> 
> QT6MULTIMEDIA_CONF_OPTS += \
>       -DFFMPEG_DIR=$(BUILD_DIR)/ffmpeg-$(FFMPEG_VERSION) \

I don't really like this. Why is this needed? Why does qt6multimedia
need to poke directly into the ffmpeg source code?

If this hadn't been present, I would have applied the patch with the
fixes proposed by Roy, but I'm not a big fan of this ffmpeg thing.

Also, are there some options to explicitly disable things?

I.e, instead of:

+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
+endif

have something to explicitly enable pulseaudio support in
qt6multimedia, and in an "else" clause, something to explicitly disable
pulseaudio support?

Roy: as Baxiche didn't come back with a new iteration, I'm not sure
they will ever come back with a new version. I'm going to mark this
patch as Changes Requested, but if Baxiche doesn't come back with a new
version and no-one else picks it up, it means it will be forgotten.

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
