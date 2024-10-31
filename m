Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F0ED767F4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76B38405AA;
	Thu, 31 Oct 2024 18:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWVyYx3Hu1pO; Thu, 31 Oct 2024 18:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47FDE402F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47FDE402F3;
	Thu, 31 Oct 2024 18:09:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 194E65E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06F474018E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9Gc3pFPfzqB for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:09:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A485240141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A485240141
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A485240141
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:09:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD15B20008;
 Thu, 31 Oct 2024 18:09:16 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:09:15 +0100
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20241031190915.499a7170@windsurf>
In-Reply-To: <20241030133416.505410-2-wsa+renesas@sang-engineering.com>
References: <20241030133416.505410-2-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730398157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Pa35SqesaL1zEZLXFZ9OgEzHek69z+LjChEukv0kas=;
 b=ZwkiY5iw2m97ANkfcsK0iqNiewXSf3JXvf1JNddz/PPSBA9zP3sgmpssqICrQo2IG7gNdw
 LcufXDDGF7Q6gPLuORVyBRKk2YfeXDlaZltgtCllMcgVBjIjdPF047hOZptMltVEilo9ko
 dhJ1VC8ZzfIc/cJ4xZkk3466u7kLc1gtevQcegbggmcnPhs3b9ah19beFA6dcK1+orC56v
 Oj4Q5Ihx3I4xp4bVlHMonsXF+Oyqv2f5ZCQVzJTz5aHJlXbB3i0IE0Z9wWbQaijpUboOHb
 Iv6B9wo5cyMjVAjq56fpP1i65QBAnZdaVblUD4i3/4MmOFiRerj0AkYwLDgizQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZwkiY5iw
Subject: Re: [Buildroot] [PATCH] package/rtc-tools: bump to version 2022.02
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Wolfram,

On Wed, 30 Oct 2024 15:34:15 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
> index 2882c88575..a2adc82a9b 100644
> --- a/package/rtc-tools/rtc-tools.mk
> +++ b/package/rtc-tools/rtc-tools.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -RTC_TOOLS_VERSION = 33ef4aa1c92b0c92a351284d93d1ac5570de9cc7
> -RTC_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git
> +RTC_TOOLS_VERSION = 2022.02
> +RTC_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/snapshot

It wasn't clear to me what you change the _SITE variable, as it isn't
needed. So I dropped this change, and applied the rest of your patch.

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
