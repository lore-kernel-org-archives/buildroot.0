Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDABC021AF
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A368780BE7;
	Sat, 14 Sep 2024 20:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqLFFH1M7VMf; Sat, 14 Sep 2024 20:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B793881F02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B793881F02;
	Sat, 14 Sep 2024 20:15:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDEEB1BF3A4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACF0E605FE
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOmgEH9vRpXX for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:15:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABC1A605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC1A605E1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABC1A605E1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:15:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07FC220003;
 Sat, 14 Sep 2024 20:14:59 +0000 (UTC)
Date: Sat, 14 Sep 2024 22:14:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914221458.7ef2165f@windsurf>
In-Reply-To: <20240910183103.2837260-1-james.hilliard1@gmail.com>
References: <20240910183103.2837260-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726344900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKnd92KuLUPzHr8T43SrNZ7iKPieE0ktnZL8dVM/vsQ=;
 b=ma3ga5szBtLinA2Lw2f8UD+S7AizySfpgH7ksTcgz6OSu47YmSb0Hfh6LY0W4l1NCrRQia
 +QkDB89avnb4EYOkAhCZBclf5UBzEOAdczlAHPTEc6cUUn/CSh92Kpz/Tdy9gI4aLKE774
 4Wb8+Lx+DPDJwR0A3C03ViKQxAZ4mmQ863PMghPvsqNAz205yuzr1ZtqwjNmN8goQb1u1L
 STGv63qzL6KMlVaKhRQaOUqVC2len7g5JBHS0wKdRGEEPHwr2MQIHt/kmsP4tW3P1vlezU
 Dh9pVPY0REZnZJI2x8qaFucTTh0Znrnv1jCuLjD1Kb/0sP0rN7S7WUkKXEdKpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ma3ga5sz
Subject: Re: [Buildroot] [PATCH 1/1] package/libblockdev: bump to version
 3.2.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue, 10 Sep 2024 12:31:03 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> +config BR2_PACKAGE_LIBBLOCKDEV_SMARTMONTOOLS
> +	bool "smartmontools"
> +	depends on BR2_INSTALL_LIBSTDCPP # smartmontools
> +	depends on BR2_USE_MMU # smartmontools
> +	select BR2_PACKAGE_JSON_GLIB
> +	select BR2_PACKAGE_SMARTMONTOOLS # runtime
> +
> +comment "smartmontools needs a toolchain w/ C++"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_PACKAGE_HAS_UDEV

This last line should have been:

	depends on !BR2_INSTALL_LIBSTDCPP

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
