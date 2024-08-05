Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90B5C52D6F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 06:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91F4D80C5A;
	Mon,  5 Aug 2024 06:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcliZyTX-qbx; Mon,  5 Aug 2024 06:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9743F80C6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9743F80C6B;
	Mon,  5 Aug 2024 06:55:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86D321BF3B5
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 06:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72AB5402B3
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 06:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8PcKAighOov for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 06:55:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE50A402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE50A402A8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE50A402A8
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 06:55:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA2D9E0003;
 Mon,  5 Aug 2024 06:55:15 +0000 (UTC)
Date: Mon, 5 Aug 2024 08:55:14 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240805085514.5e113a0a@windsurf>
In-Reply-To: <ZrBtHPY63Wyfy++l@waldemar-brodkorb.de>
References: <ZrBtHPY63Wyfy++l@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722840916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cv9sNhfcUi4CpABbjsxfaG4vkJkZs3XlTsh6u3EwLI=;
 b=VScYuAbrX4rbToUjatdpRZdmFjWTNFuXWuMc2jW+F18gaP384sCsiIrgYi+HffZ8uJYWvd
 ubgJntYR8I4eWFOWOd9P98TenBzc5XCjKdDgpMkfhxy7uqKBkqUNtd4OvHHsiEtKt1lY/D
 t3zvS7wpNfVamYeJmrEPKLfhNxl4AYw9BPHErp9mFO/XRou/BsuUNStM/uXUuHYSwXhPdb
 BUGiJyySS37Pb1zV1urHaIokWg4cyZhqvuL43bmNmviIi+lyM5B8NbxW49LV5Tn6PQIiJs
 6+C5FltpPFaz2fOgmRW7jn2VqXKA7lNidKsgnirCg1PpXbnlJsFJTigKJt8fbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VScYuAbr
Subject: Re: [Buildroot] [PATCH] package/fluent-bit: fix issue with
 uClibc-ng toolchains
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

Hello Waldemar,

On Mon, 5 Aug 2024 08:11:40 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)

BR2_TOOLCHAIN_BUILDROOT_USE_SSP only makes sense for internal
toolchains, so that wouldn't do what's expected for external
toolchains. Also putting this inside a uClibc conditional doesn't make
sense, the SSP option is independent from the C library.

But overall, you should just unconditionally pass -DFLB_SECURITY=No,
and let Buildroot decide which security hardening features to enable.

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
