Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35E6C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A863F60A7A;
	Mon,  8 Jul 2024 20:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IBAySfGau-c; Mon,  8 Jul 2024 20:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB2C860901
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB2C860901;
	Mon,  8 Jul 2024 20:47:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBE101BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B83F0400AF
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYStji9FPYLM for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22D6840544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22D6840544
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22D6840544
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:47:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6342E0003;
 Mon,  8 Jul 2024 20:47:13 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:47:12 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240708224712.60433035@windsurf>
In-Reply-To: <20240708202117.3607581-1-fiona.klute@gmx.de>
References: <20240708202117.3607581-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720471634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2H0Dq25OibN8pwJFsGA1eYD96Hf79CvISjW390brkM=;
 b=bstAbdfWsJxWRfPE/A6+MuqE2zinIY08ao5NQgreOKd7Se2nFtBJAvxJXcwqdwCuB0ii67
 bxx7NZEVXow+RfGQpgf9euKFGQMymGWiIz9dZpO+tysBeT5gEPDQJy7gGMsNKhBZfOA6aj
 baKVUj2lhWl42yGnlUr+jkOaoodo4URNgNPwnAhjJUoyiZOdXodG2cCaCIHJzAuvrqReod
 Vnoz+tc5NcTxNSg930Bn3T0J3JByWUg+SuB6fCBdIAzQhK+zMJbXGXxh2JRFvT+J7Dknav
 R864d38vgkkVuzOt1ZJCAdmgNfVPlKzne8yzeO3lhxSvytyhBAjq1FgscyVh+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bstAbdfW
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: allow building
 with musl
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Mon,  8 Jul 2024 22:21:17 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> NetworkManager officially supports building with musl since version
> 1.30, so the restriction to glibc toolchain is no longer necessary.
> 
> [1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/4f7c04eaf94849d0455e97ba9bcfdd0b84e6459d/NEWS#L615
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thanks, I've applied to master, with one small change, see below.

> -		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL || \

Changed to:

		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \

which to me feels the more natural opposite of:

		depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
