Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213C4C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4A1380B49;
	Thu,  9 May 2024 15:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izEE7mIladfO; Thu,  9 May 2024 15:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA1D083E1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA1D083E1F;
	Thu,  9 May 2024 15:48:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75F981BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61CE9405CB
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1t9BqY5KRd9 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1837440190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1837440190
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1837440190
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:48:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED1C91BF206;
 Thu,  9 May 2024 15:48:35 +0000 (UTC)
Date: Thu, 9 May 2024 17:48:34 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240509174834.46a63d72@windsurf>
In-Reply-To: <05114d73-760c-4a56-b655-3d0268158ddf@benettiengineering.com>
References: <20240413074923.1082313-1-giulio.benetti@benettiengineering.com>
 <6446e4c0-3501-4875-8a89-4db3fb369911@mind.be>
 <05114d73-760c-4a56-b655-3d0268158ddf@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715269718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmg/lSWVvtKcaOocVXUnYV/AA5axFqIl32l8esheXOU=;
 b=ImFiXvku5KUqR1BsXC6g9yUqjPbzrg2IRVq191FvAB2Sy6Rsd/AwZGZx+m4xVjHuCZPN/5
 nTGmMPw4CyvZXcZc09rWGojAgVPb5fld6GR5WKymQAgqJegVyj3WErUjT17U63k6lplHp3
 GnFuSu7bnVBkrh/dNcRABkDQf1fLo4GyiagxGhqFEBA3Rp79kEeS/mXsrpZN4FwkalX+XA
 ep4A51thz2fGaFlQT0zNlso/mLEp8u1hTaIH1oEG+/5BzCEUp8P5BkkZDwG7o6ct7u9iJ+
 q3spIr6MGnIVYWrcSSpUNV8d8iRyF/hmbwlr3Y/3ZA4Yd2VJj3zLk14rVSZNgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ImFiXvku
Subject: Re: [Buildroot] [PATCH] toolchain: remove gcc bug 90620
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Apr 2024 20:35:30 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> But this bug is Microblaze specific and the only 2 Microblaze external
> toolchains are the Bootlin's ones, where the oldest GCC version is
> 12.3.0, so as we've already done in the past with this commit:
> https://gitlab.com/buildroot.org/buildroot/-/commit/55fcba2a7c41d29f3f93bb37eec1264af4b45fb0
> 
> considering Buildroot free of bug 90620. If anyone will send a patch
> for new microblaze external-toolchains it's very unlikely they will
> contain gcc < 10.

Arnout's point is not about new toolchains (which will indeed be based
on a recent gcc), but rather on older custom external toolchains that
people might still be using.

I don't have a hard feeling on this one. Yes, supporting old external
toolchains is nice. On the other hand, at some point, we need to get
rid of those workarounds, but I'm not sure when is the good time.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
