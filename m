Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40359C433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 21:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE4E540192;
	Wed, 25 May 2022 21:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7bgQLlFBz8P; Wed, 25 May 2022 21:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4AC24018B;
	Wed, 25 May 2022 21:43:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0FD1BF356
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 21:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06C52606EB
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 21:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tT-6n3Dz_X5 for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 21:43:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A31AB605A2
 for <buildroot@buildroot.org>; Wed, 25 May 2022 21:43:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E14E9200002;
 Wed, 25 May 2022 21:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653514995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbqspQWmKg1Hw/ELRWJ4VU1TiUvnwKrecHD/T2ib4PE=;
 b=etGIUN/0XZatXXbTGjRTGf4SxD+5sENcx0F9CqDnC2OYAY2EnvZxRAdB4udb7ZLfRRHFkc
 khoD7k0OXDYHpoKxFWypCsG0GXQ54x+0ntH9OYtvfwbVD6T1K1gY9P22p9ybTUa/I4GA/C
 DzSE/nhT5feORL3hnghLsZJ57XT30JcI+xmztbTAvAJyIQ9NaZDXcN/RDBOAMgVHK/QsD0
 gHtaSSenkc7+KLeSKuBFFBrxKjNf2AqQFaku9OngWDiOyNQpvwdjVl5vkS1vvD3B8cBuFy
 NTy1mWheNV5nvPNeyuvANal86MtJ6ci2ShuGHR9W9vUR3gamro0WoQJoZzQgbg==
Date: Wed, 25 May 2022 23:43:12 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220525234312.643dfc03@windsurf>
In-Reply-To: <CA+h8R2pE3Z8=fjUBYvXMZp5d3s_+FRQeh4Ms1W8E8eySfdtazA@mail.gmail.com>
References: <CA+h8R2pE3Z8=fjUBYvXMZp5d3s_+FRQeh4Ms1W8E8eySfdtazA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC] package/go: switch to gcc go instead of
 go-bootstrap
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
Cc: Joel Stanley <joel@jms.id.au>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed, 25 May 2022 14:07:38 -0700
Christian Stewart <christian@paral.in> wrote:

> I propose that we switch to using Gccgo:
> 
>  - build gcc and/or use external toolchain
>     - add flags to enable the "go" language in Gcc
>     - GCC 11 or later

The problem I see with this is that many external toolchains do not
provide Go support. While this will probably evolve over time, this is
not something that we can reasonably require right now.

So I believe we probably don't have much other choice but to provide a
path that consists in building Go in multiple stages: first Go 1.4,
then a version of Go that is the last one that can be built with Go
1.4, and use that one to build the latest version of Go.

What do others think?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
