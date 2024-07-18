Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6CBC3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 21:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4103480B16;
	Thu, 18 Jul 2024 21:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deIGw-dHg2Sr; Thu, 18 Jul 2024 21:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47C5B80B23
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C5B80B23;
	Thu, 18 Jul 2024 21:25:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF9301BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B11480B23
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVzZs7l8GITd for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 21:25:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 780CE80B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 780CE80B16
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 780CE80B16
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:25:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 747A3E0003;
 Thu, 18 Jul 2024 21:25:27 +0000 (UTC)
Date: Thu, 18 Jul 2024 23:25:25 +0200
To: Romain Naour via buildroot <buildroot@buildroot.org>
Message-ID: <20240718232525.2b67bf21@windsurf>
In-Reply-To: <20240627075441.4116645-1-romain.naour@smile.fr>
References: <20240627075441.4116645-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721337927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tmTA5MNvM5heHLXrOhm91LGkDUO3JkJukQc0Sd86qM=;
 b=fbj4JSQgO8p71/SiI13Sgqy61kttiPUe7DYEvHBp5TLE1AVgxXAc7TB0XBa5mTmS82onQN
 t6pueAQIyS7p19Wq8xPYhBCvFaZvtC0xzZ1TJiGn7HDs1yM1t1wYZ1SQ5wyIvQKx/mGfDf
 QY3Ryy4ocVTSd3ocutrklYXPiVqAiIvaW+2sPAZ7hdMkzM6q39kB9uqlIl+n9NZWh1bILw
 Ty0+33ivHQuKUxdKD3Nur+mUEbesxUKJrTvEhJCezgt8na0ZEgIfEFWfp386DyudCvqDbF
 IiIgEC0g8WnT37noYWHCI5edHhl1MiBIdUzRpRMEcyTnx6Z9gvXXaELOE2s+TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fbj4JSQg
Subject: Re: [Buildroot] [PATCH 0/6] add missing tpm2-openssl package and
 tpm2_ptool script
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Thu, 27 Jun 2024 09:54:35 +0200
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> Romain Naour (6):
>   package/ima-evm-utils: update url to github
>   package/tpm2-openssl: new package
>   package/python-asn1crypto: add host-variant
>   package/python-pkgconfig: new host package
>   package/python-tpm2-pytss: new package
>   package/tpm2-pkcs11: install tool script (tpm2_ptool)

Series applied, except PATCH 1/6, which was already done by someone
else.

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
