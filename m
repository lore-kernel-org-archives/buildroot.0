Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A9CC3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42ABF81801;
	Thu,  1 Aug 2024 21:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BV7qI5dcx8KS; Thu,  1 Aug 2024 21:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0F081E1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0F081E1F;
	Thu,  1 Aug 2024 21:06:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 810C81BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 732FC40D63
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELEPSCGZ-JU4 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:06:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2476C40D0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2476C40D0B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2476C40D0B
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:06:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C53C1BF206;
 Thu,  1 Aug 2024 21:06:03 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:06:02 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20240801230602.11eaef15@windsurf>
In-Reply-To: <bb3ab486ff7b0113e36b555f9fdbd850c4d132a8.1722516057.git.baruch@tkos.co.il>
References: <bb3ab486ff7b0113e36b555f9fdbd850c4d132a8.1722516057.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722546364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ah1OinzTLg3WhDwWLa2l/6PW/VYmgHjPZn/LPbTj0Js=;
 b=lsogYi7FlHzvjanH6jFYJNfzrPxVFVeTUfdYSaGJEbVZAJEWC9sthyfn/V8L1y+6TlAGfo
 hYN/YdNMoZhgIVwmZkJjk6OyI10HfawZl13MRu1tFZA/LUbgIbYHLAsRRIyChz8tbrD/5k
 SPLYo8z4b7YGYXK2L7LTb99gg5p8EDPw1VvwBp9CCyk+ommvYIE8AN78QvCpnAH0yJLqeF
 UCdALLIIOUfsSrAaCx6pe2GbNkAAYTWqAys0k9xDiGYGKROcf/77qyIGmPgVax2mEJ/xV5
 kDmA5dLMfZ6JR1FYgxTdpiVDH24uGNNoZJWZ+aeOVOIdUTFHjFKQ1M38JRTuqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lsogYi7F
Subject: Re: [Buildroot] [PATCH] package/picocom: bump to version 2024-07
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Aug 2024 15:40:57 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> This release adds support for no-MMU build.
> 
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/picocom/picocom.hash | 2 +-
>  package/picocom/picocom.mk   | 9 +++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)

I think you had forgotten the change in package/picocom/Config.in to
actually make the package available on !MMU platforms, so I did it when
applying.

>  define PICOCOM_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +		EXTRA_CPPFLAGS='$(PICOCOM_CPPFLAGS)' $(MAKE) -C $(@D)

Also I changed the single quotes here to double quotes, as we much more
commonly use double quotes.

Thanks a lot, patch applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
