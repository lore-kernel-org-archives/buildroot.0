Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80995C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 16:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D82D605DD;
	Sat, 27 Jul 2024 16:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0xHrgZvUIvZ; Sat, 27 Jul 2024 16:33:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 040C9606B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 040C9606B3;
	Sat, 27 Jul 2024 16:33:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52D5B1BF82F
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 16:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BB43401F3
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 16:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LgxY7V7J1mV for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 16:33:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B84AA400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B84AA400FE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B84AA400FE
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 16:33:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E525120004;
 Sat, 27 Jul 2024 16:33:01 +0000 (UTC)
Date: Sat, 27 Jul 2024 18:33:00 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240727183300.649f0309@windsurf>
In-Reply-To: <20240726153002.18133-1-fontaine.fabrice@gmail.com>
References: <20240726153002.18133-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722097982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euwTgswE7AIJrsPanIuexkwXcwe+WHQvPWRxq1UM2Qw=;
 b=C05EWPfkX0yGna9NMmmoCkg00T+G7mmRsF+UMuN8C2xOS+F76MpY0EM2f6+V811LDB0R4o
 9EcFzPgQFjp+5ysrtkma2HJedWCYU+os/SSMd1Ba8ALMLZEar3GWGvdZfV/dgC+ZPgXaYc
 H7LMMe84LZtJD83gorlPfbmIuiPr2EIgvlRaWbdgOn5PMZKTT2OfT2tg8WKw2iz8VkAdJe
 rUBVgulOXoXUx23LV9GBpu1XVGNV97PoqEb1rYOumKL6uravDm1eVVIwnNIKY6U4YwycZi
 oQmlzukZnjJtvXxHeMXKf8aJWPU0OXAi4TqkxHwBAxdELX7zLLFZ9BnTDCi60Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C05EWPfk
Subject: Re: [Buildroot] [PATCH 1/1] package/gtkiostream: add
 BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Jul 2024 17:30:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
> index 1d1ec27346..0567ce876d 100644
> --- a/package/gtkiostream/Config.in
> +++ b/package/gtkiostream/Config.in
> @@ -1,5 +1,20 @@
> +config BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_arcle
> +	default y if BR2_aarch64
> +	default y if BR2_arm
> +	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_microblazeel
> +	default y if BR2_mipsel || BR2_mips64el
> +	default y if BR2_nios2
> +	default y if BR2_powerpc64le
> +	default y if BR2_riscv
> +	default y if BR2_sh4 || BR2_sh4a
> +	default y if BR2_xtensa

Thanks for looking into this!

Did you try:

config BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
	bool
	default y if BR2_ENDIAN = "LITTLE"

 ?

It seems a bit more concise and future proof.

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
