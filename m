Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8AEE674BA
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 08:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AF71841B6;
	Fri,  1 Nov 2024 08:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJQfA9Q25tkl; Fri,  1 Nov 2024 08:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B66841AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B66841AE;
	Fri,  1 Nov 2024 08:58:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40F7A979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 08:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AB4A40A21
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 08:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxrvprGlQUJJ for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 08:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43617405B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43617405B3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43617405B3
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 08:58:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98B70240003;
 Fri,  1 Nov 2024 08:58:07 +0000 (UTC)
Date: Fri, 1 Nov 2024 09:58:05 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, Bernd Kuhls
 <bernd@kuhls.net>, Sen Hastings <sen@hastings.org>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>, linux-amarula@amarulasolutions.com,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, Norbert Lange
 <nolange79@gmail.com>
Message-ID: <20241101095805.2929e701@windsurf>
In-Reply-To: <20241003162629.470273-1-dario.binacchi@amarulasolutions.com>
References: <20241003162629.470273-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730451489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ANAB7E3RFvWZeHX+gCEHhuz+suoJrWDNUTe578JTgk=;
 b=VAkO+Et7YXyQvsb2VG/xO/PvLSyAbveXpx5/T7LlxzilMH01kQyimOD9UDgSdAmthrP46+
 y5oVGMSo+TeADARK58bnbr/65D9fOsFUQw99FO2g6wp7esRmVdRTzbGOkSgZufC6ZsDA4W
 ENcgzLY+Cu2RS4I2er4jvhKxDuxIcFUI6N7Eygm0OpACL4fwDoNlhp9eN6uBaO5ooPYERu
 yHn/okqEGY8WvrhhCAU5zCs43ibnb3dyOmqFCtQaJ5xoOtybs/WN3CIAv5YHagZ3xaudkv
 WHCvYwsHkpG+p7sTpH2GWNQN2tpUVn0ews7RA/phZ/gofFoRKAYJmMqdowC11A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VAkO+Et7
Subject: Re: [Buildroot] [RFC PATCH 1/2] toolchain: add
 BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET option
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

On Thu,  3 Oct 2024 18:26:28 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The build of libcap fails for ARC Targets which don't have the
> ATOMICS_EXT flag set:
> 
> configure:5053: checking for cap_set_proc in -lcap
> 
> cap_proc.c:(.text+0x78): undefined reference to `__atomic_test_and_set'
> 
> configure:5086: result: no
> configure:5097: error: libcap support was requested but the library was not found
> 
> The patch disables BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET for BR2_arc
> without BR2_ARC_ATOMIC_EXT.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/66ee26677777124eafb4740a3c7437e06f704f98
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  toolchain/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks for the patch, but I'm afraid this is not the right approach. We
don't want to have BR2_* options for each and every atomic_* function.
We already have BR2_TOOLCHAIN_HAS_ATOMIC which serves this purpose.
However, what you need to make sure is to link against libatomic. Could
you try this instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
