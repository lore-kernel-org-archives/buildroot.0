Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4833CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B7EC4237C;
	Fri, 29 May 2026 08:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ih8zF6vV0eU; Fri, 29 May 2026 08:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C7AF4237D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043446;
	bh=T5nN6OZzAwEMdGie+TH+6WMdAR2BwqodebvWza1FsTQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cw6dhMsonjReZe0kul0YAYQrDPsCP4iDxd1oWj+Zg2f7ZDvNqZcX0a7xiO8WEiFGl
	 L/IFowNoKAlxxexmDv4aZymv4HcAIsrb6vx1aKfiRBKXZWZO+RT7oNgDPdjI16Dfco
	 yL/jIsRx1TertHS1Rg4y2xTRkEgd7Beahf1xdFbnO6V5TIRu3nHrbbtJ4VioGItI2g
	 C8Djg6I0XRUgJecjoAX4eVDNKhJdHtUh/h+CHTW8pqqca0m+9AKSxhbau+Euj8Do++
	 1zZ98/y4i30cjKtda+ZSL7X/MfCdwu++8evl3up0myrCuXxamOuwX62CViQPQV9TNl
	 Ktz+tk5dS1FXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C7AF4237D;
	Fri, 29 May 2026 08:30:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ED5828E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E243406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8CFwnxZiBJp for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F207F4070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F207F4070D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F207F4070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso21344925e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043431; x=1780648231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eZLlqzbsOyK9tueoEgZa6frmTgkDcuQ0onjOW1WeXv4=;
 b=XdpNVcCfqRNuaEezfRZ634rip/Km+GRAU4aR6WNrDZ7HdUDRqXQ3keMs65gM10YMyi
 v8ut5rR8/MgnGwQ4MFVqJw7M8+R7CnaiJZHd6DBbuwSdKZ49Z9ATutETdAuwJ59I7aDB
 +7sFeiVZqlUV1/3c65me/pr5fP1yb8t/JSuK/e+FxPoCme+tfNlZqoxCLTY/akH5KkAk
 ro1y3ZlRP6jrL8MGJ6uJxIMAif0F2dLMJEJvkHgtlBlbMvIDTHtW7hx4V7fIyEeIU94g
 umr2hyTwaIAZQTGygB3chWwYh33ilmRUJmEQdCwqCmK4fK0vEFEVE/mfPiC2BFyLb9eT
 +9Sw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+t5ecjFEN/pm5VwRQBmCXcZ6Uz0M5qLoehrK8Ja0rZHxjVTIMY6qvP1Ic4O956vFxpjZ1TcnybYis=@buildroot.org
X-Gm-Message-State: AOJu0YyjTLmW0JvzqlUqxB0whKXGIkVWnVmBPbvSsDKa3fzXilFZnf9C
 SrIB7845scuYAYTEvh+I1hYSvHdKdAJhPRR5uUnD34IGsODZpiFdSAlRPZwx/5nmFIjVwwkhZjY
 ifYeC
X-Gm-Gg: Acq92OHV1M5StNoxEzeVg0lEMR2V4Zzo+zsvuNhesP0VssAfhXdYqQgx2KZ26fHwnUW
 4lr19vrYN9BU9ZzR9Ho1jLgoKcCNPidbJ1L3zI5xMdkN9sh/DhAAD9+M78EDtvlrNikVTvBcK9C
 pVIYImOsJB+tIHsihfl1fRmtzEXR7Drla8NlBKdqzRXODvsgLVOuU+YaSmAHgy1iTPpQcB7FBf/
 zMS7Gm6XDNQuZaHQLilxfTxjoWQ+ASxtSsAGfa0UvASiSxmpHk+UeX4Fa6tFrRg6LSdYsLsJRzD
 wpCAxYAXb2MZVL7/xSlA2KobN5nZCednqLr9htvyTjrhKk1yzf6TwqLnEfl2LbBYpAYQyhnZDrz
 HABAUC9sA2GvgQ9WKr+heIv8KHy0ytpJT5Z6icw9sKt4R+yfjQWSz0icTcI5YQJjNnDdrRJpxb4
 6i5SdP4AVnrQNe8XhMmXgWKm5FoS2+v2GPxW3ah3pq5T2JZKReQxqFR9ILkA==
X-Received: by 2002:a05:600c:3512:b0:490:40f1:5314 with SMTP id
 5b1f17b1804b1-4909c07028emr32531045e9.1.1780043430945; 
 Fri, 29 May 2026 01:30:30 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c12b2dbsm12419295e9.6.2026.05.29.01.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:30 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:30 +0200
Message-ID: <20260529083030.59827-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517203806.375813-1-ju.o@free.fr>
References: <20260517203806.375813-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043431; x=1780648231; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZLlqzbsOyK9tueoEgZa6frmTgkDcuQ0onjOW1WeXv4=;
 b=J3+tD8chYgiOD3Izw/I+7UDT5PjrG/e3iVo0z27+uu2MNFGSGVDtYt2bVpmwyaiAUs
 F/kVzeaKIIeq2TUOkx6UICONFuiLsicoAXzSYOlHnygpqBJ4WwD9xXGxDH7MkMr5MgEw
 Fo0QVhJhBkMylChFUf9PbOGEKdYiHlGgrnsGgBr2RvIOpokI4zVpq1LyvIzeoryPAz/S
 axl12jQQ1eZX1OAE8VZO4/CJKHXNC3/e3nAXOtNQGxbBjh0WIvHk5A935CFZ/1Ou/fp2
 lVXE0+kbkrNW/U4+xHfHl01rfw8T8A2J79BpMvAP5ByP74dBNqz87NgECGkyv2fZlpNN
 eVJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J3+tD8ch
Subject: Re: [Buildroot] [PATCH next 1/2] package/zic: bump to 2026b
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> For release notes, see:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/zic/zic.hash | 4 ++--
>  package/zic/zic.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/zic/zic.hash b/package/zic/zic.hash
> index 7fe7582f10..75242a306f 100644
> --- a/package/zic/zic.hash
> +++ b/package/zic/zic.hash
> @@ -1,4 +1,4 @@
> -# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
> -sha512  d14bc0680b9cb33d6526a2c0e483f2abafc2593cfe5fbfe7dcab940aafdc1baaec065dbaa1bb58b03586a8631ffdf43ebb22ff5a70503298b6ea2cf061d82c16  tzcode2025c.tar.gz
> +# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
> +sha512  55b44d52a83c9db151be32c3d78376ea7f9d4311ef15ed6fe34b855b08fc546531e51309d178d9c175a6d5d7d0b058440e45a55d200ca8925e3798dac9bc739f  tzcode2026b.tar.gz
>  # Locally computed:
>  sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
> index 06d8ebaf15..43e74e64c8 100644
> --- a/package/zic/zic.mk
> +++ b/package/zic/zic.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ZIC_VERSION = 2025c
> +ZIC_VERSION = 2026b
>  ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
>  ZIC_SITE = https://www.iana.org/time-zones/repository/releases
>  ZIC_STRIP_COMPONENTS = 0
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
