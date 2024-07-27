Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5602EC3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 16:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14C03605DD;
	Sat, 27 Jul 2024 16:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9Eg7FqXN4Lv; Sat, 27 Jul 2024 16:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29662605DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29662605DE;
	Sat, 27 Jul 2024 16:36:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB0EA1BF82F
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A95AF605DE
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 16:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gkf0LXg5FdAl for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 16:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8709C605DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8709C605DD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8709C605DD
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 16:36:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD59920002;
 Sat, 27 Jul 2024 16:36:25 +0000 (UTC)
Date: Sat, 27 Jul 2024 18:36:24 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240727183624.648b499b@windsurf>
In-Reply-To: <20240726085352.1238297-1-fontaine.fabrice@gmail.com>
References: <20240726085352.1238297-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722098185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9NJwvWGqIONbWF33aqF2gghNfK0NUmXcwGSveRsyMX4=;
 b=SR7bQfz7SXhWgpZ1CzSRAn30ncFQObQY+2J/dMABQiKFmMO3mPfPkT71/I/uu7QwDzC4vh
 +KKf4pZQODGzuNrCV8ag0lNO0lCMK8f/BZVAp+Gdv40YdsgC6c+LwP5B2FqSRTDmyNz9by
 1dY8NYkNh9b8KyhWij6UCy2JCI0e8dTmBYQSvpJ/VBqCExJt3+HBj0zxXM5Y8csUUkqdom
 AYx8kUepghvFw417srexFaeESEmP8eIjSd1w1FMoWy+m9DC16EYR1awuNmiUg6mmDnXpQY
 5kiYmElo/J+VrFkezYpjabHhO/2S7p1N5QvN7pk81v0GArd0mIROlPjRQB3MYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SR7bQfz7
Subject: Re: [Buildroot] [PATCH 1/1] package/cairo: fix build without NPTL
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

On Fri, 26 Jul 2024 10:53:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
> +CAIRO_CFLAGS += -DCAIRO_NO_MUTEX=1
> +endif

Not your fault because it was already like this before, but I believe
92f14307ba670058d0b3692fb8e82753d6ad6868 was wrong. Indeed, it means
that when thread support is enabled, but not with NPTL, we disable
mutex support in cairo. This means that a multi-threaded application
that uses cairo will be using a version of cairo without mutexes, which
seems very wrong.

Not be honest, I am unsure on how to proceed with this. Add a
BR2_TOOLCHAIN_HAS_THREADS_NPTL dependency to cairo?

Maybe retry if toolchains with threads not provided by NPTL continue to
fail building the mutex code? (Though I doubt anything has changed in
this area). Or maybe uClibc-ng has been improved to the point where the
mutex code now builds correctly with !NPTL threads?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
