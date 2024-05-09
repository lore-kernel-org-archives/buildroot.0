Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31864C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7497606D0;
	Thu,  9 May 2024 20:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wemprq2oBtLQ; Thu,  9 May 2024 20:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9EFF6129E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9EFF6129E;
	Thu,  9 May 2024 20:43:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 886431BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80F6C41E05
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vr0eJtJk5eux for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:43:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6947941DFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6947941DFE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6947941DFE
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:43:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15F0260003;
 Thu,  9 May 2024 20:43:38 +0000 (UTC)
Date: Thu, 9 May 2024 22:43:37 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240509224337.253b2bde@windsurf>
In-Reply-To: <Zj00B8A-pgDg5rvn@landeda>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
 <20240417080538.3451923-3-roy.kollen.svendsen@akersolutions.com>
 <20240509164507.4682bee8@windsurf> <Zj00B8A-pgDg5rvn@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715287420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayj7hVrhd+d+AnL+XoVuBPBILzYnRmob4jRb3SzB7iw=;
 b=AY4m9avFjtpfJTsc/Jm2MJIDgJPnyYFYVVSRsVqKeec+0D98fpMODgp4nALBg4PaFBeyH9
 a5VUmRk2DNC23MLRLu+M42q57hGcGAaTUrYY5CrHVq9fIraT4FokTqrDVjGOE6x1zGMYpr
 KlCOvXhFGG+8j7fB5OgllbNLpMPD4dwaPnn0o4L1n8TdeH/lFKeYMGEOoK/vFmr4qfT2W4
 iOaZWfowsC6Y5VhxP8oRitCBm4AbH3ONowR2PPKi/uyZUFpBCHyvYfiPQDdSgzyyyg4d+h
 0pf/eASiExYoKmeCd9OlmDKEkhXHQ3GRX4vw+t8qWw/OY8neFoSiIJAU4ceW4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AY4m9avF
Subject: Re: [Buildroot] [PATCH v2 03/11] package/qt6/qt6shadertools: new
 package
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Romain Naour <romain.naour@smile.fr>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 9 May 2024 22:37:27 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> We have a few other host packages that have a no-prompt boolean option,
> like dracut, eudev, patchelf, systemd.
> 
> The converse is non-existent; we only have ARCH_SUPPORTS for a few host
> packages for languages:
> 
>     $ git grep -E 'config BR2_PACKAGE_HOST_' -- '*/Config.in'
>     package/erlang/Config.in:config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
>     package/mono/Config.in:config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
>     package/openjdk/Config.in:config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
>     package/protobuf/Config.in:config BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
> 
> So, yes, I'd rather have BR2_PACKAGE_HOST_QT6BASE_GUI in its own
> Config.in.host.

ACK.

> Also, it is a bit weird that this is an option for a host package
> without a kconfig symbol for the host package itself...

I don't find it weird. We need host-qt6base with some specific
features (which we don't want to build in all cases, as it takes time),
but really host-qt6base doesn't have to be user-visible in menuconfig,
as it's merely a build dependency.

> Also, adding the support for GUI in host qt6base should be in its own
> patch, separate from the one introducing qt6shadertools.

Agreed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
