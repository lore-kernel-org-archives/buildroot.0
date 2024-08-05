Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FA9C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89AC460730;
	Mon,  5 Aug 2024 07:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0tOe0-ROMj0; Mon,  5 Aug 2024 07:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CFAF60739
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFAF60739;
	Mon,  5 Aug 2024 07:31:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A07CC1BF333
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF8960739
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gi-brL0Fsfij for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDC7C60730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDC7C60730
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDC7C60730
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:31:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29E51E000B;
 Mon,  5 Aug 2024 07:31:08 +0000 (UTC)
Date: Mon, 5 Aug 2024 09:31:06 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240805093106.20d6716d@windsurf>
In-Reply-To: <ZrB+QUlNw6G1wbV4@waldemar-brodkorb.de>
References: <Zq9j8m3YPt0Xh0gY@waldemar-brodkorb.de>
 <20240804231254.6301c5df@windsurf>
 <ZrB+QUlNw6G1wbV4@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722843068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15JQxE94GWFOlvmG9QXxkfvV/axY4SxVlQtLQEWg6LU=;
 b=ozQDQI591df8+3V0/K2q9vSyrWgYUl0WnjJiroTkDizfxZRfJFqcG4wh8LqjsGAuKSeUWM
 Fxgp2N02ZcfAn9X8aAy1U2Z6RK/xZA5TylSHRNIvkQ9emn4nWy0uOHa2kcMboPC6hmPJLS
 nlBpP6QHj/7Ka4g+x7YOgiWE/DiVOu71+cU08PNUVp0rqfudq8+k5sqUD6KNPQcSfAZyKh
 AkI/pmU9AWVXZkw9lU8dGWwpfHcfYdEcAzSG6/AEgSRYXPlhHt78YLPXZq8fyRLbdVPark
 /gXoRp7ocJMOxEGENsPCA87A0QdwbLp4z0616N8rRNC/58tWrrrWMj/OVFstGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ozQDQI59
Subject: Re: [Buildroot] [PATCH] package/nginx: fix sparc compile
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

On Mon, 5 Aug 2024 09:24:49 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> The minimal reproducer is:
> BR2_sparc=y
> BR2_PACKAGE_NGINX=y

Weird, I didn't reproduce it with the Bootlin SPARC toolchain.

> For sparc only libatomic_ops is selected via
> package/nginx/Config.in. So I think the build issue is unique to
> sparcv8/leon.

Correct, but in the .mk file we have:

ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
NGINX_DEPENDENCIES += libatomic_ops
NGINX_CONF_OPTS += --with-libatomic
NGINX_CONF_ENV += ngx_force_have_libatomic=yes
ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
NGINX_CFLAGS += "-DAO_NO_SPARC_V9"
endif
else
NGINX_CONF_ENV += ngx_force_have_libatomic=no
endif

and BR2_PACKAGE_LIBATOMIC_OPS can very well be enabled on non-SPARC
architectures. Yes nginx only forces BR2_PACKAGE_LIBATOMIC_OPS on
Sparc, but nothing prevents another package (or even the user) to
enable BR2_PACKAGE_LIBATOMIC_OPS on non-Sparc architectures.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
