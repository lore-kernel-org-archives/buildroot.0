Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BB5C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98FA140217;
	Sun, 12 May 2024 10:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dVHxVnzNaa6; Sun, 12 May 2024 10:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B327D4046B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B327D4046B;
	Sun, 12 May 2024 10:20:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0291BF86C
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9487984041
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwUplZuE-vGV for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 898E284037
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898E284037
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 898E284037
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:20:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B942CE0006;
 Sun, 12 May 2024 10:20:13 +0000 (UTC)
Date: Sun, 12 May 2024 12:20:12 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240512122012.206b2a29@windsurf>
In-Reply-To: <ZkCUo5vHs4Mc3cQx@waldemar-brodkorb.de>
References: <ZkCUo5vHs4Mc3cQx@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715509213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6qcL/CzvGvt3uA7ob0wIKay4M8JNY+e2wOc+7W+cyE=;
 b=jjI7YpVZS6liT6qOWBlSlwdawd5mn+weTGK2FzS8KlsR/heWDGKKQrDemMbipR+VqtAiwR
 dZe0GZk7MtxJVolbSp2x9gGrlJ4/PoGUQqwwCOzo0xTl78cbl1xq42WMeGmo8Kvqnr3nvQ
 0z9m2xWe0uhLOO31bIeDoxD49u6+fG/kccAoxxw5Ajzq9nalZ0ga3G1RrzpqY8zyqNyy4w
 RC2KAi3BiNVHzZaOviJT3yX8DiXCvayEpZXNI2+GUWo3wPWfzHxTQ+TfZliHEqz2L2UxS3
 KSYI+eFzsTW/FfNYc+Hg2hCjRdE6Y2apT6I4QAXegFkDs3ypr8pFjWNP3ZWfVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jjI7YpVZ
Subject: Re: [Buildroot] [PATCH 1/2] arch: allow riscv32 noMMU configuration
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

On Sun, 12 May 2024 12:06:27 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

>  config BR2_RISCV_64
>  	bool "64-bit"
> @@ -62,7 +61,7 @@ endchoice
>  config BR2_RISCV_USE_MMU
>  	bool "MMU support"
>  	default y
> -	depends on BR2_RISCV_64
> +	depends on BR2_RISCV_64 || BR2_RISCV_32

This depends on was no longer needed. When RISC-V is selected, you are
sure that either BR2_RISCV_32 or BR2_RISCV_64 is enabled, so the
depends on does not make sense.

>  # FLAT binary format needs uclinux, except RISC-V 64-bits which needs

                                                     ^^^^^^  this comment needed an updated

Applied with both issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
