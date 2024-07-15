Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56BCC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 19:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A30140263;
	Mon, 15 Jul 2024 19:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DI29oLXkZQsf; Mon, 15 Jul 2024 19:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FBB34026C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FBB34026C;
	Mon, 15 Jul 2024 19:12:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 442F11BF3D4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30C904026C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOvqW-mPlSQf for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 19:12:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1FAF40263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1FAF40263
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1FAF40263
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 19:12:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DCB4C0002;
 Mon, 15 Jul 2024 19:12:28 +0000 (UTC)
Date: Mon, 15 Jul 2024 21:12:26 +0200
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20240715211226.11cab94d@windsurf>
In-Reply-To: <20240715204908.570651f2@windsurf>
References: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
 <37f6d34b-589e-4570-88d7-28aa967d45b5@gmx.at>
 <CAPi7W83Uf-Cjr7EWJEmN_E90FkqBq50jv2vJtK5yk+DJ2CLMTw@mail.gmail.com>
 <8c7c1d56-02a1-4a1f-a5b2-cae3928d79ba@gmx.at>
 <bac58c99-45bc-4d7d-9b34-1fca6bbdfd24@mind.be>
 <20240715204908.570651f2@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721070749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jm8xQNORHmB4+IuVNE/mrWUiT6EdkqIQndAsvZ3FHPs=;
 b=JS/LlujpGqTIrG+Wa0tGS+kl2x+vbBFhm0fnD+QSBajAvzxVjneQeFmrGxQwnCKxJ2rKM0
 /b9mZLrXoO27dTBmV7iwOX8/P/8iVoQtBQqhxN//FqFgPHwhdWt+rezcTtL+txfhytdT/g
 7bVHPH40se+xjlWyw36w5rV5TcfpH6oPHIy04WDuLIF2yX9ROjQ/NGIrK5UtJSwvhbRIVI
 H1J2DxdSC3WUHUAN/QgsuaxCiPPbt7CVzXrC6hdH/RtQAW6HCCgxb7kuEfdtDH4+YmSCyR
 oAoKPaCrACbhKt6dE6sKE4crMIzIoF1XPSG4AHkQIWIkETvNJBCj3l78rOOGGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JS/Llujp
Subject: Re: [Buildroot] [PATCH 1/1] package/at-spi2-core: propagate dynamic
 library dependency
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
Cc: Daniel Lang <dalang@gmx.at>, Bernd Kuhls <bernd@kuhls.net>,
 Simon Dawson <spdawson@gmail.com>, James Knight <james.knight@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Jul 2024 20:49:08 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> so unless atk_only is defined, dlopen() will be needed. atk_only is
> defined as such:
> 
> option('atk_only',
>        description: 'Build only the ATK stub library without atspi or at-spi2-atk (UNSUPPORTED)',
>        type: 'boolean',
>        value: false)
> 
> of course the UNSUPPORTED is a bit scary. But perhaps that would make
> sense in the context of Buildroot. Both libgtk2/libgtk3 require
> at-spi2-core, but we can imagine that real accessibility support is not
> always needed, so being able to build a stub at-spi2-core might be
> interesting, and that would allow to not require dlopen(), apparently.

Quick prototype:

  https://github.com/tpetazzoni/buildroot/commit/04ce4115d4cb4798f78f82dfe40ce07697b5e804

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
