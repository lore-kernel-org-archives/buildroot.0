Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F066C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD06C41A20;
	Tue, 21 Jun 2022 19:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD06C41A20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zf5KxxV3iWZ9; Tue, 21 Jun 2022 19:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AD52419BA;
	Tue, 21 Jun 2022 19:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AD52419BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0671BF364
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 19:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24B2384005
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 19:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24B2384005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onxjtPtmOrnr for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 19:40:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2656984003
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2656984003
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 19:40:46 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id mf9so9325968ejb.0
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 12:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bJuA2ArzXZtRP7TG2YC079UN+gCA8jlUAvbZBSwL9x4=;
 b=L69qjgu7CW9pabO7go4IFuzqpVbRFbUI1msdLbU9dpoDXM3jDuTcIoDrPEp9Z1qWQS
 NM1v5V8gYTZc6dpSnG0WDosApqZWAeMEvQ/Og2RV7b+ubEiS0wm4piOKlwgkRk+ZXFPI
 2DvAKAMm4KIdqp+JW3jZmCdDtv7LGphyl/RiqBWfqLnX8D94Pyx5eAoLm/qeqzxmLXR8
 kEHHK/JhP1kxEBgjj+CmVbjZ8HJ6v8XMMzSmgPkZhwEbXhDHX2NoqwCByNqjk0OSP1ZO
 DestxkQr/exU+VIrYyPXDmjKFiQhb5dzBCrgBMknhZVdc8mLaNBAwkS0aceqbVRtbkQL
 8t8g==
X-Gm-Message-State: AJIora+Y6wOOQt+U1GtPFG7/f6sSeBmP3WZTlN/TZhrbUPmVrfki6QP+
 3hSsQj0BCFquG4fWFW8Dt2c=
X-Google-Smtp-Source: AGRyM1uYvy8+Db7qYihN9WaIu/gdGNd8RJlJUxRzczQi004oXgU5BIILKiTWWxLaMYdrj37ICRFsIw==
X-Received: by 2002:a17:907:97d4:b0:722:e550:7490 with SMTP id
 js20-20020a17090797d400b00722e5507490mr4315724ejc.625.1655840444272; 
 Tue, 21 Jun 2022 12:40:44 -0700 (PDT)
Received: from localhost (tmo-098-39.customers.d1-online.com. [80.187.98.39])
 by smtp.gmail.com with ESMTPSA id
 lz6-20020a170906fb0600b00722e5e54fc2sm1323072ejb.12.2022.06.21.12.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 12:40:43 -0700 (PDT)
Date: Tue, 21 Jun 2022 21:40:42 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20220621214042.43c1b07d@tuxfamily.org>
In-Reply-To: <20220621083027.2587218-1-thomas@devoogdt.com>
References: <20220621083027.2587218-1-thomas@devoogdt.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: add qemu host tools
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Tue, 21 Jun 2022 10:30:27 +0200
schrieb Thomas Devoogdt <thomas@devoogdt.com>:

> From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> 
> Always build host qemu-tools e.g. qemu-img.
> https://qemu.readthedocs.io/en/latest/tools/index.html
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> ---
>  package/qemu/qemu.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 290186ec4e..9e1bec3836 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -390,6 +390,7 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--disable-vnc-jpeg \
>  		--disable-vnc-png \
>  		--disable-vnc-sasl \
> +		--enable-tools \
>  		$(HOST_QEMU_OPTS)
>  endef
>  

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
