Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EABC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3480240214;
	Wed, 10 Jul 2024 21:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQLjiDfh_R4N; Wed, 10 Jul 2024 21:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4BC140253
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4BC140253;
	Wed, 10 Jul 2024 21:58:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A19B01BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A5B483613
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luidttW8JtSZ for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7588F8343E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7588F8343E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7588F8343E
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:58:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A445440003;
 Wed, 10 Jul 2024 21:58:32 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:58:31 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240710235831.50ae28fc@windsurf>
In-Reply-To: <20240624224958.309140-1-ju.o@free.fr>
References: <20240624224958.309140-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720648712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7Tr+wIvUtTmHpGsLYQfRSb+iVr40ArnYe5L3DKeNKo=;
 b=ljtQwu1aOnmV8KKGO/oN9Ft0ade1llSiyNcp106G9vvLmKhJP1snk+fanG/Ofn8XDXKlc3
 GX9MS8V8PbLG7YAejCy8b49M6J8ZmDAvWRpgEmYn1M1mB5Sffw14UCdm0w1XPvtHNMnNkB
 baMm1L8VVIOpAAhZPaIMs+wrrNIbHycGME9DLtpZ79EH6pGHXs2474jXIi5yAsnneEnFNs
 7sDdTMN+l+w845IWJvOUke3VxnqGPe8owfOIjdM41ckMOylIJsNm6Hka07nmXzpHEuCkbM
 8tJ7u/EBTbad6/iMmY9xXLnF04YCxgnvBPv6RlOw9Euj5OEMBcHa2aH6TN9Ugg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ljtQwu1a
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add kmod runtime test
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

On Tue, 25 Jun 2024 00:49:58 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_kmod.py    | 97 +++++++++++++++++++
>  .../test_kmod/linux-virtio-net.fragment       |  1 +
>  3 files changed, 100 insertions(+)
>  create mode 100644 support/testing/tests/package/test_kmod.py
>  create mode 100644 support/testing/tests/package/test_kmod/linux-virtio-net.fragment

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
