Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8240CC3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF9380D61;
	Sun,  4 Aug 2024 21:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZ3bVTiZ2MyM; Sun,  4 Aug 2024 21:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A1480D9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A1480D9A;
	Sun,  4 Aug 2024 21:15:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1951A1BF35E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06E0D402B9
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mS_ezYNgPhxo for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 21:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7126402B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7126402B1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7126402B1
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 21:15:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3012B60003;
 Sun,  4 Aug 2024 21:15:10 +0000 (UTC)
Date: Sun, 4 Aug 2024 23:15:09 +0200
To: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Message-ID: <20240804231509.4a0f8075@windsurf>
In-Reply-To: <20240719064402.3105153-2-wilfred.mallawa@wdc.com>
References: <20240719064402.3105153-2-wilfred.mallawa@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722806110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKrXZ4vhl8CkWSJvVuXia0lIRLaLnIrgH23T0LEAyGI=;
 b=PbMaSO5a2FqjFwUqoe1Psry7ZRn7adORumnSW19AuyUYMKKOuxIfAjFSMgQ51u/pZWlo+q
 jxi77gPrC2XZltsL/tmC+/fHTfZ8tDGt52RQbGeabAykJeLvcuj6vmCwhiyf2LoGIqaRb9
 kepOkhJ9eKn8tmKINKxN+EeFr2Z5dk7PeOciFOAEixKH6URRQtbLeJ66kCDjpr4nRXgNvQ
 IL7UcJKfO8hY6OLskxOmZnd0O16aihRTwUZMl2IO7Z575c08VrXFZ0jQJEwnEHew8lURxu
 YxpnnPKYqv2TNPbkXXN5ZMzhvXJj3rmZWMLNdD32Sslkho+/DjXOfp+bQExJpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PbMaSO5a
Subject: Re: [Buildroot] [PATCH v3 1/1] package/libspdm: bump version to
 3.4.0
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
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Wilfred,

On Fri, 19 Jul 2024 16:44:03 +1000
Wilfred Mallawa via buildroot <buildroot@buildroot.org> wrote:

> From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
> 
> `libspdm 3.3.0` and later support the SPDM event capability, however
> this patch disables support for EVENT_CAP as it is optional,
> and requires additional functionality implemented at link time.
> 
> `libspdm 3.4.0` also introduces SPDM1.3 measurement extention log (MEL).
> Leave this off by default for the same reason as above.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Thanks for this new iteration! Some comments/questions below.

> -LIBSPDM_VERSION = 3.2.0
> +LIBSPDM_VERSION = 3.4.0
>  LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
>  LIBSPDM_LICENSE = BSD-3-Clause
>  LIBSPDM_LICENSE_FILES = LICENSE.md
> @@ -27,7 +27,9 @@ LIBSPDM_CONF_OPTS = \
>  	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
>  	-DDISABLE_TESTS=1 \
>  	-DDISABLE_EDDSA=1 \
> -	-DLINK_FLAGS=$(STAGING_DIR)
> +	-DLINK_FLAGS=$(STAGING_DIR) \
> +	-DCMAKE_C_FLAGS="-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
> +		-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0" ..

What is this ".." at the end of the line ?

Also, the way you're passing CFLAGS completely drops our
$(TARGET_CFLAGS). So instead you should do this:

LIBSPDM_CFLAGS = \
	$(TARGET_CFLAGS) \
	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0

and in the LIBSPDM_CONF_OPTS:

	-DCMAKE_C_FLAGS="$(LIBSPDM_CFLAGS)"

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
