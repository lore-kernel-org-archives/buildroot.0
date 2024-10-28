Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33C2D5B14E
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 901FA60707;
	Mon, 28 Oct 2024 20:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FhKTHN9B3jR; Mon, 28 Oct 2024 20:54:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0D8E60722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D8E60722;
	Mon, 28 Oct 2024 20:54:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 710474EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52233811D5
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8ES64PJbix4 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CCE0811D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CCE0811D0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CCE0811D0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:54:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1532FF803;
 Mon, 28 Oct 2024 20:54:00 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:53:59 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Marcin Niestroj
 <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>, Julien
 Olivain <ju.o@free.fr>, Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241028215359.048d4733@windsurf>
In-Reply-To: <CADvTj4pKGh1-PxmuCvOFcV4Vw2hREChCj4Q3FAgS=kicuHJpHQ@mail.gmail.com>
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
 <20241026162759.0100482f@windsurf>
 <CADvTj4poUTwYNeVK63EkZHKyYZ9BWAnVMNv9jOxcd-0guH+wAQ@mail.gmail.com>
 <20241028211103.67456028@windsurf>
 <CADvTj4pKGh1-PxmuCvOFcV4Vw2hREChCj4Q3FAgS=kicuHJpHQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730148842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9E7esoTzWGNzUN+2KdUm0Y/gWxYnAikLp4DOKptR4U=;
 b=Msj86RahUqKryDyFx9IuYFaceeAEyNj76lLQ0KAaypIfhXJtXX58ANgCt2Rr4PqckFeWwC
 9E+lsMVO6/7+eENqilYbP1uvWLBwedaSvMRLm8VKUzwmbxX30HveL9U3RYQQ8npM0XGa+V
 fl/v33TfiXkZktY2wseBfW001GcL28j0pQcoHmUgp4REgirvIj/Yzle2HtmQfpA3Q4Gr0z
 h0xVHRaYNbls30DDOjrSVdJfndUD6kw2hpTpMmZ7HIzwVVfFslUZ7/2+xmzPS3RV91X1fY
 gc7Fhq8oNrSv4t9zxRJ/X5TervtY3huoUBEvA/r5W6gq0sBAacCDBoyEpaYe4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Msj86Rah
Subject: Re: [Buildroot] [PATCH v2 1/3] package/{python-}protobuf: bump to
 version 28.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 28 Oct 2024 14:21:21 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Which of the two issues is this fixing? I was reporting a build
> > failure, and Michael Nosthoff was reporting a build hang in pkg-config.  
> 
> This fixes the build failure you reported, updating pkgconf fixes the build
> hang.

So this series depends on the pkg-config bump.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
