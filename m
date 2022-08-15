Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9E9C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DA7F408D0;
	Mon, 15 Aug 2022 10:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DA7F408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WycMha_290wB; Mon, 15 Aug 2022 10:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 321FA40120;
	Mon, 15 Aug 2022 10:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 321FA40120
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9B321BF3C4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2B5B40120
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2B5B40120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFq75piXcpWa for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:07:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A33054010D
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A33054010D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:07:56 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id t5so8957804edc.11
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 03:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=4OKNk5uSOqMJ4rv+veJRG4v1fLerf4Me7HoWWzSnVRE=;
 b=7+AFXhmQ3/fya0rGeBEpPYU6tA6CH4/bSgv782WAPp70gCjohIgmgN6H/VyXYlAUJU
 eyatA/t8JuzyXc0Ezl0DNr+O2muwVJKEsoG8c2iGXpTcyi8kCBI0eMheFqNZ//djCa0U
 etsd545ObZzO4jLSQNkzalxNjWr92/tvNfpR4drvzecIM7E2MrAOQDKI62KSrnBVCqnl
 VY6hvk3oJ/jxWPw8r8XNN9CEj9TgkFYX2WgoNONfDv3xITaWKiBODTq5ONBZxQqciId2
 er/Cn4yFKxTE96kn5c8A/QUsslshI9S8ilyqa7xM35nf2ABw+5wKI6kQYcsmt7ScVSy0
 hw7A==
X-Gm-Message-State: ACgBeo3zbtc5iYSnYXSbCdzqsENSwkMKHFz4MDpl8JaSc2l/rztPKXo+
 tP4QkDXPeBksC7KGORvKldM=
X-Google-Smtp-Source: AA6agR5FKSVusU9XIxqHJqkM2vzx+KPJCLx6Myo50F1FpLlFXep4kWg5hYvn5LpkonO9o9Et6SMg0Q==
X-Received: by 2002:a05:6402:2755:b0:43d:7568:c78e with SMTP id
 z21-20020a056402275500b0043d7568c78emr14086026edd.104.1660558074829; 
 Mon, 15 Aug 2022 03:07:54 -0700 (PDT)
Received: from localhost (tmo-096-168.customers.d1-online.com. [80.187.96.168])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a056402155600b0043a6e807febsm6347444edx.46.2022.08.15.03.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 03:07:54 -0700 (PDT)
Date: Mon, 15 Aug 2022 12:07:46 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20220815120746.21f03395@tuxfamily.org>
In-Reply-To: <20220814115115.2798469-2-laurent@vivier.eu>
References: <20220814115115.2798469-1-laurent@vivier.eu>
 <20220814115115.2798469-2-laurent@vivier.eu>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/2] package: add petitboot
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 14 Aug 2022 13:51:14 +0200
schrieb Laurent Vivier <laurent@vivier.eu>:

> from https://github.com/glevand/petitboot--buildroot
> 
> Updated to work with m68k architecture rather than PlayStation3
> (focused on qemu-system-m68k virt machine)
[...]
> diff --git a/package/petitboot/petitboot.hash b/package/petitboot/petitboot.hash
> new file mode 100644
> index 000000000000..7046c102d8a4
> --- /dev/null
> +++ b/package/petitboot/petitboot.hash
> @@ -0,0 +1 @@
> +sha256 b42ae4fb2a81e9cf68f727c3f54c6312788c654bd97628ec9ba61b19a68990e6  petitboot-v1.13.tar.gz

 Hi Laurent,

I think you should add a "Locally computed" comment or a reference to where
you've found the checksum. See also:

 https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

Additionally, it would be good if you could add yourself to the DEVELOPERS
file with an entry for this package, so that you get informed when it
breaks in the future...

 Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
