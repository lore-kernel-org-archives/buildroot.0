Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7113ED5B144
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13C3880BDE;
	Mon, 28 Oct 2024 20:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6wS1mg7kdli; Mon, 28 Oct 2024 20:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 134F480C38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 134F480C38;
	Mon, 28 Oct 2024 20:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96187AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91CAF40632
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_yfCZ9ZHLOD for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6475140630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6475140630
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6475140630
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:11:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1C6240004;
 Mon, 28 Oct 2024 20:11:04 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:11:03 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Marcin Niestroj
 <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>, Julien
 Olivain <ju.o@free.fr>, Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241028211103.67456028@windsurf>
In-Reply-To: <CADvTj4poUTwYNeVK63EkZHKyYZ9BWAnVMNv9jOxcd-0guH+wAQ@mail.gmail.com>
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
 <20241026162759.0100482f@windsurf>
 <CADvTj4poUTwYNeVK63EkZHKyYZ9BWAnVMNv9jOxcd-0guH+wAQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730146265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+Fe4tfWh98qd5GGtIFPjYcKXI0DHg/yfcc0CtUhdks=;
 b=Wy/pp0vWf1MnmXfvBU4MZZknsCnfY3zK5db1/JOnHYWHT+4QNhlkYF/pDal5gGSEXJwn7D
 TA+tVIKdtnncwI9r+AvPGRFDozJf1eD5m1KaYjL/wTGnaPbW+NW1ThTlbpyigiEGL00PRQ
 dO8RPA4mqSqGl4TMQBYx15yKX8x4E7D1IuGdMNQGllRBKFCrWioqjwRZ8S2nQFcOuJB6hv
 xFPNwVXiIxLKII8V25yJrQawroY8MtVKBHYcQdaCR6NqrQstG4x3gcorMZrvz+evKMek1E
 BkeUSs5TX91TmE1UO0UJYZxN1TTYLZA9wzAwHmEdciAF9wXxoeOdq564dFAYQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wy/pp0vW
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

Hello James,

On Sun, 27 Oct 2024 20:57:32 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > make[1]: *** [Makefile:1567: protoc-c/protoc_gen_c-c_bytes_field.o] Error 1
> > make[1]: Leaving directory '/home/thomas/projets/buildroot/output/build/host-protobuf-c-1.5.0'
> > make: *** [package/pkg-generic.mk:289: /home/thomas/projets/buildroot/output/build/host-protobuf-c-1.5.0/.stamp_built] Error 2
> >
> > This is on a Fedora 39 system, gcc 13.x.
> >
> > Could you have a look? Also Michael Nosthoff reported a separate
> > (weird) pkg-config issue.  
> 
> Yeah, there's a pending PR that appear to fix this:
> https://github.com/protobuf-c/protobuf-c/pull/711

Which of the two issues is this fixing? I was reporting a build
failure, and Michael Nosthoff was reporting a build hang in pkg-config.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
