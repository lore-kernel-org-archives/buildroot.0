Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D8C3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0951B401C2;
	Wed, 24 Jul 2024 16:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s51X0lAZcrNd; Wed, 24 Jul 2024 16:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0F27402F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0F27402F2;
	Wed, 24 Jul 2024 16:29:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DCEE1BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26CA880E4D
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmVBblld8QlJ for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DABFB80E48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABFB80E48
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DABFB80E48
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:29:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6AC7C0005;
 Wed, 24 Jul 2024 16:29:28 +0000 (UTC)
Date: Wed, 24 Jul 2024 18:29:28 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240724182928.3c9c1877@windsurf>
In-Reply-To: <20240724071904.1397662-1-fontaine.fabrice@gmail.com>
References: <20240724071904.1397662-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721838569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2oTh/tFiz1yOJGdMX9L1wMYbthIS3LfYrsYhtI2mV4=;
 b=jX7AbY6GIOoy9TcvAB/azfa2Lkwgu3PPS9XHkBSZKEu6w/aFpx66nHF1L8wP+9Kq9PF7Kt
 58NO2IH5KI03qXa3B2jIBKoWPTBJ95X3Nb32u6Cnu0wyqs6FitlccVR/WWc9Dz4aBNb6lU
 XgrieoTVqBdna6+Ad/4+G0Yg1PPfYdGvgxqOjm1sKmGnPWstT1RKOmIJ76gAh/G4z/4v3l
 ERdGfNRvSxPVq1e+gNSPFENP5iLz3mzaYo8hkmtgMsciHCFx7wNNc2rxqBbacmgjEPvoQt
 XXf0J+PjRVZ/eknyaC6n2ybucs7W9eQmAAMpXCh8lc9RmrbrZ5wi7C3Pfu0P2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jX7AbY6G
Subject: Re: [Buildroot] [PATCH 1/1] package/ebtables: fix build with gcc >=
 14
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

Hello,

Another short comment.

On Wed, 24 Jul 2024 09:19:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
> index 703e55a3c3..ea06b0d8b5 100644
> --- a/package/ebtables/Config.in
> +++ b/package/ebtables/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_EBTABLES
>  	bool "ebtables"
>  	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_KERNEL_64_USERLAND_32

As this is a super unusual dependency, we clearly want to have a
comment above it (not a Config.in comment, a source comment) that
explains why we have this strange dependency.

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
